// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Generate_Ready2_block.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Generate_Ready2_block
// Source Path: whdlOFDMTx/Frame Generator/Header/Interleaver/Generate Ready/Generate Ready2
// Hierarchy Level: 6
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Generate_Ready2_block
          (fifoCount,
           pop,
           ready2);


  input   [2:0] fifoCount;  // ufix3
  input   pop;
  output  ready2;


  wire Compare_To_Constant1_out1;
  wire Compare_To_Constant4_out1;
  wire Logical_Operator14_out1;
  wire Logical_Operator1_out1;


  assign Compare_To_Constant1_out1 = fifoCount == 3'b000;



  assign Compare_To_Constant4_out1 = fifoCount == 3'b001;



  assign Logical_Operator14_out1 = Compare_To_Constant4_out1 & pop;



  assign Logical_Operator1_out1 = Compare_To_Constant1_out1 | Logical_Operator14_out1;



  assign ready2 = Logical_Operator1_out1;

endmodule  // whdlOFDMTx_Generate_Ready2_block

