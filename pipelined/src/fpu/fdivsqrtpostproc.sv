///////////////////////////////////////////
// fdivsqrtpostproc.sv
//
// Written: David_Harris@hmc.edu, me@KatherineParry.com, Cedar Turek
// Modified:13 January 2022
//
// Purpose: Combined Divide and Square Root Floating Point and Integer Unit
// 
// A component of the Wally configurable RISC-V project.
// 
// Copyright (C) 2021 Harvey Mudd College & Oklahoma State University
//
// MIT LICENSE
// Permission is hereby granted, free of charge, to any person obtaining a copy of this 
// software and associated documentation files (the "Software"), to deal in the Software 
// without restriction, including without limitation the rights to use, copy, modify, merge, 
// publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons 
// to whom the Software is furnished to do so, subject to the following conditions:
//
//   The above copyright notice and this permission notice shall be included in all copies or 
//   substantial portions of the Software.
//
//   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
//   INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
//   PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS 
//   BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
//   TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE 
//   OR OTHER DEALINGS IN THE SOFTWARE.
////////////////////////////////////////////////////////////////////////////////////////////////

`include "wally-config.vh"

module fdivsqrtpostproc(
  input logic [`DIVb+3:0] WS, WC,
  input logic [`DIVN-2:0]  D, // U0.N-1
  input logic [`DIVb:0] FirstSM,
  input logic [`DIVb-1:0] FirstC,
  input logic [`DIVCOPIES-1:0] qn,
  input logic SqrtM,
  output logic WZero,
  output logic DivSM,
  output logic NegSticky
);
  
  logic [`DIVb+3:0] W;

  // check for early termination on an exact result.  If the result is not exact, the sticky should be set
  if (`RADIX == 2) begin
    logic [`DIVb+3:0] FZero;
    logic [`DIVb+2:0] FirstK;
    assign FirstK = ({3'b111, FirstC<<1} & ~({3'b111, FirstC<<1} << 1));
    assign FZero = SqrtM ? {FirstSM[`DIVb], FirstSM, 2'b0} | {FirstK,1'b0} : {3'b1,D,{`DIVb-`DIVN+2{1'b0}}};
    assign WZero = ((WS^WC)=={WS[`DIVb+2:0]|WC[`DIVb+2:0], 1'b0})|(((WS+WC+FZero)==0)&qn[`DIVCOPIES-1]);
  end else begin
    assign WZero = ((WS^WC)=={WS[`DIVb+2:0]|WC[`DIVb+2:0], 1'b0});
  end 
  assign DivSM = ~WZero;

  // Determine if sticky bit is negative
  assign W = WC+WS;
  assign NegSticky = W[`DIVb+3];

endmodule