///////////////////////////////////////////
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-SUB.S
// Sean Wu (sywu@hmc.edu)
// Created 2023-02-18 01:00:53.310811//
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

# Testcase 0:  rs1:x27(0x0000000000000000), rs2:x28(0x0000000000000000), result rd:x9(0x0000000000000000)
li x27, MASK_XLEN(0x0000000000000000)
li x28, MASK_XLEN(0x0000000000000000)
SUB x9, x27, x28
sd x9, 0(x6)

# Testcase 1:  rs1:x30(0x0000000000000000), rs2:x12(0x0000000000000001), result rd:x11(0xffffffffffffffff)
li x30, MASK_XLEN(0x0000000000000000)
li x12, MASK_XLEN(0x0000000000000001)
SUB x11, x30, x12
sd x11, 8(x6)

# Testcase 2:  rs1:x14(0x0000000000000000), rs2:x4(0x0000000000000002), result rd:x18(0xfffffffffffffffe)
li x14, MASK_XLEN(0x0000000000000000)
li x4, MASK_XLEN(0x0000000000000002)
SUB x18, x14, x4
sd x18, 16(x6)

# Testcase 3:  rs1:x29(0x0000000000000000), rs2:x10(0x00000000000000ff), result rd:x20(0xffffffffffffff01)
li x29, MASK_XLEN(0x0000000000000000)
li x10, MASK_XLEN(0x00000000000000ff)
SUB x20, x29, x10
sd x20, 24(x6)

# Testcase 4:  rs1:x18(0x0000000000000000), rs2:x26(0x624b3e976c52dd14), result rd:x7(0x9db4c16893ad22ec)
li x18, MASK_XLEN(0x0000000000000000)
li x26, MASK_XLEN(0x624b3e976c52dd14)
SUB x7, x18, x26
sd x7, 32(x6)

# Testcase 5:  rs1:x23(0x0000000000000000), rs2:x10(0x7ffffffffffffffe), result rd:x25(0x8000000000000002)
li x23, MASK_XLEN(0x0000000000000000)
li x10, MASK_XLEN(0x7ffffffffffffffe)
SUB x25, x23, x10
sd x25, 40(x6)

# Testcase 6:  rs1:x15(0x0000000000000000), rs2:x17(0x7fffffffffffffff), result rd:x20(0x8000000000000001)
li x15, MASK_XLEN(0x0000000000000000)
li x17, MASK_XLEN(0x7fffffffffffffff)
SUB x20, x15, x17
sd x20, 48(x6)

# Testcase 7:  rs1:x15(0x0000000000000000), rs2:x18(0x8000000000000000), result rd:x21(0x8000000000000000)
li x15, MASK_XLEN(0x0000000000000000)
li x18, MASK_XLEN(0x8000000000000000)
SUB x21, x15, x18
sd x21, 56(x6)

# Testcase 8:  rs1:x1(0x0000000000000000), rs2:x4(0x8000000000000001), result rd:x20(0x7fffffffffffffff)
li x1, MASK_XLEN(0x0000000000000000)
li x4, MASK_XLEN(0x8000000000000001)
SUB x20, x1, x4
sd x20, 64(x6)

# Testcase 9:  rs1:x26(0x0000000000000000), rs2:x23(0xc365ddeb9173ab42), result rd:x4(0x3c9a22146e8c54be)
li x26, MASK_XLEN(0x0000000000000000)
li x23, MASK_XLEN(0xc365ddeb9173ab42)
SUB x4, x26, x23
sd x4, 72(x6)

# Testcase 10:  rs1:x8(0x0000000000000000), rs2:x7(0xfffffffffffffffe), result rd:x10(0x0000000000000002)
li x8, MASK_XLEN(0x0000000000000000)
li x7, MASK_XLEN(0xfffffffffffffffe)
SUB x10, x8, x7
sd x10, 80(x6)

# Testcase 11:  rs1:x29(0x0000000000000000), rs2:x24(0xffffffffffffffff), result rd:x22(0x0000000000000001)
li x29, MASK_XLEN(0x0000000000000000)
li x24, MASK_XLEN(0xffffffffffffffff)
SUB x22, x29, x24
sd x22, 88(x6)

# Testcase 12:  rs1:x1(0x0000000000000001), rs2:x24(0x0000000000000000), result rd:x18(0x0000000000000001)
li x1, MASK_XLEN(0x0000000000000001)
li x24, MASK_XLEN(0x0000000000000000)
SUB x18, x1, x24
sd x18, 96(x6)

# Testcase 13:  rs1:x17(0x0000000000000001), rs2:x14(0x0000000000000001), result rd:x28(0x0000000000000000)
li x17, MASK_XLEN(0x0000000000000001)
li x14, MASK_XLEN(0x0000000000000001)
SUB x28, x17, x14
sd x28, 104(x6)

# Testcase 14:  rs1:x2(0x0000000000000001), rs2:x4(0x0000000000000002), result rd:x13(0xffffffffffffffff)
li x2, MASK_XLEN(0x0000000000000001)
li x4, MASK_XLEN(0x0000000000000002)
SUB x13, x2, x4
sd x13, 112(x6)

# Testcase 15:  rs1:x21(0x0000000000000001), rs2:x9(0x00000000000000ff), result rd:x4(0xffffffffffffff02)
li x21, MASK_XLEN(0x0000000000000001)
li x9, MASK_XLEN(0x00000000000000ff)
SUB x4, x21, x9
sd x4, 120(x6)

# Testcase 16:  rs1:x24(0x0000000000000001), rs2:x19(0x624b3e976c52dd14), result rd:x12(0x9db4c16893ad22ed)
li x24, MASK_XLEN(0x0000000000000001)
li x19, MASK_XLEN(0x624b3e976c52dd14)
SUB x12, x24, x19
sd x12, 128(x6)

# Testcase 17:  rs1:x8(0x0000000000000001), rs2:x22(0x7ffffffffffffffe), result rd:x23(0x8000000000000003)
li x8, MASK_XLEN(0x0000000000000001)
li x22, MASK_XLEN(0x7ffffffffffffffe)
SUB x23, x8, x22
sd x23, 136(x6)

# Testcase 18:  rs1:x23(0x0000000000000001), rs2:x18(0x7fffffffffffffff), result rd:x22(0x8000000000000002)
li x23, MASK_XLEN(0x0000000000000001)
li x18, MASK_XLEN(0x7fffffffffffffff)
SUB x22, x23, x18
sd x22, 144(x6)

