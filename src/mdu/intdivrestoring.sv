///////////////////////////////////////////
// intdivrestoring.sv
//
// Written: David_Harris@hmc.edu 12 September 2021
// Modified: 
//
// Purpose: Restoring integer division using a shift register and subtractor
// 
// Documentation: RISC-V System on Chip Design Chapter 12 (Figure 12.19)
//
// A component of the CORE-V-WALLY configurable RISC-V project.
// 
// Copyright (C) 2021-23 Harvey Mudd College & Oklahoma State University
//
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Licensed under the Solderpad Hardware License v 2.1 (the “License”); you may not use this file 
// except in compliance with the License, or, at your option, the Apache License version 2.0. You 
// may obtain a copy of the License at
//
// https://solderpad.org/licenses/SHL-2.1/
//
// Unless required by applicable law or agreed to in writing, any work distributed under the 
// License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
// either express or implied. See the License for the specific language governing permissions 
// and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////

`include "wally-config.vh"

module intdivrestoring(
  input  logic             clk,
  input  logic             reset,
  input  logic             StallM,
  input  logic             FlushE,
  input  logic             IntDivE,                       // integer division/remainder instruction of any type
  input  logic             DivSignedE,                    // signed division 
  input  logic             W64E,                          // W-type instructions (divw, divuw, remw, remuw)
	input  logic [`XLEN-1:0] ForwardedSrcAE, ForwardedSrcBE, // Forwarding mux outputs for Source A and B
  output logic             DivBusyE,                      // Divide is busy - stall pipeline
  output logic [`XLEN-1:0] QuotM, RemM                    // Quotient and remainder outputs
 );

  localparam STEPBITS = $clog2(`XLEN/`IDIV_BITSPERCYCLE); // Number of steps

  typedef enum logic [1:0] {IDLE, BUSY, DONE} statetype;  // division FSM state
  statetype state;

  logic [`XLEN-1:0]   W[`IDIV_BITSPERCYCLE:0];            // Residual for each of k steps
  logic [`XLEN-1:0]   XQ[`IDIV_BITSPERCYCLE:0];           // dividend/quotient for each of k steps
  logic [`XLEN-1:0]   WNext, XQNext;                      // initialized W and XQ going into registers
  logic [`XLEN-1:0]   DinE, XinE;                         // divisor & dividend, possibly truncated to 32 bits
  logic [`XLEN-1:0]   DnE;                                // DnE = ~DinE
  logic [`XLEN-1:0]   DAbsBE;                             // absolute value of D
  logic [`XLEN-1:0]   DAbsB;                              // registered absolute value of D, constant during division
  logic [`XLEN-1:0]   XnE;                                // DXnE = ~XinE
  logic [`XLEN-1:0]   XInitE;                             // |X|, or original X for divide by 0
  logic [`XLEN-1:0]   WnM, XQnM;                          // negated residual W and quotient XQ for postprocessing sign correction
  logic [STEPBITS:0]  step;                               // division step
  logic               Div0E, Div0M;                       // divide by 0
  logic               DivStartE;                          // start integer division
  logic               SignXE, SignDE;                     // sign of dividend and divisor
  logic               NegQE, NegWM, NegQM;                // negate quotient or residual during postprocessing
 
  //////////////////////////////
  // Execute Stage: prepare for division calculation with control logic, W logic and absolute values, initialize W and XQ
  //////////////////////////////

  // Divider control signals
  assign DivStartE = IntDivE & (state == IDLE) & ~StallM; 
  assign DivBusyE = (state == BUSY) | DivStartE;

  // Handle sign extension for W-type instructions
  if (`XLEN == 64) begin:rv64 // RV64 has W-type instructions
    mux2 #(`XLEN) xinmux(ForwardedSrcAE, {ForwardedSrcAE[31:0], 32'b0}, W64E, XinE);
    mux2 #(`XLEN) dinmux(ForwardedSrcBE, {{32{ForwardedSrcBE[31]&DivSignedE}}, ForwardedSrcBE[31:0]}, W64E, DinE);
  end else begin // RV32 has no W-type instructions
    assign XinE = ForwardedSrcAE;
    assign DinE = ForwardedSrcBE;	    
    end   

  // Extract sign bits and check fo division by zero
  assign SignDE = DivSignedE & DinE[`XLEN-1]; 
  assign SignXE = DivSignedE & XinE[`XLEN-1];
  assign NegQE = SignDE ^ SignXE;
  assign Div0E = (DinE == 0);

  // Take absolute value for signed operations, and negate D to handle subtraction in divider stages
  neg #(`XLEN) negd(DinE, DnE);
  mux2 #(`XLEN) dabsmux(DnE, DinE, SignDE, DAbsBE);  // take absolute value for signed operations, and negate for subtraction setp
  neg #(`XLEN) negx(XinE, XnE);
  mux3 #(`XLEN) xabsmux(XinE, XnE, ForwardedSrcAE, {Div0E, SignXE}, XInitE);  // take absolute value for signed operations, or keep original value for divide by 0

  //////////////////////////////
  // Division Iterations (effectively stalled execute stage, no suffix)
  //////////////////////////////

  // initialization multiplexers on first cycle of operation
  mux2 #(`XLEN) wmux(W[`IDIV_BITSPERCYCLE], {`XLEN{1'b0}}, DivStartE, WNext);
  mux2 #(`XLEN) xmux(XQ[`IDIV_BITSPERCYCLE], XInitE, DivStartE, XQNext);

  // registers before division steps
  flopen #(`XLEN) wreg(clk, DivBusyE, WNext, W[0]); 
  flopen #(`XLEN) xreg(clk, DivBusyE, XQNext, XQ[0]);
  flopen #(`XLEN) dabsreg(clk, DivStartE, DAbsBE, DAbsB);

  // one copy of divstep for each bit produced per cycle
  genvar i;
  for (i=0; i<`IDIV_BITSPERCYCLE; i = i+1)
    intdivrestoringstep divstep(W[i], XQ[i], DAbsB, W[i+1], XQ[i+1]);

  //////////////////////////////
  // Memory Stage: output sign correction and special cases
  //////////////////////////////

  flopen #(3) Div0eMReg(clk, DivStartE, {Div0E, NegQE, SignXE}, {Div0M, NegQM, NegWM});
  
  // On final setp of signed operations, negate outputs as needed to get correct sign
  neg #(`XLEN) qneg(XQ[0], XQnM);
  neg #(`XLEN) wneg(W[0], WnM);
  // Select appropriate output: normal, negated, or for divide by zero
  mux3 #(`XLEN) qmux(XQ[0], XQnM, {`XLEN{1'b1}}, {Div0M, NegQM}, QuotM); // Q taken from XQ register, negated if necessary, or all 1s when dividing by zero
  mux3 #(`XLEN) remmux(W[0], WnM, XQ[0], {Div0M, NegWM}, RemM); // REM taken from W register, negated if necessary, or from X when dividing by zero

  //////////////////////////////
  // Divider FSM to sequence Busy and Done
  //////////////////////////////

 always_ff @(posedge clk) 
    if (reset | FlushE) begin
        state <= IDLE; 
    end else if (DivStartE) begin 
        step <= 1;
        if (Div0E) state <= DONE;
        else       state <= BUSY;
     end else if (state == BUSY) begin // pause one cycle at beginning of signed operations for absolute value
        if (step[STEPBITS] | (`XLEN==64) & W64E & step[STEPBITS-1]) begin // complete in half the time for W-type instructions
            state <= DONE;
        end
        step <= step + 1;
    end else if (state == DONE) begin
      if (StallM) state <= DONE;
      else        state <= IDLE;
    end 
endmodule 
