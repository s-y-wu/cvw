///////////////////////////////////////////
// ../wally-riscv-arch-test/riscv-test-suite/rv32i_m/I/src/WALLY-XOR.S
// David_Harris@hmc.edu & Katherine Parry
// Created 2023-02-12 17:16:00.311172//
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

# Testcase 0:  rs1:x14(0x00000000), rs2:x19(0x00000000), result rd:x9(0x00000000)
li x14, MASK_XLEN(0x00000000)
li x19, MASK_XLEN(0x00000000)
XOR x9, x14, x19
sw x9, 0(x6)

# Testcase 1:  rs1:x15(0x00000000), rs2:x16(0x00000001), result rd:x22(0x00000001)
li x15, MASK_XLEN(0x00000000)
li x16, MASK_XLEN(0x00000001)
XOR x22, x15, x16
sw x22, 4(x6)

# Testcase 2:  rs1:x21(0x00000000), rs2:x23(0xffffffff), result rd:x30(0xffffffff)
li x21, MASK_XLEN(0x00000000)
li x23, MASK_XLEN(0xffffffff)
XOR x30, x21, x23
sw x30, 8(x6)

# Testcase 3:  rs1:x26(0x00000001), rs2:x12(0x00000000), result rd:x3(0x00000001)
li x26, MASK_XLEN(0x00000001)
li x12, MASK_XLEN(0x00000000)
XOR x3, x26, x12
sw x3, 12(x6)

# Testcase 4:  rs1:x11(0x00000001), rs2:x20(0x00000001), result rd:x4(0x00000000)
li x11, MASK_XLEN(0x00000001)
li x20, MASK_XLEN(0x00000001)
XOR x4, x11, x20
sw x4, 16(x6)

# Testcase 5:  rs1:x16(0x00000001), rs2:x19(0xffffffff), result rd:x21(0xfffffffe)
li x16, MASK_XLEN(0x00000001)
li x19, MASK_XLEN(0xffffffff)
XOR x21, x16, x19
sw x21, 20(x6)

# Testcase 6:  rs1:x11(0xffffffff), rs2:x28(0x00000000), result rd:x7(0xffffffff)
li x11, MASK_XLEN(0xffffffff)
li x28, MASK_XLEN(0x00000000)
XOR x7, x11, x28
sw x7, 24(x6)

# Testcase 7:  rs1:x8(0xffffffff), rs2:x1(0x00000001), result rd:x24(0xfffffffe)
li x8, MASK_XLEN(0xffffffff)
li x1, MASK_XLEN(0x00000001)
XOR x24, x8, x1
sw x24, 28(x6)

# Testcase 8:  rs1:x9(0xffffffff), rs2:x4(0xffffffff), result rd:x23(0x00000000)
li x9, MASK_XLEN(0xffffffff)
li x4, MASK_XLEN(0xffffffff)
XOR x23, x9, x4
sw x23, 32(x6)

# Testcase 9:  rs1:x14(0x38701a14), rs2:x27(0x5f3f5638), result rd:x2(0x674f4c2c)
li x14, MASK_XLEN(0x38701a14)
li x27, MASK_XLEN(0x5f3f5638)
XOR x2, x14, x27
sw x2, 36(x6)

# Testcase 10:  rs1:x5(0x19c16a0d), rs2:x28(0xc87a7463), result rd:x23(0xd1bb1e6e)
li x5, MASK_XLEN(0x19c16a0d)
li x28, MASK_XLEN(0xc87a7463)
XOR x23, x5, x28
sw x23, 40(x6)

# Testcase 11:  rs1:x27(0x38018b47), rs2:x19(0x0b9475b1), result rd:x21(0x3395fef6)
li x27, MASK_XLEN(0x38018b47)
li x19, MASK_XLEN(0x0b9475b1)
XOR x21, x27, x19
sw x21, 44(x6)

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
// ../wally-riscv-arch-test/riscv-test-suite/rv32i_m/I/src/WALLY-XOR.S
// David_Harris@hmc.edu & Katherine Parry
