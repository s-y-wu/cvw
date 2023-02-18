///////////////////////////////////////////
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-SLT.S
// Sean Wu (sywu@hmc.edu)
// Created 2023-02-18 01:00:53.318420//
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

# Testcase 0:  rs1:x1(0x0000000000000000), rs2:x12(0x0000000000000000), result rd:x17(0x0000000000000000)
li x1, MASK_XLEN(0x0000000000000000)
li x12, MASK_XLEN(0x0000000000000000)
SLT x17, x1, x12
sd x17, 0(x6)

# Testcase 1:  rs1:x7(0x0000000000000000), rs2:x21(0x0000000000000001), result rd:x12(0x0000000000000001)
li x7, MASK_XLEN(0x0000000000000000)
li x21, MASK_XLEN(0x0000000000000001)
SLT x12, x7, x21
sd x12, 8(x6)

# Testcase 2:  rs1:x21(0x0000000000000000), rs2:x23(0x0000000000000002), result rd:x16(0x0000000000000001)
li x21, MASK_XLEN(0x0000000000000000)
li x23, MASK_XLEN(0x0000000000000002)
SLT x16, x21, x23
sd x16, 16(x6)

# Testcase 3:  rs1:x1(0x0000000000000000), rs2:x24(0x00000000000000ff), result rd:x24(0x0000000000000001)
li x1, MASK_XLEN(0x0000000000000000)
li x24, MASK_XLEN(0x00000000000000ff)
SLT x24, x1, x24
sd x24, 24(x6)

# Testcase 4:  rs1:x8(0x0000000000000000), rs2:x19(0x624b3e976c52dd14), result rd:x29(0x0000000000000001)
li x8, MASK_XLEN(0x0000000000000000)
li x19, MASK_XLEN(0x624b3e976c52dd14)
SLT x29, x8, x19
sd x29, 32(x6)

# Testcase 5:  rs1:x31(0x0000000000000000), rs2:x25(0x7ffffffffffffffe), result rd:x30(0x0000000000000001)
li x31, MASK_XLEN(0x0000000000000000)
li x25, MASK_XLEN(0x7ffffffffffffffe)
SLT x30, x31, x25
sd x30, 40(x6)

# Testcase 6:  rs1:x14(0x0000000000000000), rs2:x3(0x7fffffffffffffff), result rd:x19(0x0000000000000001)
li x14, MASK_XLEN(0x0000000000000000)
li x3, MASK_XLEN(0x7fffffffffffffff)
SLT x19, x14, x3
sd x19, 48(x6)

# Testcase 7:  rs1:x15(0x0000000000000000), rs2:x8(0x8000000000000000), result rd:x24(0x0000000000000000)
li x15, MASK_XLEN(0x0000000000000000)
li x8, MASK_XLEN(0x8000000000000000)
SLT x24, x15, x8
sd x24, 56(x6)

# Testcase 8:  rs1:x23(0x0000000000000000), rs2:x15(0x8000000000000001), result rd:x28(0x0000000000000000)
li x23, MASK_XLEN(0x0000000000000000)
li x15, MASK_XLEN(0x8000000000000001)
SLT x28, x23, x15
sd x28, 64(x6)

# Testcase 9:  rs1:x17(0x0000000000000000), rs2:x29(0xc365ddeb9173ab42), result rd:x26(0x0000000000000000)
li x17, MASK_XLEN(0x0000000000000000)
li x29, MASK_XLEN(0xc365ddeb9173ab42)
SLT x26, x17, x29
sd x26, 72(x6)

# Testcase 10:  rs1:x26(0x0000000000000000), rs2:x23(0xfffffffffffffffe), result rd:x4(0x0000000000000000)
li x26, MASK_XLEN(0x0000000000000000)
li x23, MASK_XLEN(0xfffffffffffffffe)
SLT x4, x26, x23
sd x4, 80(x6)

# Testcase 11:  rs1:x15(0x0000000000000000), rs2:x30(0xffffffffffffffff), result rd:x3(0x0000000000000000)
li x15, MASK_XLEN(0x0000000000000000)
li x30, MASK_XLEN(0xffffffffffffffff)
SLT x3, x15, x30
sd x3, 88(x6)

# Testcase 12:  rs1:x30(0x0000000000000001), rs2:x14(0x0000000000000000), result rd:x21(0x0000000000000000)
li x30, MASK_XLEN(0x0000000000000001)
li x14, MASK_XLEN(0x0000000000000000)
SLT x21, x30, x14
sd x21, 96(x6)

# Testcase 13:  rs1:x13(0x0000000000000001), rs2:x31(0x0000000000000001), result rd:x9(0x0000000000000000)
li x13, MASK_XLEN(0x0000000000000001)
li x31, MASK_XLEN(0x0000000000000001)
SLT x9, x13, x31
sd x9, 104(x6)

# Testcase 14:  rs1:x9(0x0000000000000001), rs2:x14(0x0000000000000002), result rd:x29(0x0000000000000001)
li x9, MASK_XLEN(0x0000000000000001)
li x14, MASK_XLEN(0x0000000000000002)
SLT x29, x9, x14
sd x29, 112(x6)

# Testcase 15:  rs1:x20(0x0000000000000001), rs2:x11(0x00000000000000ff), result rd:x3(0x0000000000000001)
li x20, MASK_XLEN(0x0000000000000001)
li x11, MASK_XLEN(0x00000000000000ff)
SLT x3, x20, x11
sd x3, 120(x6)

# Testcase 16:  rs1:x10(0x0000000000000001), rs2:x1(0x624b3e976c52dd14), result rd:x16(0x0000000000000001)
li x10, MASK_XLEN(0x0000000000000001)
li x1, MASK_XLEN(0x624b3e976c52dd14)
SLT x16, x10, x1
sd x16, 128(x6)

# Testcase 17:  rs1:x1(0x0000000000000001), rs2:x25(0x7ffffffffffffffe), result rd:x9(0x0000000000000001)
li x1, MASK_XLEN(0x0000000000000001)
li x25, MASK_XLEN(0x7ffffffffffffffe)
SLT x9, x1, x25
sd x9, 136(x6)

