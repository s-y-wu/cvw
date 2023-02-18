///////////////////////////////////////////
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-XOR.S
// Sean Wu (sywu@hmc.edu)
// Created 2023-02-18 01:00:53.333608//
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

# Testcase 0:  rs1:x22(0x0000000000000000), rs2:x11(0x0000000000000000), result rd:x7(0x0000000000000000)
li x22, MASK_XLEN(0x0000000000000000)
li x11, MASK_XLEN(0x0000000000000000)
XOR x7, x22, x11
sd x7, 0(x6)

# Testcase 1:  rs1:x14(0x0000000000000000), rs2:x17(0x0000000000000001), result rd:x17(0x0000000000000001)
li x14, MASK_XLEN(0x0000000000000000)
li x17, MASK_XLEN(0x0000000000000001)
XOR x17, x14, x17
sd x17, 8(x6)

# Testcase 2:  rs1:x4(0x0000000000000000), rs2:x18(0x0000000000000002), result rd:x4(0x0000000000000002)
li x4, MASK_XLEN(0x0000000000000000)
li x18, MASK_XLEN(0x0000000000000002)
XOR x4, x4, x18
sd x4, 16(x6)

# Testcase 3:  rs1:x23(0x0000000000000000), rs2:x30(0x00000000000000ff), result rd:x16(0x00000000000000ff)
li x23, MASK_XLEN(0x0000000000000000)
li x30, MASK_XLEN(0x00000000000000ff)
XOR x16, x23, x30
sd x16, 24(x6)

# Testcase 4:  rs1:x4(0x0000000000000000), rs2:x17(0x624b3e976c52dd14), result rd:x29(0x624b3e976c52dd14)
li x4, MASK_XLEN(0x0000000000000000)
li x17, MASK_XLEN(0x624b3e976c52dd14)
XOR x29, x4, x17
sd x29, 32(x6)

# Testcase 5:  rs1:x15(0x0000000000000000), rs2:x18(0x7ffffffffffffffe), result rd:x11(0x7ffffffffffffffe)
li x15, MASK_XLEN(0x0000000000000000)
li x18, MASK_XLEN(0x7ffffffffffffffe)
XOR x11, x15, x18
sd x11, 40(x6)

# Testcase 6:  rs1:x5(0x0000000000000000), rs2:x14(0x7fffffffffffffff), result rd:x9(0x7fffffffffffffff)
li x5, MASK_XLEN(0x0000000000000000)
li x14, MASK_XLEN(0x7fffffffffffffff)
XOR x9, x5, x14
sd x9, 48(x6)

# Testcase 7:  rs1:x13(0x0000000000000000), rs2:x3(0x8000000000000000), result rd:x19(0x8000000000000000)
li x13, MASK_XLEN(0x0000000000000000)
li x3, MASK_XLEN(0x8000000000000000)
XOR x19, x13, x3
sd x19, 56(x6)

# Testcase 8:  rs1:x17(0x0000000000000000), rs2:x11(0x8000000000000001), result rd:x27(0x8000000000000001)
li x17, MASK_XLEN(0x0000000000000000)
li x11, MASK_XLEN(0x8000000000000001)
XOR x27, x17, x11
sd x27, 64(x6)

# Testcase 9:  rs1:x27(0x0000000000000000), rs2:x28(0xc365ddeb9173ab42), result rd:x8(0xc365ddeb9173ab42)
li x27, MASK_XLEN(0x0000000000000000)
li x28, MASK_XLEN(0xc365ddeb9173ab42)
XOR x8, x27, x28
sd x8, 72(x6)

# Testcase 10:  rs1:x15(0x0000000000000000), rs2:x8(0xfffffffffffffffe), result rd:x12(0xfffffffffffffffe)
li x15, MASK_XLEN(0x0000000000000000)
li x8, MASK_XLEN(0xfffffffffffffffe)
XOR x12, x15, x8
sd x12, 80(x6)

# Testcase 11:  rs1:x16(0x0000000000000000), rs2:x25(0xffffffffffffffff), result rd:x30(0xffffffffffffffff)
li x16, MASK_XLEN(0x0000000000000000)
li x25, MASK_XLEN(0xffffffffffffffff)
XOR x30, x16, x25
sd x30, 88(x6)

# Testcase 12:  rs1:x14(0x0000000000000001), rs2:x1(0x0000000000000000), result rd:x15(0x0000000000000001)
li x14, MASK_XLEN(0x0000000000000001)
li x1, MASK_XLEN(0x0000000000000000)
XOR x15, x14, x1
sd x15, 96(x6)

# Testcase 13:  rs1:x24(0x0000000000000001), rs2:x29(0x0000000000000001), result rd:x1(0x0000000000000000)
li x24, MASK_XLEN(0x0000000000000001)
li x29, MASK_XLEN(0x0000000000000001)
XOR x1, x24, x29
sd x1, 104(x6)

# Testcase 14:  rs1:x18(0x0000000000000001), rs2:x13(0x0000000000000002), result rd:x31(0x0000000000000003)
li x18, MASK_XLEN(0x0000000000000001)
li x13, MASK_XLEN(0x0000000000000002)
XOR x31, x18, x13
sd x31, 112(x6)

# Testcase 15:  rs1:x8(0x0000000000000001), rs2:x14(0x00000000000000ff), result rd:x8(0x00000000000000fe)
li x8, MASK_XLEN(0x0000000000000001)
li x14, MASK_XLEN(0x00000000000000ff)
XOR x8, x8, x14
sd x8, 120(x6)

# Testcase 16:  rs1:x9(0x0000000000000001), rs2:x16(0x624b3e976c52dd14), result rd:x16(0x624b3e976c52dd15)
li x9, MASK_XLEN(0x0000000000000001)
li x16, MASK_XLEN(0x624b3e976c52dd14)
XOR x16, x9, x16
sd x16, 128(x6)

# Testcase 17:  rs1:x5(0x0000000000000001), rs2:x8(0x7ffffffffffffffe), result rd:x15(0x7fffffffffffffff)
li x5, MASK_XLEN(0x0000000000000001)
li x8, MASK_XLEN(0x7ffffffffffffffe)
XOR x15, x5, x8
sd x15, 136(x6)

# Testcase 18:  rs1:x10(0x0000000000000001), rs2:x12(0x7fffffffffffffff), result rd:x21(0x7ffffffffffffffe)
li x10, MASK_XLEN(0x0000000000000001)
li x12, MASK_XLEN(0x7fffffffffffffff)
XOR x21, x10, x12
sd x21, 144(x6)

