// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_RADIX22FFT_SDF1_3.v
// Created: 2023-05-02 12:36:36
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_RADIX22FFT_SDF1_3
// Source Path: dsphdl.IFFT/RADIX22FFT_SDF1_3
// Hierarchy Level: 5
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_RADIX22FFT_SDF1_3
          (clk,
           reset,
           enb_1_32_0,
           din_3_1_re_dly,
           din_3_1_im_dly,
           din_3_vld_dly,
           rd_3_Addr,
           rd_3_Enb,
           twdl_3_1_re,
           twdl_3_1_im,
           proc_3_enb,
           dout_3_1_re,
           dout_3_1_im,
           dout_3_1_vld,
           dinXTwdl_3_1_vld);


  input   clk;
  input   reset;
  input   enb_1_32_0;
  input   signed [15:0] din_3_1_re_dly;  // sfix16_En14
  input   signed [15:0] din_3_1_im_dly;  // sfix16_En14
  input   din_3_vld_dly;
  input   [3:0] rd_3_Addr;  // ufix4
  input   rd_3_Enb;
  input   signed [15:0] twdl_3_1_re;  // sfix16_En14
  input   signed [15:0] twdl_3_1_im;  // sfix16_En14
  input   proc_3_enb;
  output  signed [15:0] dout_3_1_re;  // sfix16_En14
  output  signed [15:0] dout_3_1_im;  // sfix16_En14
  output  dout_3_1_vld;
  output  dinXTwdl_3_1_vld;


  wire signed [15:0] dinXTwdl_re;  // sfix16_En14
  wire signed [15:0] dinXTwdl_im;  // sfix16_En14
  reg  x_vld;
  wire signed [15:0] wrData_im;  // sfix16_En14
  wire [3:0] wrAddr;  // ufix4
  wire wrEnb;
  wire signed [15:0] x_im;  // sfix16_En14
  wire signed [15:0] wrData_re;  // sfix16_En14
  wire signed [15:0] x_re;  // sfix16_En14
  reg signed [16:0] Radix22ButterflyG1_btf1_re_reg;  // sfix17
  reg signed [16:0] Radix22ButterflyG1_btf1_im_reg;  // sfix17
  reg signed [16:0] Radix22ButterflyG1_btf2_re_reg;  // sfix17
  reg signed [16:0] Radix22ButterflyG1_btf2_im_reg;  // sfix17
  reg signed [15:0] Radix22ButterflyG1_x_re_dly1;  // sfix16
  reg signed [15:0] Radix22ButterflyG1_x_im_dly1;  // sfix16
  reg  Radix22ButterflyG1_x_vld_dly1;
  reg signed [15:0] Radix22ButterflyG1_dinXtwdl_re_dly1;  // sfix16
  reg signed [15:0] Radix22ButterflyG1_dinXtwdl_im_dly1;  // sfix16
  reg signed [15:0] Radix22ButterflyG1_dinXtwdl_re_dly2;  // sfix16
  reg signed [15:0] Radix22ButterflyG1_dinXtwdl_im_dly2;  // sfix16
  reg  Radix22ButterflyG1_dinXtwdl_vld_dly1;
  reg  Radix22ButterflyG1_dinXtwdl_vld_dly2;
  wire signed [16:0] Radix22ButterflyG1_btf1_re_reg_next;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_btf1_im_reg_next;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_btf2_re_reg_next;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_btf2_im_reg_next;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_add_cast;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_add_cast_1;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_sub_cast;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_sub_cast_1;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_add_cast_2;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_add_cast_3;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_sub_cast_2;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_sub_cast_3;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_sra_temp;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_sra_temp_1;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_sra_temp_2;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_sra_temp_3;  // sfix17_En14
  reg signed [15:0] xf_re;  // sfix16_En14
  reg signed [15:0] xf_im;  // sfix16_En14
  reg  xf_vld;
  wire signed [15:0] dinXTwdlf_re;  // sfix16_En14
  wire signed [15:0] dinXTwdlf_im;  // sfix16_En14
  wire dinxTwdlf_vld;
  wire signed [15:0] btf1_re;  // sfix16_En14
  wire signed [15:0] btf1_im;  // sfix16_En14
  wire signed [15:0] btf2_re;  // sfix16_En14
  wire signed [15:0] btf2_im;  // sfix16_En14
  reg  btf_vld;


  whdlOFDMTx_Complex4Multiply u_MUL4 (.clk(clk),
                                      .reset(reset),
                                      .enb_1_32_0(enb_1_32_0),
                                      .din_3_1_re_dly(din_3_1_re_dly),  // sfix16_En14
                                      .din_3_1_im_dly(din_3_1_im_dly),  // sfix16_En14
                                      .din_3_vld_dly(din_3_vld_dly),
                                      .twdl_3_1_re(twdl_3_1_re),  // sfix16_En14
                                      .twdl_3_1_im(twdl_3_1_im),  // sfix16_En14
                                      .dinXTwdl_re(dinXTwdl_re),  // sfix16_En14
                                      .dinXTwdl_im(dinXTwdl_im),  // sfix16_En14
                                      .dinXTwdl_3_1_vld(dinXTwdl_3_1_vld)
                                      );

  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        x_vld <= 1'b0;
      end
      else begin
        if (enb_1_32_0) begin
          x_vld <= rd_3_Enb;
        end
      end
    end



  whdlOFDMTx_SimpleDualPortRAM_generic_block #(.AddrWidth(4),
                                               .DataWidth(16)
                                               )
                                             u_dataMEM_im_0_3 (.clk(clk),
                                                               .enb_1_32_0(enb_1_32_0),
                                                               .wr_din(wrData_im),
                                                               .wr_addr(wrAddr),
                                                               .wr_en(wrEnb),
                                                               .rd_addr(rd_3_Addr),
                                                               .rd_dout(x_im)
                                                               );

  whdlOFDMTx_SimpleDualPortRAM_generic_block #(.AddrWidth(4),
                                               .DataWidth(16)
                                               )
                                             u_dataMEM_re_0_3 (.clk(clk),
                                                               .enb_1_32_0(enb_1_32_0),
                                                               .wr_din(wrData_re),
                                                               .wr_addr(wrAddr),
                                                               .wr_en(wrEnb),
                                                               .rd_addr(rd_3_Addr),
                                                               .rd_dout(x_re)
                                                               );

  // Radix22ButterflyG1
  always @(posedge clk or posedge reset)
    begin : Radix22ButterflyG1_process
      if (reset == 1'b1) begin
        Radix22ButterflyG1_btf1_re_reg <= 17'sb00000000000000000;
        Radix22ButterflyG1_btf1_im_reg <= 17'sb00000000000000000;
        Radix22ButterflyG1_btf2_re_reg <= 17'sb00000000000000000;
        Radix22ButterflyG1_btf2_im_reg <= 17'sb00000000000000000;
        Radix22ButterflyG1_x_re_dly1 <= 16'sb0000000000000000;
        Radix22ButterflyG1_x_im_dly1 <= 16'sb0000000000000000;
        Radix22ButterflyG1_x_vld_dly1 <= 1'b0;
        xf_re <= 16'sb0000000000000000;
        xf_im <= 16'sb0000000000000000;
        xf_vld <= 1'b0;
        Radix22ButterflyG1_dinXtwdl_re_dly1 <= 16'sb0000000000000000;
        Radix22ButterflyG1_dinXtwdl_im_dly1 <= 16'sb0000000000000000;
        Radix22ButterflyG1_dinXtwdl_re_dly2 <= 16'sb0000000000000000;
        Radix22ButterflyG1_dinXtwdl_im_dly2 <= 16'sb0000000000000000;
        Radix22ButterflyG1_dinXtwdl_vld_dly1 <= 1'b0;
        Radix22ButterflyG1_dinXtwdl_vld_dly2 <= 1'b0;
        btf_vld <= 1'b0;
      end
      else begin
        if (enb_1_32_0) begin
          Radix22ButterflyG1_btf1_re_reg <= Radix22ButterflyG1_btf1_re_reg_next;
          Radix22ButterflyG1_btf1_im_reg <= Radix22ButterflyG1_btf1_im_reg_next;
          Radix22ButterflyG1_btf2_re_reg <= Radix22ButterflyG1_btf2_re_reg_next;
          Radix22ButterflyG1_btf2_im_reg <= Radix22ButterflyG1_btf2_im_reg_next;
          xf_re <= Radix22ButterflyG1_x_re_dly1;
          xf_im <= Radix22ButterflyG1_x_im_dly1;
          xf_vld <= Radix22ButterflyG1_x_vld_dly1;
          btf_vld <= Radix22ButterflyG1_dinXtwdl_vld_dly2;
          Radix22ButterflyG1_dinXtwdl_vld_dly2 <= Radix22ButterflyG1_dinXtwdl_vld_dly1;
          Radix22ButterflyG1_dinXtwdl_re_dly2 <= Radix22ButterflyG1_dinXtwdl_re_dly1;
          Radix22ButterflyG1_dinXtwdl_im_dly2 <= Radix22ButterflyG1_dinXtwdl_im_dly1;
          Radix22ButterflyG1_dinXtwdl_re_dly1 <= dinXTwdl_re;
          Radix22ButterflyG1_dinXtwdl_im_dly1 <= dinXTwdl_im;
          Radix22ButterflyG1_x_re_dly1 <= x_re;
          Radix22ButterflyG1_x_im_dly1 <= x_im;
          Radix22ButterflyG1_x_vld_dly1 <= x_vld;
          Radix22ButterflyG1_dinXtwdl_vld_dly1 <= proc_3_enb && dinXTwdl_3_1_vld;
        end
      end
    end

  assign dinxTwdlf_vld = ( ! proc_3_enb) && dinXTwdl_3_1_vld;
  assign Radix22ButterflyG1_add_cast = {Radix22ButterflyG1_x_re_dly1[15], Radix22ButterflyG1_x_re_dly1};
  assign Radix22ButterflyG1_add_cast_1 = {Radix22ButterflyG1_dinXtwdl_re_dly2[15], Radix22ButterflyG1_dinXtwdl_re_dly2};
  assign Radix22ButterflyG1_btf1_re_reg_next = Radix22ButterflyG1_add_cast + Radix22ButterflyG1_add_cast_1;
  assign Radix22ButterflyG1_sub_cast = {Radix22ButterflyG1_x_re_dly1[15], Radix22ButterflyG1_x_re_dly1};
  assign Radix22ButterflyG1_sub_cast_1 = {Radix22ButterflyG1_dinXtwdl_re_dly2[15], Radix22ButterflyG1_dinXtwdl_re_dly2};
  assign Radix22ButterflyG1_btf2_re_reg_next = Radix22ButterflyG1_sub_cast - Radix22ButterflyG1_sub_cast_1;
  assign Radix22ButterflyG1_add_cast_2 = {Radix22ButterflyG1_x_im_dly1[15], Radix22ButterflyG1_x_im_dly1};
  assign Radix22ButterflyG1_add_cast_3 = {Radix22ButterflyG1_dinXtwdl_im_dly2[15], Radix22ButterflyG1_dinXtwdl_im_dly2};
  assign Radix22ButterflyG1_btf1_im_reg_next = Radix22ButterflyG1_add_cast_2 + Radix22ButterflyG1_add_cast_3;
  assign Radix22ButterflyG1_sub_cast_2 = {Radix22ButterflyG1_x_im_dly1[15], Radix22ButterflyG1_x_im_dly1};
  assign Radix22ButterflyG1_sub_cast_3 = {Radix22ButterflyG1_dinXtwdl_im_dly2[15], Radix22ButterflyG1_dinXtwdl_im_dly2};
  assign Radix22ButterflyG1_btf2_im_reg_next = Radix22ButterflyG1_sub_cast_2 - Radix22ButterflyG1_sub_cast_3;
  assign dinXTwdlf_re = dinXTwdl_re;
  assign dinXTwdlf_im = dinXTwdl_im;
  assign Radix22ButterflyG1_sra_temp = Radix22ButterflyG1_btf1_re_reg >>> 8'd1;
  assign btf1_re = Radix22ButterflyG1_sra_temp[15:0];
  assign Radix22ButterflyG1_sra_temp_1 = Radix22ButterflyG1_btf1_im_reg >>> 8'd1;
  assign btf1_im = Radix22ButterflyG1_sra_temp_1[15:0];
  assign Radix22ButterflyG1_sra_temp_2 = Radix22ButterflyG1_btf2_re_reg >>> 8'd1;
  assign btf2_re = Radix22ButterflyG1_sra_temp_2[15:0];
  assign Radix22ButterflyG1_sra_temp_3 = Radix22ButterflyG1_btf2_im_reg >>> 8'd1;
  assign btf2_im = Radix22ButterflyG1_sra_temp_3[15:0];



  whdlOFDMTx_SDFCommutator3 u_SDFCOMMUTATOR_3 (.clk(clk),
                                               .reset(reset),
                                               .enb_1_32_0(enb_1_32_0),
                                               .din_3_vld_dly(din_3_vld_dly),
                                               .xf_re(xf_re),  // sfix16_En14
                                               .xf_im(xf_im),  // sfix16_En14
                                               .xf_vld(xf_vld),
                                               .dinXTwdlf_re(dinXTwdlf_re),  // sfix16_En14
                                               .dinXTwdlf_im(dinXTwdlf_im),  // sfix16_En14
                                               .dinxTwdlf_vld(dinxTwdlf_vld),
                                               .btf1_re(btf1_re),  // sfix16_En14
                                               .btf1_im(btf1_im),  // sfix16_En14
                                               .btf2_re(btf2_re),  // sfix16_En14
                                               .btf2_im(btf2_im),  // sfix16_En14
                                               .btf_vld(btf_vld),
                                               .wrData_re(wrData_re),  // sfix16_En14
                                               .wrData_im(wrData_im),  // sfix16_En14
                                               .wrAddr(wrAddr),  // ufix4
                                               .wrEnb(wrEnb),
                                               .dout_3_1_re(dout_3_1_re),  // sfix16_En14
                                               .dout_3_1_im(dout_3_1_im),  // sfix16_En14
                                               .dout_3_1_vld(dout_3_1_vld)
                                               );

endmodule  // whdlOFDMTx_RADIX22FFT_SDF1_3

