///////////////////////////////////////////
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-SLTU.S
// Sean Wu (sywu@hmc.edu)
// Created 2023-02-18 01:00:53.326025//
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

# Testcase 0:  rs1:x10(0x0000000000000000), rs2:x25(0x0000000000000000), result rd:x17(0x0000000000000000)
li x10, MASK_XLEN(0x0000000000000000)
li x25, MASK_XLEN(0x0000000000000000)
SLTU x17, x10, x25
sd x17, 0(x6)

# Testcase 1:  rs1:x4(0x0000000000000000), rs2:x30(0x0000000000000001), result rd:x12(0x0000000000000001)
li x4, MASK_XLEN(0x0000000000000000)
li x30, MASK_XLEN(0x0000000000000001)
SLTU x12, x4, x30
sd x12, 8(x6)

# Testcase 2:  rs1:x12(0x0000000000000000), rs2:x5(0x0000000000000002), result rd:x21(0x0000000000000001)
li x12, MASK_XLEN(0x0000000000000000)
li x5, MASK_XLEN(0x0000000000000002)
SLTU x21, x12, x5
sd x21, 16(x6)

# Testcase 3:  rs1:x12(0x0000000000000000), rs2:x25(0x00000000000000ff), result rd:x16(0x0000000000000001)
li x12, MASK_XLEN(0x0000000000000000)
li x25, MASK_XLEN(0x00000000000000ff)
SLTU x16, x12, x25
sd x16, 24(x6)

# Testcase 4:  rs1:x21(0x0000000000000000), rs2:x17(0x624b3e976c52dd14), result rd:x25(0x0000000000000001)
li x21, MASK_XLEN(0x0000000000000000)
li x17, MASK_XLEN(0x624b3e976c52dd14)
SLTU x25, x21, x17
sd x25, 32(x6)

# Testcase 5:  rs1:x2(0x0000000000000000), rs2:x7(0x7ffffffffffffffe), result rd:x29(0x0000000000000001)
li x2, MASK_XLEN(0x0000000000000000)
li x7, MASK_XLEN(0x7ffffffffffffffe)
SLTU x29, x2, x7
sd x29, 40(x6)

# Testcase 6:  rs1:x24(0x0000000000000000), rs2:x19(0x7fffffffffffffff), result rd:x11(0x0000000000000001)
li x24, MASK_XLEN(0x0000000000000000)
li x19, MASK_XLEN(0x7fffffffffffffff)
SLTU x11, x24, x19
sd x11, 48(x6)

# Testcase 7:  rs1:x10(0x0000000000000000), rs2:x13(0x8000000000000000), result rd:x21(0x0000000000000001)
li x10, MASK_XLEN(0x0000000000000000)
li x13, MASK_XLEN(0x8000000000000000)
SLTU x21, x10, x13
sd x21, 56(x6)

# Testcase 8:  rs1:x2(0x0000000000000000), rs2:x10(0x8000000000000001), result rd:x18(0x0000000000000001)
li x2, MASK_XLEN(0x0000000000000000)
li x10, MASK_XLEN(0x8000000000000001)
SLTU x18, x2, x10
sd x18, 64(x6)

# Testcase 9:  rs1:x14(0x0000000000000000), rs2:x2(0xc365ddeb9173ab42), result rd:x22(0x0000000000000001)
li x14, MASK_XLEN(0x0000000000000000)
li x2, MASK_XLEN(0xc365ddeb9173ab42)
SLTU x22, x14, x2
sd x22, 72(x6)

# Testcase 10:  rs1:x14(0x0000000000000000), rs2:x9(0xfffffffffffffffe), result rd:x13(0x0000000000000001)
li x14, MASK_XLEN(0x0000000000000000)
li x9, MASK_XLEN(0xfffffffffffffffe)
SLTU x13, x14, x9
sd x13, 80(x6)

# Testcase 11:  rs1:x24(0x0000000000000000), rs2:x7(0xffffffffffffffff), result rd:x12(0x0000000000000001)
li x24, MASK_XLEN(0x0000000000000000)
li x7, MASK_XLEN(0xffffffffffffffff)
SLTU x12, x24, x7
sd x12, 88(x6)

# Testcase 12:  rs1:x1(0x0000000000000001), rs2:x14(0x0000000000000000), result rd:x19(0x0000000000000000)
li x1, MASK_XLEN(0x0000000000000001)
li x14, MASK_XLEN(0x0000000000000000)
SLTU x19, x1, x14
sd x19, 96(x6)

# Testcase 13:  rs1:x13(0x0000000000000001), rs2:x15(0x0000000000000001), result rd:x3(0x0000000000000000)
li x13, MASK_XLEN(0x0000000000000001)
li x15, MASK_XLEN(0x0000000000000001)
SLTU x3, x13, x15
sd x3, 104(x6)

# Testcase 14:  rs1:x21(0x0000000000000001), rs2:x23(0x0000000000000002), result rd:x23(0x0000000000000001)
li x21, MASK_XLEN(0x0000000000000001)
li x23, MASK_XLEN(0x0000000000000002)
SLTU x23, x21, x23
sd x23, 112(x6)

# Testcase 15:  rs1:x22(0x0000000000000001), rs2:x3(0x00000000000000ff), result rd:x25(0x0000000000000001)
li x22, MASK_XLEN(0x0000000000000001)
li x3, MASK_XLEN(0x00000000000000ff)
SLTU x25, x22, x3
sd x25, 120(x6)

# Testcase 16:  rs1:x14(0x0000000000000001), rs2:x18(0x624b3e976c52dd14), result rd:x24(0x0000000000000001)
li x14, MASK_XLEN(0x0000000000000001)
li x18, MASK_XLEN(0x624b3e976c52dd14)
SLTU x24, x14, x18
sd x24, 128(x6)

# Testcase 17:  rs1:x8(0x0000000000000001), rs2:x1(0x7ffffffffffffffe), result rd:x17(0x0000000000000001)
li x8, MASK_XLEN(0x0000000000000001)
li x1, MASK_XLEN(0x7ffffffffffffffe)
SLTU x17, x8, x1
sd x17, 136(x6)

# Testcase 18:  rs1:x5(0x0000000000000001), rs2:x27(0x7fffffffffffffff), result rd:x16(0x0000000000000001)
li x5, MASK_XLEN(0x0000000000000001)
li x27, MASK_XLEN(0x7fffffffffffffff)
SLTU x16, x5, x27
sd x16, 144(x6)