# Testcase 19:  rs1:x16(0x0000000000000001), rs2:x20(0x8000000000000000), result rd:x30(0x8000000000000001)
li x16, MASK_XLEN(0x0000000000000001)
li x20, MASK_XLEN(0x8000000000000000)
XOR x30, x16, x20
sd x30, 152(x6)

# Testcase 20:  rs1:x30(0x0000000000000001), rs2:x5(0x8000000000000001), result rd:x27(0x8000000000000000)
li x30, MASK_XLEN(0x0000000000000001)
li x5, MASK_XLEN(0x8000000000000001)
XOR x27, x30, x5
sd x27, 160(x6)

# Testcase 21:  rs1:x17(0x0000000000000001), rs2:x22(0xc365ddeb9173ab42), result rd:x3(0xc365ddeb9173ab43)
li x17, MASK_XLEN(0x0000000000000001)
li x22, MASK_XLEN(0xc365ddeb9173ab42)
XOR x3, x17, x22
sd x3, 168(x6)

# Testcase 22:  rs1:x7(0x0000000000000001), rs2:x10(0xfffffffffffffffe), result rd:x30(0xffffffffffffffff)
li x7, MASK_XLEN(0x0000000000000001)
li x10, MASK_XLEN(0xfffffffffffffffe)
XOR x30, x7, x10
sd x30, 176(x6)

# Testcase 23:  rs1:x17(0x0000000000000001), rs2:x21(0xffffffffffffffff), result rd:x22(0xfffffffffffffffe)
li x17, MASK_XLEN(0x0000000000000001)
li x21, MASK_XLEN(0xffffffffffffffff)
XOR x22, x17, x21
sd x22, 184(x6)

# Testcase 24:  rs1:x4(0x0000000000000002), rs2:x31(0x0000000000000000), result rd:x2(0x0000000000000002)
li x4, MASK_XLEN(0x0000000000000002)
li x31, MASK_XLEN(0x0000000000000000)
XOR x2, x4, x31
sd x2, 192(x6)

# Testcase 25:  rs1:x5(0x0000000000000002), rs2:x11(0x0000000000000001), result rd:x2(0x0000000000000003)
li x5, MASK_XLEN(0x0000000000000002)
li x11, MASK_XLEN(0x0000000000000001)
XOR x2, x5, x11
sd x2, 200(x6)

# Testcase 26:  rs1:x11(0x0000000000000002), rs2:x28(0x0000000000000002), result rd:x20(0x0000000000000000)
li x11, MASK_XLEN(0x0000000000000002)
li x28, MASK_XLEN(0x0000000000000002)
XOR x20, x11, x28
sd x20, 208(x6)

# Testcase 27:  rs1:x29(0x0000000000000002), rs2:x15(0x00000000000000ff), result rd:x13(0x00000000000000fd)
li x29, MASK_XLEN(0x0000000000000002)
li x15, MASK_XLEN(0x00000000000000ff)
XOR x13, x29, x15
sd x13, 216(x6)

# Testcase 28:  rs1:x22(0x0000000000000002), rs2:x7(0x624b3e976c52dd14), result rd:x14(0x624b3e976c52dd16)
li x22, MASK_XLEN(0x0000000000000002)
li x7, MASK_XLEN(0x624b3e976c52dd14)
XOR x14, x22, x7
sd x14, 224(x6)

# Testcase 29:  rs1:x13(0x0000000000000002), rs2:x2(0x7ffffffffffffffe), result rd:x26(0x7ffffffffffffffc)
li x13, MASK_XLEN(0x0000000000000002)
li x2, MASK_XLEN(0x7ffffffffffffffe)
XOR x26, x13, x2
sd x26, 232(x6)

# Testcase 30:  rs1:x31(0x0000000000000002), rs2:x26(0x7fffffffffffffff), result rd:x25(0x7ffffffffffffffd)
li x31, MASK_XLEN(0x0000000000000002)
li x26, MASK_XLEN(0x7fffffffffffffff)
XOR x25, x31, x26
sd x25, 240(x6)

# Testcase 31:  rs1:x31(0x0000000000000002), rs2:x11(0x8000000000000000), result rd:x29(0x8000000000000002)
li x31, MASK_XLEN(0x0000000000000002)
li x11, MASK_XLEN(0x8000000000000000)
XOR x29, x31, x11
sd x29, 248(x6)

# Testcase 32:  rs1:x25(0x0000000000000002), rs2:x22(0x8000000000000001), result rd:x27(0x8000000000000003)
li x25, MASK_XLEN(0x0000000000000002)
li x22, MASK_XLEN(0x8000000000000001)
XOR x27, x25, x22
sd x27, 256(x6)

# Testcase 33:  rs1:x17(0x0000000000000002), rs2:x7(0xc365ddeb9173ab42), result rd:x24(0xc365ddeb9173ab40)
li x17, MASK_XLEN(0x0000000000000002)
li x7, MASK_XLEN(0xc365ddeb9173ab42)
XOR x24, x17, x7
sd x24, 264(x6)

# Testcase 34:  rs1:x30(0x0000000000000002), rs2:x18(0xfffffffffffffffe), result rd:x23(0xfffffffffffffffc)
li x30, MASK_XLEN(0x0000000000000002)
li x18, MASK_XLEN(0xfffffffffffffffe)
XOR x23, x30, x18
sd x23, 272(x6)

# Testcase 35:  rs1:x28(0x0000000000000002), rs2:x20(0xffffffffffffffff), result rd:x19(0xfffffffffffffffd)
li x28, MASK_XLEN(0x0000000000000002)
li x20, MASK_XLEN(0xffffffffffffffff)
XOR x19, x28, x20
sd x19, 280(x6)

# Testcase 36:  rs1:x14(0x00000000000000ff), rs2:x5(0x0000000000000000), result rd:x21(0x00000000000000ff)
li x14, MASK_XLEN(0x00000000000000ff)
li x5, MASK_XLEN(0x0000000000000000)
XOR x21, x14, x5
sd x21, 288(x6)

# Testcase 37:  rs1:x23(0x00000000000000ff), rs2:x20(0x0000000000000001), result rd:x16(0x00000000000000fe)
li x23, MASK_XLEN(0x00000000000000ff)
li x20, MASK_XLEN(0x0000000000000001)
XOR x16, x23, x20
sd x16, 296(x6)

