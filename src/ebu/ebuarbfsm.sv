///////////////////////////////////////////
// ebufsmarb
//
// Written: Ross Thompson ross1728@gmail.com
// Created: 23 January 2023
// Modified: 23 January 2023
//
// Purpose: Arbitrates requests from instruction and data streams
//          LSU has priority.
// 
// Documentation: RISC-V System on Chip Design Chapter 6 (Figures 6.25 and 6.26)
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

module ebufsmarb (
  input  logic 	     HCLK,
  input  logic 	     HRESETn,
  input  logic [2:0] HBURST,
 //  AHB burst length
  
  input  logic 	     HREADY,

  input  logic 	     LSUReq,
  input  logic 	     IFUReq,
  
  
  output logic 	     IFUSave,
  output logic 	     IFURestore,
  output logic 	     IFUDisable,
  output logic 	     IFUSelect,
  output logic 	     LSUDisable,
  output logic 	     LSUSelect);
  
  typedef enum 	     logic [1:0] {IDLE, ARBITRATE} statetype;
  statetype          CurrState, NextState;

  logic 	     both;                       // Both the LSU and IFU request at the same time
  logic 	     IFUReqD;                    // 1 cycle delayed IFU request. Part of arbitration
  logic 	     FinalBeat, FinalBeatD;      // Indicates the last beat of a burst
  logic 	     BeatCntEn;
  logic [4-1:0]      NextBeatCount, BeatCount;   // Position within a burst transfer
  logic 	     CntReset;
  logic [3:0] 	     Threshold;                  // Number of beats derived from HBURST

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  // Aribtration scheme
  // FSM decides if arbitration needed.  Arbitration is held until the last beat of
  // a burst is completed.
  ////////////////////////////////////////////////////////////////////////////////////////////////////

  assign both = LSUReq & IFUReq;
  flopenl #(.TYPE(statetype)) busreg(HCLK, ~HRESETn, 1'b1, NextState, IDLE, CurrState);
  always_comb 
    case (CurrState) 
      IDLE: if (both)                                           NextState = ARBITRATE; 
            else                                                NextState = IDLE;
      ARBITRATE: if (HREADY & FinalBeatD & ~(LSUReq & IFUReq))  NextState = IDLE;
                 else                                           NextState = ARBITRATE;
      default:                                                  NextState = IDLE;
    endcase

  // basic arb always selects LSU when both
  // replace this block for more sophisticated arbitration as needed.
  // Controller 0 (IFU)
  assign IFUSave = CurrState == IDLE & both;
  assign IFURestore = CurrState == ARBITRATE;
  assign IFUDisable = CurrState == ARBITRATE;
  assign IFUSelect = (NextState == ARBITRATE) ? 1'b0 : IFUReq;
  // Controller 1 (LSU)
  // When both the IFU and LSU request at the same time, the FSM will go into the arbitrate state.
  // Once the LSU request is done the fsm returns to IDLE.  To prevent the LSU from regaining
  // priority and re issuing the same memroy operation, the delayed IFUReqD squashes the LSU request.
  // This is necessary because the pipeline is stalled for the entire duration of both transactions,
  // and the LSU memory request will stil be active.
  flopr #(1) ifureqreg(HCLK, ~HRESETn, IFUReq, IFUReqD);
  assign LSUDisable = CurrState == ARBITRATE ? 1'b0 : (IFUReqD & ~(HREADY & FinalBeatD));
  assign LSUSelect = NextState == ARBITRATE ? 1'b1: LSUReq;

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  // Burst mode logic
  ////////////////////////////////////////////////////////////////////////////////////////////////////

  flopenr #(4) BeatCountReg(HCLK, ~HRESETn | CntReset | FinalBeat, BeatCntEn, NextBeatCount, BeatCount);  
  assign NextBeatCount = BeatCount + 1'b1;

  assign CntReset = NextState == IDLE;
  assign FinalBeat = (BeatCount == Threshold); // Detect when we are waiting on the final access.
  assign BeatCntEn = (NextState == ARBITRATE & HREADY);

  // Used to store data from data phase of AHB.
  flopenr #(1) FinalBeatReg(HCLK, ~HRESETn | CntReset, BeatCntEn, FinalBeat, FinalBeatD);

  // unlike the bus fsm in lsu/ifu, we need to derive the number of beats from HBURST.
  always_comb begin
    case(HBURST)
      0:        Threshold = 4'b0000;
      3:        Threshold = 4'b0011; // INCR4
      5:        Threshold = 4'b0111; // INCR8
      7:        Threshold = 4'b1111; // INCR16
      default:  Threshold = 4'b0000; // INCR without end.
    endcase
  end
endmodule