# Testcase 19:  rs1:x10(0x0000000000000001), rs2:x8(0x8000000000000000), result rd:x24(0x8000000000000001)
li x10, MASK_XLEN(0x0000000000000001)
li x8, MASK_XLEN(0x8000000000000000)
SUB x24, x10, x8
sd x24, 152(x6)

# Testcase 20:  rs1:x27(0x0000000000000001), rs2:x29(0x8000000000000001), result rd:x8(0x8000000000000000)
li x27, MASK_XLEN(0x0000000000000001)
li x29, MASK_XLEN(0x8000000000000001)
SUB x8, x27, x29
sd x8, 160(x6)

# Testcase 21:  rs1:x3(0x0000000000000001), rs2:x17(0xc365ddeb9173ab42), result rd:x10(0x3c9a22146e8c54bf)
li x3, MASK_XLEN(0x0000000000000001)
li x17, MASK_XLEN(0xc365ddeb9173ab42)
SUB x10, x3, x17
sd x10, 168(x6)

# Testcase 22:  rs1:x22(0x0000000000000001), rs2:x11(0xfffffffffffffffe), result rd:x8(0x0000000000000003)
li x22, MASK_XLEN(0x0000000000000001)
li x11, MASK_XLEN(0xfffffffffffffffe)
SUB x8, x22, x11
sd x8, 176(x6)

# Testcase 23:  rs1:x12(0x0000000000000001), rs2:x21(0xffffffffffffffff), result rd:x16(0x0000000000000002)
li x12, MASK_XLEN(0x0000000000000001)
li x21, MASK_XLEN(0xffffffffffffffff)
SUB x16, x12, x21
sd x16, 184(x6)

# Testcase 24:  rs1:x5(0x0000000000000002), rs2:x26(0x0000000000000000), result rd:x1(0x0000000000000002)
li x5, MASK_XLEN(0x0000000000000002)
li x26, MASK_XLEN(0x0000000000000000)
SUB x1, x5, x26
sd x1, 192(x6)

# Testcase 25:  rs1:x18(0x0000000000000002), rs2:x17(0x0000000000000001), result rd:x11(0x0000000000000001)
li x18, MASK_XLEN(0x0000000000000002)
li x17, MASK_XLEN(0x0000000000000001)
SUB x11, x18, x17
sd x11, 200(x6)

# Testcase 26:  rs1:x12(0x0000000000000002), rs2:x19(0x0000000000000002), result rd:x21(0x0000000000000000)
li x12, MASK_XLEN(0x0000000000000002)
li x19, MASK_XLEN(0x0000000000000002)
SUB x21, x12, x19
sd x21, 208(x6)

# Testcase 27:  rs1:x1(0x0000000000000002), rs2:x26(0x00000000000000ff), result rd:x5(0xffffffffffffff03)
li x1, MASK_XLEN(0x0000000000000002)
li x26, MASK_XLEN(0x00000000000000ff)
SUB x5, x1, x26
sd x5, 216(x6)

# Testcase 28:  rs1:x29(0x0000000000000002), rs2:x13(0x624b3e976c52dd14), result rd:x5(0x9db4c16893ad22ee)
li x29, MASK_XLEN(0x0000000000000002)
li x13, MASK_XLEN(0x624b3e976c52dd14)
SUB x5, x29, x13
sd x5, 224(x6)

# Testcase 29:  rs1:x5(0x0000000000000002), rs2:x25(0x7ffffffffffffffe), result rd:x7(0x8000000000000004)
li x5, MASK_XLEN(0x0000000000000002)
li x25, MASK_XLEN(0x7ffffffffffffffe)
SUB x7, x5, x25
sd x7, 232(x6)

# Testcase 30:  rs1:x26(0x0000000000000002), rs2:x30(0x7fffffffffffffff), result rd:x25(0x8000000000000003)
li x26, MASK_XLEN(0x0000000000000002)
li x30, MASK_XLEN(0x7fffffffffffffff)
SUB x25, x26, x30
sd x25, 240(x6)

# Testcase 31:  rs1:x16(0x0000000000000002), rs2:x19(0x8000000000000000), result rd:x25(0x8000000000000002)
li x16, MASK_XLEN(0x0000000000000002)
li x19, MASK_XLEN(0x8000000000000000)
SUB x25, x16, x19
sd x25, 248(x6)

# Testcase 32:  rs1:x23(0x0000000000000002), rs2:x7(0x8000000000000001), result rd:x8(0x8000000000000001)
li x23, MASK_XLEN(0x0000000000000002)
li x7, MASK_XLEN(0x8000000000000001)
SUB x8, x23, x7
sd x8, 256(x6)

# Testcase 33:  rs1:x24(0x0000000000000002), rs2:x5(0xc365ddeb9173ab42), result rd:x27(0x3c9a22146e8c54c0)
li x24, MASK_XLEN(0x0000000000000002)
li x5, MASK_XLEN(0xc365ddeb9173ab42)
SUB x27, x24, x5
sd x27, 264(x6)

# Testcase 34:  rs1:x8(0x0000000000000002), rs2:x25(0xfffffffffffffffe), result rd:x13(0x0000000000000004)
li x8, MASK_XLEN(0x0000000000000002)
li x25, MASK_XLEN(0xfffffffffffffffe)
SUB x13, x8, x25
sd x13, 272(x6)

# Testcase 35:  rs1:x12(0x0000000000000002), rs2:x20(0xffffffffffffffff), result rd:x19(0x0000000000000003)
li x12, MASK_XLEN(0x0000000000000002)
li x20, MASK_XLEN(0xffffffffffffffff)
SUB x19, x12, x20
sd x19, 280(x6)

# Testcase 36:  rs1:x5(0x00000000000000ff), rs2:x21(0x0000000000000000), result rd:x16(0x00000000000000ff)
li x5, MASK_XLEN(0x00000000000000ff)
li x21, MASK_XLEN(0x0000000000000000)
SUB x16, x5, x21
sd x16, 288(x6)

# Testcase 37:  rs1:x29(0x00000000000000ff), rs2:x30(0x0000000000000001), result rd:x4(0x00000000000000fe)
li x29, MASK_XLEN(0x00000000000000ff)
li x30, MASK_XLEN(0x0000000000000001)
SUB x4, x29, x30
sd x4, 296(x6)