# Testcase 38:  rs1:x29(0x00000000000000ff), rs2:x22(0x0000000000000002), result rd:x19(0x00000000000000fd)
li x29, MASK_XLEN(0x00000000000000ff)
li x22, MASK_XLEN(0x0000000000000002)
XOR x19, x29, x22
sd x19, 304(x6)

# Testcase 39:  rs1:x30(0x00000000000000ff), rs2:x7(0x00000000000000ff), result rd:x20(0x0000000000000000)
li x30, MASK_XLEN(0x00000000000000ff)
li x7, MASK_XLEN(0x00000000000000ff)
XOR x20, x30, x7
sd x20, 312(x6)

# Testcase 40:  rs1:x15(0x00000000000000ff), rs2:x2(0x624b3e976c52dd14), result rd:x8(0x624b3e976c52ddeb)
li x15, MASK_XLEN(0x00000000000000ff)
li x2, MASK_XLEN(0x624b3e976c52dd14)
XOR x8, x15, x2
sd x8, 320(x6)

# Testcase 41:  rs1:x16(0x00000000000000ff), rs2:x29(0x7ffffffffffffffe), result rd:x20(0x7fffffffffffff01)
li x16, MASK_XLEN(0x00000000000000ff)
li x29, MASK_XLEN(0x7ffffffffffffffe)
XOR x20, x16, x29
sd x20, 328(x6)

# Testcase 42:  rs1:x27(0x00000000000000ff), rs2:x11(0x7fffffffffffffff), result rd:x18(0x7fffffffffffff00)
li x27, MASK_XLEN(0x00000000000000ff)
li x11, MASK_XLEN(0x7fffffffffffffff)
XOR x18, x27, x11
sd x18, 336(x6)

# Testcase 43:  rs1:x24(0x00000000000000ff), rs2:x7(0x8000000000000000), result rd:x1(0x80000000000000ff)
li x24, MASK_XLEN(0x00000000000000ff)
li x7, MASK_XLEN(0x8000000000000000)
XOR x1, x24, x7
sd x1, 344(x6)

# Testcase 44:  rs1:x8(0x00000000000000ff), rs2:x15(0x8000000000000001), result rd:x28(0x80000000000000fe)
li x8, MASK_XLEN(0x00000000000000ff)
li x15, MASK_XLEN(0x8000000000000001)
XOR x28, x8, x15
sd x28, 352(x6)

# Testcase 45:  rs1:x22(0x00000000000000ff), rs2:x20(0xc365ddeb9173ab42), result rd:x8(0xc365ddeb9173abbd)
li x22, MASK_XLEN(0x00000000000000ff)
li x20, MASK_XLEN(0xc365ddeb9173ab42)
XOR x8, x22, x20
sd x8, 360(x6)

# Testcase 46:  rs1:x28(0x00000000000000ff), rs2:x31(0xfffffffffffffffe), result rd:x25(0xffffffffffffff01)
li x28, MASK_XLEN(0x00000000000000ff)
li x31, MASK_XLEN(0xfffffffffffffffe)
XOR x25, x28, x31
sd x25, 368(x6)

# Testcase 47:  rs1:x17(0x00000000000000ff), rs2:x14(0xffffffffffffffff), result rd:x30(0xffffffffffffff00)
li x17, MASK_XLEN(0x00000000000000ff)
li x14, MASK_XLEN(0xffffffffffffffff)
XOR x30, x17, x14
sd x30, 376(x6)

# Testcase 48:  rs1:x29(0x624b3e976c52dd14), rs2:x22(0x0000000000000000), result rd:x11(0x624b3e976c52dd14)
li x29, MASK_XLEN(0x624b3e976c52dd14)
li x22, MASK_XLEN(0x0000000000000000)
XOR x11, x29, x22
sd x11, 384(x6)

# Testcase 49:  rs1:x16(0x624b3e976c52dd14), rs2:x22(0x0000000000000001), result rd:x7(0x624b3e976c52dd15)
li x16, MASK_XLEN(0x624b3e976c52dd14)
li x22, MASK_XLEN(0x0000000000000001)
XOR x7, x16, x22
sd x7, 392(x6)

# Testcase 50:  rs1:x27(0x624b3e976c52dd14), rs2:x12(0x0000000000000002), result rd:x23(0x624b3e976c52dd16)
li x27, MASK_XLEN(0x624b3e976c52dd14)
li x12, MASK_XLEN(0x0000000000000002)
XOR x23, x27, x12
sd x23, 400(x6)

# Testcase 51:  rs1:x15(0x624b3e976c52dd14), rs2:x13(0x00000000000000ff), result rd:x15(0x624b3e976c52ddeb)
li x15, MASK_XLEN(0x624b3e976c52dd14)
li x13, MASK_XLEN(0x00000000000000ff)
XOR x15, x15, x13
sd x15, 408(x6)

# Testcase 52:  rs1:x22(0x624b3e976c52dd14), rs2:x11(0x624b3e976c52dd14), result rd:x28(0x0000000000000000)
li x22, MASK_XLEN(0x624b3e976c52dd14)
li x11, MASK_XLEN(0x624b3e976c52dd14)
XOR x28, x22, x11
sd x28, 416(x6)

# Testcase 53:  rs1:x15(0x624b3e976c52dd14), rs2:x3(0x7ffffffffffffffe), result rd:x5(0x1db4c16893ad22ea)
li x15, MASK_XLEN(0x624b3e976c52dd14)
li x3, MASK_XLEN(0x7ffffffffffffffe)
XOR x5, x15, x3
sd x5, 424(x6)

# Testcase 54:  rs1:x8(0x624b3e976c52dd14), rs2:x25(0x7fffffffffffffff), result rd:x4(0x1db4c16893ad22eb)
li x8, MASK_XLEN(0x624b3e976c52dd14)
li x25, MASK_XLEN(0x7fffffffffffffff)
XOR x4, x8, x25
sd x4, 432(x6)

# Testcase 55:  rs1:x25(0x624b3e976c52dd14), rs2:x5(0x8000000000000000), result rd:x31(0xe24b3e976c52dd14)
li x25, MASK_XLEN(0x624b3e976c52dd14)
li x5, MASK_XLEN(0x8000000000000000)
XOR x31, x25, x5
sd x31, 440(x6)