# Testcase 18:  rs1:x7(0x0000000000000001), rs2:x25(0x7fffffffffffffff), result rd:x13(0x0000000000000001)
li x7, MASK_XLEN(0x0000000000000001)
li x25, MASK_XLEN(0x7fffffffffffffff)
SLT x13, x7, x25
sd x13, 144(x6)

# Testcase 19:  rs1:x13(0x0000000000000001), rs2:x14(0x8000000000000000), result rd:x25(0x0000000000000000)
li x13, MASK_XLEN(0x0000000000000001)
li x14, MASK_XLEN(0x8000000000000000)
SLT x25, x13, x14
sd x25, 152(x6)

# Testcase 20:  rs1:x13(0x0000000000000001), rs2:x23(0x8000000000000001), result rd:x29(0x0000000000000000)
li x13, MASK_XLEN(0x0000000000000001)
li x23, MASK_XLEN(0x8000000000000001)
SLT x29, x13, x23
sd x29, 160(x6)

# Testcase 21:  rs1:x27(0x0000000000000001), rs2:x2(0xc365ddeb9173ab42), result rd:x19(0x0000000000000000)
li x27, MASK_XLEN(0x0000000000000001)
li x2, MASK_XLEN(0xc365ddeb9173ab42)
SLT x19, x27, x2
sd x19, 168(x6)

# Testcase 22:  rs1:x15(0x0000000000000001), rs2:x12(0xfffffffffffffffe), result rd:x27(0x0000000000000000)
li x15, MASK_XLEN(0x0000000000000001)
li x12, MASK_XLEN(0xfffffffffffffffe)
SLT x27, x15, x12
sd x27, 176(x6)

# Testcase 23:  rs1:x19(0x0000000000000001), rs2:x5(0xffffffffffffffff), result rd:x19(0x0000000000000000)
li x19, MASK_XLEN(0x0000000000000001)
li x5, MASK_XLEN(0xffffffffffffffff)
SLT x19, x19, x5
sd x19, 184(x6)

# Testcase 24:  rs1:x23(0x0000000000000002), rs2:x9(0x0000000000000000), result rd:x11(0x0000000000000000)
li x23, MASK_XLEN(0x0000000000000002)
li x9, MASK_XLEN(0x0000000000000000)
SLT x11, x23, x9
sd x11, 192(x6)

# Testcase 25:  rs1:x27(0x0000000000000002), rs2:x1(0x0000000000000001), result rd:x13(0x0000000000000000)
li x27, MASK_XLEN(0x0000000000000002)
li x1, MASK_XLEN(0x0000000000000001)
SLT x13, x27, x1
sd x13, 200(x6)

# Testcase 26:  rs1:x16(0x0000000000000002), rs2:x30(0x0000000000000002), result rd:x17(0x0000000000000000)
li x16, MASK_XLEN(0x0000000000000002)
li x30, MASK_XLEN(0x0000000000000002)
SLT x17, x16, x30
sd x17, 208(x6)

# Testcase 27:  rs1:x5(0x0000000000000002), rs2:x2(0x00000000000000ff), result rd:x3(0x0000000000000001)
li x5, MASK_XLEN(0x0000000000000002)
li x2, MASK_XLEN(0x00000000000000ff)
SLT x3, x5, x2
sd x3, 216(x6)

# Testcase 28:  rs1:x19(0x0000000000000002), rs2:x28(0x624b3e976c52dd14), result rd:x12(0x0000000000000001)
li x19, MASK_XLEN(0x0000000000000002)
li x28, MASK_XLEN(0x624b3e976c52dd14)
SLT x12, x19, x28
sd x12, 224(x6)

# Testcase 29:  rs1:x12(0x0000000000000002), rs2:x1(0x7ffffffffffffffe), result rd:x3(0x0000000000000001)
li x12, MASK_XLEN(0x0000000000000002)
li x1, MASK_XLEN(0x7ffffffffffffffe)
SLT x3, x12, x1
sd x3, 232(x6)

# Testcase 30:  rs1:x7(0x0000000000000002), rs2:x23(0x7fffffffffffffff), result rd:x4(0x0000000000000001)
li x7, MASK_XLEN(0x0000000000000002)
li x23, MASK_XLEN(0x7fffffffffffffff)
SLT x4, x7, x23
sd x4, 240(x6)

# Testcase 31:  rs1:x22(0x0000000000000002), rs2:x18(0x8000000000000000), result rd:x16(0x0000000000000000)
li x22, MASK_XLEN(0x0000000000000002)
li x18, MASK_XLEN(0x8000000000000000)
SLT x16, x22, x18
sd x16, 248(x6)

# Testcase 32:  rs1:x2(0x0000000000000002), rs2:x11(0x8000000000000001), result rd:x30(0x0000000000000000)
li x2, MASK_XLEN(0x0000000000000002)
li x11, MASK_XLEN(0x8000000000000001)
SLT x30, x2, x11
sd x30, 256(x6)

# Testcase 33:  rs1:x27(0x0000000000000002), rs2:x28(0xc365ddeb9173ab42), result rd:x31(0x0000000000000000)
li x27, MASK_XLEN(0x0000000000000002)
li x28, MASK_XLEN(0xc365ddeb9173ab42)
SLT x31, x27, x28
sd x31, 264(x6)

# Testcase 34:  rs1:x31(0x0000000000000002), rs2:x1(0xfffffffffffffffe), result rd:x11(0x0000000000000000)
li x31, MASK_XLEN(0x0000000000000002)
li x1, MASK_XLEN(0xfffffffffffffffe)
SLT x11, x31, x1
sd x11, 272(x6)

# Testcase 35:  rs1:x13(0x0000000000000002), rs2:x29(0xffffffffffffffff), result rd:x5(0x0000000000000000)
li x13, MASK_XLEN(0x0000000000000002)
li x29, MASK_XLEN(0xffffffffffffffff)
SLT x5, x13, x29
sd x5, 280(x6)

# Testcase 36:  rs1:x25(0x00000000000000ff), rs2:x21(0x0000000000000000), result rd:x9(0x0000000000000000)
li x25, MASK_XLEN(0x00000000000000ff)
li x21, MASK_XLEN(0x0000000000000000)
SLT x9, x25, x21
sd x9, 288(x6)

# Testcase 37:  rs1:x14(0x00000000000000ff), rs2:x22(0x0000000000000001), result rd:x5(0x0000000000000000)
li x14, MASK_XLEN(0x00000000000000ff)
li x22, MASK_XLEN(0x0000000000000001)
SLT x5, x14, x22
sd x5, 296(x6)

