///////////////////////////////////////////
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-ADD.S
// Sean Wu (sywu@hmc.edu)
// Created 2023-02-18 01:00:53.287903//
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

# Testcase 0:  rs1:x28(0x0000000000000000), rs2:x13(0x0000000000000000), result rd:x25(0x0000000000000000)
li x28, MASK_XLEN(0x0000000000000000)
li x13, MASK_XLEN(0x0000000000000000)
ADD x25, x28, x13
sd x25, 0(x6)

# Testcase 1:  rs1:x29(0x0000000000000000), rs2:x14(0x0000000000000001), result rd:x2(0x0000000000000001)
li x29, MASK_XLEN(0x0000000000000000)
li x14, MASK_XLEN(0x0000000000000001)
ADD x2, x29, x14
sd x2, 8(x6)

# Testcase 2:  rs1:x9(0x0000000000000000), rs2:x31(0x0000000000000002), result rd:x17(0x0000000000000002)
li x9, MASK_XLEN(0x0000000000000000)
li x31, MASK_XLEN(0x0000000000000002)
ADD x17, x9, x31
sd x17, 16(x6)

# Testcase 3:  rs1:x16(0x0000000000000000), rs2:x13(0x00000000000000ff), result rd:x30(0x00000000000000ff)
li x16, MASK_XLEN(0x0000000000000000)
li x13, MASK_XLEN(0x00000000000000ff)
ADD x30, x16, x13
sd x30, 24(x6)

# Testcase 4:  rs1:x26(0x0000000000000000), rs2:x27(0x624b3e976c52dd14), result rd:x10(0x624b3e976c52dd14)
li x26, MASK_XLEN(0x0000000000000000)
li x27, MASK_XLEN(0x624b3e976c52dd14)
ADD x10, x26, x27
sd x10, 32(x6)

# Testcase 5:  rs1:x31(0x0000000000000000), rs2:x16(0x7ffffffffffffffe), result rd:x12(0x7ffffffffffffffe)
li x31, MASK_XLEN(0x0000000000000000)
li x16, MASK_XLEN(0x7ffffffffffffffe)
ADD x12, x31, x16
sd x12, 40(x6)

# Testcase 6:  rs1:x19(0x0000000000000000), rs2:x29(0x7fffffffffffffff), result rd:x30(0x7fffffffffffffff)
li x19, MASK_XLEN(0x0000000000000000)
li x29, MASK_XLEN(0x7fffffffffffffff)
ADD x30, x19, x29
sd x30, 48(x6)

# Testcase 7:  rs1:x7(0x0000000000000000), rs2:x17(0x8000000000000000), result rd:x5(0x8000000000000000)
li x7, MASK_XLEN(0x0000000000000000)
li x17, MASK_XLEN(0x8000000000000000)
ADD x5, x7, x17
sd x5, 56(x6)

# Testcase 8:  rs1:x10(0x0000000000000000), rs2:x5(0x8000000000000001), result rd:x25(0x8000000000000001)
li x10, MASK_XLEN(0x0000000000000000)
li x5, MASK_XLEN(0x8000000000000001)
ADD x25, x10, x5
sd x25, 64(x6)

# Testcase 9:  rs1:x4(0x0000000000000000), rs2:x20(0xc365ddeb9173ab42), result rd:x26(0xc365ddeb9173ab42)
li x4, MASK_XLEN(0x0000000000000000)
li x20, MASK_XLEN(0xc365ddeb9173ab42)
ADD x26, x4, x20
sd x26, 72(x6)

# Testcase 10:  rs1:x9(0x0000000000000000), rs2:x30(0xfffffffffffffffe), result rd:x18(0xfffffffffffffffe)
li x9, MASK_XLEN(0x0000000000000000)
li x30, MASK_XLEN(0xfffffffffffffffe)
ADD x18, x9, x30
sd x18, 80(x6)

# Testcase 11:  rs1:x23(0x0000000000000000), rs2:x26(0xffffffffffffffff), result rd:x20(0xffffffffffffffff)
li x23, MASK_XLEN(0x0000000000000000)
li x26, MASK_XLEN(0xffffffffffffffff)
ADD x20, x23, x26
sd x20, 88(x6)

# Testcase 12:  rs1:x29(0x0000000000000001), rs2:x5(0x0000000000000000), result rd:x10(0x0000000000000001)
li x29, MASK_XLEN(0x0000000000000001)
li x5, MASK_XLEN(0x0000000000000000)
ADD x10, x29, x5
sd x10, 96(x6)

# Testcase 13:  rs1:x4(0x0000000000000001), rs2:x24(0x0000000000000001), result rd:x3(0x0000000000000002)
li x4, MASK_XLEN(0x0000000000000001)
li x24, MASK_XLEN(0x0000000000000001)
ADD x3, x4, x24
sd x3, 104(x6)

# Testcase 14:  rs1:x29(0x0000000000000001), rs2:x28(0x0000000000000002), result rd:x22(0x0000000000000003)
li x29, MASK_XLEN(0x0000000000000001)
li x28, MASK_XLEN(0x0000000000000002)
ADD x22, x29, x28
sd x22, 112(x6)

# Testcase 15:  rs1:x11(0x0000000000000001), rs2:x16(0x00000000000000ff), result rd:x18(0x0000000000000100)
li x11, MASK_XLEN(0x0000000000000001)
li x16, MASK_XLEN(0x00000000000000ff)
ADD x18, x11, x16
sd x18, 120(x6)

# Testcase 16:  rs1:x4(0x0000000000000001), rs2:x12(0x624b3e976c52dd14), result rd:x14(0x624b3e976c52dd15)
li x4, MASK_XLEN(0x0000000000000001)
li x12, MASK_XLEN(0x624b3e976c52dd14)
ADD x14, x4, x12
sd x14, 128(x6)

# Testcase 17:  rs1:x11(0x0000000000000001), rs2:x20(0x7ffffffffffffffe), result rd:x21(0x7fffffffffffffff)
li x11, MASK_XLEN(0x0000000000000001)
li x20, MASK_XLEN(0x7ffffffffffffffe)
ADD x21, x11, x20
sd x21, 136(x6)

# Testcase 18:  rs1:x30(0x0000000000000001), rs2:x7(0x7fffffffffffffff), result rd:x31(0x8000000000000000)
li x30, MASK_XLEN(0x0000000000000001)
li x7, MASK_XLEN(0x7fffffffffffffff)
ADD x31, x30, x7
sd x31, 144(x6)

