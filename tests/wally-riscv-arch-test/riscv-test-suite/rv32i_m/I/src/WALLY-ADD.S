///////////////////////////////////////////
// ../wally-riscv-arch-test/riscv-test-suite/rv32i_m/I/src/WALLY-ADD.S
// David_Harris@hmc.edu & Katherine Parry
// Created 2023-02-12 20:53:42.885717//
// Copyright (C) 2021 Harvey Mudd College & Oklahoma State University
//
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
///////////////////////////////////////////

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64I")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN

RVTEST_CASE(0,"//check ISA:=regex(.*64.*);check ISA:=regex(.*I.*);def TEST_CASE_1=True;",temp)


RVTEST_SIGBASE( x6, wally_signature)

# Testcase 0:  rs1:x28(0x00000000), rs2:x13(0x00000000), result rd:x25(0x00000000)
li x28, MASK_XLEN(0x00000000)
li x13, MASK_XLEN(0x00000000)
ADD x25, x28, x13
sw x25, 0(x6)

# Testcase 1:  rs1:x29(0x00000000), rs2:x14(0x00000001), result rd:x2(0x00000001)
li x29, MASK_XLEN(0x00000000)
li x14, MASK_XLEN(0x00000001)
ADD x2, x29, x14
sw x2, 4(x6)

# Testcase 2:  rs1:x9(0x00000000), rs2:x31(0xffffffff), result rd:x17(0xffffffff)
li x9, MASK_XLEN(0x00000000)
li x31, MASK_XLEN(0xffffffff)
ADD x17, x9, x31
sw x17, 8(x6)

# Testcase 3:  rs1:x16(0x00000001), rs2:x13(0x00000000), result rd:x30(0x00000001)
li x16, MASK_XLEN(0x00000001)
li x13, MASK_XLEN(0x00000000)
ADD x30, x16, x13
sw x30, 12(x6)

# Testcase 4:  rs1:x26(0x00000001), rs2:x27(0x00000001), result rd:x10(0x00000002)
li x26, MASK_XLEN(0x00000001)
li x27, MASK_XLEN(0x00000001)
ADD x10, x26, x27
sw x10, 16(x6)

# Testcase 5:  rs1:x31(0x00000001), rs2:x16(0xffffffff), result rd:x12(0x00000000)
li x31, MASK_XLEN(0x00000001)
li x16, MASK_XLEN(0xffffffff)
ADD x12, x31, x16
sw x12, 20(x6)

# Testcase 6:  rs1:x19(0xffffffff), rs2:x29(0x00000000), result rd:x30(0xffffffff)
li x19, MASK_XLEN(0xffffffff)
li x29, MASK_XLEN(0x00000000)
ADD x30, x19, x29
sw x30, 24(x6)

# Testcase 7:  rs1:x7(0xffffffff), rs2:x17(0x00000001), result rd:x5(0x00000000)
li x7, MASK_XLEN(0xffffffff)
li x17, MASK_XLEN(0x00000001)
ADD x5, x7, x17
sw x5, 28(x6)

# Testcase 8:  rs1:x10(0xffffffff), rs2:x5(0xffffffff), result rd:x25(0xfffffffe)
li x10, MASK_XLEN(0xffffffff)
li x5, MASK_XLEN(0xffffffff)
ADD x25, x10, x5
sw x25, 32(x6)

# Testcase 9:  rs1:x26(0x1846d424), rs2:x9(0x9e4d6e3c), result rd:x30(0xb6944260)
li x26, MASK_XLEN(0x1846d424)
li x9, MASK_XLEN(0x9e4d6e3c)
ADD x30, x26, x9
sw x30, 36(x6)

# Testcase 10:  rs1:x23(0x88561712), rs2:x26(0xfb97d435), result rd:x20(0x83edeb47)
li x23, MASK_XLEN(0x88561712)
li x26, MASK_XLEN(0xfb97d435)
ADD x20, x23, x26
sw x20, 40(x6)

# Testcase 11:  rs1:x10(0xe6f4590b), rs2:x4(0x259f4329), result rd:x24(0x0c939c34)
li x10, MASK_XLEN(0xe6f4590b)
li x4, MASK_XLEN(0x259f4329)
ADD x24, x10, x4
sw x24, 44(x6)

.EQU NUMTESTS,12

RVTEST_CODE_END
RVMODEL_HALT

RVTEST_DATA_BEGIN
.align 4
rvtest_data:
.word 0x98765432
RVTEST_DATA_END

RVMODEL_DATA_BEGIN


wally_signature:
    .fill NUMTESTS*(XLEN/32),4,0xdeadbeef

#ifdef rvtest_mtrap_routine

mtrap_sigptr:
    .fill 64*(XLEN/32),4,0xdeadbeef

#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*(XLEN/32),4,0xdeadbeef

#endif

RVMODEL_DATA_END
// ../wally-riscv-arch-test/riscv-test-suite/rv32i_m/I/src/WALLY-ADD.S
// David_Harris@hmc.edu & Katherine Parry