# Testcase 38:  rs1:x20(0x00000000000000ff), rs2:x5(0x0000000000000002), result rd:x13(0x0000000000000000)
li x20, MASK_XLEN(0x00000000000000ff)
li x5, MASK_XLEN(0x0000000000000002)
SLT x13, x20, x5
sd x13, 304(x6)

# Testcase 39:  rs1:x28(0x00000000000000ff), rs2:x10(0x00000000000000ff), result rd:x17(0x0000000000000000)
li x28, MASK_XLEN(0x00000000000000ff)
li x10, MASK_XLEN(0x00000000000000ff)
SLT x17, x28, x10
sd x17, 312(x6)

# Testcase 40:  rs1:x29(0x00000000000000ff), rs2:x5(0x624b3e976c52dd14), result rd:x30(0x0000000000000001)
li x29, MASK_XLEN(0x00000000000000ff)
li x5, MASK_XLEN(0x624b3e976c52dd14)
SLT x30, x29, x5
sd x30, 320(x6)

# Testcase 41:  rs1:x16(0x00000000000000ff), rs2:x23(0x7ffffffffffffffe), result rd:x21(0x0000000000000001)
li x16, MASK_XLEN(0x00000000000000ff)
li x23, MASK_XLEN(0x7ffffffffffffffe)
SLT x21, x16, x23
sd x21, 328(x6)

# Testcase 42:  rs1:x23(0x00000000000000ff), rs2:x25(0x7fffffffffffffff), result rd:x24(0x0000000000000001)
li x23, MASK_XLEN(0x00000000000000ff)
li x25, MASK_XLEN(0x7fffffffffffffff)
SLT x24, x23, x25
sd x24, 336(x6)

# Testcase 43:  rs1:x2(0x00000000000000ff), rs2:x24(0x8000000000000000), result rd:x27(0x0000000000000000)
li x2, MASK_XLEN(0x00000000000000ff)
li x24, MASK_XLEN(0x8000000000000000)
SLT x27, x2, x24
sd x27, 344(x6)

# Testcase 44:  rs1:x17(0x00000000000000ff), rs2:x2(0x8000000000000001), result rd:x27(0x0000000000000000)
li x17, MASK_XLEN(0x00000000000000ff)
li x2, MASK_XLEN(0x8000000000000001)
SLT x27, x17, x2
sd x27, 352(x6)

# Testcase 45:  rs1:x18(0x00000000000000ff), rs2:x23(0xc365ddeb9173ab42), result rd:x24(0x0000000000000000)
li x18, MASK_XLEN(0x00000000000000ff)
li x23, MASK_XLEN(0xc365ddeb9173ab42)
SLT x24, x18, x23
sd x24, 360(x6)

# Testcase 46:  rs1:x23(0x00000000000000ff), rs2:x21(0xfffffffffffffffe), result rd:x13(0x0000000000000000)
li x23, MASK_XLEN(0x00000000000000ff)
li x21, MASK_XLEN(0xfffffffffffffffe)
SLT x13, x23, x21
sd x13, 368(x6)

# Testcase 47:  rs1:x26(0x00000000000000ff), rs2:x19(0xffffffffffffffff), result rd:x27(0x0000000000000000)
li x26, MASK_XLEN(0x00000000000000ff)
li x19, MASK_XLEN(0xffffffffffffffff)
SLT x27, x26, x19
sd x27, 376(x6)

# Testcase 48:  rs1:x7(0x624b3e976c52dd14), rs2:x26(0x0000000000000000), result rd:x9(0x0000000000000000)
li x7, MASK_XLEN(0x624b3e976c52dd14)
li x26, MASK_XLEN(0x0000000000000000)
SLT x9, x7, x26
sd x9, 384(x6)

# Testcase 49:  rs1:x11(0x624b3e976c52dd14), rs2:x23(0x0000000000000001), result rd:x23(0x0000000000000000)
li x11, MASK_XLEN(0x624b3e976c52dd14)
li x23, MASK_XLEN(0x0000000000000001)
SLT x23, x11, x23
sd x23, 392(x6)

# Testcase 50:  rs1:x9(0x624b3e976c52dd14), rs2:x26(0x0000000000000002), result rd:x9(0x0000000000000000)
li x9, MASK_XLEN(0x624b3e976c52dd14)
li x26, MASK_XLEN(0x0000000000000002)
SLT x9, x9, x26
sd x9, 400(x6)

# Testcase 51:  rs1:x17(0x624b3e976c52dd14), rs2:x30(0x00000000000000ff), result rd:x15(0x0000000000000000)
li x17, MASK_XLEN(0x624b3e976c52dd14)
li x30, MASK_XLEN(0x00000000000000ff)
SLT x15, x17, x30
sd x15, 408(x6)

# Testcase 52:  rs1:x30(0x624b3e976c52dd14), rs2:x5(0x624b3e976c52dd14), result rd:x25(0x0000000000000000)
li x30, MASK_XLEN(0x624b3e976c52dd14)
li x5, MASK_XLEN(0x624b3e976c52dd14)
SLT x25, x30, x5
sd x25, 416(x6)

# Testcase 53:  rs1:x29(0x624b3e976c52dd14), rs2:x15(0x7ffffffffffffffe), result rd:x18(0x0000000000000001)
li x29, MASK_XLEN(0x624b3e976c52dd14)
li x15, MASK_XLEN(0x7ffffffffffffffe)
SLT x18, x29, x15
sd x18, 424(x6)

# Testcase 54:  rs1:x5(0x624b3e976c52dd14), rs2:x2(0x7fffffffffffffff), result rd:x21(0x0000000000000001)
li x5, MASK_XLEN(0x624b3e976c52dd14)
li x2, MASK_XLEN(0x7fffffffffffffff)
SLT x21, x5, x2
sd x21, 432(x6)

# Testcase 55:  rs1:x17(0x624b3e976c52dd14), rs2:x2(0x8000000000000000), result rd:x29(0x0000000000000000)
li x17, MASK_XLEN(0x624b3e976c52dd14)
li x2, MASK_XLEN(0x8000000000000000)
SLT x29, x17, x2
sd x29, 440(x6)