# Testcase 19:  rs1:x18(0x0000000000000001), rs2:x16(0x8000000000000000), result rd:x15(0x8000000000000001)
li x18, MASK_XLEN(0x0000000000000001)
li x16, MASK_XLEN(0x8000000000000000)
ADD x15, x18, x16
sd x15, 152(x6)

# Testcase 20:  rs1:x28(0x0000000000000001), rs2:x17(0x8000000000000001), result rd:x9(0x8000000000000002)
li x28, MASK_XLEN(0x0000000000000001)
li x17, MASK_XLEN(0x8000000000000001)
ADD x9, x28, x17
sd x9, 160(x6)

# Testcase 21:  rs1:x2(0x0000000000000001), rs2:x26(0xc365ddeb9173ab42), result rd:x30(0xc365ddeb9173ab43)
li x2, MASK_XLEN(0x0000000000000001)
li x26, MASK_XLEN(0xc365ddeb9173ab42)
ADD x30, x2, x26
sd x30, 168(x6)

# Testcase 22:  rs1:x18(0x0000000000000001), rs2:x30(0xfffffffffffffffe), result rd:x1(0xffffffffffffffff)
li x18, MASK_XLEN(0x0000000000000001)
li x30, MASK_XLEN(0xfffffffffffffffe)
ADD x1, x18, x30
sd x1, 176(x6)

# Testcase 23:  rs1:x3(0x0000000000000001), rs2:x24(0xffffffffffffffff), result rd:x27(0x0000000000000000)
li x3, MASK_XLEN(0x0000000000000001)
li x24, MASK_XLEN(0xffffffffffffffff)
ADD x27, x3, x24
sd x27, 184(x6)

# Testcase 24:  rs1:x13(0x0000000000000002), rs2:x23(0x0000000000000000), result rd:x27(0x0000000000000002)
li x13, MASK_XLEN(0x0000000000000002)
li x23, MASK_XLEN(0x0000000000000000)
ADD x27, x13, x23
sd x27, 192(x6)

# Testcase 25:  rs1:x26(0x0000000000000002), rs2:x22(0x0000000000000001), result rd:x21(0x0000000000000003)
li x26, MASK_XLEN(0x0000000000000002)
li x22, MASK_XLEN(0x0000000000000001)
ADD x21, x26, x22
sd x21, 200(x6)

# Testcase 26:  rs1:x1(0x0000000000000002), rs2:x20(0x0000000000000002), result rd:x16(0x0000000000000004)
li x1, MASK_XLEN(0x0000000000000002)
li x20, MASK_XLEN(0x0000000000000002)
ADD x16, x1, x20
sd x16, 208(x6)

# Testcase 27:  rs1:x27(0x0000000000000002), rs2:x28(0x00000000000000ff), result rd:x11(0x0000000000000101)
li x27, MASK_XLEN(0x0000000000000002)
li x28, MASK_XLEN(0x00000000000000ff)
ADD x11, x27, x28
sd x11, 216(x6)

# Testcase 28:  rs1:x8(0x0000000000000002), rs2:x24(0x624b3e976c52dd14), result rd:x11(0x624b3e976c52dd16)
li x8, MASK_XLEN(0x0000000000000002)
li x24, MASK_XLEN(0x624b3e976c52dd14)
ADD x11, x8, x24
sd x11, 224(x6)

# Testcase 29:  rs1:x23(0x0000000000000002), rs2:x28(0x7ffffffffffffffe), result rd:x3(0x8000000000000000)
li x23, MASK_XLEN(0x0000000000000002)
li x28, MASK_XLEN(0x7ffffffffffffffe)
ADD x3, x23, x28
sd x3, 232(x6)

# Testcase 30:  rs1:x7(0x0000000000000002), rs2:x30(0x7fffffffffffffff), result rd:x19(0x8000000000000001)
li x7, MASK_XLEN(0x0000000000000002)
li x30, MASK_XLEN(0x7fffffffffffffff)
ADD x19, x7, x30
sd x19, 240(x6)

# Testcase 31:  rs1:x31(0x0000000000000002), rs2:x5(0x8000000000000000), result rd:x26(0x8000000000000002)
li x31, MASK_XLEN(0x0000000000000002)
li x5, MASK_XLEN(0x8000000000000000)
ADD x26, x31, x5
sd x26, 248(x6)

# Testcase 32:  rs1:x18(0x0000000000000002), rs2:x15(0x8000000000000001), result rd:x3(0x8000000000000003)
li x18, MASK_XLEN(0x0000000000000002)
li x15, MASK_XLEN(0x8000000000000001)
ADD x3, x18, x15
sd x3, 256(x6)

# Testcase 33:  rs1:x3(0x0000000000000002), rs2:x11(0xc365ddeb9173ab42), result rd:x29(0xc365ddeb9173ab44)
li x3, MASK_XLEN(0x0000000000000002)
li x11, MASK_XLEN(0xc365ddeb9173ab42)
ADD x29, x3, x11
sd x29, 264(x6)

# Testcase 34:  rs1:x17(0x0000000000000002), rs2:x30(0xfffffffffffffffe), result rd:x16(0x0000000000000000)
li x17, MASK_XLEN(0x0000000000000002)
li x30, MASK_XLEN(0xfffffffffffffffe)
ADD x16, x17, x30
sd x16, 272(x6)

# Testcase 35:  rs1:x4(0x0000000000000002), rs2:x10(0xffffffffffffffff), result rd:x18(0x0000000000000001)
li x4, MASK_XLEN(0x0000000000000002)
li x10, MASK_XLEN(0xffffffffffffffff)
ADD x18, x4, x10
sd x18, 280(x6)

# Testcase 36:  rs1:x10(0x00000000000000ff), rs2:x23(0x0000000000000000), result rd:x4(0x00000000000000ff)
li x10, MASK_XLEN(0x00000000000000ff)
li x23, MASK_XLEN(0x0000000000000000)
ADD x4, x10, x23
sd x4, 288(x6)

# Testcase 37:  rs1:x18(0x00000000000000ff), rs2:x11(0x0000000000000001), result rd:x27(0x0000000000000100)
li x18, MASK_XLEN(0x00000000000000ff)
li x11, MASK_XLEN(0x0000000000000001)
ADD x27, x18, x11
sd x27, 296(x6)