# Testcase 19:  rs1:x12(0x0000000000000001), rs2:x29(0x8000000000000000), result rd:x29(0x0000000000000001)
li x12, MASK_XLEN(0x0000000000000001)
li x29, MASK_XLEN(0x8000000000000000)
SLTU x29, x12, x29
sd x29, 152(x6)

# Testcase 20:  rs1:x20(0x0000000000000001), rs2:x24(0x8000000000000001), result rd:x10(0x0000000000000001)
li x20, MASK_XLEN(0x0000000000000001)
li x24, MASK_XLEN(0x8000000000000001)
SLTU x10, x20, x24
sd x10, 160(x6)

# Testcase 21:  rs1:x23(0x0000000000000001), rs2:x26(0xc365ddeb9173ab42), result rd:x11(0x0000000000000001)
li x23, MASK_XLEN(0x0000000000000001)
li x26, MASK_XLEN(0xc365ddeb9173ab42)
SLTU x11, x23, x26
sd x11, 168(x6)

# Testcase 22:  rs1:x22(0x0000000000000001), rs2:x4(0xfffffffffffffffe), result rd:x26(0x0000000000000001)
li x22, MASK_XLEN(0x0000000000000001)
li x4, MASK_XLEN(0xfffffffffffffffe)
SLTU x26, x22, x4
sd x26, 176(x6)

# Testcase 23:  rs1:x31(0x0000000000000001), rs2:x30(0xffffffffffffffff), result rd:x28(0x0000000000000001)
li x31, MASK_XLEN(0x0000000000000001)
li x30, MASK_XLEN(0xffffffffffffffff)
SLTU x28, x31, x30
sd x28, 184(x6)

# Testcase 24:  rs1:x27(0x0000000000000002), rs2:x14(0x0000000000000000), result rd:x25(0x0000000000000000)
li x27, MASK_XLEN(0x0000000000000002)
li x14, MASK_XLEN(0x0000000000000000)
SLTU x25, x27, x14
sd x25, 192(x6)

# Testcase 25:  rs1:x28(0x0000000000000002), rs2:x9(0x0000000000000001), result rd:x29(0x0000000000000000)
li x28, MASK_XLEN(0x0000000000000002)
li x9, MASK_XLEN(0x0000000000000001)
SLTU x29, x28, x9
sd x29, 200(x6)

# Testcase 26:  rs1:x17(0x0000000000000002), rs2:x31(0x0000000000000002), result rd:x11(0x0000000000000000)
li x17, MASK_XLEN(0x0000000000000002)
li x31, MASK_XLEN(0x0000000000000002)
SLTU x11, x17, x31
sd x11, 208(x6)

# Testcase 27:  rs1:x18(0x0000000000000002), rs2:x23(0x00000000000000ff), result rd:x5(0x0000000000000001)
li x18, MASK_XLEN(0x0000000000000002)
li x23, MASK_XLEN(0x00000000000000ff)
SLTU x5, x18, x23
sd x5, 216(x6)

# Testcase 28:  rs1:x30(0x0000000000000002), rs2:x13(0x624b3e976c52dd14), result rd:x24(0x0000000000000001)
li x30, MASK_XLEN(0x0000000000000002)
li x13, MASK_XLEN(0x624b3e976c52dd14)
SLTU x24, x30, x13
sd x24, 224(x6)

# Testcase 29:  rs1:x24(0x0000000000000002), rs2:x18(0x7ffffffffffffffe), result rd:x10(0x0000000000000001)
li x24, MASK_XLEN(0x0000000000000002)
li x18, MASK_XLEN(0x7ffffffffffffffe)
SLTU x10, x24, x18
sd x10, 232(x6)

# Testcase 30:  rs1:x8(0x0000000000000002), rs2:x29(0x7fffffffffffffff), result rd:x30(0x0000000000000001)
li x8, MASK_XLEN(0x0000000000000002)
li x29, MASK_XLEN(0x7fffffffffffffff)
SLTU x30, x8, x29
sd x30, 240(x6)

# Testcase 31:  rs1:x13(0x0000000000000002), rs2:x12(0x8000000000000000), result rd:x13(0x0000000000000001)
li x13, MASK_XLEN(0x0000000000000002)
li x12, MASK_XLEN(0x8000000000000000)
SLTU x13, x13, x12
sd x13, 248(x6)

# Testcase 32:  rs1:x31(0x0000000000000002), rs2:x16(0x8000000000000001), result rd:x17(0x0000000000000001)
li x31, MASK_XLEN(0x0000000000000002)
li x16, MASK_XLEN(0x8000000000000001)
SLTU x17, x31, x16
sd x17, 256(x6)

# Testcase 33:  rs1:x10(0x0000000000000002), rs2:x31(0xc365ddeb9173ab42), result rd:x14(0x0000000000000001)
li x10, MASK_XLEN(0x0000000000000002)
li x31, MASK_XLEN(0xc365ddeb9173ab42)
SLTU x14, x10, x31
sd x14, 264(x6)

# Testcase 34:  rs1:x14(0x0000000000000002), rs2:x27(0xfffffffffffffffe), result rd:x4(0x0000000000000001)
li x14, MASK_XLEN(0x0000000000000002)
li x27, MASK_XLEN(0xfffffffffffffffe)
SLTU x4, x14, x27
sd x4, 272(x6)

# Testcase 35:  rs1:x22(0x0000000000000002), rs2:x5(0xffffffffffffffff), result rd:x5(0x0000000000000001)
li x22, MASK_XLEN(0x0000000000000002)
li x5, MASK_XLEN(0xffffffffffffffff)
SLTU x5, x22, x5
sd x5, 280(x6)

# Testcase 36:  rs1:x1(0x00000000000000ff), rs2:x19(0x0000000000000000), result rd:x20(0x0000000000000000)
li x1, MASK_XLEN(0x00000000000000ff)
li x19, MASK_XLEN(0x0000000000000000)
SLTU x20, x1, x19
sd x20, 288(x6)

# Testcase 37:  rs1:x21(0x00000000000000ff), rs2:x23(0x0000000000000001), result rd:x30(0x0000000000000000)
li x21, MASK_XLEN(0x00000000000000ff)
li x23, MASK_XLEN(0x0000000000000001)
SLTU x30, x21, x23
sd x30, 296(x6)

