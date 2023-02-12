///////////////////////////////////////////
// fdivsqrtstage4.sv
//
// Written: David_Harris@hmc.edu, me@KatherineParry.com, cturek@hmc.edu
// Modified:13 January 2022
//
// Purpose: radix-4 divsqrt recurrence stage
// 
// Documentation: RISC-V System on Chip Design Chapter 13
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

module fdivsqrtstage4 (
  input  logic [`DIVb-1:0] D,
  input  logic [`DIVb+3:0]  DBar, D2, DBar2,
  input  logic [`DIVb:0] U, UM,
  input  logic [`DIVb+3:0]  WS, WC,
  input  logic [`DIVb+1:0] C,
  input  logic SqrtE, j1,
  output logic [`DIVb+1:0] CNext,
  output logic un,
  output logic [`DIVb:0] UNext, UMNext, 
  output logic [`DIVb+3:0]  WSNext, WCNext
);

  logic [`DIVb+3:0]  Dsel;
  logic [3:0]     udigit;
  logic [`DIVb+3:0] F;
  logic [`DIVb+3:0] AddIn;
  logic [4:0] Smsbs;
  logic [2:0] Dmsbs;
  logic [7:0] WCmsbs, WSmsbs;
  logic CarryIn;
  logic [`DIVb+3:0]  WSA, WCA;

  // Digit Selection logic
  // u encoding:
	// 1000 = +2
	// 0100 = +1
	// 0000 =  0
	// 0010 = -1
	// 0001 = -2
  assign Smsbs = U[`DIVb:`DIVb-4];
  assign Dmsbs = D[`DIVb-1:`DIVb-3];
  assign WCmsbs = WC[`DIVb+3:`DIVb-4];
  assign WSmsbs = WS[`DIVb+3:`DIVb-4];

  fdivsqrtqsel4cmp qsel4(.Dmsbs, .Smsbs, .WSmsbs, .WCmsbs, .SqrtE, .j1, .udigit);
  assign un = 1'b0; // unused for radix 4

  // F generation logic
  fdivsqrtfgen4 fgen4(.udigit, .C({2'b11, CNext}), .U({3'b000, U}), .UM({3'b000, UM}), .F);

  // Divisor multiple logic
  always_comb
    case (udigit)
      4'b1000: Dsel = DBar2;
      4'b0100: Dsel = DBar;
      4'b0000: Dsel = '0;
      4'b0010: Dsel = {3'b0, 1'b1, D};
      4'b0001: Dsel = D2;
      default: Dsel = 'x;
    endcase

  // Residual Update
  //  {WS, WC}}Next = (WS + WC - qD or F) << 2
  assign AddIn = SqrtE ? F : Dsel;
  assign CarryIn = ~SqrtE & (udigit[3] | udigit[2]); // +1 for 2's complement of -D and -2D 
  csa #(`DIVb+4) csa(WS, WC, AddIn, CarryIn, WSA, WCA);
  assign WSNext = WSA << 2;
  assign WCNext = WCA << 2;

  // Shift thermometer code C
  assign CNext = {2'b11, C[`DIVb+1:2]};
 
  // On-the-fly converter to accumulate result
  fdivsqrtuotfc4 fdivsqrtuotfc4(.udigit, .C(CNext[`DIVb:0]), .U, .UM, .UNext, .UMNext);
endmodule