# Testcase 56:  rs1:x25(0x624b3e976c52dd14), rs2:x11(0x8000000000000001), result rd:x27(0x0000000000000000)
li x25, MASK_XLEN(0x624b3e976c52dd14)
li x11, MASK_XLEN(0x8000000000000001)
SLT x27, x25, x11
sd x27, 448(x6)

# Testcase 57:  rs1:x31(0x624b3e976c52dd14), rs2:x3(0xc365ddeb9173ab42), result rd:x7(0x0000000000000000)
li x31, MASK_XLEN(0x624b3e976c52dd14)
li x3, MASK_XLEN(0xc365ddeb9173ab42)
SLT x7, x31, x3
sd x7, 456(x6)

# Testcase 58:  rs1:x21(0x624b3e976c52dd14), rs2:x26(0xfffffffffffffffe), result rd:x15(0x0000000000000000)
li x21, MASK_XLEN(0x624b3e976c52dd14)
li x26, MASK_XLEN(0xfffffffffffffffe)
SLT x15, x21, x26
sd x15, 464(x6)

# Testcase 59:  rs1:x20(0x624b3e976c52dd14), rs2:x8(0xffffffffffffffff), result rd:x26(0x0000000000000000)
li x20, MASK_XLEN(0x624b3e976c52dd14)
li x8, MASK_XLEN(0xffffffffffffffff)
SLT x26, x20, x8
sd x26, 472(x6)

# Testcase 60:  rs1:x23(0x7ffffffffffffffe), rs2:x11(0x0000000000000000), result rd:x30(0x0000000000000000)
li x23, MASK_XLEN(0x7ffffffffffffffe)
li x11, MASK_XLEN(0x0000000000000000)
SLT x30, x23, x11
sd x30, 480(x6)

# Testcase 61:  rs1:x21(0x7ffffffffffffffe), rs2:x5(0x0000000000000001), result rd:x16(0x0000000000000000)
li x21, MASK_XLEN(0x7ffffffffffffffe)
li x5, MASK_XLEN(0x0000000000000001)
SLT x16, x21, x5
sd x16, 488(x6)

# Testcase 62:  rs1:x25(0x7ffffffffffffffe), rs2:x18(0x0000000000000002), result rd:x2(0x0000000000000000)
li x25, MASK_XLEN(0x7ffffffffffffffe)
li x18, MASK_XLEN(0x0000000000000002)
SLT x2, x25, x18
sd x2, 496(x6)

# Testcase 63:  rs1:x18(0x7ffffffffffffffe), rs2:x3(0x00000000000000ff), result rd:x27(0x0000000000000000)
li x18, MASK_XLEN(0x7ffffffffffffffe)
li x3, MASK_XLEN(0x00000000000000ff)
SLT x27, x18, x3
sd x27, 504(x6)

# Testcase 64:  rs1:x17(0x7ffffffffffffffe), rs2:x11(0x624b3e976c52dd14), result rd:x1(0x0000000000000000)
li x17, MASK_XLEN(0x7ffffffffffffffe)
li x11, MASK_XLEN(0x624b3e976c52dd14)
SLT x1, x17, x11
sd x1, 512(x6)

# Testcase 65:  rs1:x27(0x7ffffffffffffffe), rs2:x25(0x7ffffffffffffffe), result rd:x3(0x0000000000000000)
li x27, MASK_XLEN(0x7ffffffffffffffe)
li x25, MASK_XLEN(0x7ffffffffffffffe)
SLT x3, x27, x25
sd x3, 520(x6)

# Testcase 66:  rs1:x4(0x7ffffffffffffffe), rs2:x14(0x7fffffffffffffff), result rd:x20(0x0000000000000001)
li x4, MASK_XLEN(0x7ffffffffffffffe)
li x14, MASK_XLEN(0x7fffffffffffffff)
SLT x20, x4, x14
sd x20, 528(x6)

# Testcase 67:  rs1:x12(0x7ffffffffffffffe), rs2:x19(0x8000000000000000), result rd:x15(0x0000000000000000)
li x12, MASK_XLEN(0x7ffffffffffffffe)
li x19, MASK_XLEN(0x8000000000000000)
SLT x15, x12, x19
sd x15, 536(x6)

# Testcase 68:  rs1:x11(0x7ffffffffffffffe), rs2:x27(0x8000000000000001), result rd:x13(0x0000000000000000)
li x11, MASK_XLEN(0x7ffffffffffffffe)
li x27, MASK_XLEN(0x8000000000000001)
SLT x13, x11, x27
sd x13, 544(x6)

# Testcase 69:  rs1:x17(0x7ffffffffffffffe), rs2:x12(0xc365ddeb9173ab42), result rd:x27(0x0000000000000000)
li x17, MASK_XLEN(0x7ffffffffffffffe)
li x12, MASK_XLEN(0xc365ddeb9173ab42)
SLT x27, x17, x12
sd x27, 552(x6)

# Testcase 70:  rs1:x28(0x7ffffffffffffffe), rs2:x21(0xfffffffffffffffe), result rd:x4(0x0000000000000000)
li x28, MASK_XLEN(0x7ffffffffffffffe)
li x21, MASK_XLEN(0xfffffffffffffffe)
SLT x4, x28, x21
sd x4, 560(x6)

# Testcase 71:  rs1:x5(0x7ffffffffffffffe), rs2:x11(0xffffffffffffffff), result rd:x30(0x0000000000000000)
li x5, MASK_XLEN(0x7ffffffffffffffe)
li x11, MASK_XLEN(0xffffffffffffffff)
SLT x30, x5, x11
sd x30, 568(x6)

# Testcase 72:  rs1:x5(0x7fffffffffffffff), rs2:x1(0x0000000000000000), result rd:x11(0x0000000000000000)
li x5, MASK_XLEN(0x7fffffffffffffff)
li x1, MASK_XLEN(0x0000000000000000)
SLT x11, x5, x1
sd x11, 576(x6)

# Testcase 73:  rs1:x29(0x7fffffffffffffff), rs2:x20(0x0000000000000001), result rd:x7(0x0000000000000000)
li x29, MASK_XLEN(0x7fffffffffffffff)
li x20, MASK_XLEN(0x0000000000000001)
SLT x7, x29, x20
sd x7, 584(x6)