# Testcase 38:  rs1:x30(0x00000000000000ff), rs2:x18(0x0000000000000002), result rd:x7(0x0000000000000101)
li x30, MASK_XLEN(0x00000000000000ff)
li x18, MASK_XLEN(0x0000000000000002)
ADD x7, x30, x18
sd x7, 304(x6)

# Testcase 39:  rs1:x31(0x00000000000000ff), rs2:x26(0x00000000000000ff), result rd:x20(0x00000000000001fe)
li x31, MASK_XLEN(0x00000000000000ff)
li x26, MASK_XLEN(0x00000000000000ff)
ADD x20, x31, x26
sd x20, 312(x6)

# Testcase 40:  rs1:x18(0x00000000000000ff), rs2:x19(0x624b3e976c52dd14), result rd:x10(0x624b3e976c52de13)
li x18, MASK_XLEN(0x00000000000000ff)
li x19, MASK_XLEN(0x624b3e976c52dd14)
ADD x10, x18, x19
sd x10, 320(x6)

# Testcase 41:  rs1:x15(0x00000000000000ff), rs2:x3(0x7ffffffffffffffe), result rd:x20(0x80000000000000fd)
li x15, MASK_XLEN(0x00000000000000ff)
li x3, MASK_XLEN(0x7ffffffffffffffe)
ADD x20, x15, x3
sd x20, 328(x6)

# Testcase 42:  rs1:x26(0x00000000000000ff), rs2:x13(0x7fffffffffffffff), result rd:x11(0x80000000000000fe)
li x26, MASK_XLEN(0x00000000000000ff)
li x13, MASK_XLEN(0x7fffffffffffffff)
ADD x11, x26, x13
sd x11, 336(x6)

# Testcase 43:  rs1:x19(0x00000000000000ff), rs2:x8(0x8000000000000000), result rd:x10(0x80000000000000ff)
li x19, MASK_XLEN(0x00000000000000ff)
li x8, MASK_XLEN(0x8000000000000000)
ADD x10, x19, x8
sd x10, 344(x6)

# Testcase 44:  rs1:x22(0x00000000000000ff), rs2:x9(0x8000000000000001), result rd:x16(0x8000000000000100)
li x22, MASK_XLEN(0x00000000000000ff)
li x9, MASK_XLEN(0x8000000000000001)
ADD x16, x22, x9
sd x16, 352(x6)

# Testcase 45:  rs1:x25(0x00000000000000ff), rs2:x5(0xc365ddeb9173ab42), result rd:x29(0xc365ddeb9173ac41)
li x25, MASK_XLEN(0x00000000000000ff)
li x5, MASK_XLEN(0xc365ddeb9173ab42)
ADD x29, x25, x5
sd x29, 360(x6)

# Testcase 46:  rs1:x5(0x00000000000000ff), rs2:x30(0xfffffffffffffffe), result rd:x2(0x00000000000000fd)
li x5, MASK_XLEN(0x00000000000000ff)
li x30, MASK_XLEN(0xfffffffffffffffe)
ADD x2, x5, x30
sd x2, 368(x6)

# Testcase 47:  rs1:x27(0x00000000000000ff), rs2:x3(0xffffffffffffffff), result rd:x29(0x00000000000000fe)
li x27, MASK_XLEN(0x00000000000000ff)
li x3, MASK_XLEN(0xffffffffffffffff)
ADD x29, x27, x3
sd x29, 376(x6)

# Testcase 48:  rs1:x23(0x624b3e976c52dd14), rs2:x30(0x0000000000000000), result rd:x27(0x624b3e976c52dd14)
li x23, MASK_XLEN(0x624b3e976c52dd14)
li x30, MASK_XLEN(0x0000000000000000)
ADD x27, x23, x30
sd x27, 384(x6)

# Testcase 49:  rs1:x18(0x624b3e976c52dd14), rs2:x22(0x0000000000000001), result rd:x13(0x624b3e976c52dd15)
li x18, MASK_XLEN(0x624b3e976c52dd14)
li x22, MASK_XLEN(0x0000000000000001)
ADD x13, x18, x22
sd x13, 392(x6)

# Testcase 50:  rs1:x27(0x624b3e976c52dd14), rs2:x23(0x0000000000000002), result rd:x17(0x624b3e976c52dd16)
li x27, MASK_XLEN(0x624b3e976c52dd14)
li x23, MASK_XLEN(0x0000000000000002)
ADD x17, x27, x23
sd x17, 400(x6)

# Testcase 51:  rs1:x9(0x624b3e976c52dd14), rs2:x17(0x00000000000000ff), result rd:x26(0x624b3e976c52de13)
li x9, MASK_XLEN(0x624b3e976c52dd14)
li x17, MASK_XLEN(0x00000000000000ff)
ADD x26, x9, x17
sd x26, 408(x6)

# Testcase 52:  rs1:x8(0x624b3e976c52dd14), rs2:x28(0x624b3e976c52dd14), result rd:x7(0xc4967d2ed8a5ba28)
li x8, MASK_XLEN(0x624b3e976c52dd14)
li x28, MASK_XLEN(0x624b3e976c52dd14)
ADD x7, x8, x28
sd x7, 416(x6)

# Testcase 53:  rs1:x29(0x624b3e976c52dd14), rs2:x22(0x7ffffffffffffffe), result rd:x19(0xe24b3e976c52dd12)
li x29, MASK_XLEN(0x624b3e976c52dd14)
li x22, MASK_XLEN(0x7ffffffffffffffe)
ADD x19, x29, x22
sd x19, 424(x6)

# Testcase 54:  rs1:x27(0x624b3e976c52dd14), rs2:x31(0x7fffffffffffffff), result rd:x14(0xe24b3e976c52dd13)
li x27, MASK_XLEN(0x624b3e976c52dd14)
li x31, MASK_XLEN(0x7fffffffffffffff)
ADD x14, x27, x31
sd x14, 432(x6)

# Testcase 55:  rs1:x19(0x624b3e976c52dd14), rs2:x9(0x8000000000000000), result rd:x15(0xe24b3e976c52dd14)
li x19, MASK_XLEN(0x624b3e976c52dd14)
li x9, MASK_XLEN(0x8000000000000000)
ADD x15, x19, x9
sd x15, 440(x6)