# Testcase 38:  rs1:x20(0x00000000000000ff), rs2:x27(0x0000000000000002), result rd:x1(0x00000000000000fd)
li x20, MASK_XLEN(0x00000000000000ff)
li x27, MASK_XLEN(0x0000000000000002)
SUB x1, x20, x27
sd x1, 304(x6)

# Testcase 39:  rs1:x17(0x00000000000000ff), rs2:x20(0x00000000000000ff), result rd:x12(0x0000000000000000)
li x17, MASK_XLEN(0x00000000000000ff)
li x20, MASK_XLEN(0x00000000000000ff)
SUB x12, x17, x20
sd x12, 312(x6)

# Testcase 40:  rs1:x16(0x00000000000000ff), rs2:x15(0x624b3e976c52dd14), result rd:x10(0x9db4c16893ad23eb)
li x16, MASK_XLEN(0x00000000000000ff)
li x15, MASK_XLEN(0x624b3e976c52dd14)
SUB x10, x16, x15
sd x10, 320(x6)

# Testcase 41:  rs1:x1(0x00000000000000ff), rs2:x31(0x7ffffffffffffffe), result rd:x8(0x8000000000000101)
li x1, MASK_XLEN(0x00000000000000ff)
li x31, MASK_XLEN(0x7ffffffffffffffe)
SUB x8, x1, x31
sd x8, 328(x6)

# Testcase 42:  rs1:x22(0x00000000000000ff), rs2:x29(0x7fffffffffffffff), result rd:x16(0x8000000000000100)
li x22, MASK_XLEN(0x00000000000000ff)
li x29, MASK_XLEN(0x7fffffffffffffff)
SUB x16, x22, x29
sd x16, 336(x6)

# Testcase 43:  rs1:x26(0x00000000000000ff), rs2:x31(0x8000000000000000), result rd:x24(0x80000000000000ff)
li x26, MASK_XLEN(0x00000000000000ff)
li x31, MASK_XLEN(0x8000000000000000)
SUB x24, x26, x31
sd x24, 344(x6)

# Testcase 44:  rs1:x16(0x00000000000000ff), rs2:x18(0x8000000000000001), result rd:x11(0x80000000000000fe)
li x16, MASK_XLEN(0x00000000000000ff)
li x18, MASK_XLEN(0x8000000000000001)
SUB x11, x16, x18
sd x11, 352(x6)

# Testcase 45:  rs1:x23(0x00000000000000ff), rs2:x28(0xc365ddeb9173ab42), result rd:x3(0x3c9a22146e8c55bd)
li x23, MASK_XLEN(0x00000000000000ff)
li x28, MASK_XLEN(0xc365ddeb9173ab42)
SUB x3, x23, x28
sd x3, 360(x6)

# Testcase 46:  rs1:x9(0x00000000000000ff), rs2:x5(0xfffffffffffffffe), result rd:x20(0x0000000000000101)
li x9, MASK_XLEN(0x00000000000000ff)
li x5, MASK_XLEN(0xfffffffffffffffe)
SUB x20, x9, x5
sd x20, 368(x6)

# Testcase 47:  rs1:x13(0x00000000000000ff), rs2:x23(0xffffffffffffffff), result rd:x7(0x0000000000000100)
li x13, MASK_XLEN(0x00000000000000ff)
li x23, MASK_XLEN(0xffffffffffffffff)
SUB x7, x13, x23
sd x7, 376(x6)

# Testcase 48:  rs1:x27(0x624b3e976c52dd14), rs2:x11(0x0000000000000000), result rd:x26(0x624b3e976c52dd14)
li x27, MASK_XLEN(0x624b3e976c52dd14)
li x11, MASK_XLEN(0x0000000000000000)
SUB x26, x27, x11
sd x26, 384(x6)

# Testcase 49:  rs1:x10(0x624b3e976c52dd14), rs2:x13(0x0000000000000001), result rd:x31(0x624b3e976c52dd13)
li x10, MASK_XLEN(0x624b3e976c52dd14)
li x13, MASK_XLEN(0x0000000000000001)
SUB x31, x10, x13
sd x31, 392(x6)

# Testcase 50:  rs1:x2(0x624b3e976c52dd14), rs2:x7(0x0000000000000002), result rd:x2(0x624b3e976c52dd12)
li x2, MASK_XLEN(0x624b3e976c52dd14)
li x7, MASK_XLEN(0x0000000000000002)
SUB x2, x2, x7
sd x2, 400(x6)

# Testcase 51:  rs1:x11(0x624b3e976c52dd14), rs2:x24(0x00000000000000ff), result rd:x24(0x624b3e976c52dc15)
li x11, MASK_XLEN(0x624b3e976c52dd14)
li x24, MASK_XLEN(0x00000000000000ff)
SUB x24, x11, x24
sd x24, 408(x6)

# Testcase 52:  rs1:x31(0x624b3e976c52dd14), rs2:x8(0x624b3e976c52dd14), result rd:x11(0x0000000000000000)
li x31, MASK_XLEN(0x624b3e976c52dd14)
li x8, MASK_XLEN(0x624b3e976c52dd14)
SUB x11, x31, x8
sd x11, 416(x6)

# Testcase 53:  rs1:x28(0x624b3e976c52dd14), rs2:x15(0x7ffffffffffffffe), result rd:x22(0xe24b3e976c52dd16)
li x28, MASK_XLEN(0x624b3e976c52dd14)
li x15, MASK_XLEN(0x7ffffffffffffffe)
SUB x22, x28, x15
sd x22, 424(x6)

# Testcase 54:  rs1:x24(0x624b3e976c52dd14), rs2:x22(0x7fffffffffffffff), result rd:x22(0xe24b3e976c52dd15)
li x24, MASK_XLEN(0x624b3e976c52dd14)
li x22, MASK_XLEN(0x7fffffffffffffff)
SUB x22, x24, x22
sd x22, 432(x6)

# Testcase 55:  rs1:x8(0x624b3e976c52dd14), rs2:x9(0x8000000000000000), result rd:x12(0xe24b3e976c52dd14)
li x8, MASK_XLEN(0x624b3e976c52dd14)
li x9, MASK_XLEN(0x8000000000000000)
SUB x12, x8, x9
sd x12, 440(x6)