# Testcase 38:  rs1:x29(0x00000000000000ff), rs2:x17(0x0000000000000002), result rd:x4(0x0000000000000000)
li x29, MASK_XLEN(0x00000000000000ff)
li x17, MASK_XLEN(0x0000000000000002)
SLTU x4, x29, x17
sd x4, 304(x6)

# Testcase 39:  rs1:x23(0x00000000000000ff), rs2:x25(0x00000000000000ff), result rd:x21(0x0000000000000000)
li x23, MASK_XLEN(0x00000000000000ff)
li x25, MASK_XLEN(0x00000000000000ff)
SLTU x21, x23, x25
sd x21, 312(x6)

# Testcase 40:  rs1:x23(0x00000000000000ff), rs2:x7(0x624b3e976c52dd14), result rd:x20(0x0000000000000001)
li x23, MASK_XLEN(0x00000000000000ff)
li x7, MASK_XLEN(0x624b3e976c52dd14)
SLTU x20, x23, x7
sd x20, 320(x6)

# Testcase 41:  rs1:x21(0x00000000000000ff), rs2:x20(0x7ffffffffffffffe), result rd:x17(0x0000000000000001)
li x21, MASK_XLEN(0x00000000000000ff)
li x20, MASK_XLEN(0x7ffffffffffffffe)
SLTU x17, x21, x20
sd x17, 328(x6)

# Testcase 42:  rs1:x4(0x00000000000000ff), rs2:x9(0x7fffffffffffffff), result rd:x23(0x0000000000000001)
li x4, MASK_XLEN(0x00000000000000ff)
li x9, MASK_XLEN(0x7fffffffffffffff)
SLTU x23, x4, x9
sd x23, 336(x6)

# Testcase 43:  rs1:x13(0x00000000000000ff), rs2:x3(0x8000000000000000), result rd:x26(0x0000000000000001)
li x13, MASK_XLEN(0x00000000000000ff)
li x3, MASK_XLEN(0x8000000000000000)
SLTU x26, x13, x3
sd x26, 344(x6)

# Testcase 44:  rs1:x2(0x00000000000000ff), rs2:x1(0x8000000000000001), result rd:x4(0x0000000000000001)
li x2, MASK_XLEN(0x00000000000000ff)
li x1, MASK_XLEN(0x8000000000000001)
SLTU x4, x2, x1
sd x4, 352(x6)

# Testcase 45:  rs1:x29(0x00000000000000ff), rs2:x12(0xc365ddeb9173ab42), result rd:x27(0x0000000000000001)
li x29, MASK_XLEN(0x00000000000000ff)
li x12, MASK_XLEN(0xc365ddeb9173ab42)
SLTU x27, x29, x12
sd x27, 360(x6)

# Testcase 46:  rs1:x24(0x00000000000000ff), rs2:x16(0xfffffffffffffffe), result rd:x11(0x0000000000000001)
li x24, MASK_XLEN(0x00000000000000ff)
li x16, MASK_XLEN(0xfffffffffffffffe)
SLTU x11, x24, x16
sd x11, 368(x6)

# Testcase 47:  rs1:x4(0x00000000000000ff), rs2:x22(0xffffffffffffffff), result rd:x15(0x0000000000000001)
li x4, MASK_XLEN(0x00000000000000ff)
li x22, MASK_XLEN(0xffffffffffffffff)
SLTU x15, x4, x22
sd x15, 376(x6)

# Testcase 48:  rs1:x12(0x624b3e976c52dd14), rs2:x19(0x0000000000000000), result rd:x23(0x0000000000000000)
li x12, MASK_XLEN(0x624b3e976c52dd14)
li x19, MASK_XLEN(0x0000000000000000)
SLTU x23, x12, x19
sd x23, 384(x6)

# Testcase 49:  rs1:x9(0x624b3e976c52dd14), rs2:x22(0x0000000000000001), result rd:x16(0x0000000000000000)
li x9, MASK_XLEN(0x624b3e976c52dd14)
li x22, MASK_XLEN(0x0000000000000001)
SLTU x16, x9, x22
sd x16, 392(x6)

# Testcase 50:  rs1:x26(0x624b3e976c52dd14), rs2:x25(0x0000000000000002), result rd:x8(0x0000000000000000)
li x26, MASK_XLEN(0x624b3e976c52dd14)
li x25, MASK_XLEN(0x0000000000000002)
SLTU x8, x26, x25
sd x8, 400(x6)

# Testcase 51:  rs1:x18(0x624b3e976c52dd14), rs2:x27(0x00000000000000ff), result rd:x29(0x0000000000000000)
li x18, MASK_XLEN(0x624b3e976c52dd14)
li x27, MASK_XLEN(0x00000000000000ff)
SLTU x29, x18, x27
sd x29, 408(x6)

# Testcase 52:  rs1:x3(0x624b3e976c52dd14), rs2:x25(0x624b3e976c52dd14), result rd:x28(0x0000000000000000)
li x3, MASK_XLEN(0x624b3e976c52dd14)
li x25, MASK_XLEN(0x624b3e976c52dd14)
SLTU x28, x3, x25
sd x28, 416(x6)

# Testcase 53:  rs1:x17(0x624b3e976c52dd14), rs2:x30(0x7ffffffffffffffe), result rd:x29(0x0000000000000001)
li x17, MASK_XLEN(0x624b3e976c52dd14)
li x30, MASK_XLEN(0x7ffffffffffffffe)
SLTU x29, x17, x30
sd x29, 424(x6)

# Testcase 54:  rs1:x29(0x624b3e976c52dd14), rs2:x17(0x7fffffffffffffff), result rd:x14(0x0000000000000001)
li x29, MASK_XLEN(0x624b3e976c52dd14)
li x17, MASK_XLEN(0x7fffffffffffffff)
SLTU x14, x29, x17
sd x14, 432(x6)

# Testcase 55:  rs1:x20(0x624b3e976c52dd14), rs2:x22(0x8000000000000000), result rd:x7(0x0000000000000001)
li x20, MASK_XLEN(0x624b3e976c52dd14)
li x22, MASK_XLEN(0x8000000000000000)
SLTU x7, x20, x22
sd x7, 440(x6)

