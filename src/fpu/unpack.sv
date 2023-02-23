///////////////////////////////////////////
// unpack.sv
//
// Written: me@KatherineParry.com
// Modified: 7/5/2022
//
// Purpose: unpack X, Y, Z floating-point inputs
// 
// Documentation: RISC-V System on Chip Design Chapter 13
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

module unpack ( 
  input  logic [`FLEN-1:0]        X, Y, Z,              // inputs from register file
  input  logic [`FMTBITS-1:0]     Fmt,                  // format signal 00 - single 01 - double 11 - quad 10 - half
  input  logic                    XEn, YEn, ZEn,        // input enables
  output logic                    Xs, Ys, Zs,           // sign bits of XYZ
  output logic [`NE-1:0]          Xe, Ye, Ze,           // exponents of XYZ (converted to largest supported precision)
  output logic [`NF:0]            Xm, Ym, Zm,           // mantissas of XYZ (converted to largest supported precision)
  output logic                    XNaN, YNaN, ZNaN,     // is XYZ a NaN
  output logic                    XSNaN, YSNaN, ZSNaN,  // is XYZ a signaling NaN
  output logic                    XSubnorm,             // is X subnormal
  output logic                    XZero, YZero, ZZero,  // is XYZ zero
  output logic                    XInf, YInf, ZInf,     // is XYZ infinity
  output logic                    XExpMax,              // does X have the maximum exponent (NaN or Inf)
  output logic [`FLEN-1:0]        XPostBox              // X after being properly NaN-boxed
);

  logic XExpNonZero, YExpNonZero, ZExpNonZero;          // is the exponent of XYZ non-zero
  logic XFracZero, YFracZero, ZFracZero;                // is the fraction zero
  logic YExpMax, ZExpMax;                               // is the exponent all 1s
  
  unpackinput unpackinputX (.In(X), .Fmt, .Sgn(Xs), .Exp(Xe), .Man(Xm), .En(XEn),
                          .NaN(XNaN), .SNaN(XSNaN), .ExpNonZero(XExpNonZero),
                          .Zero(XZero), .Inf(XInf), .ExpMax(XExpMax), .FracZero(XFracZero), 
                          .Subnorm(XSubnorm), .PostBox(XPostBox));

  unpackinput unpackinputY (.In(Y), .Fmt, .Sgn(Ys), .Exp(Ye), .Man(Ym), .En(YEn),
                          .NaN(YNaN), .SNaN(YSNaN), .ExpNonZero(YExpNonZero),
                          .Zero(YZero), .Inf(YInf), .ExpMax(YExpMax), .FracZero(YFracZero), 
                          .Subnorm(), .PostBox());

  unpackinput unpackinputZ (.In(Z), .Fmt, .Sgn(Zs), .Exp(Ze), .Man(Zm), .En(ZEn),
                          .NaN(ZNaN), .SNaN(ZSNaN), .ExpNonZero(ZExpNonZero),
                          .Zero(ZZero), .Inf(ZInf), .ExpMax(ZExpMax), .FracZero(ZFracZero), 
                          .Subnorm(), .PostBox());
 
 endmodule