# Testcase 56:  rs1:x16(0x624b3e976c52dd14), rs2:x22(0x8000000000000001), result rd:x21(0xe24b3e976c52dd15)
li x16, MASK_XLEN(0x624b3e976c52dd14)
li x22, MASK_XLEN(0x8000000000000001)
ADD x21, x16, x22
sd x21, 448(x6)

# Testcase 57:  rs1:x23(0x624b3e976c52dd14), rs2:x30(0xc365ddeb9173ab42), result rd:x26(0x25b11c82fdc68856)
li x23, MASK_XLEN(0x624b3e976c52dd14)
li x30, MASK_XLEN(0xc365ddeb9173ab42)
ADD x26, x23, x30
sd x26, 456(x6)

# Testcase 58:  rs1:x12(0x624b3e976c52dd14), rs2:x3(0xfffffffffffffffe), result rd:x11(0x624b3e976c52dd12)
li x12, MASK_XLEN(0x624b3e976c52dd14)
li x3, MASK_XLEN(0xfffffffffffffffe)
ADD x11, x12, x3
sd x11, 464(x6)

# Testcase 59:  rs1:x20(0x624b3e976c52dd14), rs2:x4(0xffffffffffffffff), result rd:x16(0x624b3e976c52dd13)
li x20, MASK_XLEN(0x624b3e976c52dd14)
li x4, MASK_XLEN(0xffffffffffffffff)
ADD x16, x20, x4
sd x16, 472(x6)

# Testcase 60:  rs1:x19(0x7ffffffffffffffe), rs2:x21(0x0000000000000000), result rd:x11(0x7ffffffffffffffe)
li x19, MASK_XLEN(0x7ffffffffffffffe)
li x21, MASK_XLEN(0x0000000000000000)
ADD x11, x19, x21
sd x11, 480(x6)

# Testcase 61:  rs1:x28(0x7ffffffffffffffe), rs2:x7(0x0000000000000001), result rd:x8(0x7fffffffffffffff)
li x28, MASK_XLEN(0x7ffffffffffffffe)
li x7, MASK_XLEN(0x0000000000000001)
ADD x8, x28, x7
sd x8, 488(x6)

# Testcase 62:  rs1:x1(0x7ffffffffffffffe), rs2:x24(0x0000000000000002), result rd:x9(0x8000000000000000)
li x1, MASK_XLEN(0x7ffffffffffffffe)
li x24, MASK_XLEN(0x0000000000000002)
ADD x9, x1, x24
sd x9, 496(x6)

# Testcase 63:  rs1:x4(0x7ffffffffffffffe), rs2:x23(0x00000000000000ff), result rd:x8(0x80000000000000fd)
li x4, MASK_XLEN(0x7ffffffffffffffe)
li x23, MASK_XLEN(0x00000000000000ff)
ADD x8, x4, x23
sd x8, 504(x6)

# Testcase 64:  rs1:x11(0x7ffffffffffffffe), rs2:x14(0x624b3e976c52dd14), result rd:x27(0xe24b3e976c52dd12)
li x11, MASK_XLEN(0x7ffffffffffffffe)
li x14, MASK_XLEN(0x624b3e976c52dd14)
ADD x27, x11, x14
sd x27, 512(x6)

# Testcase 65:  rs1:x2(0x7ffffffffffffffe), rs2:x4(0x7ffffffffffffffe), result rd:x26(0xfffffffffffffffc)
li x2, MASK_XLEN(0x7ffffffffffffffe)
li x4, MASK_XLEN(0x7ffffffffffffffe)
ADD x26, x2, x4
sd x26, 520(x6)

# Testcase 66:  rs1:x5(0x7ffffffffffffffe), rs2:x28(0x7fffffffffffffff), result rd:x23(0xfffffffffffffffd)
li x5, MASK_XLEN(0x7ffffffffffffffe)
li x28, MASK_XLEN(0x7fffffffffffffff)
ADD x23, x5, x28
sd x23, 528(x6)

# Testcase 67:  rs1:x8(0x7ffffffffffffffe), rs2:x2(0x8000000000000000), result rd:x27(0xfffffffffffffffe)
li x8, MASK_XLEN(0x7ffffffffffffffe)
li x2, MASK_XLEN(0x8000000000000000)
ADD x27, x8, x2
sd x27, 536(x6)

# Testcase 68:  rs1:x19(0x7ffffffffffffffe), rs2:x21(0x8000000000000001), result rd:x30(0xffffffffffffffff)
li x19, MASK_XLEN(0x7ffffffffffffffe)
li x21, MASK_XLEN(0x8000000000000001)
ADD x30, x19, x21
sd x30, 544(x6)

# Testcase 69:  rs1:x30(0x7ffffffffffffffe), rs2:x18(0xc365ddeb9173ab42), result rd:x20(0x4365ddeb9173ab40)
li x30, MASK_XLEN(0x7ffffffffffffffe)
li x18, MASK_XLEN(0xc365ddeb9173ab42)
ADD x20, x30, x18
sd x20, 552(x6)

# Testcase 70:  rs1:x22(0x7ffffffffffffffe), rs2:x3(0xfffffffffffffffe), result rd:x1(0x7ffffffffffffffc)
li x22, MASK_XLEN(0x7ffffffffffffffe)
li x3, MASK_XLEN(0xfffffffffffffffe)
ADD x1, x22, x3
sd x1, 560(x6)

# Testcase 71:  rs1:x4(0x7ffffffffffffffe), rs2:x21(0xffffffffffffffff), result rd:x7(0x7ffffffffffffffd)
li x4, MASK_XLEN(0x7ffffffffffffffe)
li x21, MASK_XLEN(0xffffffffffffffff)
ADD x7, x4, x21
sd x7, 568(x6)

# Testcase 72:  rs1:x20(0x7fffffffffffffff), rs2:x27(0x0000000000000000), result rd:x19(0x7fffffffffffffff)
li x20, MASK_XLEN(0x7fffffffffffffff)
li x27, MASK_XLEN(0x0000000000000000)
ADD x19, x20, x27
sd x19, 576(x6)

# Testcase 73:  rs1:x4(0x7fffffffffffffff), rs2:x13(0x0000000000000001), result rd:x3(0x8000000000000000)
li x4, MASK_XLEN(0x7fffffffffffffff)
li x13, MASK_XLEN(0x0000000000000001)
ADD x3, x4, x13
sd x3, 584(x6)