# Testcase 56:  rs1:x15(0x624b3e976c52dd14), rs2:x23(0x8000000000000001), result rd:x22(0x0000000000000001)
li x15, MASK_XLEN(0x624b3e976c52dd14)
li x23, MASK_XLEN(0x8000000000000001)
SLTU x22, x15, x23
sd x22, 448(x6)

# Testcase 57:  rs1:x13(0x624b3e976c52dd14), rs2:x9(0xc365ddeb9173ab42), result rd:x1(0x0000000000000001)
li x13, MASK_XLEN(0x624b3e976c52dd14)
li x9, MASK_XLEN(0xc365ddeb9173ab42)
SLTU x1, x13, x9
sd x1, 456(x6)

# Testcase 58:  rs1:x19(0x624b3e976c52dd14), rs2:x5(0xfffffffffffffffe), result rd:x30(0x0000000000000001)
li x19, MASK_XLEN(0x624b3e976c52dd14)
li x5, MASK_XLEN(0xfffffffffffffffe)
SLTU x30, x19, x5
sd x30, 464(x6)

# Testcase 59:  rs1:x15(0x624b3e976c52dd14), rs2:x19(0xffffffffffffffff), result rd:x2(0x0000000000000001)
li x15, MASK_XLEN(0x624b3e976c52dd14)
li x19, MASK_XLEN(0xffffffffffffffff)
SLTU x2, x15, x19
sd x2, 472(x6)

# Testcase 60:  rs1:x30(0x7ffffffffffffffe), rs2:x13(0x0000000000000000), result rd:x30(0x0000000000000000)
li x30, MASK_XLEN(0x7ffffffffffffffe)
li x13, MASK_XLEN(0x0000000000000000)
SLTU x30, x30, x13
sd x30, 480(x6)

# Testcase 61:  rs1:x26(0x7ffffffffffffffe), rs2:x3(0x0000000000000001), result rd:x21(0x0000000000000000)
li x26, MASK_XLEN(0x7ffffffffffffffe)
li x3, MASK_XLEN(0x0000000000000001)
SLTU x21, x26, x3
sd x21, 488(x6)

# Testcase 62:  rs1:x19(0x7ffffffffffffffe), rs2:x13(0x0000000000000002), result rd:x11(0x0000000000000000)
li x19, MASK_XLEN(0x7ffffffffffffffe)
li x13, MASK_XLEN(0x0000000000000002)
SLTU x11, x19, x13
sd x11, 496(x6)

# Testcase 63:  rs1:x8(0x7ffffffffffffffe), rs2:x17(0x00000000000000ff), result rd:x28(0x0000000000000000)
li x8, MASK_XLEN(0x7ffffffffffffffe)
li x17, MASK_XLEN(0x00000000000000ff)
SLTU x28, x8, x17
sd x28, 504(x6)

# Testcase 64:  rs1:x15(0x7ffffffffffffffe), rs2:x2(0x624b3e976c52dd14), result rd:x16(0x0000000000000000)
li x15, MASK_XLEN(0x7ffffffffffffffe)
li x2, MASK_XLEN(0x624b3e976c52dd14)
SLTU x16, x15, x2
sd x16, 512(x6)

# Testcase 65:  rs1:x20(0x7ffffffffffffffe), rs2:x4(0x7ffffffffffffffe), result rd:x9(0x0000000000000000)
li x20, MASK_XLEN(0x7ffffffffffffffe)
li x4, MASK_XLEN(0x7ffffffffffffffe)
SLTU x9, x20, x4
sd x9, 520(x6)

# Testcase 66:  rs1:x27(0x7ffffffffffffffe), rs2:x17(0x7fffffffffffffff), result rd:x16(0x0000000000000001)
li x27, MASK_XLEN(0x7ffffffffffffffe)
li x17, MASK_XLEN(0x7fffffffffffffff)
SLTU x16, x27, x17
sd x16, 528(x6)

# Testcase 67:  rs1:x18(0x7ffffffffffffffe), rs2:x21(0x8000000000000000), result rd:x13(0x0000000000000001)
li x18, MASK_XLEN(0x7ffffffffffffffe)
li x21, MASK_XLEN(0x8000000000000000)
SLTU x13, x18, x21
sd x13, 536(x6)

# Testcase 68:  rs1:x8(0x7ffffffffffffffe), rs2:x18(0x8000000000000001), result rd:x12(0x0000000000000001)
li x8, MASK_XLEN(0x7ffffffffffffffe)
li x18, MASK_XLEN(0x8000000000000001)
SLTU x12, x8, x18
sd x12, 544(x6)

# Testcase 69:  rs1:x20(0x7ffffffffffffffe), rs2:x27(0xc365ddeb9173ab42), result rd:x30(0x0000000000000001)
li x20, MASK_XLEN(0x7ffffffffffffffe)
li x27, MASK_XLEN(0xc365ddeb9173ab42)
SLTU x30, x20, x27
sd x30, 552(x6)

# Testcase 70:  rs1:x5(0x7ffffffffffffffe), rs2:x15(0xfffffffffffffffe), result rd:x3(0x0000000000000001)
li x5, MASK_XLEN(0x7ffffffffffffffe)
li x15, MASK_XLEN(0xfffffffffffffffe)
SLTU x3, x5, x15
sd x3, 560(x6)

# Testcase 71:  rs1:x31(0x7ffffffffffffffe), rs2:x3(0xffffffffffffffff), result rd:x16(0x0000000000000001)
li x31, MASK_XLEN(0x7ffffffffffffffe)
li x3, MASK_XLEN(0xffffffffffffffff)
SLTU x16, x31, x3
sd x16, 568(x6)

# Testcase 72:  rs1:x13(0x7fffffffffffffff), rs2:x19(0x0000000000000000), result rd:x31(0x0000000000000000)
li x13, MASK_XLEN(0x7fffffffffffffff)
li x19, MASK_XLEN(0x0000000000000000)
SLTU x31, x13, x19
sd x31, 576(x6)

# Testcase 73:  rs1:x14(0x7fffffffffffffff), rs2:x18(0x0000000000000001), result rd:x3(0x0000000000000000)
li x14, MASK_XLEN(0x7fffffffffffffff)
li x18, MASK_XLEN(0x0000000000000001)
SLTU x3, x14, x18
sd x3, 584(x6)