# Testcase 56:  rs1:x1(0x624b3e976c52dd14), rs2:x12(0x8000000000000001), result rd:x19(0xe24b3e976c52dd13)
li x1, MASK_XLEN(0x624b3e976c52dd14)
li x12, MASK_XLEN(0x8000000000000001)
SUB x19, x1, x12
sd x19, 448(x6)

# Testcase 57:  rs1:x18(0x624b3e976c52dd14), rs2:x2(0xc365ddeb9173ab42), result rd:x24(0x9ee560abdadf31d2)
li x18, MASK_XLEN(0x624b3e976c52dd14)
li x2, MASK_XLEN(0xc365ddeb9173ab42)
SUB x24, x18, x2
sd x24, 456(x6)

# Testcase 58:  rs1:x21(0x624b3e976c52dd14), rs2:x5(0xfffffffffffffffe), result rd:x12(0x624b3e976c52dd16)
li x21, MASK_XLEN(0x624b3e976c52dd14)
li x5, MASK_XLEN(0xfffffffffffffffe)
SUB x12, x21, x5
sd x12, 464(x6)

# Testcase 59:  rs1:x1(0x624b3e976c52dd14), rs2:x16(0xffffffffffffffff), result rd:x21(0x624b3e976c52dd15)
li x1, MASK_XLEN(0x624b3e976c52dd14)
li x16, MASK_XLEN(0xffffffffffffffff)
SUB x21, x1, x16
sd x21, 472(x6)

# Testcase 60:  rs1:x2(0x7ffffffffffffffe), rs2:x1(0x0000000000000000), result rd:x8(0x7ffffffffffffffe)
li x2, MASK_XLEN(0x7ffffffffffffffe)
li x1, MASK_XLEN(0x0000000000000000)
SUB x8, x2, x1
sd x8, 480(x6)

# Testcase 61:  rs1:x2(0x7ffffffffffffffe), rs2:x1(0x0000000000000001), result rd:x8(0x7ffffffffffffffd)
li x2, MASK_XLEN(0x7ffffffffffffffe)
li x1, MASK_XLEN(0x0000000000000001)
SUB x8, x2, x1
sd x8, 488(x6)

# Testcase 62:  rs1:x31(0x7ffffffffffffffe), rs2:x21(0x0000000000000002), result rd:x11(0x7ffffffffffffffc)
li x31, MASK_XLEN(0x7ffffffffffffffe)
li x21, MASK_XLEN(0x0000000000000002)
SUB x11, x31, x21
sd x11, 496(x6)

# Testcase 63:  rs1:x3(0x7ffffffffffffffe), rs2:x27(0x00000000000000ff), result rd:x2(0x7ffffffffffffeff)
li x3, MASK_XLEN(0x7ffffffffffffffe)
li x27, MASK_XLEN(0x00000000000000ff)
SUB x2, x3, x27
sd x2, 504(x6)

# Testcase 64:  rs1:x12(0x7ffffffffffffffe), rs2:x22(0x624b3e976c52dd14), result rd:x14(0x1db4c16893ad22ea)
li x12, MASK_XLEN(0x7ffffffffffffffe)
li x22, MASK_XLEN(0x624b3e976c52dd14)
SUB x14, x12, x22
sd x14, 512(x6)

# Testcase 65:  rs1:x5(0x7ffffffffffffffe), rs2:x29(0x7ffffffffffffffe), result rd:x30(0x0000000000000000)
li x5, MASK_XLEN(0x7ffffffffffffffe)
li x29, MASK_XLEN(0x7ffffffffffffffe)
SUB x30, x5, x29
sd x30, 520(x6)

# Testcase 66:  rs1:x7(0x7ffffffffffffffe), rs2:x15(0x7fffffffffffffff), result rd:x14(0xffffffffffffffff)
li x7, MASK_XLEN(0x7ffffffffffffffe)
li x15, MASK_XLEN(0x7fffffffffffffff)
SUB x14, x7, x15
sd x14, 528(x6)

# Testcase 67:  rs1:x5(0x7ffffffffffffffe), rs2:x12(0x8000000000000000), result rd:x10(0xfffffffffffffffe)
li x5, MASK_XLEN(0x7ffffffffffffffe)
li x12, MASK_XLEN(0x8000000000000000)
SUB x10, x5, x12
sd x10, 536(x6)

# Testcase 68:  rs1:x24(0x7ffffffffffffffe), rs2:x26(0x8000000000000001), result rd:x24(0xfffffffffffffffd)
li x24, MASK_XLEN(0x7ffffffffffffffe)
li x26, MASK_XLEN(0x8000000000000001)
SUB x24, x24, x26
sd x24, 544(x6)

# Testcase 69:  rs1:x14(0x7ffffffffffffffe), rs2:x13(0xc365ddeb9173ab42), result rd:x1(0xbc9a22146e8c54bc)
li x14, MASK_XLEN(0x7ffffffffffffffe)
li x13, MASK_XLEN(0xc365ddeb9173ab42)
SUB x1, x14, x13
sd x1, 552(x6)

# Testcase 70:  rs1:x14(0x7ffffffffffffffe), rs2:x29(0xfffffffffffffffe), result rd:x9(0x8000000000000000)
li x14, MASK_XLEN(0x7ffffffffffffffe)
li x29, MASK_XLEN(0xfffffffffffffffe)
SUB x9, x14, x29
sd x9, 560(x6)

# Testcase 71:  rs1:x24(0x7ffffffffffffffe), rs2:x22(0xffffffffffffffff), result rd:x23(0x7fffffffffffffff)
li x24, MASK_XLEN(0x7ffffffffffffffe)
li x22, MASK_XLEN(0xffffffffffffffff)
SUB x23, x24, x22
sd x23, 568(x6)

# Testcase 72:  rs1:x15(0x7fffffffffffffff), rs2:x25(0x0000000000000000), result rd:x2(0x7fffffffffffffff)
li x15, MASK_XLEN(0x7fffffffffffffff)
li x25, MASK_XLEN(0x0000000000000000)
SUB x2, x15, x25
sd x2, 576(x6)

# Testcase 73:  rs1:x19(0x7fffffffffffffff), rs2:x30(0x0000000000000001), result rd:x4(0x7ffffffffffffffe)
li x19, MASK_XLEN(0x7fffffffffffffff)
li x30, MASK_XLEN(0x0000000000000001)
SUB x4, x19, x30
sd x4, 584(x6)

