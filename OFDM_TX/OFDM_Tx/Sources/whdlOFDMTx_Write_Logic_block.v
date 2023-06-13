// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Write_Logic_block.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Write_Logic_block
// Source Path: whdlOFDMTx/Frame Generator/Header/Interleaver/Write Logic
// Hierarchy Level: 5
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Write_Logic_block
          (clk,
           reset,
           enb,
           start,
           valid,
           end_rsvd,
           wrAddr,
           wrValid,
           count,
           endOut,
           endReady);


  input   clk;
  input   reset;
  input   enb;
  input   start;
  input   valid;
  input   end_rsvd;
  output  [7:0] wrAddr;  // uint8
  output  wrValid;
  output  [6:0] count;  // ufix7
  output  endOut;
  output  endReady;


  wire Handle_Input_Control_Signals_out1;
  wire Handle_Input_Control_Signals_out2;
  wire Handle_Input_Control_Signals_out3;
  wire Handle_Input_Control_Signals_out4;
  wire [7:0] Generate_Write_Address_out1;  // uint8
  wire [6:0] Generate_Write_Address_out2;  // ufix7


  whdlOFDMTx_Handle_Input_Control_Signals_block u_Handle_Input_Control_Signals (.clk(clk),
                                                                                .reset(reset),
                                                                                .enb(enb),
                                                                                .start(start),
                                                                                .valid(valid),
                                                                                .end_rsvd(end_rsvd),
                                                                                .reset_1(Handle_Input_Control_Signals_out1),
                                                                                .countEnb(Handle_Input_Control_Signals_out2),
                                                                                .endOut(Handle_Input_Control_Signals_out3),
                                                                                .endReady(Handle_Input_Control_Signals_out4)
                                                                                );

  whdlOFDMTx_Generate_Write_Address_block u_Generate_Write_Address (.clk(clk),
                                                                    .reset(reset),
                                                                    .enb(enb),
                                                                    .rst(Handle_Input_Control_Signals_out1),
                                                                    .enb_1(Handle_Input_Control_Signals_out2),
                                                                    .end_rsvd(Handle_Input_Control_Signals_out3),
                                                                    .wrAddr(Generate_Write_Address_out1),  // uint8
                                                                    .count(Generate_Write_Address_out2)  // ufix7
                                                                    );

  assign wrAddr = Generate_Write_Address_out1;

  assign wrValid = Handle_Input_Control_Signals_out2;

  assign count = Generate_Write_Address_out2;

  assign endOut = Handle_Input_Control_Signals_out3;

  assign endReady = Handle_Input_Control_Signals_out4;

endmodule  // whdlOFDMTx_Write_Logic_block