# Testcase 74:  rs1:x9(0x7fffffffffffffff), rs2:x16(0x0000000000000002), result rd:x8(0x0000000000000000)
li x9, MASK_XLEN(0x7fffffffffffffff)
li x16, MASK_XLEN(0x0000000000000002)
SLTU x8, x9, x16
sd x8, 592(x6)

# Testcase 75:  rs1:x27(0x7fffffffffffffff), rs2:x4(0x00000000000000ff), result rd:x10(0x0000000000000000)
li x27, MASK_XLEN(0x7fffffffffffffff)
li x4, MASK_XLEN(0x00000000000000ff)
SLTU x10, x27, x4
sd x10, 600(x6)

# Testcase 76:  rs1:x5(0x7fffffffffffffff), rs2:x12(0x624b3e976c52dd14), result rd:x26(0x0000000000000000)
li x5, MASK_XLEN(0x7fffffffffffffff)
li x12, MASK_XLEN(0x624b3e976c52dd14)
SLTU x26, x5, x12
sd x26, 608(x6)

# Testcase 77:  rs1:x4(0x7fffffffffffffff), rs2:x5(0x7ffffffffffffffe), result rd:x22(0x0000000000000000)
li x4, MASK_XLEN(0x7fffffffffffffff)
li x5, MASK_XLEN(0x7ffffffffffffffe)
SLTU x22, x4, x5
sd x22, 616(x6)

# Testcase 78:  rs1:x28(0x7fffffffffffffff), rs2:x2(0x7fffffffffffffff), result rd:x27(0x0000000000000000)
li x28, MASK_XLEN(0x7fffffffffffffff)
li x2, MASK_XLEN(0x7fffffffffffffff)
SLTU x27, x28, x2
sd x27, 624(x6)

# Testcase 79:  rs1:x22(0x7fffffffffffffff), rs2:x5(0x8000000000000000), result rd:x19(0x0000000000000001)
li x22, MASK_XLEN(0x7fffffffffffffff)
li x5, MASK_XLEN(0x8000000000000000)
SLTU x19, x22, x5
sd x19, 632(x6)

# Testcase 80:  rs1:x18(0x7fffffffffffffff), rs2:x7(0x8000000000000001), result rd:x1(0x0000000000000001)
li x18, MASK_XLEN(0x7fffffffffffffff)
li x7, MASK_XLEN(0x8000000000000001)
SLTU x1, x18, x7
sd x1, 640(x6)

# Testcase 81:  rs1:x2(0x7fffffffffffffff), rs2:x28(0xc365ddeb9173ab42), result rd:x13(0x0000000000000001)
li x2, MASK_XLEN(0x7fffffffffffffff)
li x28, MASK_XLEN(0xc365ddeb9173ab42)
SLTU x13, x2, x28
sd x13, 648(x6)

# Testcase 82:  rs1:x18(0x7fffffffffffffff), rs2:x23(0xfffffffffffffffe), result rd:x25(0x0000000000000001)
li x18, MASK_XLEN(0x7fffffffffffffff)
li x23, MASK_XLEN(0xfffffffffffffffe)
SLTU x25, x18, x23
sd x25, 656(x6)

# Testcase 83:  rs1:x20(0x7fffffffffffffff), rs2:x16(0xffffffffffffffff), result rd:x23(0x0000000000000001)
li x20, MASK_XLEN(0x7fffffffffffffff)
li x16, MASK_XLEN(0xffffffffffffffff)
SLTU x23, x20, x16
sd x23, 664(x6)

# Testcase 84:  rs1:x23(0x8000000000000000), rs2:x4(0x0000000000000000), result rd:x30(0x0000000000000000)
li x23, MASK_XLEN(0x8000000000000000)
li x4, MASK_XLEN(0x0000000000000000)
SLTU x30, x23, x4
sd x30, 672(x6)

# Testcase 85:  rs1:x16(0x8000000000000000), rs2:x18(0x0000000000000001), result rd:x12(0x0000000000000000)
li x16, MASK_XLEN(0x8000000000000000)
li x18, MASK_XLEN(0x0000000000000001)
SLTU x12, x16, x18
sd x12, 680(x6)

# Testcase 86:  rs1:x28(0x8000000000000000), rs2:x25(0x0000000000000002), result rd:x11(0x0000000000000000)
li x28, MASK_XLEN(0x8000000000000000)
li x25, MASK_XLEN(0x0000000000000002)
SLTU x11, x28, x25
sd x11, 688(x6)

# Testcase 87:  rs1:x28(0x8000000000000000), rs2:x4(0x00000000000000ff), result rd:x22(0x0000000000000000)
li x28, MASK_XLEN(0x8000000000000000)
li x4, MASK_XLEN(0x00000000000000ff)
SLTU x22, x28, x4
sd x22, 696(x6)

# Testcase 88:  rs1:x1(0x8000000000000000), rs2:x8(0x624b3e976c52dd14), result rd:x8(0x0000000000000000)
li x1, MASK_XLEN(0x8000000000000000)
li x8, MASK_XLEN(0x624b3e976c52dd14)
SLTU x8, x1, x8
sd x8, 704(x6)

# Testcase 89:  rs1:x16(0x8000000000000000), rs2:x27(0x7ffffffffffffffe), result rd:x10(0x0000000000000000)
li x16, MASK_XLEN(0x8000000000000000)
li x27, MASK_XLEN(0x7ffffffffffffffe)
SLTU x10, x16, x27
sd x10, 712(x6)

# Testcase 90:  rs1:x9(0x8000000000000000), rs2:x8(0x7fffffffffffffff), result rd:x1(0x0000000000000000)
li x9, MASK_XLEN(0x8000000000000000)
li x8, MASK_XLEN(0x7fffffffffffffff)
SLTU x1, x9, x8
sd x1, 720(x6)

# Testcase 91:  rs1:x16(0x8000000000000000), rs2:x12(0x8000000000000000), result rd:x31(0x0000000000000000)
li x16, MASK_XLEN(0x8000000000000000)
li x12, MASK_XLEN(0x8000000000000000)
SLTU x31, x16, x12
sd x31, 728(x6)

# Testcase 92:  rs1:x31(0x8000000000000000), rs2:x17(0x8000000000000001), result rd:x30(0x0000000000000001)
li x31, MASK_XLEN(0x8000000000000000)
li x17, MASK_XLEN(0x8000000000000001)
SLTU x30, x31, x17
sd x30, 736(x6)

