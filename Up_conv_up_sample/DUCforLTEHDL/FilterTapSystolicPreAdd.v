// -------------------------------------------------------------
// 
// File Name: D:\OFDM\HDLImplementationOfDUCForLTEExample(Single Tone Output)\HDLImplementationOfDUCForLTEExample\hdlsrc\complex_upsampler\DUCforLTEHDL\FilterTapSystolicPreAdd.v
// Created: 2023-05-25 17:45:33
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: FilterTapSystolicPreAdd
// Source Path: DUCforLTEHDL/HDL_DUC/Halfband Interpolator/DUCforLTEHDL/HDL_DUC/Halfband Interpolator/FIRFilter1/FilterTapSystolicPreAdd
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module FilterTapSystolicPreAdd
          (clk,
           enb,
           din_re,
           preAddIn,
           coeff,
           sumIn,
           sumOut);


  input   clk;
  input   enb;
  input   signed [17:0] din_re;  // sfix18_En14
  input   signed [17:0] preAddIn;  // sfix18_En14
  input   signed [17:0] coeff;  // sfix18_En17
  input   signed [35:0] sumIn;  // sfix36_En31
  output  signed [35:0] sumOut;  // sfix36_En31


  reg signed [17:0] fTap_din1_reg1;  // sfix18
  reg signed [17:0] fTap_din1_reg2;  // sfix18
  reg signed [17:0] fTap_din2_reg1;  // sfix18
  reg signed [18:0] fTap_preAdd_reg;  // sfix19
  reg signed [36:0] fTap_mult_reg;  // sfix37
  reg signed [35:0] fTap_addout_reg;  // sfix36
  reg signed [17:0] fTap_coef_reg1;  // sfix18
  reg signed [17:0] fTap_coef_reg2;  // sfix18
  wire signed [18:0] fTap_preAdd_reg_next;  // sfix19_En14
  wire signed [36:0] fTap_mult_reg_next;  // sfix37_En31
  wire signed [35:0] fTap_addout_reg_next;  // sfix36_En31
  wire signed [35:0] fTap_add_cast;  // sfix36_En31
  wire signed [18:0] fTap_add_cast_1;  // sfix19_En14
  wire signed [18:0] fTap_add_cast_2;  // sfix19_En14

  initial begin
    fTap_din1_reg1 = 18'sb000000000000000000;
    fTap_din1_reg2 = 18'sb000000000000000000;
    fTap_din2_reg1 = 18'sb000000000000000000;
    fTap_preAdd_reg = 19'sb0000000000000000000;
    fTap_coef_reg1 = 18'sb000000000000000000;
    fTap_coef_reg2 = 18'sb000000000000000000;
    fTap_mult_reg = 37'sh0000000000;
    fTap_addout_reg = 36'sh000000000;
  end

  // FilterTapSystolicPreAddS
  always @(posedge clk)
    begin : fTap_process
      if (enb) begin
        fTap_preAdd_reg <= fTap_preAdd_reg_next;
        fTap_mult_reg <= fTap_mult_reg_next;
        fTap_addout_reg <= fTap_addout_reg_next;
        fTap_din1_reg2 <= fTap_din1_reg1;
        fTap_din1_reg1 <= din_re;
        fTap_din2_reg1 <= preAddIn;
        fTap_coef_reg2 <= fTap_coef_reg1;
        fTap_coef_reg1 <= coeff;
      end
    end

  assign sumOut = fTap_addout_reg;
  assign fTap_add_cast = fTap_mult_reg[35:0];
  assign fTap_addout_reg_next = fTap_add_cast + sumIn;
  assign fTap_mult_reg_next = fTap_preAdd_reg * fTap_coef_reg2;
  assign fTap_add_cast_1 = {fTap_din1_reg2[17], fTap_din1_reg2};
  assign fTap_add_cast_2 = {fTap_din2_reg1[17], fTap_din2_reg1};
  assign fTap_preAdd_reg_next = fTap_add_cast_1 + fTap_add_cast_2;



endmodule  // FilterTapSystolicPreAdd