# Testcase 56:  rs1:x30(0x624b3e976c52dd14), rs2:x13(0x8000000000000001), result rd:x31(0xe24b3e976c52dd15)
li x30, MASK_XLEN(0x624b3e976c52dd14)
li x13, MASK_XLEN(0x8000000000000001)
XOR x31, x30, x13
sd x31, 448(x6)

# Testcase 57:  rs1:x15(0x624b3e976c52dd14), rs2:x23(0xc365ddeb9173ab42), result rd:x18(0xa12ee37cfd217656)
li x15, MASK_XLEN(0x624b3e976c52dd14)
li x23, MASK_XLEN(0xc365ddeb9173ab42)
XOR x18, x15, x23
sd x18, 456(x6)

# Testcase 58:  rs1:x7(0x624b3e976c52dd14), rs2:x29(0xfffffffffffffffe), result rd:x12(0x9db4c16893ad22ea)
li x7, MASK_XLEN(0x624b3e976c52dd14)
li x29, MASK_XLEN(0xfffffffffffffffe)
XOR x12, x7, x29
sd x12, 464(x6)

# Testcase 59:  rs1:x23(0x624b3e976c52dd14), rs2:x2(0xffffffffffffffff), result rd:x1(0x9db4c16893ad22eb)
li x23, MASK_XLEN(0x624b3e976c52dd14)
li x2, MASK_XLEN(0xffffffffffffffff)
XOR x1, x23, x2
sd x1, 472(x6)

# Testcase 60:  rs1:x13(0x7ffffffffffffffe), rs2:x7(0x0000000000000000), result rd:x3(0x7ffffffffffffffe)
li x13, MASK_XLEN(0x7ffffffffffffffe)
li x7, MASK_XLEN(0x0000000000000000)
XOR x3, x13, x7
sd x3, 480(x6)

# Testcase 61:  rs1:x28(0x7ffffffffffffffe), rs2:x14(0x0000000000000001), result rd:x19(0x7fffffffffffffff)
li x28, MASK_XLEN(0x7ffffffffffffffe)
li x14, MASK_XLEN(0x0000000000000001)
XOR x19, x28, x14
sd x19, 488(x6)

# Testcase 62:  rs1:x19(0x7ffffffffffffffe), rs2:x28(0x0000000000000002), result rd:x26(0x7ffffffffffffffc)
li x19, MASK_XLEN(0x7ffffffffffffffe)
li x28, MASK_XLEN(0x0000000000000002)
XOR x26, x19, x28
sd x26, 496(x6)

# Testcase 63:  rs1:x14(0x7ffffffffffffffe), rs2:x18(0x00000000000000ff), result rd:x7(0x7fffffffffffff01)
li x14, MASK_XLEN(0x7ffffffffffffffe)
li x18, MASK_XLEN(0x00000000000000ff)
XOR x7, x14, x18
sd x7, 504(x6)

# Testcase 64:  rs1:x21(0x7ffffffffffffffe), rs2:x1(0x624b3e976c52dd14), result rd:x31(0x1db4c16893ad22ea)
li x21, MASK_XLEN(0x7ffffffffffffffe)
li x1, MASK_XLEN(0x624b3e976c52dd14)
XOR x31, x21, x1
sd x31, 512(x6)

# Testcase 65:  rs1:x22(0x7ffffffffffffffe), rs2:x5(0x7ffffffffffffffe), result rd:x17(0x0000000000000000)
li x22, MASK_XLEN(0x7ffffffffffffffe)
li x5, MASK_XLEN(0x7ffffffffffffffe)
XOR x17, x22, x5
sd x17, 520(x6)

# Testcase 66:  rs1:x21(0x7ffffffffffffffe), rs2:x30(0x7fffffffffffffff), result rd:x16(0x0000000000000001)
li x21, MASK_XLEN(0x7ffffffffffffffe)
li x30, MASK_XLEN(0x7fffffffffffffff)
XOR x16, x21, x30
sd x16, 528(x6)

# Testcase 67:  rs1:x10(0x7ffffffffffffffe), rs2:x13(0x8000000000000000), result rd:x18(0xfffffffffffffffe)
li x10, MASK_XLEN(0x7ffffffffffffffe)
li x13, MASK_XLEN(0x8000000000000000)
XOR x18, x10, x13
sd x18, 536(x6)

# Testcase 68:  rs1:x18(0x7ffffffffffffffe), rs2:x3(0x8000000000000001), result rd:x3(0xffffffffffffffff)
li x18, MASK_XLEN(0x7ffffffffffffffe)
li x3, MASK_XLEN(0x8000000000000001)
XOR x3, x18, x3
sd x3, 544(x6)

# Testcase 69:  rs1:x20(0x7ffffffffffffffe), rs2:x24(0xc365ddeb9173ab42), result rd:x16(0xbc9a22146e8c54bc)
li x20, MASK_XLEN(0x7ffffffffffffffe)
li x24, MASK_XLEN(0xc365ddeb9173ab42)
XOR x16, x20, x24
sd x16, 552(x6)

# Testcase 70:  rs1:x25(0x7ffffffffffffffe), rs2:x1(0xfffffffffffffffe), result rd:x7(0x8000000000000000)
li x25, MASK_XLEN(0x7ffffffffffffffe)
li x1, MASK_XLEN(0xfffffffffffffffe)
XOR x7, x25, x1
sd x7, 560(x6)

# Testcase 71:  rs1:x14(0x7ffffffffffffffe), rs2:x20(0xffffffffffffffff), result rd:x25(0x8000000000000001)
li x14, MASK_XLEN(0x7ffffffffffffffe)
li x20, MASK_XLEN(0xffffffffffffffff)
XOR x25, x14, x20
sd x25, 568(x6)

# Testcase 72:  rs1:x12(0x7fffffffffffffff), rs2:x10(0x0000000000000000), result rd:x3(0x7fffffffffffffff)
li x12, MASK_XLEN(0x7fffffffffffffff)
li x10, MASK_XLEN(0x0000000000000000)
XOR x3, x12, x10
sd x3, 576(x6)

# Testcase 73:  rs1:x24(0x7fffffffffffffff), rs2:x1(0x0000000000000001), result rd:x25(0x7ffffffffffffffe)
li x24, MASK_XLEN(0x7fffffffffffffff)
li x1, MASK_XLEN(0x0000000000000001)
XOR x25, x24, x1
sd x25, 584(x6)