# Testcase 74:  rs1:x12(0x7fffffffffffffff), rs2:x27(0x0000000000000002), result rd:x4(0x8000000000000001)
li x12, MASK_XLEN(0x7fffffffffffffff)
li x27, MASK_XLEN(0x0000000000000002)
ADD x4, x12, x27
sd x4, 592(x6)

# Testcase 75:  rs1:x2(0x7fffffffffffffff), rs2:x20(0x00000000000000ff), result rd:x1(0x80000000000000fe)
li x2, MASK_XLEN(0x7fffffffffffffff)
li x20, MASK_XLEN(0x00000000000000ff)
ADD x1, x2, x20
sd x1, 600(x6)

# Testcase 76:  rs1:x23(0x7fffffffffffffff), rs2:x4(0x624b3e976c52dd14), result rd:x16(0xe24b3e976c52dd13)
li x23, MASK_XLEN(0x7fffffffffffffff)
li x4, MASK_XLEN(0x624b3e976c52dd14)
ADD x16, x23, x4
sd x16, 608(x6)

# Testcase 77:  rs1:x7(0x7fffffffffffffff), rs2:x24(0x7ffffffffffffffe), result rd:x26(0xfffffffffffffffd)
li x7, MASK_XLEN(0x7fffffffffffffff)
li x24, MASK_XLEN(0x7ffffffffffffffe)
ADD x26, x7, x24
sd x26, 616(x6)

# Testcase 78:  rs1:x2(0x7fffffffffffffff), rs2:x30(0x7fffffffffffffff), result rd:x22(0xfffffffffffffffe)
li x2, MASK_XLEN(0x7fffffffffffffff)
li x30, MASK_XLEN(0x7fffffffffffffff)
ADD x22, x2, x30
sd x22, 624(x6)

# Testcase 79:  rs1:x1(0x7fffffffffffffff), rs2:x18(0x8000000000000000), result rd:x14(0xffffffffffffffff)
li x1, MASK_XLEN(0x7fffffffffffffff)
li x18, MASK_XLEN(0x8000000000000000)
ADD x14, x1, x18
sd x14, 632(x6)

# Testcase 80:  rs1:x20(0x7fffffffffffffff), rs2:x4(0x8000000000000001), result rd:x27(0x0000000000000000)
li x20, MASK_XLEN(0x7fffffffffffffff)
li x4, MASK_XLEN(0x8000000000000001)
ADD x27, x20, x4
sd x27, 640(x6)

# Testcase 81:  rs1:x9(0x7fffffffffffffff), rs2:x3(0xc365ddeb9173ab42), result rd:x8(0x4365ddeb9173ab41)
li x9, MASK_XLEN(0x7fffffffffffffff)
li x3, MASK_XLEN(0xc365ddeb9173ab42)
ADD x8, x9, x3
sd x8, 648(x6)

# Testcase 82:  rs1:x3(0x7fffffffffffffff), rs2:x21(0xfffffffffffffffe), result rd:x10(0x7ffffffffffffffd)
li x3, MASK_XLEN(0x7fffffffffffffff)
li x21, MASK_XLEN(0xfffffffffffffffe)
ADD x10, x3, x21
sd x10, 656(x6)

# Testcase 83:  rs1:x2(0x7fffffffffffffff), rs2:x17(0xffffffffffffffff), result rd:x15(0x7ffffffffffffffe)
li x2, MASK_XLEN(0x7fffffffffffffff)
li x17, MASK_XLEN(0xffffffffffffffff)
ADD x15, x2, x17
sd x15, 664(x6)

# Testcase 84:  rs1:x2(0x8000000000000000), rs2:x20(0x0000000000000000), result rd:x4(0x8000000000000000)
li x2, MASK_XLEN(0x8000000000000000)
li x20, MASK_XLEN(0x0000000000000000)
ADD x4, x2, x20
sd x4, 672(x6)

# Testcase 85:  rs1:x23(0x8000000000000000), rs2:x13(0x0000000000000001), result rd:x7(0x8000000000000001)
li x23, MASK_XLEN(0x8000000000000000)
li x13, MASK_XLEN(0x0000000000000001)
ADD x7, x23, x13
sd x7, 680(x6)

# Testcase 86:  rs1:x9(0x8000000000000000), rs2:x12(0x0000000000000002), result rd:x29(0x8000000000000002)
li x9, MASK_XLEN(0x8000000000000000)
li x12, MASK_XLEN(0x0000000000000002)
ADD x29, x9, x12
sd x29, 688(x6)

# Testcase 87:  rs1:x24(0x8000000000000000), rs2:x16(0x00000000000000ff), result rd:x27(0x80000000000000ff)
li x24, MASK_XLEN(0x8000000000000000)
li x16, MASK_XLEN(0x00000000000000ff)
ADD x27, x24, x16
sd x27, 696(x6)

# Testcase 88:  rs1:x29(0x8000000000000000), rs2:x30(0x624b3e976c52dd14), result rd:x19(0xe24b3e976c52dd14)
li x29, MASK_XLEN(0x8000000000000000)
li x30, MASK_XLEN(0x624b3e976c52dd14)
ADD x19, x29, x30
sd x19, 704(x6)

# Testcase 89:  rs1:x7(0x8000000000000000), rs2:x31(0x7ffffffffffffffe), result rd:x25(0xfffffffffffffffe)
li x7, MASK_XLEN(0x8000000000000000)
li x31, MASK_XLEN(0x7ffffffffffffffe)
ADD x25, x7, x31
sd x25, 712(x6)

# Testcase 90:  rs1:x2(0x8000000000000000), rs2:x26(0x7fffffffffffffff), result rd:x22(0xffffffffffffffff)
li x2, MASK_XLEN(0x8000000000000000)
li x26, MASK_XLEN(0x7fffffffffffffff)
ADD x22, x2, x26
sd x22, 720(x6)

# Testcase 91:  rs1:x11(0x8000000000000000), rs2:x17(0x8000000000000000), result rd:x9(0x0000000000000000)
li x11, MASK_XLEN(0x8000000000000000)
li x17, MASK_XLEN(0x8000000000000000)
ADD x9, x11, x17
sd x9, 728(x6)

# Testcase 92:  rs1:x4(0x8000000000000000), rs2:x20(0x8000000000000001), result rd:x30(0x0000000000000001)
li x4, MASK_XLEN(0x8000000000000000)
li x20, MASK_XLEN(0x8000000000000001)
ADD x30, x4, x20
sd x30, 736(x6)

