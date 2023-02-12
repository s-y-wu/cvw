///////////////////////////////////////////
// datapath.sv
//
// Written: Ross Thompson
// email: ross1728@gmail.com
// Created: November 9, 2019
// Modified: March 04, 2021
//
// Purpose: Finds the current function or global assembly label based on PCE.
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

module FunctionName(reset, clk, ProgramAddrMapFile, ProgramLabelMapFile);
  
  input logic reset;
  input logic clk;
  input string ProgramAddrMapFile;
  input string ProgramLabelMapFile;

  logic [`XLEN-1:0] ProgramAddrMapMemory [];
  string 	    ProgramLabelMapMemory [integer];
  string 	    FunctionName;
  

  logic [`XLEN-1:0] PCF, PCD, PCE, FunctionAddr;
  logic 	    StallD, StallE, FlushD, FlushE;
  integer 	    ProgramAddrIndex, ProgramAddrIndexQ;

  assign PCF = testbench.dut.core.ifu.PCF;
  assign StallD = testbench.dut.core.StallD;
  assign StallE = testbench.dut.core.StallE;  
  assign FlushD = testbench.dut.core.FlushD;
  assign FlushE = testbench.dut.core.FlushE;

  // copy from ifu
  // when the F and D stages are flushed we need to ensure the PCE is held so that the function name does not
  // erroneously change.
  flopenrc #(`XLEN) PCDReg(clk, reset, 1'b0, ~StallD, FlushE & FlushD ? PCE : PCF, PCD);
  flopenr #(`XLEN) PCEReg(clk, reset, ~StallE, FlushE ? PCE : PCD, PCE);
  
  

  task automatic bin_search_min;
    input logic [`XLEN-1:0] pc;
    input logic [`XLEN-1:0] length;
    ref logic [`XLEN-1:0]   array [];
    output logic [`XLEN-1:0] minval;
    output     logic [`XLEN-1:0] mid;

    logic [`XLEN-1:0] 	     left, right;

    begin
      if ( pc == 0 ) begin
	// *** want to  keep the old value for mid and minval
	mid = 0;
	return;
      end
      left = 0;
      right = length;
      while (left <= right) begin
	mid = left + ((right - left) / 2);
	if (array[mid] == pc) begin
	  minval = array[mid];
	  return;
        end
	if (array[mid] < pc) begin
	  left = mid + 1;
	end else if( array[mid] > pc) begin
	  right = mid -1;
	end else begin
	  //$display("Critical Error in FunctionName. PC, %x not found.", pc);
	  return;
	  //$stop();
	end	  
      end // while (left <= right)
      // if the element pc is now found, right and left will be equal at this point.
      // we need to check if pc is less than the array at left or greather.
      // if it is less than pc, then we select left as the index.
      // if it is greather we want 1 less than left.
      if (array[left] < pc) begin
	minval = array[left];
	mid = left;      
	return;	    
      end else begin
	minval = array[left-1];
	mid = left - 1;	
	return;
      end
    end
  endtask // bin_search_min

  integer ProgramAddrMapFP, ProgramLabelMapFP;
  integer ProgramAddrMapLineCount, ProgramLabelMapLineCount;
  longint ProgramAddrMapLine;
  string  ProgramLabelMapLine;
  integer status;
  

  // preload
//  initial begin
  always @ (posedge reset) begin
    $readmemh(ProgramAddrMapFile, ProgramAddrMapMemory);
    // we need to count the number of lines in the file so we can set FunctionRadixLineCount.

    ProgramAddrMapLineCount = 0;
    ProgramAddrMapFP = $fopen(ProgramAddrMapFile, "r");

    // read line by line to count lines
    if (ProgramAddrMapFP) begin
      while (! $feof(ProgramAddrMapFP)) begin
	status = $fscanf(ProgramAddrMapFP, "%h\n", ProgramAddrMapLine);
	
	ProgramAddrMapLineCount = ProgramAddrMapLineCount + 1;
      end
    end else begin
      $display("Cannot open file %s for reading.", ProgramAddrMapFile);
    end
    $fclose(ProgramAddrMapFP);

    // ProgramIndexFile maps the program name to the compile index.
    // The compile index is then used to inditify the application
    // in the custom radix.
    // Build an associative array to convert the name to an index.
    ProgramLabelMapLineCount = 0;
    ProgramLabelMapFP = $fopen(ProgramLabelMapFile, "r");
    
    if (ProgramLabelMapFP) begin
      while (! $feof(ProgramLabelMapFP)) begin
	status = $fscanf(ProgramLabelMapFP, "%s\n", ProgramLabelMapLine);
	ProgramLabelMapMemory[ProgramLabelMapLineCount] = ProgramLabelMapLine;
	ProgramLabelMapLineCount = ProgramLabelMapLineCount + 1;
      end
    end else begin
      $display("Cannot open file %s for reading.", ProgramLabelMapFile);
    end
    $fclose(ProgramLabelMapFP);
    
  end

  always @(PCE) begin
    bin_search_min(PCE, ProgramAddrMapLineCount, ProgramAddrMapMemory, FunctionAddr, ProgramAddrIndex);
  end

  logic OrReducedAdr, AnyUnknown;
  assign OrReducedAdr = |ProgramAddrIndex;
  assign AnyUnknown = (OrReducedAdr === 1'bx) ? 1'b1 : 1'b0;
  initial ProgramAddrIndex = '0;

  assign FunctionName = AnyUnknown ? "Unknown!" : ProgramLabelMapMemory[ProgramAddrIndex];
  

endmodule // function_radix

