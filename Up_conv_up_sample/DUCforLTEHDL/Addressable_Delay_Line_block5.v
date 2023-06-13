// -------------------------------------------------------------
// 
// File Name: D:\OFDM\HDLImplementationOfDUCForLTEExample(Single Tone Output)\HDLImplementationOfDUCForLTEExample\hdlsrc\complex_upsampler\DUCforLTEHDL\Addressable_Delay_Line_block5.v
// Created: 2023-05-25 17:45:33
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Addressable_Delay_Line_block5
// Source Path: DUCforLTEHDL/HDL_DUC/Halfband Interpolator/DUCforLTEHDL/HDL_DUC/Halfband Interpolator/FIRFilter1/Addressable 
// Delay Lin
// Hierarchy Level: 3
// 
// Addressable Delay Line
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Addressable_Delay_Line_block5
          (clk,
           reset,
           enb,
           dataIn,
           wrEn,
           wrAddr,
           rdAddr,
           delayLineEnd,
           dataOut);


  input   clk;
  input   reset;
  input   enb;
  input   signed [17:0] dataIn;  // sfix18_En14
  input   wrEn;
  input   [2:0] wrAddr;  // ufix3
  input   [2:0] rdAddr;  // ufix3
  output  signed [17:0] delayLineEnd;  // sfix18_En14
  output  signed [17:0] dataOut;  // sfix18_En14


  wire relop_relop1;
  reg  dataEndEn;
  wire wrEnN;
  wire dataEndEnS;
  wire signed [17:0] delayedSignals;  // sfix18_En14
  reg signed [17:0] delayLineEnd_1;  // sfix18_En14


  assign relop_relop1 = wrAddr == rdAddr;



  always @(posedge clk or posedge reset)
    begin : dataOutReg_process
      if (reset == 1'b1) begin
        dataEndEn <= 1'b0;
      end
      else begin
        if (enb) begin
          dataEndEn <= relop_relop1;
        end
      end
    end



  assign wrEnN =  ~ dataEndEn;



  assign dataEndEnS = relop_relop1 & wrEnN;



  SimpleDualPortRAM_generic #(.AddrWidth(3),
                              .DataWidth(18)
                              )
                            u_simpleDualPortRam (.clk(clk),
                                                 .enb(enb),
                                                 .wr_din(dataIn),
                                                 .wr_addr(wrAddr),
                                                 .wr_en(wrEn),
                                                 .rd_addr(rdAddr),
                                                 .rd_dout(delayedSignals)
                                                 );

  always @(posedge clk or posedge reset)
    begin : dataOutReg_1_process
      if (reset == 1'b1) begin
        delayLineEnd_1 <= 18'sb000000000000000000;
      end
      else begin
        if (enb && dataEndEnS) begin
          delayLineEnd_1 <= delayedSignals;
        end
      end
    end



  assign dataOut = delayedSignals;

  assign delayLineEnd = delayLineEnd_1;

endmodule  // Addressable_Delay_Line_block5

