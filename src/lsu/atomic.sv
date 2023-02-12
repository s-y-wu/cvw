///////////////////////////////////////////
// atomic.sv
//
// Written: Ross Thompson ross1728@gmail.com
// Created: 31 January 2022
// Modified: 18 January 2023
//
// Purpose: Wrapper for amoalu and lrsc
//
// Documentation: RISC-V System on Chip Design Chapter 14 (Figure ***)
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

module atomic (
  input logic                clk,
  input logic                reset, 
  input logic                StallW,
  input logic [`XLEN-1:0]    ReadDataM,      // LSU ReadData XLEN because FPU does not issue atomic memory operation from FPU registers
  input logic [`XLEN-1:0]    IHWriteDataM,   // LSU WriteData XLEN because FPU does not issue atomic memory operation from FPU registers
  input logic [`PA_BITS-1:0] PAdrM,          // Physical memory address
  input logic [6:0]          LSUFunct7M,     // AMO alu operation gated by HPTW
  input logic [2:0]          LSUFunct3M,     // IEU or HPTW memory operation size
  input logic [1:0]          LSUAtomicM,     // 10: AMO operation, select AMOResult as the writedata output, 01: LR/SC operation
  input logic [1:0]          PreLSURWM,      // IEU or HPTW Read/Write signal
  input logic                IgnoreRequest,  // On FlushM or TLB miss ignore memory operation
  output logic [`XLEN-1:0]   IMAWriteDataM,  // IEU, HPTW, or AMO write data
  output logic               SquashSCW,      // Store conditional failed disable write to GPR
  output logic [1:0]         LSURWM          // IEU or HPTW Read/Write signal gated by LR/SC
);

  logic [`XLEN-1:0]          AMOResult;
  logic                      MemReadM;

  amoalu amoalu(.ReadDataM, .IHWriteDataM, .LSUFunct7M, .LSUFunct3M, .AMOResult);

  mux2 #(`XLEN) wdmux(IHWriteDataM, AMOResult, LSUAtomicM[1], IMAWriteDataM);
  assign MemReadM = PreLSURWM[1] & ~IgnoreRequest;

  lrsc lrsc(.clk, .reset, .StallW, .MemReadM, .PreLSURWM, .LSUAtomicM, .PAdrM, .SquashSCW, .LSURWM);

endmodule  
