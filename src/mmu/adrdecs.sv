///////////////////////////////////////////
// adrdecs.sv
//
// Written: David_Harris@hmc.edu 22 June 2021
// Modified: 
//
// Purpose: All the address decoders for peripherals
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

`include "wally-config.vh"
  // verilator lint_off UNOPTFLAT 

module adrdecs (
  input  logic [`PA_BITS-1:0] PhysicalAddress,
  input  logic                AccessRW, AccessRX, AccessRWX,
  input  logic [1:0]          Size,
  output logic [10:0]         SelRegions
);

  localparam logic [3:0]          SUPPORTED_SIZE = (`LLEN == 32 ? 4'b0111 : 4'b1111);
 // Determine which region of physical memory (if any) is being accessed
  adrdec dtimdec(PhysicalAddress, `DTIM_BASE, `DTIM_RANGE, `DTIM_SUPPORTED, AccessRWX, Size, SUPPORTED_SIZE, SelRegions[10]);  
  adrdec iromdec(PhysicalAddress, `IROM_BASE, `IROM_RANGE, `IROM_SUPPORTED, AccessRWX, Size, SUPPORTED_SIZE, SelRegions[9]);  
  adrdec ddr4dec(PhysicalAddress, `EXT_MEM_BASE, `EXT_MEM_RANGE, `EXT_MEM_SUPPORTED, AccessRWX, Size, SUPPORTED_SIZE, SelRegions[8]);  
  adrdec bootromdec(PhysicalAddress, `BOOTROM_BASE, `BOOTROM_RANGE, `BOOTROM_SUPPORTED, AccessRX, Size, SUPPORTED_SIZE, SelRegions[7]);
  adrdec uncoreramdec(PhysicalAddress, `UNCORE_RAM_BASE, `UNCORE_RAM_RANGE, `UNCORE_RAM_SUPPORTED, AccessRWX, Size, SUPPORTED_SIZE, SelRegions[6]);
  adrdec clintdec(PhysicalAddress, `CLINT_BASE, `CLINT_RANGE, `CLINT_SUPPORTED, AccessRW, Size, SUPPORTED_SIZE, SelRegions[5]);
  adrdec gpiodec(PhysicalAddress, `GPIO_BASE, `GPIO_RANGE, `GPIO_SUPPORTED, AccessRW, Size, 4'b0100, SelRegions[4]);
  adrdec uartdec(PhysicalAddress, `UART_BASE, `UART_RANGE, `UART_SUPPORTED, AccessRW, Size, 4'b0001, SelRegions[3]);
  adrdec plicdec(PhysicalAddress, `PLIC_BASE, `PLIC_RANGE, `PLIC_SUPPORTED, AccessRW, Size, 4'b0100, SelRegions[2]);
  adrdec sdcdec(PhysicalAddress, `SDC_BASE, `SDC_RANGE, `SDC_SUPPORTED, AccessRW, Size, SUPPORTED_SIZE & 4'b1100, SelRegions[1]); 

  assign SelRegions[0] = ~|(SelRegions[10:1]); // none of the regions are selected

endmodule

  // verilator lint_on UNOPTFLAT 