# Testcase 74:  rs1:x2(0x7fffffffffffffff), rs2:x14(0x0000000000000002), result rd:x21(0x0000000000000000)
li x2, MASK_XLEN(0x7fffffffffffffff)
li x14, MASK_XLEN(0x0000000000000002)
SLT x21, x2, x14
sd x21, 592(x6)

# Testcase 75:  rs1:x2(0x7fffffffffffffff), rs2:x23(0x00000000000000ff), result rd:x10(0x0000000000000000)
li x2, MASK_XLEN(0x7fffffffffffffff)
li x23, MASK_XLEN(0x00000000000000ff)
SLT x10, x2, x23
sd x10, 600(x6)

# Testcase 76:  rs1:x26(0x7fffffffffffffff), rs2:x13(0x624b3e976c52dd14), result rd:x30(0x0000000000000000)
li x26, MASK_XLEN(0x7fffffffffffffff)
li x13, MASK_XLEN(0x624b3e976c52dd14)
SLT x30, x26, x13
sd x30, 608(x6)

# Testcase 77:  rs1:x2(0x7fffffffffffffff), rs2:x20(0x7ffffffffffffffe), result rd:x25(0x0000000000000000)
li x2, MASK_XLEN(0x7fffffffffffffff)
li x20, MASK_XLEN(0x7ffffffffffffffe)
SLT x25, x2, x20
sd x25, 616(x6)

# Testcase 78:  rs1:x12(0x7fffffffffffffff), rs2:x30(0x7fffffffffffffff), result rd:x27(0x0000000000000000)
li x12, MASK_XLEN(0x7fffffffffffffff)
li x30, MASK_XLEN(0x7fffffffffffffff)
SLT x27, x12, x30
sd x27, 624(x6)

# Testcase 79:  rs1:x30(0x7fffffffffffffff), rs2:x3(0x8000000000000000), result rd:x14(0x0000000000000000)
li x30, MASK_XLEN(0x7fffffffffffffff)
li x3, MASK_XLEN(0x8000000000000000)
SLT x14, x30, x3
sd x14, 632(x6)

# Testcase 80:  rs1:x2(0x7fffffffffffffff), rs2:x15(0x8000000000000001), result rd:x12(0x0000000000000000)
li x2, MASK_XLEN(0x7fffffffffffffff)
li x15, MASK_XLEN(0x8000000000000001)
SLT x12, x2, x15
sd x12, 640(x6)

# Testcase 81:  rs1:x20(0x7fffffffffffffff), rs2:x29(0xc365ddeb9173ab42), result rd:x20(0x0000000000000000)
li x20, MASK_XLEN(0x7fffffffffffffff)
li x29, MASK_XLEN(0xc365ddeb9173ab42)
SLT x20, x20, x29
sd x20, 648(x6)

# Testcase 82:  rs1:x25(0x7fffffffffffffff), rs2:x9(0xfffffffffffffffe), result rd:x22(0x0000000000000000)
li x25, MASK_XLEN(0x7fffffffffffffff)
li x9, MASK_XLEN(0xfffffffffffffffe)
SLT x22, x25, x9
sd x22, 656(x6)

# Testcase 83:  rs1:x10(0x7fffffffffffffff), rs2:x19(0xffffffffffffffff), result rd:x28(0x0000000000000000)
li x10, MASK_XLEN(0x7fffffffffffffff)
li x19, MASK_XLEN(0xffffffffffffffff)
SLT x28, x10, x19
sd x28, 664(x6)

# Testcase 84:  rs1:x26(0x8000000000000000), rs2:x15(0x0000000000000000), result rd:x14(0x0000000000000001)
li x26, MASK_XLEN(0x8000000000000000)
li x15, MASK_XLEN(0x0000000000000000)
SLT x14, x26, x15
sd x14, 672(x6)

# Testcase 85:  rs1:x26(0x8000000000000000), rs2:x9(0x0000000000000001), result rd:x7(0x0000000000000001)
li x26, MASK_XLEN(0x8000000000000000)
li x9, MASK_XLEN(0x0000000000000001)
SLT x7, x26, x9
sd x7, 680(x6)

# Testcase 86:  rs1:x31(0x8000000000000000), rs2:x13(0x0000000000000002), result rd:x3(0x0000000000000001)
li x31, MASK_XLEN(0x8000000000000000)
li x13, MASK_XLEN(0x0000000000000002)
SLT x3, x31, x13
sd x3, 688(x6)

# Testcase 87:  rs1:x12(0x8000000000000000), rs2:x4(0x00000000000000ff), result rd:x4(0x0000000000000001)
li x12, MASK_XLEN(0x8000000000000000)
li x4, MASK_XLEN(0x00000000000000ff)
SLT x4, x12, x4
sd x4, 696(x6)

# Testcase 88:  rs1:x1(0x8000000000000000), rs2:x12(0x624b3e976c52dd14), result rd:x1(0x0000000000000001)
li x1, MASK_XLEN(0x8000000000000000)
li x12, MASK_XLEN(0x624b3e976c52dd14)
SLT x1, x1, x12
sd x1, 704(x6)

# Testcase 89:  rs1:x23(0x8000000000000000), rs2:x21(0x7ffffffffffffffe), result rd:x29(0x0000000000000001)
li x23, MASK_XLEN(0x8000000000000000)
li x21, MASK_XLEN(0x7ffffffffffffffe)
SLT x29, x23, x21
sd x29, 712(x6)

# Testcase 90:  rs1:x1(0x8000000000000000), rs2:x11(0x7fffffffffffffff), result rd:x15(0x0000000000000001)
li x1, MASK_XLEN(0x8000000000000000)
li x11, MASK_XLEN(0x7fffffffffffffff)
SLT x15, x1, x11
sd x15, 720(x6)

# Testcase 91:  rs1:x26(0x8000000000000000), rs2:x18(0x8000000000000000), result rd:x24(0x0000000000000000)
li x26, MASK_XLEN(0x8000000000000000)
li x18, MASK_XLEN(0x8000000000000000)
SLT x24, x26, x18
sd x24, 728(x6)

# Testcase 92:  rs1:x28(0x8000000000000000), rs2:x23(0x8000000000000001), result rd:x16(0x0000000000000001)
li x28, MASK_XLEN(0x8000000000000000)
li x23, MASK_XLEN(0x8000000000000001)
SLT x16, x28, x23
sd x16, 736(x6)