# Testcase 93:  rs1:x1(0x8000000000000000), rs2:x16(0xc365ddeb9173ab42), result rd:x22(0x4365ddeb9173ab42)
li x1, MASK_XLEN(0x8000000000000000)
li x16, MASK_XLEN(0xc365ddeb9173ab42)
ADD x22, x1, x16
sd x22, 744(x6)

# Testcase 94:  rs1:x14(0x8000000000000000), rs2:x29(0xfffffffffffffffe), result rd:x19(0x7ffffffffffffffe)
li x14, MASK_XLEN(0x8000000000000000)
li x29, MASK_XLEN(0xfffffffffffffffe)
ADD x19, x14, x29
sd x19, 752(x6)

# Testcase 95:  rs1:x28(0x8000000000000000), rs2:x17(0xffffffffffffffff), result rd:x30(0x7fffffffffffffff)
li x28, MASK_XLEN(0x8000000000000000)
li x17, MASK_XLEN(0xffffffffffffffff)
ADD x30, x28, x17
sd x30, 760(x6)

# Testcase 96:  rs1:x10(0x8000000000000001), rs2:x21(0x0000000000000000), result rd:x12(0x8000000000000001)
li x10, MASK_XLEN(0x8000000000000001)
li x21, MASK_XLEN(0x0000000000000000)
ADD x12, x10, x21
sd x12, 768(x6)

# Testcase 97:  rs1:x13(0x8000000000000001), rs2:x27(0x0000000000000001), result rd:x22(0x8000000000000002)
li x13, MASK_XLEN(0x8000000000000001)
li x27, MASK_XLEN(0x0000000000000001)
ADD x22, x13, x27
sd x22, 776(x6)

# Testcase 98:  rs1:x9(0x8000000000000001), rs2:x5(0x0000000000000002), result rd:x18(0x8000000000000003)
li x9, MASK_XLEN(0x8000000000000001)
li x5, MASK_XLEN(0x0000000000000002)
ADD x18, x9, x5
sd x18, 784(x6)

# Testcase 99:  rs1:x23(0x8000000000000001), rs2:x1(0x00000000000000ff), result rd:x15(0x8000000000000100)
li x23, MASK_XLEN(0x8000000000000001)
li x1, MASK_XLEN(0x00000000000000ff)
ADD x15, x23, x1
sd x15, 792(x6)

# Testcase 100:  rs1:x24(0x8000000000000001), rs2:x3(0x624b3e976c52dd14), result rd:x11(0xe24b3e976c52dd15)
li x24, MASK_XLEN(0x8000000000000001)
li x3, MASK_XLEN(0x624b3e976c52dd14)
ADD x11, x24, x3
sd x11, 800(x6)

# Testcase 101:  rs1:x24(0x8000000000000001), rs2:x2(0x7ffffffffffffffe), result rd:x18(0xffffffffffffffff)
li x24, MASK_XLEN(0x8000000000000001)
li x2, MASK_XLEN(0x7ffffffffffffffe)
ADD x18, x24, x2
sd x18, 808(x6)

# Testcase 102:  rs1:x9(0x8000000000000001), rs2:x5(0x7fffffffffffffff), result rd:x8(0x0000000000000000)
li x9, MASK_XLEN(0x8000000000000001)
li x5, MASK_XLEN(0x7fffffffffffffff)
ADD x8, x9, x5
sd x8, 816(x6)

# Testcase 103:  rs1:x25(0x8000000000000001), rs2:x31(0x8000000000000000), result rd:x16(0x0000000000000001)
li x25, MASK_XLEN(0x8000000000000001)
li x31, MASK_XLEN(0x8000000000000000)
ADD x16, x25, x31
sd x16, 824(x6)

# Testcase 104:  rs1:x12(0x8000000000000001), rs2:x20(0x8000000000000001), result rd:x10(0x0000000000000002)
li x12, MASK_XLEN(0x8000000000000001)
li x20, MASK_XLEN(0x8000000000000001)
ADD x10, x12, x20
sd x10, 832(x6)

# Testcase 105:  rs1:x22(0x8000000000000001), rs2:x12(0xc365ddeb9173ab42), result rd:x19(0x4365ddeb9173ab43)
li x22, MASK_XLEN(0x8000000000000001)
li x12, MASK_XLEN(0xc365ddeb9173ab42)
ADD x19, x22, x12
sd x19, 840(x6)

# Testcase 106:  rs1:x31(0x8000000000000001), rs2:x29(0xfffffffffffffffe), result rd:x21(0x7fffffffffffffff)
li x31, MASK_XLEN(0x8000000000000001)
li x29, MASK_XLEN(0xfffffffffffffffe)
ADD x21, x31, x29
sd x21, 848(x6)

# Testcase 107:  rs1:x28(0x8000000000000001), rs2:x20(0xffffffffffffffff), result rd:x5(0x8000000000000000)
li x28, MASK_XLEN(0x8000000000000001)
li x20, MASK_XLEN(0xffffffffffffffff)
ADD x5, x28, x20
sd x5, 856(x6)

# Testcase 108:  rs1:x23(0xc365ddeb9173ab42), rs2:x10(0x0000000000000000), result rd:x13(0xc365ddeb9173ab42)
li x23, MASK_XLEN(0xc365ddeb9173ab42)
li x10, MASK_XLEN(0x0000000000000000)
ADD x13, x23, x10
sd x13, 864(x6)

# Testcase 109:  rs1:x24(0xc365ddeb9173ab42), rs2:x14(0x0000000000000001), result rd:x27(0xc365ddeb9173ab43)
li x24, MASK_XLEN(0xc365ddeb9173ab42)
li x14, MASK_XLEN(0x0000000000000001)
ADD x27, x24, x14
sd x27, 872(x6)

# Testcase 110:  rs1:x21(0xc365ddeb9173ab42), rs2:x3(0x0000000000000002), result rd:x1(0xc365ddeb9173ab44)
li x21, MASK_XLEN(0xc365ddeb9173ab42)
li x3, MASK_XLEN(0x0000000000000002)
ADD x1, x21, x3
sd x1, 880(x6)

