// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_LTE_Symbol_Modulator_block.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_LTE_Symbol_Modulator_block
// Source Path: whdlOFDMTx/Frame Generator/Header/LTE Symbol Modulator
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_LTE_Symbol_Modulator_block
          (clk,
           reset,
           enb,
           data,
           valid,
           data1_re,
           data1_im,
           valid1);


  input   clk;
  input   reset;
  input   enb;
  input   data;
  input   valid;
  output  signed [15:0] data1_re;  // sfix16_En14
  output  signed [15:0] data1_im;  // sfix16_En14
  output  valid1;


  reg  obj_enbReg;
  wire obj_count;  // ufix1
  reg  obj_count_1;  // ufix1
  wire tmp;  // ufix1
  wire [1:0] p40tmp_add_temp;  // ufix2
  wire [1:0] p40tmp_1;  // ufix2
  wire tmp_1;
  wire tmp_2;  // ufix1
  wire tmp_3;  // ufix1
  wire tmp_4;
  wire out;
  wire out_1;
  wire tmp_5;
  reg  [0:1] obj_validReg_reg_reg;  // ufix1 [2]
  wire [0:1] obj_validReg_reg_reg_next;  // ufix1 [2]
  wire obj_validReg;
  reg  obj_dataInReg;
  reg  obj_shiftReg;
  wire tmp_6;
  wire tmp_7;  // ufix1
  reg  obj_Iaddr;  // ufix1
  wire signed [15:0] tmp_8;  // sfix16_En14
  wire signed [15:0] p21tmp_1 [0:1];  // sfix16_En14 [2]
  reg signed [15:0] obj_Ireg;  // sfix16_En14
  wire signed [15:0] tmp_9;  // sfix16_En14
  wire tmp_10;  // ufix1
  reg  obj_Qaddr;  // ufix1
  wire signed [15:0] tmp_11;  // sfix16_En14
  wire signed [15:0] p20tmp_1 [0:1];  // sfix16_En14 [2]
  reg signed [15:0] obj_Qreg;  // sfix16_En14
  wire signed [15:0] tmp_12;  // sfix16_En14
  wire signed [15:0] data_re;  // sfix16_En14
  wire signed [15:0] data_im;  // sfix16_En14
  reg  valid_1;


  always @(posedge clk or posedge reset)
    begin : obj_enbReg_reg_process
      if (reset == 1'b1) begin
        obj_enbReg <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_enbReg <= valid;
        end
      end
    end



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp36
  assign obj_count = 1'b0;



  // HDL code generation from MATLAB function: SystemCore_stepImpl
  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp36
  assign p40tmp_1 = {1'b0, obj_count_1};
  assign p40tmp_add_temp = p40tmp_1 + 2'b01;
  assign tmp = p40tmp_add_temp[0];



  assign tmp_1 = obj_count_1 == 1'b0;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp23
  assign tmp_2 = (tmp_1 == 1'b0 ? tmp :
              obj_count);



  assign tmp_3 = (obj_enbReg == 1'b0 ? obj_count_1 :
              tmp_2);



  always @(posedge clk or posedge reset)
    begin : obj_count_reg_process
      if (reset == 1'b1) begin
        obj_count_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_count_1 <= tmp_3;
        end
      end
    end



  assign tmp_4 = ( ~ obj_count_1) && obj_enbReg;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp27
  assign out = 1'b0;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp27
  assign out_1 = 1'b1;



  assign tmp_5 = (tmp_4 == 1'b0 ? out :
              out_1);



  always @(posedge clk or posedge reset)
    begin : obj_validReg_reg_process
      if (reset == 1'b1) begin
        obj_validReg_reg_reg[0] <= 1'b0;
        obj_validReg_reg_reg[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_validReg_reg_reg[0] <= obj_validReg_reg_reg_next[0];
          obj_validReg_reg_reg[1] <= obj_validReg_reg_reg_next[1];
        end
      end
    end

  assign obj_validReg = obj_validReg_reg_reg[1];
  assign obj_validReg_reg_reg_next[0] = tmp_5;
  assign obj_validReg_reg_reg_next[1] = obj_validReg_reg_reg[0];



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp32
  always @(posedge clk or posedge reset)
    begin : obj_dataInReg_reg_process
      if (reset == 1'b1) begin
        obj_dataInReg <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_dataInReg <= data;
        end
      end
    end



  assign tmp_6 = (obj_enbReg == 1'b0 ? obj_shiftReg :
              obj_dataInReg);



  always @(posedge clk or posedge reset)
    begin : obj_shiftReg_reg_process
      if (reset == 1'b1) begin
        obj_shiftReg <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_shiftReg <= tmp_6;
        end
      end
    end



  assign tmp_7 = obj_shiftReg;



  always @(posedge clk or posedge reset)
    begin : obj_Iaddr_reg_process
      if (reset == 1'b1) begin
        obj_Iaddr <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_Iaddr <= tmp_7;
        end
      end
    end



  assign p21tmp_1[0] = 16'sb0010110101000001;
  assign p21tmp_1[1] = 16'sb1101001010111111;
  assign tmp_8 = p21tmp_1[obj_Iaddr];



  assign tmp_9 = (obj_validReg == 1'b0 ? obj_Ireg :
              tmp_8);



  always @(posedge clk or posedge reset)
    begin : obj_Ireg_reg_process
      if (reset == 1'b1) begin
        obj_Ireg <= 16'sb0000000000000000;
      end
      else begin
        if (enb) begin
          obj_Ireg <= tmp_9;
        end
      end
    end



  assign tmp_10 = obj_shiftReg;



  always @(posedge clk or posedge reset)
    begin : obj_Qaddr_reg_process
      if (reset == 1'b1) begin
        obj_Qaddr <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_Qaddr <= tmp_10;
        end
      end
    end



  assign p20tmp_1[0] = 16'sb0010110101000001;
  assign p20tmp_1[1] = 16'sb1101001010111111;
  assign tmp_11 = p20tmp_1[obj_Qaddr];



  assign tmp_12 = (obj_validReg == 1'b0 ? obj_Qreg :
              tmp_11);



  always @(posedge clk or posedge reset)
    begin : obj_Qreg_reg_process
      if (reset == 1'b1) begin
        obj_Qreg <= 16'sb0000000000000000;
      end
      else begin
        if (enb) begin
          obj_Qreg <= tmp_12;
        end
      end
    end



  assign data_re = obj_Ireg;
  assign data_im = obj_Qreg;



  assign data1_re = data_re;

  assign data1_im = data_im;

  always @(posedge clk or posedge reset)
    begin : obj_validRegReg_reg_process
      if (reset == 1'b1) begin
        valid_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          valid_1 <= obj_validReg;
        end
      end
    end



  assign valid1 = valid_1;

endmodule  // whdlOFDMTx_LTE_Symbol_Modulator_block
