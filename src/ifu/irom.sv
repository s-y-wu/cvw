///////////////////////////////////////////
// irom.sv
//
// Written: Ross Thompson ross1728@gmail.com
// Created: 30 January 2022
// Modified: 18 January 2023
//
// Purpose: simple instruction ROM
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

module irom(
  input logic 			  clk, 
  input logic 			  ce,        // Chip Enable.  0: Holds IROMInstrF constant
  input logic [`XLEN-1:0] Adr,       // PCNextFSpill
  output logic [31:0] 	  IROMInstrF // Instruction read data
);

  localparam XLENBYTES = `XLEN/8;
  localparam ADDR_WDITH = $clog2(`IROM_RANGE/XLENBYTES); 
  localparam OFFSET = $clog2(XLENBYTES);

  logic [`XLEN-1:0] IROMInstrFFull;
  logic [31:0] 		RawIROMInstrF;

  logic [1:0] 			AdrD;
  flopen #(2) AdrReg(clk, ce, Adr[2:1], AdrD);

  rom1p1r #(ADDR_WDITH, `XLEN) rom(.clk, .ce, .addr(Adr[ADDR_WDITH+OFFSET-1:OFFSET]), .dout(IROMInstrFFull));
  if (`XLEN == 32) assign RawIROMInstrF = IROMInstrFFull;
  else             begin
	// IROM is aligned to XLEN words, but instructions are 32 bits.  Select between the two
	// haves.  Adr is the Next PCF not PCF so we delay 1 cycle.
    assign RawIROMInstrF = AdrD[1] ? IROMInstrFFull[63:32] : IROMInstrFFull[31:0];
  end
  // If the memory addres is aligned to 2 bytes return the upper 2 bytes in the lower 2 bytes.
  // The spill logic will handle merging the two together.
  assign IROMInstrF = AdrD[0] ? {16'b0, RawIROMInstrF[31:16]} : RawIROMInstrF;
endmodule  
  