# Testcase 74:  rs1:x26(0x7fffffffffffffff), rs2:x8(0x0000000000000002), result rd:x20(0x7ffffffffffffffd)
li x26, MASK_XLEN(0x7fffffffffffffff)
li x8, MASK_XLEN(0x0000000000000002)
XOR x20, x26, x8
sd x20, 592(x6)

# Testcase 75:  rs1:x31(0x7fffffffffffffff), rs2:x28(0x00000000000000ff), result rd:x1(0x7fffffffffffff00)
li x31, MASK_XLEN(0x7fffffffffffffff)
li x28, MASK_XLEN(0x00000000000000ff)
XOR x1, x31, x28
sd x1, 600(x6)

# Testcase 76:  rs1:x19(0x7fffffffffffffff), rs2:x28(0x624b3e976c52dd14), result rd:x31(0x1db4c16893ad22eb)
li x19, MASK_XLEN(0x7fffffffffffffff)
li x28, MASK_XLEN(0x624b3e976c52dd14)
XOR x31, x19, x28
sd x31, 608(x6)

# Testcase 77:  rs1:x17(0x7fffffffffffffff), rs2:x12(0x7ffffffffffffffe), result rd:x5(0x0000000000000001)
li x17, MASK_XLEN(0x7fffffffffffffff)
li x12, MASK_XLEN(0x7ffffffffffffffe)
XOR x5, x17, x12
sd x5, 616(x6)

# Testcase 78:  rs1:x15(0x7fffffffffffffff), rs2:x9(0x7fffffffffffffff), result rd:x4(0x0000000000000000)
li x15, MASK_XLEN(0x7fffffffffffffff)
li x9, MASK_XLEN(0x7fffffffffffffff)
XOR x4, x15, x9
sd x4, 624(x6)

# Testcase 79:  rs1:x19(0x7fffffffffffffff), rs2:x15(0x8000000000000000), result rd:x9(0xffffffffffffffff)
li x19, MASK_XLEN(0x7fffffffffffffff)
li x15, MASK_XLEN(0x8000000000000000)
XOR x9, x19, x15
sd x9, 632(x6)

# Testcase 80:  rs1:x29(0x7fffffffffffffff), rs2:x27(0x8000000000000001), result rd:x8(0xfffffffffffffffe)
li x29, MASK_XLEN(0x7fffffffffffffff)
li x27, MASK_XLEN(0x8000000000000001)
XOR x8, x29, x27
sd x8, 640(x6)

# Testcase 81:  rs1:x17(0x7fffffffffffffff), rs2:x30(0xc365ddeb9173ab42), result rd:x11(0xbc9a22146e8c54bd)
li x17, MASK_XLEN(0x7fffffffffffffff)
li x30, MASK_XLEN(0xc365ddeb9173ab42)
XOR x11, x17, x30
sd x11, 648(x6)

# Testcase 82:  rs1:x8(0x7fffffffffffffff), rs2:x27(0xfffffffffffffffe), result rd:x19(0x8000000000000001)
li x8, MASK_XLEN(0x7fffffffffffffff)
li x27, MASK_XLEN(0xfffffffffffffffe)
XOR x19, x8, x27
sd x19, 656(x6)

# Testcase 83:  rs1:x9(0x7fffffffffffffff), rs2:x30(0xffffffffffffffff), result rd:x3(0x8000000000000000)
li x9, MASK_XLEN(0x7fffffffffffffff)
li x30, MASK_XLEN(0xffffffffffffffff)
XOR x3, x9, x30
sd x3, 664(x6)

# Testcase 84:  rs1:x2(0x8000000000000000), rs2:x5(0x0000000000000000), result rd:x11(0x8000000000000000)
li x2, MASK_XLEN(0x8000000000000000)
li x5, MASK_XLEN(0x0000000000000000)
XOR x11, x2, x5
sd x11, 672(x6)

# Testcase 85:  rs1:x21(0x8000000000000000), rs2:x19(0x0000000000000001), result rd:x19(0x8000000000000001)
li x21, MASK_XLEN(0x8000000000000000)
li x19, MASK_XLEN(0x0000000000000001)
XOR x19, x21, x19
sd x19, 680(x6)

# Testcase 86:  rs1:x16(0x8000000000000000), rs2:x3(0x0000000000000002), result rd:x31(0x8000000000000002)
li x16, MASK_XLEN(0x8000000000000000)
li x3, MASK_XLEN(0x0000000000000002)
XOR x31, x16, x3
sd x31, 688(x6)

# Testcase 87:  rs1:x17(0x8000000000000000), rs2:x16(0x00000000000000ff), result rd:x14(0x80000000000000ff)
li x17, MASK_XLEN(0x8000000000000000)
li x16, MASK_XLEN(0x00000000000000ff)
XOR x14, x17, x16
sd x14, 696(x6)

# Testcase 88:  rs1:x11(0x8000000000000000), rs2:x13(0x624b3e976c52dd14), result rd:x24(0xe24b3e976c52dd14)
li x11, MASK_XLEN(0x8000000000000000)
li x13, MASK_XLEN(0x624b3e976c52dd14)
XOR x24, x11, x13
sd x24, 704(x6)

# Testcase 89:  rs1:x28(0x8000000000000000), rs2:x1(0x7ffffffffffffffe), result rd:x4(0xfffffffffffffffe)
li x28, MASK_XLEN(0x8000000000000000)
li x1, MASK_XLEN(0x7ffffffffffffffe)
XOR x4, x28, x1
sd x4, 712(x6)

# Testcase 90:  rs1:x14(0x8000000000000000), rs2:x20(0x7fffffffffffffff), result rd:x22(0xffffffffffffffff)
li x14, MASK_XLEN(0x8000000000000000)
li x20, MASK_XLEN(0x7fffffffffffffff)
XOR x22, x14, x20
sd x22, 720(x6)

# Testcase 91:  rs1:x30(0x8000000000000000), rs2:x31(0x8000000000000000), result rd:x5(0x0000000000000000)
li x30, MASK_XLEN(0x8000000000000000)
li x31, MASK_XLEN(0x8000000000000000)
XOR x5, x30, x31
sd x5, 728(x6)

# Testcase 92:  rs1:x25(0x8000000000000000), rs2:x5(0x8000000000000001), result rd:x29(0x0000000000000001)
li x25, MASK_XLEN(0x8000000000000000)
li x5, MASK_XLEN(0x8000000000000001)
XOR x29, x25, x5
sd x29, 736(x6)