# Testcase 74:  rs1:x14(0x7fffffffffffffff), rs2:x31(0x0000000000000002), result rd:x13(0x7ffffffffffffffd)
li x14, MASK_XLEN(0x7fffffffffffffff)
li x31, MASK_XLEN(0x0000000000000002)
SUB x13, x14, x31
sd x13, 592(x6)

# Testcase 75:  rs1:x5(0x7fffffffffffffff), rs2:x20(0x00000000000000ff), result rd:x28(0x7fffffffffffff00)
li x5, MASK_XLEN(0x7fffffffffffffff)
li x20, MASK_XLEN(0x00000000000000ff)
SUB x28, x5, x20
sd x28, 600(x6)

# Testcase 76:  rs1:x22(0x7fffffffffffffff), rs2:x17(0x624b3e976c52dd14), result rd:x27(0x1db4c16893ad22eb)
li x22, MASK_XLEN(0x7fffffffffffffff)
li x17, MASK_XLEN(0x624b3e976c52dd14)
SUB x27, x22, x17
sd x27, 608(x6)

# Testcase 77:  rs1:x24(0x7fffffffffffffff), rs2:x23(0x7ffffffffffffffe), result rd:x5(0x0000000000000001)
li x24, MASK_XLEN(0x7fffffffffffffff)
li x23, MASK_XLEN(0x7ffffffffffffffe)
SUB x5, x24, x23
sd x5, 616(x6)

# Testcase 78:  rs1:x3(0x7fffffffffffffff), rs2:x11(0x7fffffffffffffff), result rd:x8(0x0000000000000000)
li x3, MASK_XLEN(0x7fffffffffffffff)
li x11, MASK_XLEN(0x7fffffffffffffff)
SUB x8, x3, x11
sd x8, 624(x6)

# Testcase 79:  rs1:x1(0x7fffffffffffffff), rs2:x31(0x8000000000000000), result rd:x26(0xffffffffffffffff)
li x1, MASK_XLEN(0x7fffffffffffffff)
li x31, MASK_XLEN(0x8000000000000000)
SUB x26, x1, x31
sd x26, 632(x6)

# Testcase 80:  rs1:x26(0x7fffffffffffffff), rs2:x27(0x8000000000000001), result rd:x22(0xfffffffffffffffe)
li x26, MASK_XLEN(0x7fffffffffffffff)
li x27, MASK_XLEN(0x8000000000000001)
SUB x22, x26, x27
sd x22, 640(x6)

# Testcase 81:  rs1:x3(0x7fffffffffffffff), rs2:x14(0xc365ddeb9173ab42), result rd:x30(0xbc9a22146e8c54bd)
li x3, MASK_XLEN(0x7fffffffffffffff)
li x14, MASK_XLEN(0xc365ddeb9173ab42)
SUB x30, x3, x14
sd x30, 648(x6)

# Testcase 82:  rs1:x28(0x7fffffffffffffff), rs2:x20(0xfffffffffffffffe), result rd:x4(0x8000000000000001)
li x28, MASK_XLEN(0x7fffffffffffffff)
li x20, MASK_XLEN(0xfffffffffffffffe)
SUB x4, x28, x20
sd x4, 656(x6)

# Testcase 83:  rs1:x20(0x7fffffffffffffff), rs2:x21(0xffffffffffffffff), result rd:x15(0x8000000000000000)
li x20, MASK_XLEN(0x7fffffffffffffff)
li x21, MASK_XLEN(0xffffffffffffffff)
SUB x15, x20, x21
sd x15, 664(x6)

# Testcase 84:  rs1:x23(0x8000000000000000), rs2:x5(0x0000000000000000), result rd:x20(0x8000000000000000)
li x23, MASK_XLEN(0x8000000000000000)
li x5, MASK_XLEN(0x0000000000000000)
SUB x20, x23, x5
sd x20, 672(x6)

# Testcase 85:  rs1:x20(0x8000000000000000), rs2:x2(0x0000000000000001), result rd:x9(0x7fffffffffffffff)
li x20, MASK_XLEN(0x8000000000000000)
li x2, MASK_XLEN(0x0000000000000001)
SUB x9, x20, x2
sd x9, 680(x6)

# Testcase 86:  rs1:x11(0x8000000000000000), rs2:x26(0x0000000000000002), result rd:x24(0x7ffffffffffffffe)
li x11, MASK_XLEN(0x8000000000000000)
li x26, MASK_XLEN(0x0000000000000002)
SUB x24, x11, x26
sd x24, 688(x6)

# Testcase 87:  rs1:x24(0x8000000000000000), rs2:x13(0x00000000000000ff), result rd:x1(0x7fffffffffffff01)
li x24, MASK_XLEN(0x8000000000000000)
li x13, MASK_XLEN(0x00000000000000ff)
SUB x1, x24, x13
sd x1, 696(x6)

# Testcase 88:  rs1:x21(0x8000000000000000), rs2:x30(0x624b3e976c52dd14), result rd:x29(0x1db4c16893ad22ec)
li x21, MASK_XLEN(0x8000000000000000)
li x30, MASK_XLEN(0x624b3e976c52dd14)
SUB x29, x21, x30
sd x29, 704(x6)

# Testcase 89:  rs1:x2(0x8000000000000000), rs2:x16(0x7ffffffffffffffe), result rd:x3(0x0000000000000002)
li x2, MASK_XLEN(0x8000000000000000)
li x16, MASK_XLEN(0x7ffffffffffffffe)
SUB x3, x2, x16
sd x3, 712(x6)

# Testcase 90:  rs1:x12(0x8000000000000000), rs2:x10(0x7fffffffffffffff), result rd:x22(0x0000000000000001)
li x12, MASK_XLEN(0x8000000000000000)
li x10, MASK_XLEN(0x7fffffffffffffff)
SUB x22, x12, x10
sd x22, 720(x6)

# Testcase 91:  rs1:x5(0x8000000000000000), rs2:x15(0x8000000000000000), result rd:x8(0x0000000000000000)
li x5, MASK_XLEN(0x8000000000000000)
li x15, MASK_XLEN(0x8000000000000000)
SUB x8, x5, x15
sd x8, 728(x6)

# Testcase 92:  rs1:x24(0x8000000000000000), rs2:x25(0x8000000000000001), result rd:x13(0xffffffffffffffff)
li x24, MASK_XLEN(0x8000000000000000)
li x25, MASK_XLEN(0x8000000000000001)
SUB x13, x24, x25
sd x13, 736(x6)

