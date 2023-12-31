// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Generate_Output_Control_Signals.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Generate_Output_Control_Signals
// Source Path: whdlOFDMTx/Frame Generator/Data/Data Chain/Symbol Interleaver/Interleaver/Read Logic/Generate Output 
// Control Signal
// Hierarchy Level: 8
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Generate_Output_Control_Signals
          (clk,
           reset,
           enb,
           blockLen,
           blockValid,
           blockCount,
           valid,
           pop,
           advPop);


  input   clk;
  input   reset;
  input   enb;
  input   [8:0] blockLen;  // ufix9
  input   blockValid;
  input   [8:0] blockCount;  // ufix9
  output  valid;
  output  pop;
  output  advPop;


  wire Relational_Operator2_relop1;
  wire Logical_Operator1_out1;
  reg  Delay6_out1;
  wire [3:0] Constant_out1;  // ufix4
  wire signed [9:0] Add_1;  // sfix10
  wire signed [9:0] Add_2;  // sfix10
  wire signed [9:0] Add_out1;  // sfix10
  wire signed [9:0] Relational_Operator1_1_1;  // sfix10
  wire Relational_Operator1_relop1;
  reg  Delay8_out1;
  wire Compare_To_Constant_out1;
  wire Logical_Operator8_out1;
  reg  Delay_out1;
  wire Constant1_out1;
  reg  Unit_Delay_Enabled_Synchronous_out1;
  wire Logical_Operator4_out1;
  wire [3:0] Constant2_out1;  // ufix4
  wire signed [9:0] Add1_1;  // sfix10
  wire signed [9:0] Add1_2;  // sfix10
  wire signed [9:0] Add1_out1;  // sfix10
  wire signed [9:0] Relational_Operator3_1_1;  // sfix10
  wire Relational_Operator3_relop1;
  reg  Delay1_out1;
  wire Constant3_out1;
  reg  Unit_Delay_Enabled_Synchronous1_out1;
  wire Logical_Operator3_out1;


  assign Relational_Operator2_relop1 = blockCount <= blockLen;



  assign Logical_Operator1_out1 = blockValid & Relational_Operator2_relop1;



  always @(posedge clk or posedge reset)
    begin : Delay6_process
      if (reset == 1'b1) begin
        Delay6_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay6_out1 <= Logical_Operator1_out1;
        end
      end
    end



  assign valid = Delay6_out1;

  assign Constant_out1 = 4'b1000;



  assign Add_1 = {1'b0, blockLen};
  assign Add_2 = {6'b0, Constant_out1};
  assign Add_out1 = Add_1 - Add_2;



  assign Relational_Operator1_1_1 = {1'b0, blockCount};
  assign Relational_Operator1_relop1 = Relational_Operator1_1_1 >= Add_out1;



  always @(posedge clk or posedge reset)
    begin : Delay8_process
      if (reset == 1'b1) begin
        Delay8_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay8_out1 <= Relational_Operator1_relop1;
        end
      end
    end



  assign Compare_To_Constant_out1 = blockCount == 9'b000000000;



  assign Logical_Operator8_out1 = blockValid & Compare_To_Constant_out1;



  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay_out1 <= Logical_Operator8_out1;
        end
      end
    end



  assign Constant1_out1 = 1'b0;



  always @(posedge clk or posedge reset)
    begin : Unit_Delay_Enabled_Synchronous_process
      if (reset == 1'b1) begin
        Unit_Delay_Enabled_Synchronous_out1 <= 1'b1;
      end
      else begin
        if (enb && Delay_out1) begin
          Unit_Delay_Enabled_Synchronous_out1 <= Constant1_out1;
        end
      end
    end



  assign Logical_Operator4_out1 = Delay8_out1 | Unit_Delay_Enabled_Synchronous_out1;



  assign pop = Logical_Operator4_out1;

  assign Constant2_out1 = 4'b1011;



  assign Add1_1 = {1'b0, blockLen};
  assign Add1_2 = {6'b0, Constant2_out1};
  assign Add1_out1 = Add1_1 - Add1_2;



  assign Relational_Operator3_1_1 = {1'b0, blockCount};
  assign Relational_Operator3_relop1 = Relational_Operator3_1_1 >= Add1_out1;



  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= Relational_Operator3_relop1;
        end
      end
    end



  assign Constant3_out1 = 1'b0;



  always @(posedge clk or posedge reset)
    begin : Unit_Delay_Enabled_Synchronous1_process
      if (reset == 1'b1) begin
        Unit_Delay_Enabled_Synchronous1_out1 <= 1'b1;
      end
      else begin
        if (enb && Delay_out1) begin
          Unit_Delay_Enabled_Synchronous1_out1 <= Constant3_out1;
        end
      end
    end



  assign Logical_Operator3_out1 =  ~ (Delay1_out1 | Unit_Delay_Enabled_Synchronous1_out1);



  assign advPop = Logical_Operator3_out1;

endmodule  // whdlOFDMTx_Generate_Output_Control_Signals