# Testcase 93:  rs1:x11(0x8000000000000000), rs2:x3(0xc365ddeb9173ab42), result rd:x3(0x0000000000000001)
li x11, MASK_XLEN(0x8000000000000000)
li x3, MASK_XLEN(0xc365ddeb9173ab42)
SLTU x3, x11, x3
sd x3, 744(x6)

# Testcase 94:  rs1:x10(0x8000000000000000), rs2:x19(0xfffffffffffffffe), result rd:x14(0x0000000000000001)
li x10, MASK_XLEN(0x8000000000000000)
li x19, MASK_XLEN(0xfffffffffffffffe)
SLTU x14, x10, x19
sd x14, 752(x6)

# Testcase 95:  rs1:x8(0x8000000000000000), rs2:x24(0xffffffffffffffff), result rd:x12(0x0000000000000001)
li x8, MASK_XLEN(0x8000000000000000)
li x24, MASK_XLEN(0xffffffffffffffff)
SLTU x12, x8, x24
sd x12, 760(x6)

# Testcase 96:  rs1:x31(0x8000000000000001), rs2:x13(0x0000000000000000), result rd:x28(0x0000000000000000)
li x31, MASK_XLEN(0x8000000000000001)
li x13, MASK_XLEN(0x0000000000000000)
SLTU x28, x31, x13
sd x28, 768(x6)

# Testcase 97:  rs1:x25(0x8000000000000001), rs2:x5(0x0000000000000001), result rd:x8(0x0000000000000000)
li x25, MASK_XLEN(0x8000000000000001)
li x5, MASK_XLEN(0x0000000000000001)
SLTU x8, x25, x5
sd x8, 776(x6)

# Testcase 98:  rs1:x10(0x8000000000000001), rs2:x30(0x0000000000000002), result rd:x7(0x0000000000000000)
li x10, MASK_XLEN(0x8000000000000001)
li x30, MASK_XLEN(0x0000000000000002)
SLTU x7, x10, x30
sd x7, 784(x6)

# Testcase 99:  rs1:x24(0x8000000000000001), rs2:x25(0x00000000000000ff), result rd:x16(0x0000000000000000)
li x24, MASK_XLEN(0x8000000000000001)
li x25, MASK_XLEN(0x00000000000000ff)
SLTU x16, x24, x25
sd x16, 792(x6)

# Testcase 100:  rs1:x22(0x8000000000000001), rs2:x29(0x624b3e976c52dd14), result rd:x26(0x0000000000000000)
li x22, MASK_XLEN(0x8000000000000001)
li x29, MASK_XLEN(0x624b3e976c52dd14)
SLTU x26, x22, x29
sd x26, 800(x6)

# Testcase 101:  rs1:x12(0x8000000000000001), rs2:x10(0x7ffffffffffffffe), result rd:x13(0x0000000000000000)
li x12, MASK_XLEN(0x8000000000000001)
li x10, MASK_XLEN(0x7ffffffffffffffe)
SLTU x13, x12, x10
sd x13, 808(x6)

# Testcase 102:  rs1:x20(0x8000000000000001), rs2:x5(0x7fffffffffffffff), result rd:x27(0x0000000000000000)
li x20, MASK_XLEN(0x8000000000000001)
li x5, MASK_XLEN(0x7fffffffffffffff)
SLTU x27, x20, x5
sd x27, 816(x6)

# Testcase 103:  rs1:x25(0x8000000000000001), rs2:x4(0x8000000000000000), result rd:x13(0x0000000000000000)
li x25, MASK_XLEN(0x8000000000000001)
li x4, MASK_XLEN(0x8000000000000000)
SLTU x13, x25, x4
sd x13, 824(x6)

# Testcase 104:  rs1:x12(0x8000000000000001), rs2:x17(0x8000000000000001), result rd:x28(0x0000000000000000)
li x12, MASK_XLEN(0x8000000000000001)
li x17, MASK_XLEN(0x8000000000000001)
SLTU x28, x12, x17
sd x28, 832(x6)

# Testcase 105:  rs1:x16(0x8000000000000001), rs2:x8(0xc365ddeb9173ab42), result rd:x21(0x0000000000000001)
li x16, MASK_XLEN(0x8000000000000001)
li x8, MASK_XLEN(0xc365ddeb9173ab42)
SLTU x21, x16, x8
sd x21, 840(x6)

# Testcase 106:  rs1:x23(0x8000000000000001), rs2:x12(0xfffffffffffffffe), result rd:x21(0x0000000000000001)
li x23, MASK_XLEN(0x8000000000000001)
li x12, MASK_XLEN(0xfffffffffffffffe)
SLTU x21, x23, x12
sd x21, 848(x6)

# Testcase 107:  rs1:x30(0x8000000000000001), rs2:x12(0xffffffffffffffff), result rd:x14(0x0000000000000001)
li x30, MASK_XLEN(0x8000000000000001)
li x12, MASK_XLEN(0xffffffffffffffff)
SLTU x14, x30, x12
sd x14, 856(x6)

# Testcase 108:  rs1:x9(0xc365ddeb9173ab42), rs2:x12(0x0000000000000000), result rd:x13(0x0000000000000000)
li x9, MASK_XLEN(0xc365ddeb9173ab42)
li x12, MASK_XLEN(0x0000000000000000)
SLTU x13, x9, x12
sd x13, 864(x6)

# Testcase 109:  rs1:x10(0xc365ddeb9173ab42), rs2:x28(0x0000000000000001), result rd:x4(0x0000000000000000)
li x10, MASK_XLEN(0xc365ddeb9173ab42)
li x28, MASK_XLEN(0x0000000000000001)
SLTU x4, x10, x28
sd x4, 872(x6)

# Testcase 110:  rs1:x16(0xc365ddeb9173ab42), rs2:x29(0x0000000000000002), result rd:x10(0x0000000000000000)
li x16, MASK_XLEN(0xc365ddeb9173ab42)
li x29, MASK_XLEN(0x0000000000000002)
SLTU x10, x16, x29
sd x10, 880(x6)