# Testcase 93:  rs1:x11(0x8000000000000000), rs2:x9(0xc365ddeb9173ab42), result rd:x26(0xbc9a22146e8c54be)
li x11, MASK_XLEN(0x8000000000000000)
li x9, MASK_XLEN(0xc365ddeb9173ab42)
SUB x26, x11, x9
sd x26, 744(x6)

# Testcase 94:  rs1:x16(0x8000000000000000), rs2:x31(0xfffffffffffffffe), result rd:x13(0x8000000000000002)
li x16, MASK_XLEN(0x8000000000000000)
li x31, MASK_XLEN(0xfffffffffffffffe)
SUB x13, x16, x31
sd x13, 752(x6)

# Testcase 95:  rs1:x1(0x8000000000000000), rs2:x10(0xffffffffffffffff), result rd:x17(0x8000000000000001)
li x1, MASK_XLEN(0x8000000000000000)
li x10, MASK_XLEN(0xffffffffffffffff)
SUB x17, x1, x10
sd x17, 760(x6)

# Testcase 96:  rs1:x29(0x8000000000000001), rs2:x10(0x0000000000000000), result rd:x18(0x8000000000000001)
li x29, MASK_XLEN(0x8000000000000001)
li x10, MASK_XLEN(0x0000000000000000)
SUB x18, x29, x10
sd x18, 768(x6)

# Testcase 97:  rs1:x16(0x8000000000000001), rs2:x2(0x0000000000000001), result rd:x25(0x8000000000000000)
li x16, MASK_XLEN(0x8000000000000001)
li x2, MASK_XLEN(0x0000000000000001)
SUB x25, x16, x2
sd x25, 776(x6)

# Testcase 98:  rs1:x18(0x8000000000000001), rs2:x19(0x0000000000000002), result rd:x18(0x7fffffffffffffff)
li x18, MASK_XLEN(0x8000000000000001)
li x19, MASK_XLEN(0x0000000000000002)
SUB x18, x18, x19
sd x18, 784(x6)

# Testcase 99:  rs1:x9(0x8000000000000001), rs2:x30(0x00000000000000ff), result rd:x22(0x7fffffffffffff02)
li x9, MASK_XLEN(0x8000000000000001)
li x30, MASK_XLEN(0x00000000000000ff)
SUB x22, x9, x30
sd x22, 792(x6)

# Testcase 100:  rs1:x2(0x8000000000000001), rs2:x15(0x624b3e976c52dd14), result rd:x13(0x1db4c16893ad22ed)
li x2, MASK_XLEN(0x8000000000000001)
li x15, MASK_XLEN(0x624b3e976c52dd14)
SUB x13, x2, x15
sd x13, 800(x6)

# Testcase 101:  rs1:x24(0x8000000000000001), rs2:x4(0x7ffffffffffffffe), result rd:x13(0x0000000000000003)
li x24, MASK_XLEN(0x8000000000000001)
li x4, MASK_XLEN(0x7ffffffffffffffe)
SUB x13, x24, x4
sd x13, 808(x6)

# Testcase 102:  rs1:x12(0x8000000000000001), rs2:x16(0x7fffffffffffffff), result rd:x2(0x0000000000000002)
li x12, MASK_XLEN(0x8000000000000001)
li x16, MASK_XLEN(0x7fffffffffffffff)
SUB x2, x12, x16
sd x2, 816(x6)

# Testcase 103:  rs1:x1(0x8000000000000001), rs2:x9(0x8000000000000000), result rd:x24(0x0000000000000001)
li x1, MASK_XLEN(0x8000000000000001)
li x9, MASK_XLEN(0x8000000000000000)
SUB x24, x1, x9
sd x24, 824(x6)

# Testcase 104:  rs1:x2(0x8000000000000001), rs2:x9(0x8000000000000001), result rd:x22(0x0000000000000000)
li x2, MASK_XLEN(0x8000000000000001)
li x9, MASK_XLEN(0x8000000000000001)
SUB x22, x2, x9
sd x22, 832(x6)

# Testcase 105:  rs1:x22(0x8000000000000001), rs2:x19(0xc365ddeb9173ab42), result rd:x23(0xbc9a22146e8c54bf)
li x22, MASK_XLEN(0x8000000000000001)
li x19, MASK_XLEN(0xc365ddeb9173ab42)
SUB x23, x22, x19
sd x23, 840(x6)

# Testcase 106:  rs1:x25(0x8000000000000001), rs2:x30(0xfffffffffffffffe), result rd:x10(0x8000000000000003)
li x25, MASK_XLEN(0x8000000000000001)
li x30, MASK_XLEN(0xfffffffffffffffe)
SUB x10, x25, x30
sd x10, 848(x6)

# Testcase 107:  rs1:x22(0x8000000000000001), rs2:x25(0xffffffffffffffff), result rd:x7(0x8000000000000002)
li x22, MASK_XLEN(0x8000000000000001)
li x25, MASK_XLEN(0xffffffffffffffff)
SUB x7, x22, x25
sd x7, 856(x6)

# Testcase 108:  rs1:x25(0xc365ddeb9173ab42), rs2:x17(0x0000000000000000), result rd:x17(0xc365ddeb9173ab42)
li x25, MASK_XLEN(0xc365ddeb9173ab42)
li x17, MASK_XLEN(0x0000000000000000)
SUB x17, x25, x17
sd x17, 864(x6)

# Testcase 109:  rs1:x11(0xc365ddeb9173ab42), rs2:x13(0x0000000000000001), result rd:x27(0xc365ddeb9173ab41)
li x11, MASK_XLEN(0xc365ddeb9173ab42)
li x13, MASK_XLEN(0x0000000000000001)
SUB x27, x11, x13
sd x27, 872(x6)

# Testcase 110:  rs1:x9(0xc365ddeb9173ab42), rs2:x7(0x0000000000000002), result rd:x4(0xc365ddeb9173ab40)
li x9, MASK_XLEN(0xc365ddeb9173ab42)
li x7, MASK_XLEN(0x0000000000000002)
SUB x4, x9, x7
sd x4, 880(x6)

# Testcase 111:  rs1:x19(0xc365ddeb9173ab42), rs2:x11(0x00000000000000ff), result rd:x26(0xc365ddeb9173aa43)
li x19, MASK_XLEN(0xc365ddeb9173ab42)
li x11, MASK_XLEN(0x00000000000000ff)
SUB x26, x19, x11
sd x26, 888(x6)

