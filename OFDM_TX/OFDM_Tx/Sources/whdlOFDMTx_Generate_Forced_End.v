// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Generate_Forced_End.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Generate_Forced_End
// Source Path: whdlOFDMTx/Frame Generator/Data/Data Chain/Symbol Interleaver/Interleaver/Write Logic/Handle Input 
// Control Signals/Generate Forced En
// Hierarchy Level: 9
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Generate_Forced_End
          (clk,
           reset,
           enb,
           rst,
           valid,
           frameOn,
           forcedEnd);


  input   clk;
  input   reset;
  input   enb;
  input   rst;
  input   valid;
  input   frameOn;
  output  forcedEnd;


  wire Logical_Operator1_out1;
  wire [8:0] count_step;  // ufix9
  wire [8:0] count_from;  // ufix9
  wire [8:0] count_reset;  // ufix9
  reg [8:0] currentAddr;  // ufix9
  wire [8:0] count;  // ufix9
  wire need_to_wrap;
  wire [8:0] count_value;  // ufix9
  wire [8:0] count_1;  // ufix9
  wire [8:0] count_2;  // ufix9
  wire Compare_To_Constant1_out1;
  wire Logical_Operator6_out1;


  assign Logical_Operator1_out1 = valid & frameOn;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 360
  assign count_step = 9'b000000001;



  assign count_from = 9'b000000000;



  assign count_reset = 9'b000000000;



  assign count = currentAddr + count_step;



  assign need_to_wrap = currentAddr == 9'b101101000;



  assign count_value = (need_to_wrap == 1'b0 ? count :
              count_from);



  assign count_1 = (Logical_Operator1_out1 == 1'b0 ? currentAddr :
              count_value);



  assign count_2 = (rst == 1'b0 ? count_1 :
              count_reset);



  always @(posedge clk or posedge reset)
    begin : readyCounter_process
      if (reset == 1'b1) begin
        currentAddr <= 9'b000000000;
      end
      else begin
        if (enb) begin
          currentAddr <= count_2;
        end
      end
    end



  assign Compare_To_Constant1_out1 = currentAddr == 9'b101100110;



  assign Logical_Operator6_out1 = Compare_To_Constant1_out1 & Logical_Operator1_out1;



  assign forcedEnd = Logical_Operator6_out1;

endmodule  // whdlOFDMTx_Generate_Forced_End