# Testcase 93:  rs1:x1(0x8000000000000000), rs2:x4(0xc365ddeb9173ab42), result rd:x23(0x4365ddeb9173ab42)
li x1, MASK_XLEN(0x8000000000000000)
li x4, MASK_XLEN(0xc365ddeb9173ab42)
XOR x23, x1, x4
sd x23, 744(x6)

# Testcase 94:  rs1:x14(0x8000000000000000), rs2:x8(0xfffffffffffffffe), result rd:x2(0x7ffffffffffffffe)
li x14, MASK_XLEN(0x8000000000000000)
li x8, MASK_XLEN(0xfffffffffffffffe)
XOR x2, x14, x8
sd x2, 752(x6)

# Testcase 95:  rs1:x21(0x8000000000000000), rs2:x9(0xffffffffffffffff), result rd:x9(0x7fffffffffffffff)
li x21, MASK_XLEN(0x8000000000000000)
li x9, MASK_XLEN(0xffffffffffffffff)
XOR x9, x21, x9
sd x9, 760(x6)

# Testcase 96:  rs1:x13(0x8000000000000001), rs2:x4(0x0000000000000000), result rd:x12(0x8000000000000001)
li x13, MASK_XLEN(0x8000000000000001)
li x4, MASK_XLEN(0x0000000000000000)
XOR x12, x13, x4
sd x12, 768(x6)

# Testcase 97:  rs1:x10(0x8000000000000001), rs2:x12(0x0000000000000001), result rd:x20(0x8000000000000000)
li x10, MASK_XLEN(0x8000000000000001)
li x12, MASK_XLEN(0x0000000000000001)
XOR x20, x10, x12
sd x20, 776(x6)

# Testcase 98:  rs1:x26(0x8000000000000001), rs2:x21(0x0000000000000002), result rd:x7(0x8000000000000003)
li x26, MASK_XLEN(0x8000000000000001)
li x21, MASK_XLEN(0x0000000000000002)
XOR x7, x26, x21
sd x7, 784(x6)

# Testcase 99:  rs1:x24(0x8000000000000001), rs2:x27(0x00000000000000ff), result rd:x18(0x80000000000000fe)
li x24, MASK_XLEN(0x8000000000000001)
li x27, MASK_XLEN(0x00000000000000ff)
XOR x18, x24, x27
sd x18, 792(x6)

# Testcase 100:  rs1:x18(0x8000000000000001), rs2:x2(0x624b3e976c52dd14), result rd:x11(0xe24b3e976c52dd15)
li x18, MASK_XLEN(0x8000000000000001)
li x2, MASK_XLEN(0x624b3e976c52dd14)
XOR x11, x18, x2
sd x11, 800(x6)

# Testcase 101:  rs1:x17(0x8000000000000001), rs2:x18(0x7ffffffffffffffe), result rd:x1(0xffffffffffffffff)
li x17, MASK_XLEN(0x8000000000000001)
li x18, MASK_XLEN(0x7ffffffffffffffe)
XOR x1, x17, x18
sd x1, 808(x6)

# Testcase 102:  rs1:x27(0x8000000000000001), rs2:x1(0x7fffffffffffffff), result rd:x21(0xfffffffffffffffe)
li x27, MASK_XLEN(0x8000000000000001)
li x1, MASK_XLEN(0x7fffffffffffffff)
XOR x21, x27, x1
sd x21, 816(x6)

# Testcase 103:  rs1:x28(0x8000000000000001), rs2:x9(0x8000000000000000), result rd:x11(0x0000000000000001)
li x28, MASK_XLEN(0x8000000000000001)
li x9, MASK_XLEN(0x8000000000000000)
XOR x11, x28, x9
sd x11, 824(x6)

# Testcase 104:  rs1:x5(0x8000000000000001), rs2:x12(0x8000000000000001), result rd:x4(0x0000000000000000)
li x5, MASK_XLEN(0x8000000000000001)
li x12, MASK_XLEN(0x8000000000000001)
XOR x4, x5, x12
sd x4, 832(x6)

# Testcase 105:  rs1:x20(0x8000000000000001), rs2:x18(0xc365ddeb9173ab42), result rd:x14(0x4365ddeb9173ab43)
li x20, MASK_XLEN(0x8000000000000001)
li x18, MASK_XLEN(0xc365ddeb9173ab42)
XOR x14, x20, x18
sd x14, 840(x6)

# Testcase 106:  rs1:x31(0x8000000000000001), rs2:x26(0xfffffffffffffffe), result rd:x25(0x7fffffffffffffff)
li x31, MASK_XLEN(0x8000000000000001)
li x26, MASK_XLEN(0xfffffffffffffffe)
XOR x25, x31, x26
sd x25, 848(x6)

# Testcase 107:  rs1:x3(0x8000000000000001), rs2:x9(0xffffffffffffffff), result rd:x19(0x7ffffffffffffffe)
li x3, MASK_XLEN(0x8000000000000001)
li x9, MASK_XLEN(0xffffffffffffffff)
XOR x19, x3, x9
sd x19, 856(x6)

# Testcase 108:  rs1:x4(0xc365ddeb9173ab42), rs2:x17(0x0000000000000000), result rd:x3(0xc365ddeb9173ab42)
li x4, MASK_XLEN(0xc365ddeb9173ab42)
li x17, MASK_XLEN(0x0000000000000000)
XOR x3, x4, x17
sd x3, 864(x6)

# Testcase 109:  rs1:x28(0xc365ddeb9173ab42), rs2:x19(0x0000000000000001), result rd:x5(0xc365ddeb9173ab43)
li x28, MASK_XLEN(0xc365ddeb9173ab42)
li x19, MASK_XLEN(0x0000000000000001)
XOR x5, x28, x19
sd x5, 872(x6)

# Testcase 110:  rs1:x16(0xc365ddeb9173ab42), rs2:x2(0x0000000000000002), result rd:x17(0xc365ddeb9173ab40)
li x16, MASK_XLEN(0xc365ddeb9173ab42)
li x2, MASK_XLEN(0x0000000000000002)
XOR x17, x16, x2
sd x17, 880(x6)