# Testcase 111:  rs1:x4(0xc365ddeb9173ab42), rs2:x15(0x00000000000000ff), result rd:x5(0x0000000000000000)
li x4, MASK_XLEN(0xc365ddeb9173ab42)
li x15, MASK_XLEN(0x00000000000000ff)
SLTU x5, x4, x15
sd x5, 888(x6)

# Testcase 112:  rs1:x12(0xc365ddeb9173ab42), rs2:x30(0x624b3e976c52dd14), result rd:x8(0x0000000000000000)
li x12, MASK_XLEN(0xc365ddeb9173ab42)
li x30, MASK_XLEN(0x624b3e976c52dd14)
SLTU x8, x12, x30
sd x8, 896(x6)

# Testcase 113:  rs1:x31(0xc365ddeb9173ab42), rs2:x11(0x7ffffffffffffffe), result rd:x16(0x0000000000000000)
li x31, MASK_XLEN(0xc365ddeb9173ab42)
li x11, MASK_XLEN(0x7ffffffffffffffe)
SLTU x16, x31, x11
sd x16, 904(x6)

# Testcase 114:  rs1:x8(0xc365ddeb9173ab42), rs2:x4(0x7fffffffffffffff), result rd:x22(0x0000000000000000)
li x8, MASK_XLEN(0xc365ddeb9173ab42)
li x4, MASK_XLEN(0x7fffffffffffffff)
SLTU x22, x8, x4
sd x22, 912(x6)

# Testcase 115:  rs1:x17(0xc365ddeb9173ab42), rs2:x15(0x8000000000000000), result rd:x30(0x0000000000000000)
li x17, MASK_XLEN(0xc365ddeb9173ab42)
li x15, MASK_XLEN(0x8000000000000000)
SLTU x30, x17, x15
sd x30, 920(x6)

# Testcase 116:  rs1:x19(0xc365ddeb9173ab42), rs2:x27(0x8000000000000001), result rd:x20(0x0000000000000000)
li x19, MASK_XLEN(0xc365ddeb9173ab42)
li x27, MASK_XLEN(0x8000000000000001)
SLTU x20, x19, x27
sd x20, 928(x6)

# Testcase 117:  rs1:x8(0xc365ddeb9173ab42), rs2:x22(0xc365ddeb9173ab42), result rd:x13(0x0000000000000000)
li x8, MASK_XLEN(0xc365ddeb9173ab42)
li x22, MASK_XLEN(0xc365ddeb9173ab42)
SLTU x13, x8, x22
sd x13, 936(x6)

# Testcase 118:  rs1:x17(0xc365ddeb9173ab42), rs2:x10(0xfffffffffffffffe), result rd:x16(0x0000000000000001)
li x17, MASK_XLEN(0xc365ddeb9173ab42)
li x10, MASK_XLEN(0xfffffffffffffffe)
SLTU x16, x17, x10
sd x16, 944(x6)

# Testcase 119:  rs1:x8(0xc365ddeb9173ab42), rs2:x11(0xffffffffffffffff), result rd:x17(0x0000000000000001)
li x8, MASK_XLEN(0xc365ddeb9173ab42)
li x11, MASK_XLEN(0xffffffffffffffff)
SLTU x17, x8, x11
sd x17, 952(x6)

# Testcase 120:  rs1:x22(0xfffffffffffffffe), rs2:x1(0x0000000000000000), result rd:x3(0x0000000000000000)
li x22, MASK_XLEN(0xfffffffffffffffe)
li x1, MASK_XLEN(0x0000000000000000)
SLTU x3, x22, x1
sd x3, 960(x6)

# Testcase 121:  rs1:x16(0xfffffffffffffffe), rs2:x11(0x0000000000000001), result rd:x13(0x0000000000000000)
li x16, MASK_XLEN(0xfffffffffffffffe)
li x11, MASK_XLEN(0x0000000000000001)
SLTU x13, x16, x11
sd x13, 968(x6)

# Testcase 122:  rs1:x29(0xfffffffffffffffe), rs2:x31(0x0000000000000002), result rd:x8(0x0000000000000000)
li x29, MASK_XLEN(0xfffffffffffffffe)
li x31, MASK_XLEN(0x0000000000000002)
SLTU x8, x29, x31
sd x8, 976(x6)

# Testcase 123:  rs1:x27(0xfffffffffffffffe), rs2:x31(0x00000000000000ff), result rd:x14(0x0000000000000000)
li x27, MASK_XLEN(0xfffffffffffffffe)
li x31, MASK_XLEN(0x00000000000000ff)
SLTU x14, x27, x31
sd x14, 984(x6)

# Testcase 124:  rs1:x2(0xfffffffffffffffe), rs2:x19(0x624b3e976c52dd14), result rd:x25(0x0000000000000000)
li x2, MASK_XLEN(0xfffffffffffffffe)
li x19, MASK_XLEN(0x624b3e976c52dd14)
SLTU x25, x2, x19
sd x25, 992(x6)

# Testcase 125:  rs1:x2(0xfffffffffffffffe), rs2:x14(0x7ffffffffffffffe), result rd:x3(0x0000000000000000)
li x2, MASK_XLEN(0xfffffffffffffffe)
li x14, MASK_XLEN(0x7ffffffffffffffe)
SLTU x3, x2, x14
sd x3, 1000(x6)

# Testcase 126:  rs1:x9(0xfffffffffffffffe), rs2:x7(0x7fffffffffffffff), result rd:x24(0x0000000000000000)
li x9, MASK_XLEN(0xfffffffffffffffe)
li x7, MASK_XLEN(0x7fffffffffffffff)
SLTU x24, x9, x7
sd x24, 1008(x6)

# Testcase 127:  rs1:x12(0xfffffffffffffffe), rs2:x1(0x8000000000000000), result rd:x8(0x0000000000000000)
li x12, MASK_XLEN(0xfffffffffffffffe)
li x1, MASK_XLEN(0x8000000000000000)
SLTU x8, x12, x1
sd x8, 1016(x6)

# Testcase 128:  rs1:x31(0xfffffffffffffffe), rs2:x2(0x8000000000000001), result rd:x1(0x0000000000000000)
li x31, MASK_XLEN(0xfffffffffffffffe)
li x2, MASK_XLEN(0x8000000000000001)
SLTU x1, x31, x2
sd x1, 1024(x6)

