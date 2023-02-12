///////////////////////////////////////////
// tlb.sv
//
// Written: jtorrey@hmc.edu 16 February 2021
// Modified: kmacsaigoren@hmc.edu 1 June 2021
//            Implemented SV48 on top of SV39. This included adding the SvMode signal,
//            and using it to decide the translate signal and get the virtual page number
//
// Purpose: Translation lookaside buffer
//          Cache of virtural-to-physical address translations
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

/**
 * SV32 specs
 * ----------
 * Virtual address [31:0] (32 bits)
 *    [________________________________]
 *     |--VPN1--||--VPN0--||----OFF---|
 *         10        10         12
 * 
 * Physical address [33:0] (34 bits)
 *  [__________________________________]
 *   |---PPN1---||--PPN0--||----OFF---|
 *        12         10         12
 * 
 * Page Table Entry [31:0] (32 bits)
 *    [________________________________]
 *     |---PPN1---||--PPN0--|||DAGUXWRV
 *          12         10    ^^
 *                         RSW(2) -- for OS
 */

`include "wally-config.vh"

// The TLB will have 2**ENTRY_BITS total entries
module tlb #(parameter TLB_ENTRIES = 8, ITLB = 0) (
  input logic                     clk, reset,
  input  logic [`SVMODE_BITS-1:0] SATP_MODE,        // Current address translation mode
  input  logic [`ASID_BITS-1:0]   SATP_ASID,
  input  logic                    STATUS_MXR, STATUS_SUM, STATUS_MPRV,
  input  logic [1:0]              STATUS_MPP,
  input  logic [1:0]              PrivilegeModeW,   // Current privilege level of the processeor
  input  logic                    ReadAccess, 
  input  logic                    WriteAccess,
  input  logic                    DisableTranslation,
  input  logic [`XLEN-1:0]        VAdr,             // address input before translation (could be physical or virtual)
  input  logic [`XLEN-1:0]        PTE,
  input  logic [1:0]              PageTypeWriteVal,
  input  logic                    TLBWrite,
  input  logic                    TLBFlush,
  output logic [`PA_BITS-1:0]     TLBPAdr,
  output logic                    TLBMiss,
  output logic                    TLBHit,
  output logic                    Translate,
  output logic                    TLBPageFault,
  output logic                    DAPageFault
);

  logic [TLB_ENTRIES-1:0]         Matches, WriteEnables, PTE_Gs; // used as the one-hot encoding of WriteIndex
  // Sections of the virtual and physical addresses
  logic [`VPN_BITS-1:0]           VPN;
  logic [`PPN_BITS-1:0]           PPN;
  // Sections of the page table entry
  logic [7:0]                     PTEAccessBits;
  logic [1:0]                     HitPageType;
  logic                           CAMHit;
  logic                           SV39Mode;
  logic 				                  Misaligned;
  logic 				                  MegapageMisaligned;

  if(`XLEN == 32) begin
    assign MegapageMisaligned = |(PPN[9:0]); // must have zero PPN0
    assign Misaligned = (HitPageType == 2'b01) & MegapageMisaligned;
  end else begin // 64-bit
    logic  GigapageMisaligned, TerapageMisaligned;
    assign TerapageMisaligned = |(PPN[26:0]); // must have zero PPN2, PPN1, PPN0
    assign GigapageMisaligned = |(PPN[17:0]); // must have zero PPN1 and PPN0
    assign MegapageMisaligned = |(PPN[8:0]); // must have zero PPN0		  
    assign Misaligned = ((HitPageType == 2'b11) & TerapageMisaligned) | 
              ((HitPageType == 2'b10) & GigapageMisaligned) | 
              ((HitPageType == 2'b01) & MegapageMisaligned);
  end

  assign VPN = VAdr[`VPN_BITS+11:12];

  tlbcontrol #(ITLB) tlbcontrol(.SATP_MODE, .VAdr, .STATUS_MXR, .STATUS_SUM, .STATUS_MPRV, .STATUS_MPP,
    .PrivilegeModeW, .ReadAccess, .WriteAccess, .DisableTranslation, .TLBFlush,
    .PTEAccessBits, .CAMHit, .Misaligned, .TLBMiss, .TLBHit, .TLBPageFault, 
    .DAPageFault, .SV39Mode, .Translate);

  tlblru #(TLB_ENTRIES) lru(.clk, .reset, .TLBWrite, .TLBFlush, .Matches, .CAMHit, .WriteEnables);
  tlbcam #(TLB_ENTRIES, `VPN_BITS + `ASID_BITS, `VPN_SEGMENT_BITS) 
  tlbcam(.clk, .reset, .VPN, .PageTypeWriteVal, .SV39Mode, .TLBFlush, .WriteEnables, .PTE_Gs, 
           .SATP_ASID, .Matches, .HitPageType, .CAMHit);
  tlbram #(TLB_ENTRIES) tlbram(.clk, .reset, .PTE, .Matches, .WriteEnables, .PPN, .PTEAccessBits, .PTE_Gs);

  // Replace segments of the virtual page number with segments of the physical
  // page number. For 4 KB pages, the entire virtual page number is replaced.
  // For superpages, some segments are considered offsets into a larger page.
  tlbmixer Mixer(.VPN, .PPN, .HitPageType, .Offset(VAdr[11:0]), .TLBHit, .TLBPAdr);

endmodule