# Testcase 111:  rs1:x27(0xc365ddeb9173ab42), rs2:x26(0x00000000000000ff), result rd:x8(0xc365ddeb9173abbd)
li x27, MASK_XLEN(0xc365ddeb9173ab42)
li x26, MASK_XLEN(0x00000000000000ff)
XOR x8, x27, x26
sd x8, 888(x6)

# Testcase 112:  rs1:x12(0xc365ddeb9173ab42), rs2:x4(0x624b3e976c52dd14), result rd:x18(0xa12ee37cfd217656)
li x12, MASK_XLEN(0xc365ddeb9173ab42)
li x4, MASK_XLEN(0x624b3e976c52dd14)
XOR x18, x12, x4
sd x18, 896(x6)

# Testcase 113:  rs1:x27(0xc365ddeb9173ab42), rs2:x23(0x7ffffffffffffffe), result rd:x7(0xbc9a22146e8c54bc)
li x27, MASK_XLEN(0xc365ddeb9173ab42)
li x23, MASK_XLEN(0x7ffffffffffffffe)
XOR x7, x27, x23
sd x7, 904(x6)

# Testcase 114:  rs1:x31(0xc365ddeb9173ab42), rs2:x8(0x7fffffffffffffff), result rd:x13(0xbc9a22146e8c54bd)
li x31, MASK_XLEN(0xc365ddeb9173ab42)
li x8, MASK_XLEN(0x7fffffffffffffff)
XOR x13, x31, x8
sd x13, 912(x6)

# Testcase 115:  rs1:x7(0xc365ddeb9173ab42), rs2:x20(0x8000000000000000), result rd:x23(0x4365ddeb9173ab42)
li x7, MASK_XLEN(0xc365ddeb9173ab42)
li x20, MASK_XLEN(0x8000000000000000)
XOR x23, x7, x20
sd x23, 920(x6)

# Testcase 116:  rs1:x24(0xc365ddeb9173ab42), rs2:x15(0x8000000000000001), result rd:x12(0x4365ddeb9173ab43)
li x24, MASK_XLEN(0xc365ddeb9173ab42)
li x15, MASK_XLEN(0x8000000000000001)
XOR x12, x24, x15
sd x12, 928(x6)

# Testcase 117:  rs1:x29(0xc365ddeb9173ab42), rs2:x12(0xc365ddeb9173ab42), result rd:x18(0x0000000000000000)
li x29, MASK_XLEN(0xc365ddeb9173ab42)
li x12, MASK_XLEN(0xc365ddeb9173ab42)
XOR x18, x29, x12
sd x18, 936(x6)

# Testcase 118:  rs1:x28(0xc365ddeb9173ab42), rs2:x7(0xfffffffffffffffe), result rd:x7(0x3c9a22146e8c54bc)
li x28, MASK_XLEN(0xc365ddeb9173ab42)
li x7, MASK_XLEN(0xfffffffffffffffe)
XOR x7, x28, x7
sd x7, 944(x6)

# Testcase 119:  rs1:x15(0xc365ddeb9173ab42), rs2:x27(0xffffffffffffffff), result rd:x11(0x3c9a22146e8c54bd)
li x15, MASK_XLEN(0xc365ddeb9173ab42)
li x27, MASK_XLEN(0xffffffffffffffff)
XOR x11, x15, x27
sd x11, 952(x6)

# Testcase 120:  rs1:x5(0xfffffffffffffffe), rs2:x9(0x0000000000000000), result rd:x18(0xfffffffffffffffe)
li x5, MASK_XLEN(0xfffffffffffffffe)
li x9, MASK_XLEN(0x0000000000000000)
XOR x18, x5, x9
sd x18, 960(x6)

# Testcase 121:  rs1:x22(0xfffffffffffffffe), rs2:x25(0x0000000000000001), result rd:x25(0xffffffffffffffff)
li x22, MASK_XLEN(0xfffffffffffffffe)
li x25, MASK_XLEN(0x0000000000000001)
XOR x25, x22, x25
sd x25, 968(x6)

# Testcase 122:  rs1:x1(0xfffffffffffffffe), rs2:x3(0x0000000000000002), result rd:x22(0xfffffffffffffffc)
li x1, MASK_XLEN(0xfffffffffffffffe)
li x3, MASK_XLEN(0x0000000000000002)
XOR x22, x1, x3
sd x22, 976(x6)

# Testcase 123:  rs1:x27(0xfffffffffffffffe), rs2:x11(0x00000000000000ff), result rd:x10(0xffffffffffffff01)
li x27, MASK_XLEN(0xfffffffffffffffe)
li x11, MASK_XLEN(0x00000000000000ff)
XOR x10, x27, x11
sd x10, 984(x6)

# Testcase 124:  rs1:x28(0xfffffffffffffffe), rs2:x23(0x624b3e976c52dd14), result rd:x26(0x9db4c16893ad22ea)
li x28, MASK_XLEN(0xfffffffffffffffe)
li x23, MASK_XLEN(0x624b3e976c52dd14)
XOR x26, x28, x23
sd x26, 992(x6)

# Testcase 125:  rs1:x31(0xfffffffffffffffe), rs2:x11(0x7ffffffffffffffe), result rd:x2(0x8000000000000000)
li x31, MASK_XLEN(0xfffffffffffffffe)
li x11, MASK_XLEN(0x7ffffffffffffffe)
XOR x2, x31, x11
sd x2, 1000(x6)

# Testcase 126:  rs1:x3(0xfffffffffffffffe), rs2:x20(0x7fffffffffffffff), result rd:x1(0x8000000000000001)
li x3, MASK_XLEN(0xfffffffffffffffe)
li x20, MASK_XLEN(0x7fffffffffffffff)
XOR x1, x3, x20
sd x1, 1008(x6)

# Testcase 127:  rs1:x10(0xfffffffffffffffe), rs2:x26(0x8000000000000000), result rd:x4(0x7ffffffffffffffe)
li x10, MASK_XLEN(0xfffffffffffffffe)
li x26, MASK_XLEN(0x8000000000000000)
XOR x4, x10, x26
sd x4, 1016(x6)

# Testcase 128:  rs1:x7(0xfffffffffffffffe), rs2:x17(0x8000000000000001), result rd:x18(0x7fffffffffffffff)
li x7, MASK_XLEN(0xfffffffffffffffe)
li x17, MASK_XLEN(0x8000000000000001)
XOR x18, x7, x17
sd x18, 1024(x6)

