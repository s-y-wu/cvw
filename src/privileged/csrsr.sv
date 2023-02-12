///////////////////////////////////////////
// crsr.sv
//
// Written: David_Harris@hmc.edu 9 January 2021
// Modified: 
//
// Purpose: Status register
//          See RISC-V Privileged Mode Specification 20190608 
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

module csrsr (
  input  logic             clk, reset, StallW,
  input  logic             WriteMSTATUSM, WriteMSTATUSHM, WriteSSTATUSM, 
  input  logic             TrapM, FRegWriteM,
  input  logic [1:0]       NextPrivilegeModeM, PrivilegeModeW,
  input  logic             mretM, sretM, 
  input  logic             WriteFRMM, WriteFFLAGSM,
  input  logic [`XLEN-1:0] CSRWriteValM,
  input  logic             SelHPTW,
  output logic [`XLEN-1:0] MSTATUS_REGW, SSTATUS_REGW, MSTATUSH_REGW,
  output logic [1:0]       STATUS_MPP,
  output logic             STATUS_SPP, STATUS_TSR, STATUS_TW,
  output logic             STATUS_MIE, STATUS_SIE,
  output logic             STATUS_MXR, STATUS_SUM,
  output logic             STATUS_MPRV, STATUS_TVM,
  output logic [1:0]       STATUS_FS,
  output logic             BigEndianM
);
  
  logic STATUS_SD, STATUS_TW_INT, STATUS_TSR_INT, STATUS_TVM_INT, STATUS_MXR_INT, STATUS_SUM_INT, STATUS_MPRV_INT;
  logic [1:0] STATUS_SXL, STATUS_UXL, STATUS_XS, STATUS_FS_INT, STATUS_MPP_NEXT;
  logic STATUS_MPIE, STATUS_SPIE, STATUS_UBE, STATUS_SBE, STATUS_MBE;
  logic nextMBE, nextSBE;

  // STATUS REGISTER FIELD
  // See Privileged Spec Section 3.1.6
  // Lower privilege status registers are a subset of the full status register
  // *** consider adding MBE, SBE, UBE fields, parameterized to be fixed or adjustable
  if (`XLEN==64) begin: csrsr64 // RV64
    assign MSTATUS_REGW = {STATUS_SD, 25'b0, STATUS_MBE, STATUS_SBE, STATUS_SXL, STATUS_UXL, 9'b0,
                          STATUS_TSR, STATUS_TW, STATUS_TVM, STATUS_MXR, STATUS_SUM, STATUS_MPRV,
                          STATUS_XS, STATUS_FS, STATUS_MPP, 2'b0,
                          STATUS_SPP, STATUS_MPIE, STATUS_UBE, STATUS_SPIE, 1'b0,
                          STATUS_MIE, 1'b0, STATUS_SIE, 1'b0};
    assign SSTATUS_REGW = {STATUS_SD, /*27'b0, */ 29'b0, /*STATUS_SXL, */ {`QEMU ? 2'b0 : STATUS_UXL}, /*9'b0, */ 12'b0,
                          /*STATUS_TSR, STATUS_TW, STATUS_TVM, */STATUS_MXR, STATUS_SUM, /* STATUS_MPRV, */ 1'b0,
                          STATUS_XS, STATUS_FS, /*STATUS_MPP, 2'b0*/ 4'b0,
                          STATUS_SPP, /*STATUS_MPIE*/ 1'b0, STATUS_UBE, STATUS_SPIE,
                          /*1'b0, STATUS_MIE, 1'b0*/ 3'b0, STATUS_SIE, 1'b0};
	assign MSTATUSH_REGW = '0; // *** does not exist when XLEN=64, but don't want it to have an undefined value.  Spec is not clear what it should be.
  end else begin: csrsr32 // RV32
    assign MSTATUS_REGW = {STATUS_SD, 8'b0,
                          STATUS_TSR, STATUS_TW, STATUS_TVM, STATUS_MXR, STATUS_SUM, STATUS_MPRV,
                          STATUS_XS, STATUS_FS, STATUS_MPP, 2'b0,
                          STATUS_SPP, STATUS_MPIE, STATUS_UBE, STATUS_SPIE, 1'b0, STATUS_MIE, 1'b0, STATUS_SIE, 1'b0};
    assign MSTATUSH_REGW = {26'b0, STATUS_MBE, STATUS_SBE, 4'b0}; 
    assign SSTATUS_REGW = {STATUS_SD, 11'b0,
                          /*STATUS_TSR, STATUS_TW, STATUS_TVM, */STATUS_MXR, STATUS_SUM, /* STATUS_MPRV, */ 1'b0,
                          STATUS_XS, STATUS_FS, /*STATUS_MPP, 2'b0*/ 4'b0,
                          STATUS_SPP, /*STATUS_MPIE*/ 1'b0, STATUS_UBE, STATUS_SPIE,
                          /*1'b0, STATUS_MIE, 1'b0*/ 3'b0, STATUS_SIE, 1'b0};
  end

  // extract values to write to upper status register on 64/32-bit access
  if (`XLEN==64) begin:upperstatus
    assign nextMBE = CSRWriteValM[37] & `BIGENDIAN_SUPPORTED;
    assign nextSBE = CSRWriteValM[36] & `S_SUPPORTED & `BIGENDIAN_SUPPORTED;
  end else begin:upperstatus
    assign nextMBE = STATUS_MBE;
    assign nextSBE = STATUS_SBE;
  end

  // harwired STATUS bits
  assign STATUS_TSR = `S_SUPPORTED & STATUS_TSR_INT; // override reigster with 0 if supervisor mode not supported
  assign STATUS_TW = (`S_SUPPORTED | `U_SUPPORTED) & STATUS_TW_INT; // override reigster with 0 if only machine mode supported
  assign STATUS_TVM = `S_SUPPORTED & STATUS_TVM_INT; // override reigster with 0 if supervisor mode not supported
  assign STATUS_MXR = `S_SUPPORTED & STATUS_MXR_INT; // override reigster with 0 if supervisor mode not supported
/*  assign STATUS_UBE = 0; // little-endian
  assign STATUS_SBE = 0; // little-endian
  assign STATUS_MBE = 0; // little-endian */
  // SXL and UXL bits only matter for RV64.  Set to 10 for RV64 if mode is supported, or 0 if not
  assign STATUS_SXL = `S_SUPPORTED ? 2'b10 : 2'b00; // 10 if supervisor mode supported
  assign STATUS_UXL = `U_SUPPORTED ? 2'b10 : 2'b00; // 10 if user mode supported
  assign STATUS_SUM = `S_SUPPORTED & `VIRTMEM_SUPPORTED & STATUS_SUM_INT; // override reigster with 0 if supervisor mode not supported
  assign STATUS_MPRV = `U_SUPPORTED & STATUS_MPRV_INT; // override with 0 if user mode not supported
  assign STATUS_FS = (`S_SUPPORTED & (`F_SUPPORTED | `D_SUPPORTED)) ? STATUS_FS_INT : 2'b00; // off if no FP  
  assign STATUS_SD = (STATUS_FS == 2'b11) | (STATUS_XS == 2'b11); // dirty state logic
  assign STATUS_XS = 2'b00; // No additional user-mode state to be dirty

  always_comb
    if      (CSRWriteValM[12:11] == `U_MODE & `U_SUPPORTED) STATUS_MPP_NEXT = `U_MODE;
    else if (CSRWriteValM[12:11] == `S_MODE & `S_SUPPORTED) STATUS_MPP_NEXT = `S_MODE;
    else                                                    STATUS_MPP_NEXT = `M_MODE;

  ///////////////////////////////////////////
  // Endianness logic Privileged Spec 3.1.6.4
  ///////////////////////////////////////////

  if (`BIGENDIAN_SUPPORTED) begin: endianmux
    // determine whether big endian accesses should be made
    logic [1:0] EndiannessPrivMode;
    always_comb begin
      if      (SelHPTW)                                  EndiannessPrivMode = `S_MODE;
      else if (PrivilegeModeW == `M_MODE & STATUS_MPRV)  EndiannessPrivMode = STATUS_MPP;
      else                                               EndiannessPrivMode = PrivilegeModeW;

      case (EndiannessPrivMode) 
        `M_MODE: BigEndianM = STATUS_MBE;
        `S_MODE: BigEndianM = STATUS_SBE;
        default: BigEndianM = STATUS_UBE;
      endcase
    end
  end else begin: endianmux
    assign BigEndianM = 0;
  end

  // registers for STATUS bits
  // complex register with reset, write enable, and the ability to update other bits in certain cases
  always_ff @(posedge clk) //, posedge reset)
    if (reset) begin
      STATUS_TSR_INT <= #1 0;
      STATUS_TW_INT <= #1 0;
      STATUS_TVM_INT <= #1 0;
      STATUS_MXR_INT <= #1 0;
      STATUS_SUM_INT <= #1 0;
      STATUS_MPRV_INT <= #1 0; // Per Priv 3.3
      STATUS_FS_INT <= #1 `F_SUPPORTED ? 2'b00 : 2'b00; // leave floating-point off until activated, even if F_SUPPORTED
      STATUS_MPP <= #1 0; 
      STATUS_SPP <= #1 0; 
      STATUS_MPIE <= #1 0; 
      STATUS_SPIE <= #1 0; 
      STATUS_MIE <= #1 0; 
      STATUS_SIE <= #1 0; 
      STATUS_MBE <= #1 0;
      STATUS_SBE <= #1 0;
      STATUS_UBE <= #1 0;
    end else if (~StallW) begin
      if (TrapM) begin
        // Update interrupt enables per Privileged Spec p. 21
        // y = PrivilegeModeW
        // x = NextPrivilegeModeM
        // Modes: 11 = Machine, 01 = Supervisor, 00 = User
        if (NextPrivilegeModeM == `M_MODE) begin
          STATUS_MPIE <= #1 STATUS_MIE;
          STATUS_MIE <= #1 0;
          STATUS_MPP <= #1 PrivilegeModeW;
        end else begin // supervisor mode
          STATUS_SPIE <= #1 STATUS_SIE;
          STATUS_SIE <= #1 0;
          STATUS_SPP <= #1 PrivilegeModeW[0];
       end
      end else if (mretM) begin // Privileged 3.1.6.1
        STATUS_MIE <= #1 STATUS_MPIE; // restore global interrupt enable
        STATUS_MPIE <= #1 1; // 
        STATUS_MPP <= #1 `U_SUPPORTED ? `U_MODE : `M_MODE; // set MPP to lowest supported privilege level
        // STATUS_MPRV_INT <= #1 0; // changed to this by Ross to solve Linux bug; might have been s spurious disagreement with QEMU
        STATUS_MPRV_INT <= #1 STATUS_MPRV_INT & (STATUS_MPP == `M_MODE); // Seems to be given by page 21 of spec.
      end else if (sretM) begin
        STATUS_SIE <= #1 STATUS_SPIE; // restore global interrupt enable
        STATUS_SPIE <= #1 `S_SUPPORTED; 
        STATUS_SPP <= #1 0; // set SPP to lowest supported privilege level to catch bugs
        STATUS_MPRV_INT <= #1 0; // always clear MPRV
      end else if (WriteMSTATUSM) begin
        STATUS_TSR_INT <= #1 CSRWriteValM[22];
        STATUS_TW_INT <= #1 CSRWriteValM[21];
        STATUS_TVM_INT <= #1 CSRWriteValM[20];
        STATUS_MXR_INT <= #1 CSRWriteValM[19];
        STATUS_SUM_INT <= #1 CSRWriteValM[18];
        STATUS_MPRV_INT <= #1 CSRWriteValM[17];
        STATUS_FS_INT <= #1 CSRWriteValM[14:13];
        STATUS_MPP <= #1 STATUS_MPP_NEXT;
        STATUS_SPP <= #1 `S_SUPPORTED & CSRWriteValM[8];
        STATUS_MPIE <= #1 CSRWriteValM[7];
        STATUS_SPIE <= #1 `S_SUPPORTED & CSRWriteValM[5];
        STATUS_MIE <= #1 CSRWriteValM[3];
        STATUS_SIE <= #1 `S_SUPPORTED & CSRWriteValM[1];
        STATUS_UBE <= #1 CSRWriteValM[6]  & `U_SUPPORTED & `BIGENDIAN_SUPPORTED;
        STATUS_MBE <= #1 nextMBE;
        STATUS_SBE <= #1 nextSBE;
      end else if (WriteMSTATUSHM) begin
        STATUS_MBE <= #1 CSRWriteValM[5] & `BIGENDIAN_SUPPORTED;
        STATUS_SBE <= #1 CSRWriteValM[4] & `S_SUPPORTED & `BIGENDIAN_SUPPORTED;
      end else if (WriteSSTATUSM) begin // write a subset of the STATUS bits
        STATUS_MXR_INT <= #1 CSRWriteValM[19];
        STATUS_SUM_INT <= #1 CSRWriteValM[18];
        STATUS_FS_INT <= #1 CSRWriteValM[14:13];
        STATUS_SPP <= #1 `S_SUPPORTED & CSRWriteValM[8];
        STATUS_SPIE <= #1 `S_SUPPORTED & CSRWriteValM[5];
        STATUS_SIE <= #1 `S_SUPPORTED & CSRWriteValM[1];
        STATUS_UBE <= #1 CSRWriteValM[6] & `U_SUPPORTED & `BIGENDIAN_SUPPORTED;
      end else if (FRegWriteM | WriteFRMM | WriteFFLAGSM) STATUS_FS_INT <= #1 2'b11; 
    end
endmodule
