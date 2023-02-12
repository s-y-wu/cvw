///////////////////////////////////////////
// csri.sv
//
// Written: David_Harris@hmc.edu 9 January 2021
// Modified: 
//
// Purpose: Interrupt Control & Status Registers (IP, EI)
//          See RISC-V Privileged Mode Specification 20190608 & 20210108 draft
// 
// Documentation: RISC-V System on Chip Design Chapter 5
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

module csri #(parameter 
  MIE = 12'h304,
  MIP = 12'h344,
  SIE = 12'h104,
  SIP = 12'h144) (
  input  logic 			        clk, reset, 
  input  logic 			        InstrValidNotFlushedM,
  input  logic 			        CSRMWriteM, CSRSWriteM,
  input  logic [`XLEN-1:0]  CSRWriteValM,
  input  logic [11:0] 		  CSRAdrM,
  input  logic MExtInt, SExtInt, MTimerInt, MSwInt,
  output logic [11:0] 	    MIP_REGW, MIE_REGW,
  output logic [11:0]   MIP_REGW_writeable // only SEIP, STIP, SSIP are actually writeable; the rest are hardwired to 0
);

  logic [11:0]              MIP_WRITE_MASK, SIP_WRITE_MASK, MIE_WRITE_MASK;
  logic                     WriteMIPM, WriteMIEM, WriteSIPM, WriteSIEM;

  // Interrupt Write Enables
  assign WriteMIPM = CSRMWriteM & (CSRAdrM == MIP) & InstrValidNotFlushedM;
  assign WriteMIEM = CSRMWriteM & (CSRAdrM == MIE) & InstrValidNotFlushedM;
  assign WriteSIPM = CSRSWriteM & (CSRAdrM == SIP) & InstrValidNotFlushedM;
  assign WriteSIEM = CSRSWriteM & (CSRAdrM == SIE) & InstrValidNotFlushedM;

  // Interrupt Pending and Enable Registers
  // MEIP, MTIP, MSIP are read-only
  // SEIP, STIP, SSIP is writable in MIP if S mode exists
  // SSIP is writable in SIP if S mode exists
  if (`S_SUPPORTED) begin:mask
    assign MIP_WRITE_MASK = 12'h222; // SEIP, STIP, SSIP are writeable in MIP (20210108-draft 3.1.9)
    assign SIP_WRITE_MASK = 12'h002; // SSIP is writeable in SIP (privileged 20210108-draft 4.1.3) 
    assign MIE_WRITE_MASK = 12'hAAA;
  end else begin:mask
    assign MIP_WRITE_MASK = 12'h000;
    assign SIP_WRITE_MASK = 12'h000;
    assign MIE_WRITE_MASK = 12'h888;
  end
  always @(posedge clk)
    if (reset)          MIP_REGW_writeable <= 12'b0;
    else if (WriteMIPM) MIP_REGW_writeable <= (CSRWriteValM[11:0] & MIP_WRITE_MASK);
    else if (WriteSIPM) MIP_REGW_writeable <= (CSRWriteValM[11:0] & SIP_WRITE_MASK) | (MIP_REGW_writeable & ~SIP_WRITE_MASK);
  always @(posedge clk)
    if (reset)          MIE_REGW <= 12'b0;
    else if (WriteMIEM) MIE_REGW <= (CSRWriteValM[11:0] & MIE_WRITE_MASK); // MIE controls M and S fields
    else if (WriteSIEM) MIE_REGW <= (CSRWriteValM[11:0] & 12'h222) | (MIE_REGW & 12'h888); // only S fields

  assign MIP_REGW = {MExtInt,1'b0,SExtInt|MIP_REGW_writeable[9],1'b0,MTimerInt,1'b0,MIP_REGW_writeable[5],1'b0,MSwInt,1'b0,MIP_REGW_writeable[1],1'b0};
endmodule