# Testcase 129:  rs1:x12(0xfffffffffffffffe), rs2:x28(0xc365ddeb9173ab42), result rd:x15(0x3c9a22146e8c54bc)
li x12, MASK_XLEN(0xfffffffffffffffe)
li x28, MASK_XLEN(0xc365ddeb9173ab42)
XOR x15, x12, x28
sd x15, 1032(x6)

# Testcase 130:  rs1:x3(0xfffffffffffffffe), rs2:x14(0xfffffffffffffffe), result rd:x17(0x0000000000000000)
li x3, MASK_XLEN(0xfffffffffffffffe)
li x14, MASK_XLEN(0xfffffffffffffffe)
XOR x17, x3, x14
sd x17, 1040(x6)

# Testcase 131:  rs1:x18(0xfffffffffffffffe), rs2:x27(0xffffffffffffffff), result rd:x14(0x0000000000000001)
li x18, MASK_XLEN(0xfffffffffffffffe)
li x27, MASK_XLEN(0xffffffffffffffff)
XOR x14, x18, x27
sd x14, 1048(x6)

# Testcase 132:  rs1:x4(0xffffffffffffffff), rs2:x3(0x0000000000000000), result rd:x19(0xffffffffffffffff)
li x4, MASK_XLEN(0xffffffffffffffff)
li x3, MASK_XLEN(0x0000000000000000)
XOR x19, x4, x3
sd x19, 1056(x6)

# Testcase 133:  rs1:x10(0xffffffffffffffff), rs2:x8(0x0000000000000001), result rd:x21(0xfffffffffffffffe)
li x10, MASK_XLEN(0xffffffffffffffff)
li x8, MASK_XLEN(0x0000000000000001)
XOR x21, x10, x8
sd x21, 1064(x6)

# Testcase 134:  rs1:x14(0xffffffffffffffff), rs2:x22(0x0000000000000002), result rd:x23(0xfffffffffffffffd)
li x14, MASK_XLEN(0xffffffffffffffff)
li x22, MASK_XLEN(0x0000000000000002)
XOR x23, x14, x22
sd x23, 1072(x6)

# Testcase 135:  rs1:x10(0xffffffffffffffff), rs2:x2(0x00000000000000ff), result rd:x1(0xffffffffffffff00)
li x10, MASK_XLEN(0xffffffffffffffff)
li x2, MASK_XLEN(0x00000000000000ff)
XOR x1, x10, x2
sd x1, 1080(x6)

# Testcase 136:  rs1:x27(0xffffffffffffffff), rs2:x1(0x624b3e976c52dd14), result rd:x21(0x9db4c16893ad22eb)
li x27, MASK_XLEN(0xffffffffffffffff)
li x1, MASK_XLEN(0x624b3e976c52dd14)
XOR x21, x27, x1
sd x21, 1088(x6)

# Testcase 137:  rs1:x28(0xffffffffffffffff), rs2:x9(0x7ffffffffffffffe), result rd:x3(0x8000000000000001)
li x28, MASK_XLEN(0xffffffffffffffff)
li x9, MASK_XLEN(0x7ffffffffffffffe)
XOR x3, x28, x9
sd x3, 1096(x6)

# Testcase 138:  rs1:x28(0xffffffffffffffff), rs2:x22(0x7fffffffffffffff), result rd:x11(0x8000000000000000)
li x28, MASK_XLEN(0xffffffffffffffff)
li x22, MASK_XLEN(0x7fffffffffffffff)
XOR x11, x28, x22
sd x11, 1104(x6)

# Testcase 139:  rs1:x11(0xffffffffffffffff), rs2:x18(0x8000000000000000), result rd:x21(0x7fffffffffffffff)
li x11, MASK_XLEN(0xffffffffffffffff)
li x18, MASK_XLEN(0x8000000000000000)
XOR x21, x11, x18
sd x21, 1112(x6)

# Testcase 140:  rs1:x10(0xffffffffffffffff), rs2:x2(0x8000000000000001), result rd:x26(0x7ffffffffffffffe)
li x10, MASK_XLEN(0xffffffffffffffff)
li x2, MASK_XLEN(0x8000000000000001)
XOR x26, x10, x2
sd x26, 1120(x6)

# Testcase 141:  rs1:x23(0xffffffffffffffff), rs2:x8(0xc365ddeb9173ab42), result rd:x28(0x3c9a22146e8c54bd)
li x23, MASK_XLEN(0xffffffffffffffff)
li x8, MASK_XLEN(0xc365ddeb9173ab42)
XOR x28, x23, x8
sd x28, 1128(x6)

# Testcase 142:  rs1:x29(0xffffffffffffffff), rs2:x23(0xfffffffffffffffe), result rd:x17(0x0000000000000001)
li x29, MASK_XLEN(0xffffffffffffffff)
li x23, MASK_XLEN(0xfffffffffffffffe)
XOR x17, x29, x23
sd x17, 1136(x6)

# Testcase 143:  rs1:x5(0xffffffffffffffff), rs2:x9(0xffffffffffffffff), result rd:x20(0x0000000000000000)
li x5, MASK_XLEN(0xffffffffffffffff)
li x9, MASK_XLEN(0xffffffffffffffff)
XOR x20, x5, x9
sd x20, 1144(x6)

# Testcase 144:  rs1:x9(0xc9345ce70e5bc44c), rs2:x19(0x6b291a13637c3644), result rd:x8(0xa21d46f46d27f208)
li x9, MASK_XLEN(0xc9345ce70e5bc44c)
li x19, MASK_XLEN(0x6b291a13637c3644)
XOR x8, x9, x19
sd x8, 1152(x6)

# Testcase 145:  rs1:x26(0xf367dbe240e3469f), rs2:x18(0xe9184b9f501049e2), result rd:x16(0x1a7f907d10f30f7d)
li x26, MASK_XLEN(0xf367dbe240e3469f)
li x18, MASK_XLEN(0xe9184b9f501049e2)
XOR x16, x26, x18
sd x16, 1160(x6)

# Testcase 146:  rs1:x17(0x72e55360e3aeb12e), rs2:x2(0x1f7550bcb550f221), result rd:x8(0x6d9003dc56fe430f)
li x17, MASK_XLEN(0x72e55360e3aeb12e)
li x2, MASK_XLEN(0x1f7550bcb550f221)
XOR x8, x17, x2
sd x8, 1168(x6)

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
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-XOR.S
// Sean Wu (sywu@hmc.edu)