# Testcase 93:  rs1:x16(0x8000000000000000), rs2:x3(0xc365ddeb9173ab42), result rd:x28(0x0000000000000001)
li x16, MASK_XLEN(0x8000000000000000)
li x3, MASK_XLEN(0xc365ddeb9173ab42)
SLT x28, x16, x3
sd x28, 744(x6)

# Testcase 94:  rs1:x2(0x8000000000000000), rs2:x18(0xfffffffffffffffe), result rd:x28(0x0000000000000001)
li x2, MASK_XLEN(0x8000000000000000)
li x18, MASK_XLEN(0xfffffffffffffffe)
SLT x28, x2, x18
sd x28, 752(x6)

# Testcase 95:  rs1:x13(0x8000000000000000), rs2:x26(0xffffffffffffffff), result rd:x26(0x0000000000000001)
li x13, MASK_XLEN(0x8000000000000000)
li x26, MASK_XLEN(0xffffffffffffffff)
SLT x26, x13, x26
sd x26, 760(x6)

# Testcase 96:  rs1:x28(0x8000000000000001), rs2:x30(0x0000000000000000), result rd:x9(0x0000000000000001)
li x28, MASK_XLEN(0x8000000000000001)
li x30, MASK_XLEN(0x0000000000000000)
SLT x9, x28, x30
sd x9, 768(x6)

# Testcase 97:  rs1:x1(0x8000000000000001), rs2:x21(0x0000000000000001), result rd:x17(0x0000000000000001)
li x1, MASK_XLEN(0x8000000000000001)
li x21, MASK_XLEN(0x0000000000000001)
SLT x17, x1, x21
sd x17, 776(x6)

# Testcase 98:  rs1:x4(0x8000000000000001), rs2:x27(0x0000000000000002), result rd:x27(0x0000000000000001)
li x4, MASK_XLEN(0x8000000000000001)
li x27, MASK_XLEN(0x0000000000000002)
SLT x27, x4, x27
sd x27, 784(x6)

# Testcase 99:  rs1:x3(0x8000000000000001), rs2:x11(0x00000000000000ff), result rd:x12(0x0000000000000001)
li x3, MASK_XLEN(0x8000000000000001)
li x11, MASK_XLEN(0x00000000000000ff)
SLT x12, x3, x11
sd x12, 792(x6)

# Testcase 100:  rs1:x31(0x8000000000000001), rs2:x4(0x624b3e976c52dd14), result rd:x16(0x0000000000000001)
li x31, MASK_XLEN(0x8000000000000001)
li x4, MASK_XLEN(0x624b3e976c52dd14)
SLT x16, x31, x4
sd x16, 800(x6)

# Testcase 101:  rs1:x31(0x8000000000000001), rs2:x2(0x7ffffffffffffffe), result rd:x5(0x0000000000000001)
li x31, MASK_XLEN(0x8000000000000001)
li x2, MASK_XLEN(0x7ffffffffffffffe)
SLT x5, x31, x2
sd x5, 808(x6)

# Testcase 102:  rs1:x30(0x8000000000000001), rs2:x17(0x7fffffffffffffff), result rd:x21(0x0000000000000001)
li x30, MASK_XLEN(0x8000000000000001)
li x17, MASK_XLEN(0x7fffffffffffffff)
SLT x21, x30, x17
sd x21, 816(x6)

# Testcase 103:  rs1:x26(0x8000000000000001), rs2:x10(0x8000000000000000), result rd:x31(0x0000000000000000)
li x26, MASK_XLEN(0x8000000000000001)
li x10, MASK_XLEN(0x8000000000000000)
SLT x31, x26, x10
sd x31, 824(x6)

# Testcase 104:  rs1:x2(0x8000000000000001), rs2:x1(0x8000000000000001), result rd:x13(0x0000000000000000)
li x2, MASK_XLEN(0x8000000000000001)
li x1, MASK_XLEN(0x8000000000000001)
SLT x13, x2, x1
sd x13, 832(x6)

# Testcase 105:  rs1:x18(0x8000000000000001), rs2:x23(0xc365ddeb9173ab42), result rd:x5(0x0000000000000001)
li x18, MASK_XLEN(0x8000000000000001)
li x23, MASK_XLEN(0xc365ddeb9173ab42)
SLT x5, x18, x23
sd x5, 840(x6)

# Testcase 106:  rs1:x22(0x8000000000000001), rs2:x8(0xfffffffffffffffe), result rd:x31(0x0000000000000001)
li x22, MASK_XLEN(0x8000000000000001)
li x8, MASK_XLEN(0xfffffffffffffffe)
SLT x31, x22, x8
sd x31, 848(x6)

# Testcase 107:  rs1:x29(0x8000000000000001), rs2:x30(0xffffffffffffffff), result rd:x20(0x0000000000000001)
li x29, MASK_XLEN(0x8000000000000001)
li x30, MASK_XLEN(0xffffffffffffffff)
SLT x20, x29, x30
sd x20, 856(x6)

# Testcase 108:  rs1:x11(0xc365ddeb9173ab42), rs2:x31(0x0000000000000000), result rd:x1(0x0000000000000001)
li x11, MASK_XLEN(0xc365ddeb9173ab42)
li x31, MASK_XLEN(0x0000000000000000)
SLT x1, x11, x31
sd x1, 864(x6)

# Testcase 109:  rs1:x16(0xc365ddeb9173ab42), rs2:x31(0x0000000000000001), result rd:x29(0x0000000000000001)
li x16, MASK_XLEN(0xc365ddeb9173ab42)
li x31, MASK_XLEN(0x0000000000000001)
SLT x29, x16, x31
sd x29, 872(x6)

# Testcase 110:  rs1:x21(0xc365ddeb9173ab42), rs2:x22(0x0000000000000002), result rd:x13(0x0000000000000001)
li x21, MASK_XLEN(0xc365ddeb9173ab42)
li x22, MASK_XLEN(0x0000000000000002)
SLT x13, x21, x22
sd x13, 880(x6)