# Testcase 112:  rs1:x8(0xc365ddeb9173ab42), rs2:x19(0x624b3e976c52dd14), result rd:x22(0x611a9f542520ce2e)
li x8, MASK_XLEN(0xc365ddeb9173ab42)
li x19, MASK_XLEN(0x624b3e976c52dd14)
SUB x22, x8, x19
sd x22, 896(x6)

# Testcase 113:  rs1:x24(0xc365ddeb9173ab42), rs2:x18(0x7ffffffffffffffe), result rd:x22(0x4365ddeb9173ab44)
li x24, MASK_XLEN(0xc365ddeb9173ab42)
li x18, MASK_XLEN(0x7ffffffffffffffe)
SUB x22, x24, x18
sd x22, 904(x6)

# Testcase 114:  rs1:x30(0xc365ddeb9173ab42), rs2:x28(0x7fffffffffffffff), result rd:x29(0x4365ddeb9173ab43)
li x30, MASK_XLEN(0xc365ddeb9173ab42)
li x28, MASK_XLEN(0x7fffffffffffffff)
SUB x29, x30, x28
sd x29, 912(x6)

# Testcase 115:  rs1:x5(0xc365ddeb9173ab42), rs2:x11(0x8000000000000000), result rd:x28(0x4365ddeb9173ab42)
li x5, MASK_XLEN(0xc365ddeb9173ab42)
li x11, MASK_XLEN(0x8000000000000000)
SUB x28, x5, x11
sd x28, 920(x6)

# Testcase 116:  rs1:x24(0xc365ddeb9173ab42), rs2:x27(0x8000000000000001), result rd:x1(0x4365ddeb9173ab41)
li x24, MASK_XLEN(0xc365ddeb9173ab42)
li x27, MASK_XLEN(0x8000000000000001)
SUB x1, x24, x27
sd x1, 928(x6)

# Testcase 117:  rs1:x19(0xc365ddeb9173ab42), rs2:x27(0xc365ddeb9173ab42), result rd:x2(0x0000000000000000)
li x19, MASK_XLEN(0xc365ddeb9173ab42)
li x27, MASK_XLEN(0xc365ddeb9173ab42)
SUB x2, x19, x27
sd x2, 936(x6)

# Testcase 118:  rs1:x19(0xc365ddeb9173ab42), rs2:x5(0xfffffffffffffffe), result rd:x31(0xc365ddeb9173ab44)
li x19, MASK_XLEN(0xc365ddeb9173ab42)
li x5, MASK_XLEN(0xfffffffffffffffe)
SUB x31, x19, x5
sd x31, 944(x6)

# Testcase 119:  rs1:x21(0xc365ddeb9173ab42), rs2:x10(0xffffffffffffffff), result rd:x11(0xc365ddeb9173ab43)
li x21, MASK_XLEN(0xc365ddeb9173ab42)
li x10, MASK_XLEN(0xffffffffffffffff)
SUB x11, x21, x10
sd x11, 952(x6)

# Testcase 120:  rs1:x16(0xfffffffffffffffe), rs2:x26(0x0000000000000000), result rd:x13(0xfffffffffffffffe)
li x16, MASK_XLEN(0xfffffffffffffffe)
li x26, MASK_XLEN(0x0000000000000000)
SUB x13, x16, x26
sd x13, 960(x6)

# Testcase 121:  rs1:x1(0xfffffffffffffffe), rs2:x26(0x0000000000000001), result rd:x5(0xfffffffffffffffd)
li x1, MASK_XLEN(0xfffffffffffffffe)
li x26, MASK_XLEN(0x0000000000000001)
SUB x5, x1, x26
sd x5, 968(x6)

# Testcase 122:  rs1:x19(0xfffffffffffffffe), rs2:x2(0x0000000000000002), result rd:x15(0xfffffffffffffffc)
li x19, MASK_XLEN(0xfffffffffffffffe)
li x2, MASK_XLEN(0x0000000000000002)
SUB x15, x19, x2
sd x15, 976(x6)

# Testcase 123:  rs1:x5(0xfffffffffffffffe), rs2:x11(0x00000000000000ff), result rd:x30(0xfffffffffffffeff)
li x5, MASK_XLEN(0xfffffffffffffffe)
li x11, MASK_XLEN(0x00000000000000ff)
SUB x30, x5, x11
sd x30, 984(x6)

# Testcase 124:  rs1:x1(0xfffffffffffffffe), rs2:x31(0x624b3e976c52dd14), result rd:x24(0x9db4c16893ad22ea)
li x1, MASK_XLEN(0xfffffffffffffffe)
li x31, MASK_XLEN(0x624b3e976c52dd14)
SUB x24, x1, x31
sd x24, 992(x6)

# Testcase 125:  rs1:x16(0xfffffffffffffffe), rs2:x30(0x7ffffffffffffffe), result rd:x31(0x8000000000000000)
li x16, MASK_XLEN(0xfffffffffffffffe)
li x30, MASK_XLEN(0x7ffffffffffffffe)
SUB x31, x16, x30
sd x31, 1000(x6)

# Testcase 126:  rs1:x22(0xfffffffffffffffe), rs2:x27(0x7fffffffffffffff), result rd:x22(0x7fffffffffffffff)
li x22, MASK_XLEN(0xfffffffffffffffe)
li x27, MASK_XLEN(0x7fffffffffffffff)
SUB x22, x22, x27
sd x22, 1008(x6)

# Testcase 127:  rs1:x25(0xfffffffffffffffe), rs2:x9(0x8000000000000000), result rd:x24(0x7ffffffffffffffe)
li x25, MASK_XLEN(0xfffffffffffffffe)
li x9, MASK_XLEN(0x8000000000000000)
SUB x24, x25, x9
sd x24, 1016(x6)

# Testcase 128:  rs1:x20(0xfffffffffffffffe), rs2:x7(0x8000000000000001), result rd:x3(0x7ffffffffffffffd)
li x20, MASK_XLEN(0xfffffffffffffffe)
li x7, MASK_XLEN(0x8000000000000001)
SUB x3, x20, x7
sd x3, 1024(x6)

