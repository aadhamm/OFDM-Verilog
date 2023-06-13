// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Rising_Edge_Detector_block.v
// Created: 2023-05-02 12:36:36
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Rising_Edge_Detector_block
// Source Path: whdlOFDMTx/Frame Formation and OFDM Modulation/Make OFDM Valid Continuous/Rising Edge Detector
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Rising_Edge_Detector_block
          (clk,
           reset,
           enb_1_32_0,
           in,
           out);


  input   clk;
  input   reset;
  input   enb_1_32_0;
  input   in;
  output  out;


  wire Logical_Operator1_out1;
  reg  Delay_out1;
  wire Logical_Operator_out1;


  assign Logical_Operator1_out1 =  ~ in;



  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 1'b0;
      end
      else begin
        if (enb_1_32_0) begin
          Delay_out1 <= Logical_Operator1_out1;
        end
      end
    end



  assign Logical_Operator_out1 = in & Delay_out1;



  assign out = Logical_Operator_out1;

endmodule  // whdlOFDMTx_Rising_Edge_Detector_block

