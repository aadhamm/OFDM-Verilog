// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Generate_Base_Read_Address_block.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Generate_Base_Read_Address_block
// Source Path: whdlOFDMTx/Frame Generator/Header/Interleaver/Read Logic/Generate Base Read Address
// Hierarchy Level: 6
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Generate_Base_Read_Address_block
          (clk,
           reset,
           enb,
           readStart,
           baseAddr);


  input   clk;
  input   reset;
  input   enb;
  input   readStart;
  output  [6:0] baseAddr;  // ufix7


  reg  Unit_Delay_Enabled_Synchronous2_out1;
  wire Logical_Operator7_out1;
  wire [6:0] Constant1_out1;  // ufix7
  wire [6:0] Constant5_out1;  // ufix7
  wire [6:0] Switch1_out1;  // ufix7


  assign Logical_Operator7_out1 =  ~ Unit_Delay_Enabled_Synchronous2_out1;



  always @(posedge clk or posedge reset)
    begin : Unit_Delay_Enabled_Synchronous2_process
      if (reset == 1'b1) begin
        Unit_Delay_Enabled_Synchronous2_out1 <= 1'b1;
      end
      else begin
        if (enb && readStart) begin
          Unit_Delay_Enabled_Synchronous2_out1 <= Logical_Operator7_out1;
        end
      end
    end



  assign Constant1_out1 = 7'b0000000;



  assign Constant5_out1 = 7'b1001000;



  assign Switch1_out1 = (Unit_Delay_Enabled_Synchronous2_out1 == 1'b0 ? Constant1_out1 :
              Constant5_out1);



  assign baseAddr = Switch1_out1;

endmodule  // whdlOFDMTx_Generate_Base_Read_Address_block