# Testcase 129:  rs1:x18(0xfffffffffffffffe), rs2:x30(0xc365ddeb9173ab42), result rd:x14(0x3c9a22146e8c54bc)
li x18, MASK_XLEN(0xfffffffffffffffe)
li x30, MASK_XLEN(0xc365ddeb9173ab42)
SUB x14, x18, x30
sd x14, 1032(x6)

# Testcase 130:  rs1:x9(0xfffffffffffffffe), rs2:x31(0xfffffffffffffffe), result rd:x27(0x0000000000000000)
li x9, MASK_XLEN(0xfffffffffffffffe)
li x31, MASK_XLEN(0xfffffffffffffffe)
SUB x27, x9, x31
sd x27, 1040(x6)

# Testcase 131:  rs1:x3(0xfffffffffffffffe), rs2:x22(0xffffffffffffffff), result rd:x21(0xffffffffffffffff)
li x3, MASK_XLEN(0xfffffffffffffffe)
li x22, MASK_XLEN(0xffffffffffffffff)
SUB x21, x3, x22
sd x21, 1048(x6)

# Testcase 132:  rs1:x31(0xffffffffffffffff), rs2:x17(0x0000000000000000), result rd:x21(0xffffffffffffffff)
li x31, MASK_XLEN(0xffffffffffffffff)
li x17, MASK_XLEN(0x0000000000000000)
SUB x21, x31, x17
sd x21, 1056(x6)

# Testcase 133:  rs1:x26(0xffffffffffffffff), rs2:x18(0x0000000000000001), result rd:x20(0xfffffffffffffffe)
li x26, MASK_XLEN(0xffffffffffffffff)
li x18, MASK_XLEN(0x0000000000000001)
SUB x20, x26, x18
sd x20, 1064(x6)

# Testcase 134:  rs1:x13(0xffffffffffffffff), rs2:x25(0x0000000000000002), result rd:x14(0xfffffffffffffffd)
li x13, MASK_XLEN(0xffffffffffffffff)
li x25, MASK_XLEN(0x0000000000000002)
SUB x14, x13, x25
sd x14, 1072(x6)

# Testcase 135:  rs1:x9(0xffffffffffffffff), rs2:x10(0x00000000000000ff), result rd:x10(0xffffffffffffff00)
li x9, MASK_XLEN(0xffffffffffffffff)
li x10, MASK_XLEN(0x00000000000000ff)
SUB x10, x9, x10
sd x10, 1080(x6)

# Testcase 136:  rs1:x1(0xffffffffffffffff), rs2:x14(0x624b3e976c52dd14), result rd:x25(0x9db4c16893ad22eb)
li x1, MASK_XLEN(0xffffffffffffffff)
li x14, MASK_XLEN(0x624b3e976c52dd14)
SUB x25, x1, x14
sd x25, 1088(x6)

# Testcase 137:  rs1:x27(0xffffffffffffffff), rs2:x23(0x7ffffffffffffffe), result rd:x9(0x8000000000000001)
li x27, MASK_XLEN(0xffffffffffffffff)
li x23, MASK_XLEN(0x7ffffffffffffffe)
SUB x9, x27, x23
sd x9, 1096(x6)

# Testcase 138:  rs1:x31(0xffffffffffffffff), rs2:x9(0x7fffffffffffffff), result rd:x18(0x8000000000000000)
li x31, MASK_XLEN(0xffffffffffffffff)
li x9, MASK_XLEN(0x7fffffffffffffff)
SUB x18, x31, x9
sd x18, 1104(x6)

# Testcase 139:  rs1:x17(0xffffffffffffffff), rs2:x18(0x8000000000000000), result rd:x11(0x7fffffffffffffff)
li x17, MASK_XLEN(0xffffffffffffffff)
li x18, MASK_XLEN(0x8000000000000000)
SUB x11, x17, x18
sd x11, 1112(x6)

# Testcase 140:  rs1:x11(0xffffffffffffffff), rs2:x7(0x8000000000000001), result rd:x23(0x7ffffffffffffffe)
li x11, MASK_XLEN(0xffffffffffffffff)
li x7, MASK_XLEN(0x8000000000000001)
SUB x23, x11, x7
sd x23, 1120(x6)

# Testcase 141:  rs1:x26(0xffffffffffffffff), rs2:x14(0xc365ddeb9173ab42), result rd:x26(0x3c9a22146e8c54bd)
li x26, MASK_XLEN(0xffffffffffffffff)
li x14, MASK_XLEN(0xc365ddeb9173ab42)
SUB x26, x26, x14
sd x26, 1128(x6)

# Testcase 142:  rs1:x5(0xffffffffffffffff), rs2:x28(0xfffffffffffffffe), result rd:x1(0x0000000000000001)
li x5, MASK_XLEN(0xffffffffffffffff)
li x28, MASK_XLEN(0xfffffffffffffffe)
SUB x1, x5, x28
sd x1, 1136(x6)

# Testcase 143:  rs1:x25(0xffffffffffffffff), rs2:x17(0xffffffffffffffff), result rd:x5(0x0000000000000000)
li x25, MASK_XLEN(0xffffffffffffffff)
li x17, MASK_XLEN(0xffffffffffffffff)
SUB x5, x25, x17
sd x5, 1144(x6)

# Testcase 144:  rs1:x26(0xa93fa902c8dec9ab), rs2:x19(0xec77cfc8b38e5adb), result rd:x13(0xbcc7d93a15506ed0)
li x26, MASK_XLEN(0xa93fa902c8dec9ab)
li x19, MASK_XLEN(0xec77cfc8b38e5adb)
SUB x13, x26, x19
sd x13, 1152(x6)

# Testcase 145:  rs1:x18(0x76d142d05c66a9bb), rs2:x30(0x094f7d5af313c0b0), result rd:x14(0x6d81c5756952e90b)
li x18, MASK_XLEN(0x76d142d05c66a9bb)
li x30, MASK_XLEN(0x094f7d5af313c0b0)
SUB x14, x18, x30
sd x14, 1160(x6)

# Testcase 146:  rs1:x25(0x9d37da5ca2fc7fe3), rs2:x8(0xcddb2316cc68fd3f), result rd:x29(0xcf5cb745d69382a4)
li x25, MASK_XLEN(0x9d37da5ca2fc7fe3)
li x8, MASK_XLEN(0xcddb2316cc68fd3f)
SUB x29, x25, x8
sd x29, 1168(x6)

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
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-SUB.S
// Sean Wu (sywu@hmc.edu)