# Testcase 129:  rs1:x13(0xfffffffffffffffe), rs2:x18(0xc365ddeb9173ab42), result rd:x1(0x0000000000000000)
li x13, MASK_XLEN(0xfffffffffffffffe)
li x18, MASK_XLEN(0xc365ddeb9173ab42)
SLTU x1, x13, x18
sd x1, 1032(x6)

# Testcase 130:  rs1:x5(0xfffffffffffffffe), rs2:x4(0xfffffffffffffffe), result rd:x27(0x0000000000000000)
li x5, MASK_XLEN(0xfffffffffffffffe)
li x4, MASK_XLEN(0xfffffffffffffffe)
SLTU x27, x5, x4
sd x27, 1040(x6)

# Testcase 131:  rs1:x30(0xfffffffffffffffe), rs2:x7(0xffffffffffffffff), result rd:x3(0x0000000000000001)
li x30, MASK_XLEN(0xfffffffffffffffe)
li x7, MASK_XLEN(0xffffffffffffffff)
SLTU x3, x30, x7
sd x3, 1048(x6)

# Testcase 132:  rs1:x24(0xffffffffffffffff), rs2:x15(0x0000000000000000), result rd:x7(0x0000000000000000)
li x24, MASK_XLEN(0xffffffffffffffff)
li x15, MASK_XLEN(0x0000000000000000)
SLTU x7, x24, x15
sd x7, 1056(x6)

# Testcase 133:  rs1:x28(0xffffffffffffffff), rs2:x1(0x0000000000000001), result rd:x17(0x0000000000000000)
li x28, MASK_XLEN(0xffffffffffffffff)
li x1, MASK_XLEN(0x0000000000000001)
SLTU x17, x28, x1
sd x17, 1064(x6)

# Testcase 134:  rs1:x29(0xffffffffffffffff), rs2:x20(0x0000000000000002), result rd:x28(0x0000000000000000)
li x29, MASK_XLEN(0xffffffffffffffff)
li x20, MASK_XLEN(0x0000000000000002)
SLTU x28, x29, x20
sd x28, 1072(x6)

# Testcase 135:  rs1:x14(0xffffffffffffffff), rs2:x3(0x00000000000000ff), result rd:x18(0x0000000000000000)
li x14, MASK_XLEN(0xffffffffffffffff)
li x3, MASK_XLEN(0x00000000000000ff)
SLTU x18, x14, x3
sd x18, 1080(x6)

# Testcase 136:  rs1:x8(0xffffffffffffffff), rs2:x30(0x624b3e976c52dd14), result rd:x14(0x0000000000000000)
li x8, MASK_XLEN(0xffffffffffffffff)
li x30, MASK_XLEN(0x624b3e976c52dd14)
SLTU x14, x8, x30
sd x14, 1088(x6)

# Testcase 137:  rs1:x13(0xffffffffffffffff), rs2:x16(0x7ffffffffffffffe), result rd:x26(0x0000000000000000)
li x13, MASK_XLEN(0xffffffffffffffff)
li x16, MASK_XLEN(0x7ffffffffffffffe)
SLTU x26, x13, x16
sd x26, 1096(x6)

# Testcase 138:  rs1:x1(0xffffffffffffffff), rs2:x14(0x7fffffffffffffff), result rd:x7(0x0000000000000000)
li x1, MASK_XLEN(0xffffffffffffffff)
li x14, MASK_XLEN(0x7fffffffffffffff)
SLTU x7, x1, x14
sd x7, 1104(x6)

# Testcase 139:  rs1:x13(0xffffffffffffffff), rs2:x25(0x8000000000000000), result rd:x2(0x0000000000000000)
li x13, MASK_XLEN(0xffffffffffffffff)
li x25, MASK_XLEN(0x8000000000000000)
SLTU x2, x13, x25
sd x2, 1112(x6)

# Testcase 140:  rs1:x20(0xffffffffffffffff), rs2:x31(0x8000000000000001), result rd:x9(0x0000000000000000)
li x20, MASK_XLEN(0xffffffffffffffff)
li x31, MASK_XLEN(0x8000000000000001)
SLTU x9, x20, x31
sd x9, 1120(x6)

# Testcase 141:  rs1:x1(0xffffffffffffffff), rs2:x19(0xc365ddeb9173ab42), result rd:x12(0x0000000000000000)
li x1, MASK_XLEN(0xffffffffffffffff)
li x19, MASK_XLEN(0xc365ddeb9173ab42)
SLTU x12, x1, x19
sd x12, 1128(x6)

# Testcase 142:  rs1:x23(0xffffffffffffffff), rs2:x12(0xfffffffffffffffe), result rd:x27(0x0000000000000000)
li x23, MASK_XLEN(0xffffffffffffffff)
li x12, MASK_XLEN(0xfffffffffffffffe)
SLTU x27, x23, x12
sd x27, 1136(x6)

# Testcase 143:  rs1:x11(0xffffffffffffffff), rs2:x22(0xffffffffffffffff), result rd:x15(0x0000000000000000)
li x11, MASK_XLEN(0xffffffffffffffff)
li x22, MASK_XLEN(0xffffffffffffffff)
SLTU x15, x11, x22
sd x15, 1144(x6)

# Testcase 144:  rs1:x3(0x2266a107a408001f), rs2:x9(0x845c21e7988d0e4a), result rd:x31(0x0000000000000001)
li x3, MASK_XLEN(0x2266a107a408001f)
li x9, MASK_XLEN(0x845c21e7988d0e4a)
SLTU x31, x3, x9
sd x31, 1152(x6)

# Testcase 145:  rs1:x1(0xb6ffe12c1a6f0c9a), rs2:x23(0x45dae1f31a7e256d), result rd:x5(0x0000000000000000)
li x1, MASK_XLEN(0xb6ffe12c1a6f0c9a)
li x23, MASK_XLEN(0x45dae1f31a7e256d)
SLTU x5, x1, x23
sd x5, 1160(x6)

# Testcase 146:  rs1:x13(0xc5a918d19eede43c), rs2:x7(0x22ca9fe8a8aa7d13), result rd:x19(0x0000000000000000)
li x13, MASK_XLEN(0xc5a918d19eede43c)
li x7, MASK_XLEN(0x22ca9fe8a8aa7d13)
SLTU x19, x13, x7
sd x19, 1168(x6)

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
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-SLTU.S
// Sean Wu (sywu@hmc.edu)
