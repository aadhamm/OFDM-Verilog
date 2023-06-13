// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_dsphdl_IFFT.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_dsphdl_IFFT
// Source Path: dsphdl.IFFT
// Hierarchy Level: 4
// 
// FFT
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_dsphdl_IFFT
          (clk,
           reset,
           enb_1_32_0,
           dataIn_re,
           dataIn_im,
           validIn,
           dataOut_re,
           dataOut_im,
           validOut);


  input   clk;
  input   reset;
  input   enb_1_32_0;
  input   signed [15:0] dataIn_re;  // sfix16_En14
  input   signed [15:0] dataIn_im;  // sfix16_En14
  input   validIn;
  output  signed [15:0] dataOut_re;  // sfix16_En14
  output  signed [15:0] dataOut_im;  // sfix16_En14
  output  validOut;


  wire softReset;
  reg signed [15:0] intdelay_reg [0:2];  // sfix16 [3]
  wire signed [15:0] intdelay_reg_next [0:2];  // sfix16_En14 [3]
  wire signed [15:0] din_1_1_re_dly;  // sfix16_En14
  reg signed [15:0] intdelay_reg_1 [0:2];  // sfix16 [3]
  wire signed [15:0] intdelay_reg_next_1 [0:2];  // sfix16_En14 [3]
  wire signed [15:0] din_1_1_im_dly;  // sfix16_En14
  reg  [0:2] intdelay_reg_2;  // ufix1 [3]
  wire [0:2] intdelay_reg_next_2;  // ufix1 [3]
  wire din_1_vld_dly;
  wire dinXTwdl_1_1_vld;
  wire [5:0] rd_1_Addr;  // ufix6
  wire rd_1_Enb;
  wire proc_1_enb;
  wire signed [15:0] dout_1_1_re;  // sfix16_En14
  wire signed [15:0] dout_1_1_im;  // sfix16_En14
  wire dout_1_1_vld;
  wire dinXTwdl_2_1_vld;
  wire [4:0] rd_2_Addr;  // ufix5
  wire rd_2_Enb;
  wire proc_2_enb;
  wire multiply_2_J;
  wire signed [15:0] dout_2_1_re;  // sfix16_En14
  wire signed [15:0] dout_2_1_im;  // sfix16_En14
  wire dout_2_1_vld;
  reg signed [15:0] intdelay_reg_3 [0:2];  // sfix16 [3]
  wire signed [15:0] intdelay_reg_next_3 [0:2];  // sfix16_En14 [3]
  wire signed [15:0] din_3_1_re_dly;  // sfix16_En14
  reg signed [15:0] intdelay_reg_4 [0:2];  // sfix16 [3]
  wire signed [15:0] intdelay_reg_next_4 [0:2];  // sfix16_En14 [3]
  wire signed [15:0] din_3_1_im_dly;  // sfix16_En14
  reg  [0:2] intdelay_reg_5;  // ufix1 [3]
  wire [0:2] intdelay_reg_next_5;  // ufix1 [3]
  wire din_3_vld_dly;
  wire signed [15:0] twdl_3_1_re;  // sfix16_En14
  wire signed [15:0] twdl_3_1_im;  // sfix16_En14
  wire dinXTwdl_3_1_vld;
  wire [3:0] rd_3_Addr;  // ufix4
  wire rd_3_Enb;
  wire proc_3_enb;
  wire signed [15:0] dout_3_1_re;  // sfix16_En14
  wire signed [15:0] dout_3_1_im;  // sfix16_En14
  wire dout_3_1_vld;
  wire dinXTwdl_4_1_vld;
  wire [2:0] rd_4_Addr;  // ufix3
  wire rd_4_Enb;
  wire proc_4_enb;
  wire multiply_4_J;
  wire signed [15:0] dout_4_1_re;  // sfix16_En14
  wire signed [15:0] dout_4_1_im;  // sfix16_En14
  wire dout_4_1_vld;
  reg signed [15:0] intdelay_reg_6 [0:2];  // sfix16 [3]
  wire signed [15:0] intdelay_reg_next_6 [0:2];  // sfix16_En14 [3]
  wire signed [15:0] din_5_1_re_dly;  // sfix16_En14
  reg signed [15:0] intdelay_reg_7 [0:2];  // sfix16 [3]
  wire signed [15:0] intdelay_reg_next_7 [0:2];  // sfix16_En14 [3]
  wire signed [15:0] din_5_1_im_dly;  // sfix16_En14
  reg  [0:2] intdelay_reg_8;  // ufix1 [3]
  wire [0:2] intdelay_reg_next_8;  // ufix1 [3]
  wire din_5_vld_dly;
  wire signed [15:0] twdl_5_1_re;  // sfix16_En14
  wire signed [15:0] twdl_5_1_im;  // sfix16_En14
  wire dinXTwdl_5_1_vld;
  wire [1:0] rd_5_Addr;  // ufix2
  wire rd_5_Enb;
  wire proc_5_enb;
  wire signed [15:0] dout_5_1_re;  // sfix16_En14
  wire signed [15:0] dout_5_1_im;  // sfix16_En14
  wire dout_5_1_vld;
  wire dinXTwdl_6_1_vld;
  wire rd_6_Addr;  // ufix1
  wire rd_6_Enb;
  wire proc_6_enb;
  wire multiply_6_J;
  wire signed [15:0] dout_6_1_re;  // sfix16_En14
  wire signed [15:0] dout_6_1_im;  // sfix16_En14
  wire dout_6_1_vld;
  reg signed [15:0] intdelay_reg_9 [0:2];  // sfix16 [3]
  wire signed [15:0] intdelay_reg_next_9 [0:2];  // sfix16_En14 [3]
  wire signed [15:0] din_7_re_dly;  // sfix16_En14
  reg signed [15:0] intdelay_reg_10 [0:2];  // sfix16 [3]
  wire signed [15:0] intdelay_reg_next_10 [0:2];  // sfix16_En14 [3]
  wire signed [15:0] din_7_im_dly;  // sfix16_En14
  reg  [0:2] intdelay_reg_11;  // ufix1 [3]
  wire [0:2] intdelay_reg_next_11;  // ufix1 [3]
  wire din_7_vld_dly;
  wire signed [15:0] twdl_7_re;  // sfix16_En14
  wire signed [15:0] twdl_7_im;  // sfix16_En14
  wire rd_7_Enb;
  reg  rd_7_Enb_dly;
  wire dinXTwdl_7_vld;
  wire rd_7_Addr;
  wire proc_7_enb;
  wire signed [15:0] dout_7_re;  // sfix16_En14
  wire signed [15:0] dout_7_im;  // sfix16_En14
  wire dout_7_vld;
  wire signed [15:0] dout_re1;  // sfix16_En14
  wire signed [15:0] dout_im1;  // sfix16_En14
  wire dout_vld1;


  assign softReset = 1'b0;



  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        intdelay_reg[0] <= 16'sb0000000000000000;
        intdelay_reg[1] <= 16'sb0000000000000000;
        intdelay_reg[2] <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_32_0) begin
          if (softReset == 1'b1) begin
            intdelay_reg[0] <= 16'sb0000000000000000;
            intdelay_reg[1] <= 16'sb0000000000000000;
            intdelay_reg[2] <= 16'sb0000000000000000;
          end
          else begin
            intdelay_reg[0] <= intdelay_reg_next[0];
            intdelay_reg[1] <= intdelay_reg_next[1];
            intdelay_reg[2] <= intdelay_reg_next[2];
          end
        end
      end
    end

  assign din_1_1_re_dly = intdelay_reg[2];
  assign intdelay_reg_next[0] = dataIn_im;
  assign intdelay_reg_next[1] = intdelay_reg[0];
  assign intdelay_reg_next[2] = intdelay_reg[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_1_process
      if (reset == 1'b1) begin
        intdelay_reg_1[0] <= 16'sb0000000000000000;
        intdelay_reg_1[1] <= 16'sb0000000000000000;
        intdelay_reg_1[2] <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_32_0) begin
          if (softReset == 1'b1) begin
            intdelay_reg_1[0] <= 16'sb0000000000000000;
            intdelay_reg_1[1] <= 16'sb0000000000000000;
            intdelay_reg_1[2] <= 16'sb0000000000000000;
          end
          else begin
            intdelay_reg_1[0] <= intdelay_reg_next_1[0];
            intdelay_reg_1[1] <= intdelay_reg_next_1[1];
            intdelay_reg_1[2] <= intdelay_reg_next_1[2];
          end
        end
      end
    end

  assign din_1_1_im_dly = intdelay_reg_1[2];
  assign intdelay_reg_next_1[0] = dataIn_re;
  assign intdelay_reg_next_1[1] = intdelay_reg_1[0];
  assign intdelay_reg_next_1[2] = intdelay_reg_1[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_2_process
      if (reset == 1'b1) begin
        intdelay_reg_2[0] <= 1'b0;
        intdelay_reg_2[1] <= 1'b0;
        intdelay_reg_2[2] <= 1'b0;
      end
      else begin
        if (enb_1_32_0) begin
          if (softReset == 1'b1) begin
            intdelay_reg_2[0] <= 1'b0;
            intdelay_reg_2[1] <= 1'b0;
            intdelay_reg_2[2] <= 1'b0;
          end
          else begin
            intdelay_reg_2[0] <= intdelay_reg_next_2[0];
            intdelay_reg_2[1] <= intdelay_reg_next_2[1];
            intdelay_reg_2[2] <= intdelay_reg_next_2[2];
          end
        end
      end
    end

  assign din_1_vld_dly = intdelay_reg_2[2];
  assign intdelay_reg_next_2[0] = validIn;
  assign intdelay_reg_next_2[1] = intdelay_reg_2[0];
  assign intdelay_reg_next_2[2] = intdelay_reg_2[1];



  whdlOFDMTx_RADIX22FFT_CTRL1_1 u_CTRL1_1_1 (.clk(clk),
                                             .reset(reset),
                                             .enb_1_32_0(enb_1_32_0),
                                             .dinXTwdl_1_1_vld(dinXTwdl_1_1_vld),
                                             .dinXTwdl_1_1_vld_1(dinXTwdl_1_1_vld),
                                             .rd_1_Addr(rd_1_Addr),  // ufix6
                                             .rd_1_Enb(rd_1_Enb),
                                             .proc_1_enb(proc_1_enb)
                                             );

  whdlOFDMTx_RADIX22FFT_SDF1_1 u_SDF1_1_1 (.clk(clk),
                                           .reset(reset),
                                           .enb_1_32_0(enb_1_32_0),
                                           .din_1_1_re_dly(din_1_1_re_dly),  // sfix16_En14
                                           .din_1_1_im_dly(din_1_1_im_dly),  // sfix16_En14
                                           .din_1_vld_dly(din_1_vld_dly),
                                           .rd_1_Addr(rd_1_Addr),  // ufix6
                                           .rd_1_Enb(rd_1_Enb),
                                           .proc_1_enb(proc_1_enb),
                                           .dout_1_1_re(dout_1_1_re),  // sfix16_En14
                                           .dout_1_1_im(dout_1_1_im),  // sfix16_En14
                                           .dout_1_1_vld(dout_1_1_vld),
                                           .dinXTwdl_1_1_vld(dinXTwdl_1_1_vld)
                                           );

  whdlOFDMTx_RADIX22FFT_CTRL1_2 u_CTRL2_2_1 (.clk(clk),
                                             .reset(reset),
                                             .enb_1_32_0(enb_1_32_0),
                                             .dout_1_1_vld(dout_1_1_vld),
                                             .dinXTwdl_2_1_vld(dinXTwdl_2_1_vld),
                                             .rd_2_Addr(rd_2_Addr),  // ufix5
                                             .rd_2_Enb(rd_2_Enb),
                                             .proc_2_enb(proc_2_enb),
                                             .multiply_2_J(multiply_2_J)
                                             );

  whdlOFDMTx_RADIX22FFT_SDF2_2 u_SDF2_2_1 (.clk(clk),
                                           .reset(reset),
                                           .enb_1_32_0(enb_1_32_0),
                                           .dout_1_1_re(dout_1_1_re),  // sfix16_En14
                                           .dout_1_1_im(dout_1_1_im),  // sfix16_En14
                                           .dout_1_1_vld(dout_1_1_vld),
                                           .rd_2_Addr(rd_2_Addr),  // ufix5
                                           .rd_2_Enb(rd_2_Enb),
                                           .proc_2_enb(proc_2_enb),
                                           .multiply_2_J(multiply_2_J),
                                           .dout_2_1_re(dout_2_1_re),  // sfix16_En14
                                           .dout_2_1_im(dout_2_1_im),  // sfix16_En14
                                           .dout_2_1_vld(dout_2_1_vld),
                                           .dinXTwdl_2_1_vld(dinXTwdl_2_1_vld)
                                           );

  always @(posedge clk or posedge reset)
    begin : intdelay_3_process
      if (reset == 1'b1) begin
        intdelay_reg_3[0] <= 16'sb0000000000000000;
        intdelay_reg_3[1] <= 16'sb0000000000000000;
        intdelay_reg_3[2] <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_32_0) begin
          if (softReset == 1'b1) begin
            intdelay_reg_3[0] <= 16'sb0000000000000000;
            intdelay_reg_3[1] <= 16'sb0000000000000000;
            intdelay_reg_3[2] <= 16'sb0000000000000000;
          end
          else begin
            intdelay_reg_3[0] <= intdelay_reg_next_3[0];
            intdelay_reg_3[1] <= intdelay_reg_next_3[1];
            intdelay_reg_3[2] <= intdelay_reg_next_3[2];
          end
        end
      end
    end

  assign din_3_1_re_dly = intdelay_reg_3[2];
  assign intdelay_reg_next_3[0] = dout_2_1_re;
  assign intdelay_reg_next_3[1] = intdelay_reg_3[0];
  assign intdelay_reg_next_3[2] = intdelay_reg_3[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_4_process
      if (reset == 1'b1) begin
        intdelay_reg_4[0] <= 16'sb0000000000000000;
        intdelay_reg_4[1] <= 16'sb0000000000000000;
        intdelay_reg_4[2] <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_32_0) begin
          if (softReset == 1'b1) begin
            intdelay_reg_4[0] <= 16'sb0000000000000000;
            intdelay_reg_4[1] <= 16'sb0000000000000000;
            intdelay_reg_4[2] <= 16'sb0000000000000000;
          end
          else begin
            intdelay_reg_4[0] <= intdelay_reg_next_4[0];
            intdelay_reg_4[1] <= intdelay_reg_next_4[1];
            intdelay_reg_4[2] <= intdelay_reg_next_4[2];
          end
        end
      end
    end

  assign din_3_1_im_dly = intdelay_reg_4[2];
  assign intdelay_reg_next_4[0] = dout_2_1_im;
  assign intdelay_reg_next_4[1] = intdelay_reg_4[0];
  assign intdelay_reg_next_4[2] = intdelay_reg_4[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_5_process
      if (reset == 1'b1) begin
        intdelay_reg_5[0] <= 1'b0;
        intdelay_reg_5[1] <= 1'b0;
        intdelay_reg_5[2] <= 1'b0;
      end
      else begin
        if (enb_1_32_0) begin
          if (softReset == 1'b1) begin
            intdelay_reg_5[0] <= 1'b0;
            intdelay_reg_5[1] <= 1'b0;
            intdelay_reg_5[2] <= 1'b0;
          end
          else begin
            intdelay_reg_5[0] <= intdelay_reg_next_5[0];
            intdelay_reg_5[1] <= intdelay_reg_next_5[1];
            intdelay_reg_5[2] <= intdelay_reg_next_5[2];
          end
        end
      end
    end

  assign din_3_vld_dly = intdelay_reg_5[2];
  assign intdelay_reg_next_5[0] = dout_2_1_vld;
  assign intdelay_reg_next_5[1] = intdelay_reg_5[0];
  assign intdelay_reg_next_5[2] = intdelay_reg_5[1];



  whdlOFDMTx_TWDLROM_3_1 u_twdlROM_3_1 (.clk(clk),
                                        .reset(reset),
                                        .enb_1_32_0(enb_1_32_0),
                                        .dout_2_1_vld(dout_2_1_vld),
                                        .twdl_3_1_re(twdl_3_1_re),  // sfix16_En14
                                        .twdl_3_1_im(twdl_3_1_im)  // sfix16_En14
                                        );

  whdlOFDMTx_RADIX22FFT_CTRL1_3 u_CTRL1_3_1 (.clk(clk),
                                             .reset(reset),
                                             .enb_1_32_0(enb_1_32_0),
                                             .dinXTwdl_3_1_vld(dinXTwdl_3_1_vld),
                                             .dinXTwdl_3_1_vld_1(dinXTwdl_3_1_vld),
                                             .rd_3_Addr(rd_3_Addr),  // ufix4
                                             .rd_3_Enb(rd_3_Enb),
                                             .proc_3_enb(proc_3_enb)
                                             );

  whdlOFDMTx_RADIX22FFT_SDF1_3 u_SDF1_3_1 (.clk(clk),
                                           .reset(reset),
                                           .enb_1_32_0(enb_1_32_0),
                                           .din_3_1_re_dly(din_3_1_re_dly),  // sfix16_En14
                                           .din_3_1_im_dly(din_3_1_im_dly),  // sfix16_En14
                                           .din_3_vld_dly(din_3_vld_dly),
                                           .rd_3_Addr(rd_3_Addr),  // ufix4
                                           .rd_3_Enb(rd_3_Enb),
                                           .twdl_3_1_re(twdl_3_1_re),  // sfix16_En14
                                           .twdl_3_1_im(twdl_3_1_im),  // sfix16_En14
                                           .proc_3_enb(proc_3_enb),
                                           .dout_3_1_re(dout_3_1_re),  // sfix16_En14
                                           .dout_3_1_im(dout_3_1_im),  // sfix16_En14
                                           .dout_3_1_vld(dout_3_1_vld),
                                           .dinXTwdl_3_1_vld(dinXTwdl_3_1_vld)
                                           );

  whdlOFDMTx_RADIX22FFT_CTRL1_4 u_CTRL2_4_1 (.clk(clk),
                                             .reset(reset),
                                             .enb_1_32_0(enb_1_32_0),
                                             .dout_3_1_vld(dout_3_1_vld),
                                             .dinXTwdl_4_1_vld(dinXTwdl_4_1_vld),
                                             .rd_4_Addr(rd_4_Addr),  // ufix3
                                             .rd_4_Enb(rd_4_Enb),
                                             .proc_4_enb(proc_4_enb),
                                             .multiply_4_J(multiply_4_J)
                                             );

  whdlOFDMTx_RADIX22FFT_SDF2_4 u_SDF2_4_1 (.clk(clk),
                                           .reset(reset),
                                           .enb_1_32_0(enb_1_32_0),
                                           .dout_3_1_re(dout_3_1_re),  // sfix16_En14
                                           .dout_3_1_im(dout_3_1_im),  // sfix16_En14
                                           .dout_3_1_vld(dout_3_1_vld),
                                           .rd_4_Addr(rd_4_Addr),  // ufix3
                                           .rd_4_Enb(rd_4_Enb),
                                           .proc_4_enb(proc_4_enb),
                                           .multiply_4_J(multiply_4_J),
                                           .dout_4_1_re(dout_4_1_re),  // sfix16_En14
                                           .dout_4_1_im(dout_4_1_im),  // sfix16_En14
                                           .dout_4_1_vld(dout_4_1_vld),
                                           .dinXTwdl_4_1_vld(dinXTwdl_4_1_vld)
                                           );

  always @(posedge clk or posedge reset)
    begin : intdelay_6_process
      if (reset == 1'b1) begin
        intdelay_reg_6[0] <= 16'sb0000000000000000;
        intdelay_reg_6[1] <= 16'sb0000000000000000;
        intdelay_reg_6[2] <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_32_0) begin
          if (softReset == 1'b1) begin
            intdelay_reg_6[0] <= 16'sb0000000000000000;
            intdelay_reg_6[1] <= 16'sb0000000000000000;
            intdelay_reg_6[2] <= 16'sb0000000000000000;
          end
          else begin
            intdelay_reg_6[0] <= intdelay_reg_next_6[0];
            intdelay_reg_6[1] <= intdelay_reg_next_6[1];
            intdelay_reg_6[2] <= intdelay_reg_next_6[2];
          end
        end
      end
    end

  assign din_5_1_re_dly = intdelay_reg_6[2];
  assign intdelay_reg_next_6[0] = dout_4_1_re;
  assign intdelay_reg_next_6[1] = intdelay_reg_6[0];
  assign intdelay_reg_next_6[2] = intdelay_reg_6[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_7_process
      if (reset == 1'b1) begin
        intdelay_reg_7[0] <= 16'sb0000000000000000;
        intdelay_reg_7[1] <= 16'sb0000000000000000;
        intdelay_reg_7[2] <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_32_0) begin
          if (softReset == 1'b1) begin
            intdelay_reg_7[0] <= 16'sb0000000000000000;
            intdelay_reg_7[1] <= 16'sb0000000000000000;
            intdelay_reg_7[2] <= 16'sb0000000000000000;
          end
          else begin
            intdelay_reg_7[0] <= intdelay_reg_next_7[0];
            intdelay_reg_7[1] <= intdelay_reg_next_7[1];
            intdelay_reg_7[2] <= intdelay_reg_next_7[2];
          end
        end
      end
    end

  assign din_5_1_im_dly = intdelay_reg_7[2];
  assign intdelay_reg_next_7[0] = dout_4_1_im;
  assign intdelay_reg_next_7[1] = intdelay_reg_7[0];
  assign intdelay_reg_next_7[2] = intdelay_reg_7[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_8_process
      if (reset == 1'b1) begin
        intdelay_reg_8[0] <= 1'b0;
        intdelay_reg_8[1] <= 1'b0;
        intdelay_reg_8[2] <= 1'b0;
      end
      else begin
        if (enb_1_32_0) begin
          if (softReset == 1'b1) begin
            intdelay_reg_8[0] <= 1'b0;
            intdelay_reg_8[1] <= 1'b0;
            intdelay_reg_8[2] <= 1'b0;
          end
          else begin
            intdelay_reg_8[0] <= intdelay_reg_next_8[0];
            intdelay_reg_8[1] <= intdelay_reg_next_8[1];
            intdelay_reg_8[2] <= intdelay_reg_next_8[2];
          end
        end
      end
    end

  assign din_5_vld_dly = intdelay_reg_8[2];
  assign intdelay_reg_next_8[0] = dout_4_1_vld;
  assign intdelay_reg_next_8[1] = intdelay_reg_8[0];
  assign intdelay_reg_next_8[2] = intdelay_reg_8[1];



  whdlOFDMTx_TWDLROM_5_1 u_twdlROM_5_1 (.clk(clk),
                                        .reset(reset),
                                        .enb_1_32_0(enb_1_32_0),
                                        .dout_4_1_vld(dout_4_1_vld),
                                        .twdl_5_1_re(twdl_5_1_re),  // sfix16_En14
                                        .twdl_5_1_im(twdl_5_1_im)  // sfix16_En14
                                        );

  whdlOFDMTx_RADIX22FFT_CTRL1_5 u_CTRL1_5_1 (.clk(clk),
                                             .reset(reset),
                                             .enb_1_32_0(enb_1_32_0),
                                             .dinXTwdl_5_1_vld(dinXTwdl_5_1_vld),
                                             .dinXTwdl_5_1_vld_1(dinXTwdl_5_1_vld),
                                             .rd_5_Addr(rd_5_Addr),  // ufix2
                                             .rd_5_Enb(rd_5_Enb),
                                             .proc_5_enb(proc_5_enb)
                                             );

  whdlOFDMTx_RADIX22FFT_SDF1_5 u_SDF1_5_1 (.clk(clk),
                                           .reset(reset),
                                           .enb_1_32_0(enb_1_32_0),
                                           .din_5_1_re_dly(din_5_1_re_dly),  // sfix16_En14
                                           .din_5_1_im_dly(din_5_1_im_dly),  // sfix16_En14
                                           .din_5_vld_dly(din_5_vld_dly),
                                           .rd_5_Addr(rd_5_Addr),  // ufix2
                                           .rd_5_Enb(rd_5_Enb),
                                           .twdl_5_1_re(twdl_5_1_re),  // sfix16_En14
                                           .twdl_5_1_im(twdl_5_1_im),  // sfix16_En14
                                           .proc_5_enb(proc_5_enb),
                                           .dout_5_1_re(dout_5_1_re),  // sfix16_En14
                                           .dout_5_1_im(dout_5_1_im),  // sfix16_En14
                                           .dout_5_1_vld(dout_5_1_vld),
                                           .dinXTwdl_5_1_vld(dinXTwdl_5_1_vld)
                                           );

  whdlOFDMTx_RADIX22FFT_CTRL1_6 u_CTRL2_6_1 (.clk(clk),
                                             .reset(reset),
                                             .enb_1_32_0(enb_1_32_0),
                                             .dout_5_1_vld(dout_5_1_vld),
                                             .dinXTwdl_6_1_vld(dinXTwdl_6_1_vld),
                                             .rd_6_Addr(rd_6_Addr),  // ufix1
                                             .rd_6_Enb(rd_6_Enb),
                                             .proc_6_enb(proc_6_enb),
                                             .multiply_6_J(multiply_6_J)
                                             );

  whdlOFDMTx_RADIX22FFT_SDF2_6 u_SDF2_6_1 (.clk(clk),
                                           .reset(reset),
                                           .enb_1_32_0(enb_1_32_0),
                                           .dout_5_1_re(dout_5_1_re),  // sfix16_En14
                                           .dout_5_1_im(dout_5_1_im),  // sfix16_En14
                                           .dout_5_1_vld(dout_5_1_vld),
                                           .rd_6_Addr(rd_6_Addr),  // ufix1
                                           .rd_6_Enb(rd_6_Enb),
                                           .proc_6_enb(proc_6_enb),
                                           .multiply_6_J(multiply_6_J),
                                           .dout_6_1_re(dout_6_1_re),  // sfix16_En14
                                           .dout_6_1_im(dout_6_1_im),  // sfix16_En14
                                           .dout_6_1_vld(dout_6_1_vld),
                                           .dinXTwdl_6_1_vld(dinXTwdl_6_1_vld)
                                           );

  always @(posedge clk or posedge reset)
    begin : intdelay_9_process
      if (reset == 1'b1) begin
        intdelay_reg_9[0] <= 16'sb0000000000000000;
        intdelay_reg_9[1] <= 16'sb0000000000000000;
        intdelay_reg_9[2] <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_32_0) begin
          if (softReset == 1'b1) begin
            intdelay_reg_9[0] <= 16'sb0000000000000000;
            intdelay_reg_9[1] <= 16'sb0000000000000000;
            intdelay_reg_9[2] <= 16'sb0000000000000000;
          end
          else begin
            intdelay_reg_9[0] <= intdelay_reg_next_9[0];
            intdelay_reg_9[1] <= intdelay_reg_next_9[1];
            intdelay_reg_9[2] <= intdelay_reg_next_9[2];
          end
        end
      end
    end

  assign din_7_re_dly = intdelay_reg_9[2];
  assign intdelay_reg_next_9[0] = dout_6_1_re;
  assign intdelay_reg_next_9[1] = intdelay_reg_9[0];
  assign intdelay_reg_next_9[2] = intdelay_reg_9[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_10_process
      if (reset == 1'b1) begin
        intdelay_reg_10[0] <= 16'sb0000000000000000;
        intdelay_reg_10[1] <= 16'sb0000000000000000;
        intdelay_reg_10[2] <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_32_0) begin
          if (softReset == 1'b1) begin
            intdelay_reg_10[0] <= 16'sb0000000000000000;
            intdelay_reg_10[1] <= 16'sb0000000000000000;
            intdelay_reg_10[2] <= 16'sb0000000000000000;
          end
          else begin
            intdelay_reg_10[0] <= intdelay_reg_next_10[0];
            intdelay_reg_10[1] <= intdelay_reg_next_10[1];
            intdelay_reg_10[2] <= intdelay_reg_next_10[2];
          end
        end
      end
    end

  assign din_7_im_dly = intdelay_reg_10[2];
  assign intdelay_reg_next_10[0] = dout_6_1_im;
  assign intdelay_reg_next_10[1] = intdelay_reg_10[0];
  assign intdelay_reg_next_10[2] = intdelay_reg_10[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_11_process
      if (reset == 1'b1) begin
        intdelay_reg_11[0] <= 1'b0;
        intdelay_reg_11[1] <= 1'b0;
        intdelay_reg_11[2] <= 1'b0;
      end
      else begin
        if (enb_1_32_0) begin
          if (softReset == 1'b1) begin
            intdelay_reg_11[0] <= 1'b0;
            intdelay_reg_11[1] <= 1'b0;
            intdelay_reg_11[2] <= 1'b0;
          end
          else begin
            intdelay_reg_11[0] <= intdelay_reg_next_11[0];
            intdelay_reg_11[1] <= intdelay_reg_next_11[1];
            intdelay_reg_11[2] <= intdelay_reg_next_11[2];
          end
        end
      end
    end

  assign din_7_vld_dly = intdelay_reg_11[2];
  assign intdelay_reg_next_11[0] = dout_6_1_vld;
  assign intdelay_reg_next_11[1] = intdelay_reg_11[0];
  assign intdelay_reg_next_11[2] = intdelay_reg_11[1];



  whdlOFDMTx_TWDLROM_7_1 u_twdlROM_7 (.clk(clk),
                                      .reset(reset),
                                      .enb_1_32_0(enb_1_32_0),
                                      .dout_6_1_vld(dout_6_1_vld),
                                      .twdl_7_re(twdl_7_re),  // sfix16_En14
                                      .twdl_7_im(twdl_7_im)  // sfix16_En14
                                      );

  always @(posedge clk or posedge reset)
    begin : intdelay_12_process
      if (reset == 1'b1) begin
        rd_7_Enb_dly <= 1'b0;
      end
      else begin
        if (enb_1_32_0) begin
          if (softReset == 1'b1) begin
            rd_7_Enb_dly <= 1'b0;
          end
          else begin
            rd_7_Enb_dly <= rd_7_Enb;
          end
        end
      end
    end



  whdlOFDMTx_RADIX22FFT_CTRL1_1_block u_CTRLRX2 (.clk(clk),
                                                 .reset(reset),
                                                 .enb_1_32_0(enb_1_32_0),
                                                 .dinXTwdl_7_vld(dinXTwdl_7_vld),
                                                 .dinXTwdl_7_vld_1(dinXTwdl_7_vld),
                                                 .rd_7_Addr(rd_7_Addr),
                                                 .rd_7_Enb(rd_7_Enb),
                                                 .proc_7_enb(proc_7_enb)
                                                 );

  whdlOFDMTx_RADIX22FFT_SDF1_7 u_RADIX2 (.clk(clk),
                                         .reset(reset),
                                         .enb_1_32_0(enb_1_32_0),
                                         .din_7_re_dly(din_7_re_dly),  // sfix16_En14
                                         .din_7_im_dly(din_7_im_dly),  // sfix16_En14
                                         .din_7_vld_dly(din_7_vld_dly),
                                         .rd_7_Addr(rd_7_Addr),
                                         .rd_7_Enb_dly(rd_7_Enb_dly),
                                         .twdl_7_re(twdl_7_re),  // sfix16_En14
                                         .twdl_7_im(twdl_7_im),  // sfix16_En14
                                         .proc_7_enb(proc_7_enb),
                                         .dout_7_re(dout_7_re),  // sfix16_En14
                                         .dout_7_im(dout_7_im),  // sfix16_En14
                                         .dout_7_vld(dout_7_vld),
                                         .dinXTwdl_7_vld(dinXTwdl_7_vld)
                                         );

  whdlOFDMTx_RADIX2FFT_bitNatural u_NaturalOrder_Stage (.clk(clk),
                                                        .reset(reset),
                                                        .enb_1_32_0(enb_1_32_0),
                                                        .dout_7_re(dout_7_re),  // sfix16_En14
                                                        .dout_7_im(dout_7_im),  // sfix16_En14
                                                        .dout_7_vld(dout_7_vld),
                                                        .dout_re1(dout_re1),  // sfix16_En14
                                                        .dout_im1(dout_im1),  // sfix16_En14
                                                        .dout_vld1(dout_vld1)
                                                        );

  assign dataOut_re = dout_im1;

  assign dataOut_im = dout_re1;

  assign validOut = dout_vld1;

endmodule  // whdlOFDMTx_dsphdl_IFFT

