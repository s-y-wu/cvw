///////////////////////////////////////////
// tlblru.sv
//
// Written: tfleming@hmc.edu & jtorrey@hmc.edu 16 February 2021
// Modified:
//
// Purpose: Implementation of bit pseudo least-recently-used algorithm for
//          cache evictions. Outputs the index of the next entry to be written.
// 
// Documentation: RISC-V System on Chip Design Chapter 8
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

module tlblru #(parameter TLB_ENTRIES = 8) (
  input  logic                    clk, reset,
  input  logic                    TLBWrite,
  input  logic                    TLBFlush,
  input  logic [TLB_ENTRIES-1:0]  Matches,
  input  logic                    CAMHit,
  output logic [TLB_ENTRIES-1:0]  WriteEnables
);

  logic [TLB_ENTRIES-1:0]         RUBits, RUBitsNext, RUBitsAccessed;
  logic [TLB_ENTRIES-1:0]         WriteLines;
  logic [TLB_ENTRIES-1:0]         AccessLines; // One-hot encodings of which line is being accessed
  logic                           AllUsed;  // High if the next access causes all RU bits to be 1

  // Find the first line not recently used
  priorityonehot #(TLB_ENTRIES) nru(.a(~RUBits), .y(WriteLines));

  // Track recently used lines, updating on a CAM Hit or TLB write
  assign WriteEnables = WriteLines & {(TLB_ENTRIES){TLBWrite}};
  assign AccessLines = TLBWrite ? WriteLines : Matches;
  assign RUBitsAccessed = AccessLines | RUBits;
  assign AllUsed = &RUBitsAccessed; // if all recently used, then clear to none
  assign RUBitsNext = AllUsed ? 0 : RUBitsAccessed; 

  // enable must be ORd with TLBFlush to ensure flop fires on a flush.  DH 7/8/21
  flopenrc #(TLB_ENTRIES) lrustate(clk, reset, TLBFlush, (CAMHit | TLBWrite), RUBitsNext, RUBits);
endmodule