# Testcase 111:  rs1:x2(0xc365ddeb9173ab42), rs2:x8(0x00000000000000ff), result rd:x8(0x0000000000000001)
li x2, MASK_XLEN(0xc365ddeb9173ab42)
li x8, MASK_XLEN(0x00000000000000ff)
SLT x8, x2, x8
sd x8, 888(x6)

# Testcase 112:  rs1:x21(0xc365ddeb9173ab42), rs2:x10(0x624b3e976c52dd14), result rd:x11(0x0000000000000001)
li x21, MASK_XLEN(0xc365ddeb9173ab42)
li x10, MASK_XLEN(0x624b3e976c52dd14)
SLT x11, x21, x10
sd x11, 896(x6)

# Testcase 113:  rs1:x29(0xc365ddeb9173ab42), rs2:x14(0x7ffffffffffffffe), result rd:x15(0x0000000000000001)
li x29, MASK_XLEN(0xc365ddeb9173ab42)
li x14, MASK_XLEN(0x7ffffffffffffffe)
SLT x15, x29, x14
sd x15, 904(x6)

# Testcase 114:  rs1:x12(0xc365ddeb9173ab42), rs2:x29(0x7fffffffffffffff), result rd:x19(0x0000000000000001)
li x12, MASK_XLEN(0xc365ddeb9173ab42)
li x29, MASK_XLEN(0x7fffffffffffffff)
SLT x19, x12, x29
sd x19, 912(x6)

# Testcase 115:  rs1:x5(0xc365ddeb9173ab42), rs2:x13(0x8000000000000000), result rd:x19(0x0000000000000000)
li x5, MASK_XLEN(0xc365ddeb9173ab42)
li x13, MASK_XLEN(0x8000000000000000)
SLT x19, x5, x13
sd x19, 920(x6)

# Testcase 116:  rs1:x30(0xc365ddeb9173ab42), rs2:x19(0x8000000000000001), result rd:x1(0x0000000000000000)
li x30, MASK_XLEN(0xc365ddeb9173ab42)
li x19, MASK_XLEN(0x8000000000000001)
SLT x1, x30, x19
sd x1, 928(x6)

# Testcase 117:  rs1:x22(0xc365ddeb9173ab42), rs2:x13(0xc365ddeb9173ab42), result rd:x23(0x0000000000000000)
li x22, MASK_XLEN(0xc365ddeb9173ab42)
li x13, MASK_XLEN(0xc365ddeb9173ab42)
SLT x23, x22, x13
sd x23, 936(x6)

# Testcase 118:  rs1:x11(0xc365ddeb9173ab42), rs2:x17(0xfffffffffffffffe), result rd:x1(0x0000000000000001)
li x11, MASK_XLEN(0xc365ddeb9173ab42)
li x17, MASK_XLEN(0xfffffffffffffffe)
SLT x1, x11, x17
sd x1, 944(x6)

# Testcase 119:  rs1:x30(0xc365ddeb9173ab42), rs2:x4(0xffffffffffffffff), result rd:x19(0x0000000000000001)
li x30, MASK_XLEN(0xc365ddeb9173ab42)
li x4, MASK_XLEN(0xffffffffffffffff)
SLT x19, x30, x4
sd x19, 952(x6)

# Testcase 120:  rs1:x20(0xfffffffffffffffe), rs2:x5(0x0000000000000000), result rd:x25(0x0000000000000001)
li x20, MASK_XLEN(0xfffffffffffffffe)
li x5, MASK_XLEN(0x0000000000000000)
SLT x25, x20, x5
sd x25, 960(x6)

# Testcase 121:  rs1:x5(0xfffffffffffffffe), rs2:x22(0x0000000000000001), result rd:x26(0x0000000000000001)
li x5, MASK_XLEN(0xfffffffffffffffe)
li x22, MASK_XLEN(0x0000000000000001)
SLT x26, x5, x22
sd x26, 968(x6)

# Testcase 122:  rs1:x13(0xfffffffffffffffe), rs2:x26(0x0000000000000002), result rd:x1(0x0000000000000001)
li x13, MASK_XLEN(0xfffffffffffffffe)
li x26, MASK_XLEN(0x0000000000000002)
SLT x1, x13, x26
sd x1, 976(x6)

# Testcase 123:  rs1:x30(0xfffffffffffffffe), rs2:x22(0x00000000000000ff), result rd:x11(0x0000000000000001)
li x30, MASK_XLEN(0xfffffffffffffffe)
li x22, MASK_XLEN(0x00000000000000ff)
SLT x11, x30, x22
sd x11, 984(x6)

# Testcase 124:  rs1:x23(0xfffffffffffffffe), rs2:x8(0x624b3e976c52dd14), result rd:x30(0x0000000000000001)
li x23, MASK_XLEN(0xfffffffffffffffe)
li x8, MASK_XLEN(0x624b3e976c52dd14)
SLT x30, x23, x8
sd x30, 992(x6)

# Testcase 125:  rs1:x5(0xfffffffffffffffe), rs2:x12(0x7ffffffffffffffe), result rd:x17(0x0000000000000001)
li x5, MASK_XLEN(0xfffffffffffffffe)
li x12, MASK_XLEN(0x7ffffffffffffffe)
SLT x17, x5, x12
sd x17, 1000(x6)

# Testcase 126:  rs1:x7(0xfffffffffffffffe), rs2:x18(0x7fffffffffffffff), result rd:x13(0x0000000000000001)
li x7, MASK_XLEN(0xfffffffffffffffe)
li x18, MASK_XLEN(0x7fffffffffffffff)
SLT x13, x7, x18
sd x13, 1008(x6)

# Testcase 127:  rs1:x3(0xfffffffffffffffe), rs2:x5(0x8000000000000000), result rd:x14(0x0000000000000000)
li x3, MASK_XLEN(0xfffffffffffffffe)
li x5, MASK_XLEN(0x8000000000000000)
SLT x14, x3, x5
sd x14, 1016(x6)

# Testcase 128:  rs1:x19(0xfffffffffffffffe), rs2:x22(0x8000000000000001), result rd:x12(0x0000000000000000)
li x19, MASK_XLEN(0xfffffffffffffffe)
li x22, MASK_XLEN(0x8000000000000001)
SLT x12, x19, x22
sd x12, 1024(x6)

