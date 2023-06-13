// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Sample_Control_Bus_Creator.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Sample_Control_Bus_Creator
// Source Path: whdlOFDMTx/Frame Generator/Data/Data Chain/Create Control Bus/Sample Control Bus Creator
// Hierarchy Level: 6
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Sample_Control_Bus_Creator
          (In1,
           In2,
           In3,
           Out1_start,
           Out1_end,
           Out1_valid);


  input   In1;
  input   In2;
  input   In3;
  output  Out1_start;
  output  Out1_end;
  output  Out1_valid;




  assign Out1_start = In1;

  assign Out1_end = In2;

  assign Out1_valid = In3;

endmodule  // whdlOFDMTx_Sample_Control_Bus_Creator