# Testcase 111:  rs1:x20(0xc365ddeb9173ab42), rs2:x7(0x00000000000000ff), result rd:x23(0xc365ddeb9173ac41)
li x20, MASK_XLEN(0xc365ddeb9173ab42)
li x7, MASK_XLEN(0x00000000000000ff)
ADD x23, x20, x7
sd x23, 888(x6)

# Testcase 112:  rs1:x8(0xc365ddeb9173ab42), rs2:x21(0x624b3e976c52dd14), result rd:x15(0x25b11c82fdc68856)
li x8, MASK_XLEN(0xc365ddeb9173ab42)
li x21, MASK_XLEN(0x624b3e976c52dd14)
ADD x15, x8, x21
sd x15, 896(x6)

# Testcase 113:  rs1:x13(0xc365ddeb9173ab42), rs2:x23(0x7ffffffffffffffe), result rd:x29(0x4365ddeb9173ab40)
li x13, MASK_XLEN(0xc365ddeb9173ab42)
li x23, MASK_XLEN(0x7ffffffffffffffe)
ADD x29, x13, x23
sd x29, 904(x6)

# Testcase 114:  rs1:x22(0xc365ddeb9173ab42), rs2:x19(0x7fffffffffffffff), result rd:x28(0x4365ddeb9173ab41)
li x22, MASK_XLEN(0xc365ddeb9173ab42)
li x19, MASK_XLEN(0x7fffffffffffffff)
ADD x28, x22, x19
sd x28, 912(x6)

# Testcase 115:  rs1:x14(0xc365ddeb9173ab42), rs2:x2(0x8000000000000000), result rd:x13(0x4365ddeb9173ab42)
li x14, MASK_XLEN(0xc365ddeb9173ab42)
li x2, MASK_XLEN(0x8000000000000000)
ADD x13, x14, x2
sd x13, 920(x6)

# Testcase 116:  rs1:x28(0xc365ddeb9173ab42), rs2:x23(0x8000000000000001), result rd:x19(0x4365ddeb9173ab43)
li x28, MASK_XLEN(0xc365ddeb9173ab42)
li x23, MASK_XLEN(0x8000000000000001)
ADD x19, x28, x23
sd x19, 928(x6)

# Testcase 117:  rs1:x14(0xc365ddeb9173ab42), rs2:x25(0xc365ddeb9173ab42), result rd:x22(0x86cbbbd722e75684)
li x14, MASK_XLEN(0xc365ddeb9173ab42)
li x25, MASK_XLEN(0xc365ddeb9173ab42)
ADD x22, x14, x25
sd x22, 936(x6)

# Testcase 118:  rs1:x15(0xc365ddeb9173ab42), rs2:x3(0xfffffffffffffffe), result rd:x9(0xc365ddeb9173ab40)
li x15, MASK_XLEN(0xc365ddeb9173ab42)
li x3, MASK_XLEN(0xfffffffffffffffe)
ADD x9, x15, x3
sd x9, 944(x6)

# Testcase 119:  rs1:x17(0xc365ddeb9173ab42), rs2:x29(0xffffffffffffffff), result rd:x16(0xc365ddeb9173ab41)
li x17, MASK_XLEN(0xc365ddeb9173ab42)
li x29, MASK_XLEN(0xffffffffffffffff)
ADD x16, x17, x29
sd x16, 952(x6)

# Testcase 120:  rs1:x30(0xfffffffffffffffe), rs2:x18(0x0000000000000000), result rd:x20(0xfffffffffffffffe)
li x30, MASK_XLEN(0xfffffffffffffffe)
li x18, MASK_XLEN(0x0000000000000000)
ADD x20, x30, x18
sd x20, 960(x6)

# Testcase 121:  rs1:x25(0xfffffffffffffffe), rs2:x1(0x0000000000000001), result rd:x29(0xffffffffffffffff)
li x25, MASK_XLEN(0xfffffffffffffffe)
li x1, MASK_XLEN(0x0000000000000001)
ADD x29, x25, x1
sd x29, 968(x6)

# Testcase 122:  rs1:x2(0xfffffffffffffffe), rs2:x16(0x0000000000000002), result rd:x11(0x0000000000000000)
li x2, MASK_XLEN(0xfffffffffffffffe)
li x16, MASK_XLEN(0x0000000000000002)
ADD x11, x2, x16
sd x11, 976(x6)

# Testcase 123:  rs1:x10(0xfffffffffffffffe), rs2:x27(0x00000000000000ff), result rd:x15(0x00000000000000fd)
li x10, MASK_XLEN(0xfffffffffffffffe)
li x27, MASK_XLEN(0x00000000000000ff)
ADD x15, x10, x27
sd x15, 984(x6)

# Testcase 124:  rs1:x2(0xfffffffffffffffe), rs2:x26(0x624b3e976c52dd14), result rd:x27(0x624b3e976c52dd12)
li x2, MASK_XLEN(0xfffffffffffffffe)
li x26, MASK_XLEN(0x624b3e976c52dd14)
ADD x27, x2, x26
sd x27, 992(x6)

# Testcase 125:  rs1:x29(0xfffffffffffffffe), rs2:x26(0x7ffffffffffffffe), result rd:x14(0x7ffffffffffffffc)
li x29, MASK_XLEN(0xfffffffffffffffe)
li x26, MASK_XLEN(0x7ffffffffffffffe)
ADD x14, x29, x26
sd x14, 1000(x6)

# Testcase 126:  rs1:x7(0xfffffffffffffffe), rs2:x18(0x7fffffffffffffff), result rd:x31(0x7ffffffffffffffd)
li x7, MASK_XLEN(0xfffffffffffffffe)
li x18, MASK_XLEN(0x7fffffffffffffff)
ADD x31, x7, x18
sd x31, 1008(x6)

# Testcase 127:  rs1:x21(0xfffffffffffffffe), rs2:x3(0x8000000000000000), result rd:x27(0x7ffffffffffffffe)
li x21, MASK_XLEN(0xfffffffffffffffe)
li x3, MASK_XLEN(0x8000000000000000)
ADD x27, x21, x3
sd x27, 1016(x6)

# Testcase 128:  rs1:x24(0xfffffffffffffffe), rs2:x5(0x8000000000000001), result rd:x1(0x7fffffffffffffff)
li x24, MASK_XLEN(0xfffffffffffffffe)
li x5, MASK_XLEN(0x8000000000000001)
ADD x1, x24, x5
sd x1, 1024(x6)