# Testcase 129:  rs1:x31(0xfffffffffffffffe), rs2:x4(0xc365ddeb9173ab42), result rd:x14(0x0000000000000000)
li x31, MASK_XLEN(0xfffffffffffffffe)
li x4, MASK_XLEN(0xc365ddeb9173ab42)
SLT x14, x31, x4
sd x14, 1032(x6)

# Testcase 130:  rs1:x29(0xfffffffffffffffe), rs2:x14(0xfffffffffffffffe), result rd:x8(0x0000000000000000)
li x29, MASK_XLEN(0xfffffffffffffffe)
li x14, MASK_XLEN(0xfffffffffffffffe)
SLT x8, x29, x14
sd x8, 1040(x6)

# Testcase 131:  rs1:x16(0xfffffffffffffffe), rs2:x13(0xffffffffffffffff), result rd:x8(0x0000000000000001)
li x16, MASK_XLEN(0xfffffffffffffffe)
li x13, MASK_XLEN(0xffffffffffffffff)
SLT x8, x16, x13
sd x8, 1048(x6)

# Testcase 132:  rs1:x30(0xffffffffffffffff), rs2:x13(0x0000000000000000), result rd:x8(0x0000000000000001)
li x30, MASK_XLEN(0xffffffffffffffff)
li x13, MASK_XLEN(0x0000000000000000)
SLT x8, x30, x13
sd x8, 1056(x6)

# Testcase 133:  rs1:x21(0xffffffffffffffff), rs2:x16(0x0000000000000001), result rd:x13(0x0000000000000001)
li x21, MASK_XLEN(0xffffffffffffffff)
li x16, MASK_XLEN(0x0000000000000001)
SLT x13, x21, x16
sd x13, 1064(x6)

# Testcase 134:  rs1:x30(0xffffffffffffffff), rs2:x19(0x0000000000000002), result rd:x3(0x0000000000000001)
li x30, MASK_XLEN(0xffffffffffffffff)
li x19, MASK_XLEN(0x0000000000000002)
SLT x3, x30, x19
sd x3, 1072(x6)

# Testcase 135:  rs1:x27(0xffffffffffffffff), rs2:x9(0x00000000000000ff), result rd:x9(0x0000000000000001)
li x27, MASK_XLEN(0xffffffffffffffff)
li x9, MASK_XLEN(0x00000000000000ff)
SLT x9, x27, x9
sd x9, 1080(x6)

# Testcase 136:  rs1:x29(0xffffffffffffffff), rs2:x17(0x624b3e976c52dd14), result rd:x12(0x0000000000000001)
li x29, MASK_XLEN(0xffffffffffffffff)
li x17, MASK_XLEN(0x624b3e976c52dd14)
SLT x12, x29, x17
sd x12, 1088(x6)

# Testcase 137:  rs1:x18(0xffffffffffffffff), rs2:x1(0x7ffffffffffffffe), result rd:x20(0x0000000000000001)
li x18, MASK_XLEN(0xffffffffffffffff)
li x1, MASK_XLEN(0x7ffffffffffffffe)
SLT x20, x18, x1
sd x20, 1096(x6)

# Testcase 138:  rs1:x20(0xffffffffffffffff), rs2:x25(0x7fffffffffffffff), result rd:x16(0x0000000000000001)
li x20, MASK_XLEN(0xffffffffffffffff)
li x25, MASK_XLEN(0x7fffffffffffffff)
SLT x16, x20, x25
sd x16, 1104(x6)

# Testcase 139:  rs1:x29(0xffffffffffffffff), rs2:x8(0x8000000000000000), result rd:x9(0x0000000000000000)
li x29, MASK_XLEN(0xffffffffffffffff)
li x8, MASK_XLEN(0x8000000000000000)
SLT x9, x29, x8
sd x9, 1112(x6)

# Testcase 140:  rs1:x2(0xffffffffffffffff), rs2:x20(0x8000000000000001), result rd:x11(0x0000000000000000)
li x2, MASK_XLEN(0xffffffffffffffff)
li x20, MASK_XLEN(0x8000000000000001)
SLT x11, x2, x20
sd x11, 1120(x6)

# Testcase 141:  rs1:x28(0xffffffffffffffff), rs2:x26(0xc365ddeb9173ab42), result rd:x13(0x0000000000000000)
li x28, MASK_XLEN(0xffffffffffffffff)
li x26, MASK_XLEN(0xc365ddeb9173ab42)
SLT x13, x28, x26
sd x13, 1128(x6)

# Testcase 142:  rs1:x31(0xffffffffffffffff), rs2:x21(0xfffffffffffffffe), result rd:x4(0x0000000000000000)
li x31, MASK_XLEN(0xffffffffffffffff)
li x21, MASK_XLEN(0xfffffffffffffffe)
SLT x4, x31, x21
sd x4, 1136(x6)

# Testcase 143:  rs1:x18(0xffffffffffffffff), rs2:x29(0xffffffffffffffff), result rd:x28(0x0000000000000000)
li x18, MASK_XLEN(0xffffffffffffffff)
li x29, MASK_XLEN(0xffffffffffffffff)
SLT x28, x18, x29
sd x28, 1144(x6)

# Testcase 144:  rs1:x1(0x24eac3f40c78c2f9), rs2:x25(0x647640a1b6a659ef), result rd:x14(0x0000000000000001)
li x1, MASK_XLEN(0x24eac3f40c78c2f9)
li x25, MASK_XLEN(0x647640a1b6a659ef)
SLT x14, x1, x25
sd x14, 1152(x6)

# Testcase 145:  rs1:x14(0xdec772b7bb22fa31), rs2:x30(0x64a2bc48f9fb4010), result rd:x4(0x0000000000000001)
li x14, MASK_XLEN(0xdec772b7bb22fa31)
li x30, MASK_XLEN(0x64a2bc48f9fb4010)
SLT x4, x14, x30
sd x4, 1160(x6)

# Testcase 146:  rs1:x19(0x75ef8aabb693f4ef), rs2:x30(0x7644d1839aabd22d), result rd:x28(0x0000000000000001)
li x19, MASK_XLEN(0x75ef8aabb693f4ef)
li x30, MASK_XLEN(0x7644d1839aabd22d)
SLT x28, x19, x30
sd x28, 1168(x6)

.EQU NUMTESTS,147

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
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-SLT.S
// Sean Wu (sywu@hmc.edu)
