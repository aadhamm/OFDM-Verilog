// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Symbol_Interleaver.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Symbol_Interleaver
// Source Path: whdlOFDMTx/Frame Generator/Data/Data Chain/Symbol Interleaver
// Hierarchy Level: 5
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Symbol_Interleaver
          (clk,
           reset,
           enb,
           data,
           valid,
           modTypeIndex,
           dataOut,
           validOut);


  input   clk;
  input   reset;
  input   enb;
  input   data;
  input   valid;
  input   [2:0] modTypeIndex;  // ufix3
  output  dataOut;
  output  validOut;


  wire serializer_PostProcessed;
  wire Split_Data_Into_Symbols_out2;
  wire Split_Data_Into_Symbols_out3;
  wire Split_Data_Into_Symbols_out4;
  wire Interleaver_out1;
  wire Interleaver_out4;


  whdlOFDMTx_Split_Data_Into_Symbols u_Split_Data_Into_Symbols (.clk(clk),
                                                                .reset(reset),
                                                                .enb(enb),
                                                                .data(data),
                                                                .valid(valid),
                                                                .modTypeIndex(modTypeIndex),  // ufix3
                                                                .dataOut(serializer_PostProcessed),
                                                                .startOut(Split_Data_Into_Symbols_out2),
                                                                .endOut(Split_Data_Into_Symbols_out3),
                                                                .validOut(Split_Data_Into_Symbols_out4)
                                                                );

  whdlOFDMTx_Interleaver u_Interleaver (.clk(clk),
                                        .reset(reset),
                                        .enb(enb),
                                        .dataIn(serializer_PostProcessed),
                                        .startIn(Split_Data_Into_Symbols_out2),
                                        .endIn(Split_Data_Into_Symbols_out3),
                                        .validIn(Split_Data_Into_Symbols_out4),
                                        .dataOut(Interleaver_out1),
                                        .validOut(Interleaver_out4)
                                        );

  assign dataOut = Interleaver_out1;

  assign validOut = Interleaver_out4;

endmodule  // whdlOFDMTx_Symbol_Interleaver