# Testcase 129:  rs1:x13(0xfffffffffffffffe), rs2:x31(0xc365ddeb9173ab42), result rd:x22(0xc365ddeb9173ab40)
li x13, MASK_XLEN(0xfffffffffffffffe)
li x31, MASK_XLEN(0xc365ddeb9173ab42)
ADD x22, x13, x31
sd x22, 1032(x6)

# Testcase 130:  rs1:x14(0xfffffffffffffffe), rs2:x11(0xfffffffffffffffe), result rd:x1(0xfffffffffffffffc)
li x14, MASK_XLEN(0xfffffffffffffffe)
li x11, MASK_XLEN(0xfffffffffffffffe)
ADD x1, x14, x11
sd x1, 1040(x6)

# Testcase 131:  rs1:x7(0xfffffffffffffffe), rs2:x1(0xffffffffffffffff), result rd:x23(0xfffffffffffffffd)
li x7, MASK_XLEN(0xfffffffffffffffe)
li x1, MASK_XLEN(0xffffffffffffffff)
ADD x23, x7, x1
sd x23, 1048(x6)

# Testcase 132:  rs1:x25(0xffffffffffffffff), rs2:x1(0x0000000000000000), result rd:x27(0xffffffffffffffff)
li x25, MASK_XLEN(0xffffffffffffffff)
li x1, MASK_XLEN(0x0000000000000000)
ADD x27, x25, x1
sd x27, 1056(x6)

# Testcase 133:  rs1:x22(0xffffffffffffffff), rs2:x17(0x0000000000000001), result rd:x20(0x0000000000000000)
li x22, MASK_XLEN(0xffffffffffffffff)
li x17, MASK_XLEN(0x0000000000000001)
ADD x20, x22, x17
sd x20, 1064(x6)

# Testcase 134:  rs1:x4(0xffffffffffffffff), rs2:x7(0x0000000000000002), result rd:x4(0x0000000000000001)
li x4, MASK_XLEN(0xffffffffffffffff)
li x7, MASK_XLEN(0x0000000000000002)
ADD x4, x4, x7
sd x4, 1072(x6)

# Testcase 135:  rs1:x20(0xffffffffffffffff), rs2:x21(0x00000000000000ff), result rd:x7(0x00000000000000fe)
li x20, MASK_XLEN(0xffffffffffffffff)
li x21, MASK_XLEN(0x00000000000000ff)
ADD x7, x20, x21
sd x7, 1080(x6)

# Testcase 136:  rs1:x28(0xffffffffffffffff), rs2:x10(0x624b3e976c52dd14), result rd:x9(0x624b3e976c52dd13)
li x28, MASK_XLEN(0xffffffffffffffff)
li x10, MASK_XLEN(0x624b3e976c52dd14)
ADD x9, x28, x10
sd x9, 1088(x6)

# Testcase 137:  rs1:x16(0xffffffffffffffff), rs2:x28(0x7ffffffffffffffe), result rd:x30(0x7ffffffffffffffd)
li x16, MASK_XLEN(0xffffffffffffffff)
li x28, MASK_XLEN(0x7ffffffffffffffe)
ADD x30, x16, x28
sd x30, 1096(x6)

# Testcase 138:  rs1:x13(0xffffffffffffffff), rs2:x21(0x7fffffffffffffff), result rd:x3(0x7ffffffffffffffe)
li x13, MASK_XLEN(0xffffffffffffffff)
li x21, MASK_XLEN(0x7fffffffffffffff)
ADD x3, x13, x21
sd x3, 1104(x6)

# Testcase 139:  rs1:x1(0xffffffffffffffff), rs2:x9(0x8000000000000000), result rd:x30(0x7fffffffffffffff)
li x1, MASK_XLEN(0xffffffffffffffff)
li x9, MASK_XLEN(0x8000000000000000)
ADD x30, x1, x9
sd x30, 1112(x6)

# Testcase 140:  rs1:x15(0xffffffffffffffff), rs2:x26(0x8000000000000001), result rd:x26(0x8000000000000000)
li x15, MASK_XLEN(0xffffffffffffffff)
li x26, MASK_XLEN(0x8000000000000001)
ADD x26, x15, x26
sd x26, 1120(x6)

# Testcase 141:  rs1:x4(0xffffffffffffffff), rs2:x28(0xc365ddeb9173ab42), result rd:x9(0xc365ddeb9173ab41)
li x4, MASK_XLEN(0xffffffffffffffff)
li x28, MASK_XLEN(0xc365ddeb9173ab42)
ADD x9, x4, x28
sd x9, 1128(x6)

# Testcase 142:  rs1:x5(0xffffffffffffffff), rs2:x21(0xfffffffffffffffe), result rd:x17(0xfffffffffffffffd)
li x5, MASK_XLEN(0xffffffffffffffff)
li x21, MASK_XLEN(0xfffffffffffffffe)
ADD x17, x5, x21
sd x17, 1136(x6)

# Testcase 143:  rs1:x27(0xffffffffffffffff), rs2:x21(0xffffffffffffffff), result rd:x21(0xfffffffffffffffe)
li x27, MASK_XLEN(0xffffffffffffffff)
li x21, MASK_XLEN(0xffffffffffffffff)
ADD x21, x27, x21
sd x21, 1144(x6)

# Testcase 144:  rs1:x9(0x1d77ce4058d87776), rs2:x28(0x27896389df3277fd), result rd:x1(0x450131ca380aef73)
li x9, MASK_XLEN(0x1d77ce4058d87776)
li x28, MASK_XLEN(0x27896389df3277fd)
ADD x1, x9, x28
sd x1, 1152(x6)

# Testcase 145:  rs1:x9(0x0a68e88e0ad40415), rs2:x18(0xae55cdff34ab18fd), result rd:x11(0xb8beb68d3f7f1d12)
li x9, MASK_XLEN(0x0a68e88e0ad40415)
li x18, MASK_XLEN(0xae55cdff34ab18fd)
ADD x11, x9, x18
sd x11, 1160(x6)

# Testcase 146:  rs1:x30(0x5decc06af24dfdd8), rs2:x28(0x914591aef03d866a), result rd:x2(0xef325219e28b8442)
li x30, MASK_XLEN(0x5decc06af24dfdd8)
li x28, MASK_XLEN(0x914591aef03d866a)
ADD x2, x30, x28
sd x2, 1168(x6)

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
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-ADD.S
// Sean Wu (sywu@hmc.edu)
