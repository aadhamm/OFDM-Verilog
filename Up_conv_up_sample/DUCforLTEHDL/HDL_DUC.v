// -------------------------------------------------------------
// 
// File Name: D:\OFDM\HDLImplementationOfDUCForLTEExample(Single Tone Output)\HDLImplementationOfDUCForLTEExample\hdlsrc\complex_upsampler\DUCforLTEHDL\HDL_DUC.v
// Created: 2023-05-25 17:45:34
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 4.88281e-07
// Target subsystem base rate: 4.88281e-07
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        4.88281e-07
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// Out1_re                       ce_out        4.88281e-07
// Out1_im                       ce_out        4.88281e-07
// Out2                          ce_out        4.88281e-07
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: HDL_DUC
// Source Path: DUCforLTEHDL/HDL_DUC
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module HDL_DUC
          (clk,
           reset,
           clk_enable,
           dataIn_re,
           dataIn_im,
           ValidIn,
           ce_out,
           Out1_re,
           Out1_im,
           Out2);


  input   clk;
  input   reset;
  input   clk_enable;
  input   signed [15:0] dataIn_re;  // sfix16_En15
  input   signed [15:0] dataIn_im;  // sfix16_En15
  input   ValidIn;
  output  ce_out;
  output  signed [17:0] Out1_re;  // sfix18_En16
  output  signed [17:0] Out1_im;  // sfix18_En16
  output  Out2;


  wire enb;
  wire enb_1_16_1;
  wire enb_1_1_1;
  wire signed [15:0] Upsample_zero_re;  // sfix16_En15
  wire signed [15:0] Upsample_zero_im;  // sfix16_En15
  wire signed [15:0] Upsample_muxout_re;  // sfix16_En15
  wire signed [15:0] Upsample_muxout_im;  // sfix16_En15
  reg signed [15:0] Upsample_bypass_reg_re;  // sfix16_En15
  reg signed [15:0] Upsample_bypass_reg_im;  // sfix16_En15
  wire signed [15:0] Upsample_bypassout_re;  // sfix16_En15
  wire signed [15:0] Upsample_bypassout_im;  // sfix16_En15
  wire Upsample1_zero;
  wire Upsample1_muxout;
  reg  Upsample1_bypass_reg;  // ufix1
  wire Upsample1_bypassout;
  wire signed [17:0] LP_re;  // sfix18_En14
  wire signed [17:0] LP_im;  // sfix18_En14
  wire LP_Valid;
  wire signed [17:0] HB_re;  // sfix18_En14
  wire signed [17:0] HB_im;  // sfix18_En14
  wire HB_Valid;
  wire signed [17:0] CIC_COMP_re;  // sfix18_En14
  wire signed [17:0] CIC_COMP_im;  // sfix18_En14
  wire CIC_COMP_Valid;
  wire signed [17:0] CIC2_re;  // sfix18_En12
  wire signed [17:0] CIC2_im;  // sfix18_En12
  wire CIC_Valid;
  wire signed [17:0] GC2_re;  // sfix18_En14
  wire signed [17:0] GC2_im;  // sfix18_En14
  reg signed [17:0] Delay5_reg_re [0:5];  // sfix18_En14 [6]
  reg signed [17:0] Delay5_reg_im [0:5];  // sfix18_En14 [6]
  wire signed [17:0] Delay5_reg_next_re [0:5];  // sfix18_En14 [6]
  wire signed [17:0] Delay5_reg_next_im [0:5];  // sfix18_En14 [6]
  wire signed [17:0] Delay5_out1_re;  // sfix18_En14
  wire signed [17:0] Delay5_out1_im;  // sfix18_En14
  wire signed [17:0] NCO_out1_re;  // sfix18_En16
  wire signed [17:0] NCO_out1_im;  // sfix18_En16
  wire signed [17:0] Mixer_out1_re;  // sfix18_En16
  wire signed [17:0] Mixer_out1_im;  // sfix18_En16
  reg  [0:5] Delay8_reg;  // ufix1 [6]
  wire [0:5] Delay8_reg_next;  // ufix1 [6]
  wire Delay8_out1;


  HDL_DUC_tc u_HDL_DUC_tc (.clk(clk),
                           .reset(reset),
                           .clk_enable(clk_enable),
                           .enb(enb),
                           .enb_1_1_1(enb_1_1_1),
                           .enb_1_16_1(enb_1_16_1)
                           );

  // Upsample: Upsample by 16, Sample offset 0 
  assign Upsample_zero_re = 16'sb0000000000000000;
  assign Upsample_zero_im = 16'sb0000000000000000;



  assign Upsample_muxout_re = (enb_1_16_1 == 1'b1 ? dataIn_re :
              Upsample_zero_re);
  assign Upsample_muxout_im = (enb_1_16_1 == 1'b1 ? dataIn_im :
              Upsample_zero_im);



  // Upsample bypass register
  always @(posedge clk or posedge reset)
    begin : Upsample_bypass_process
      if (reset == 1'b1) begin
        Upsample_bypass_reg_re <= 16'sb0000000000000000;
        Upsample_bypass_reg_im <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_1_1) begin
          Upsample_bypass_reg_im <= Upsample_muxout_im;
          Upsample_bypass_reg_re <= Upsample_muxout_re;
        end
      end
    end

  assign Upsample_bypassout_re = (enb_1_1_1 == 1'b1 ? Upsample_muxout_re :
              Upsample_bypass_reg_re);
  assign Upsample_bypassout_im = (enb_1_1_1 == 1'b1 ? Upsample_muxout_im :
              Upsample_bypass_reg_im);



  // Upsample1: Upsample by 16, Sample offset 0 
  assign Upsample1_zero = 1'b0;



  assign Upsample1_muxout = (enb_1_16_1 == 1'b1 ? ValidIn :
              Upsample1_zero);



  // Upsample bypass register
  always @(posedge clk or posedge reset)
    begin : Upsample1_bypass_process
      if (reset == 1'b1) begin
        Upsample1_bypass_reg <= 1'b0;
      end
      else begin
        if (enb_1_1_1) begin
          Upsample1_bypass_reg <= Upsample1_muxout;
        end
      end
    end

  assign Upsample1_bypassout = (enb_1_1_1 == 1'b1 ? Upsample1_muxout :
              Upsample1_bypass_reg);



  Lowpass_Interpolator u_Lowpass_Interpolator (.clk(clk),
                                               .reset(reset),
                                               .enb(enb),
                                               .dataIn_re(Upsample_bypassout_re),  // sfix16_En15
                                               .dataIn_im(Upsample_bypassout_im),  // sfix16_En15
                                               .validIn(Upsample1_bypassout),
                                               .dataOut_re(LP_re),  // sfix18_En14
                                               .dataOut_im(LP_im),  // sfix18_En14
                                               .validOut(LP_Valid)
                                               );

  Halfband_Interpolator u_Halfband_Interpolator (.clk(clk),
                                                 .reset(reset),
                                                 .enb(enb),
                                                 .dataIn_re(LP_re),  // sfix18_En14
                                                 .dataIn_im(LP_im),  // sfix18_En14
                                                 .validIn(LP_Valid),
                                                 .dataOut_re(HB_re),  // sfix18_En14
                                                 .dataOut_im(HB_im),  // sfix18_En14
                                                 .validOut(HB_Valid)
                                                 );

  CIC_Compensation_Interpolator u_CIC_Compensation_Interpolator (.clk(clk),
                                                                 .reset(reset),
                                                                 .enb(enb),
                                                                 .dataIn_re(HB_re),  // sfix18_En14
                                                                 .dataIn_im(HB_im),  // sfix18_En14
                                                                 .validIn(HB_Valid),
                                                                 .dataOut_re(CIC_COMP_re),  // sfix18_En14
                                                                 .dataOut_im(CIC_COMP_im),  // sfix18_En14
                                                                 .validOut(CIC_COMP_Valid)
                                                                 );

  // StartHere
  CICInterpolator u_CIC_Interpolator_inst (.clk(clk),
                                           .reset(reset),
                                           .enb(enb),
                                           .dataIn_re(CIC_COMP_re),  // sfix18_En14
                                           .dataIn_im(CIC_COMP_im),  // sfix18_En14
                                           .validIn(CIC_COMP_Valid),
                                           .dataOut_re(CIC2_re),  // sfix18_En12
                                           .dataOut_im(CIC2_im),  // sfix18_En12
                                           .validOut(CIC_Valid)
                                           );

  Gain_Correction u_Gain_Correction (.dataIn_re(CIC2_re),  // sfix18_En12
                                     .dataIn_im(CIC2_im),  // sfix18_En12
                                     .dataOut_re(GC2_re),  // sfix18_En14
                                     .dataOut_im(GC2_im)  // sfix18_En14
                                     );

  always @(posedge clk or posedge reset)
    begin : Delay5_process
      if (reset == 1'b1) begin
        Delay5_reg_re[0] <= 18'sb000000000000000000;
        Delay5_reg_im[0] <= 18'sb000000000000000000;
        Delay5_reg_re[1] <= 18'sb000000000000000000;
        Delay5_reg_im[1] <= 18'sb000000000000000000;
        Delay5_reg_re[2] <= 18'sb000000000000000000;
        Delay5_reg_im[2] <= 18'sb000000000000000000;
        Delay5_reg_re[3] <= 18'sb000000000000000000;
        Delay5_reg_im[3] <= 18'sb000000000000000000;
        Delay5_reg_re[4] <= 18'sb000000000000000000;
        Delay5_reg_im[4] <= 18'sb000000000000000000;
        Delay5_reg_re[5] <= 18'sb000000000000000000;
        Delay5_reg_im[5] <= 18'sb000000000000000000;
      end
      else begin
        if (enb) begin
          Delay5_reg_re[0] <= Delay5_reg_next_re[0];
          Delay5_reg_im[0] <= Delay5_reg_next_im[0];
          Delay5_reg_re[1] <= Delay5_reg_next_re[1];
          Delay5_reg_im[1] <= Delay5_reg_next_im[1];
          Delay5_reg_re[2] <= Delay5_reg_next_re[2];
          Delay5_reg_im[2] <= Delay5_reg_next_im[2];
          Delay5_reg_re[3] <= Delay5_reg_next_re[3];
          Delay5_reg_im[3] <= Delay5_reg_next_im[3];
          Delay5_reg_re[4] <= Delay5_reg_next_re[4];
          Delay5_reg_im[4] <= Delay5_reg_next_im[4];
          Delay5_reg_re[5] <= Delay5_reg_next_re[5];
          Delay5_reg_im[5] <= Delay5_reg_next_im[5];
        end
      end
    end

  assign Delay5_out1_re = Delay5_reg_re[5];
  assign Delay5_out1_im = Delay5_reg_im[5];
  assign Delay5_reg_next_re[0] = GC2_re;
  assign Delay5_reg_next_im[0] = GC2_im;
  assign Delay5_reg_next_re[1] = Delay5_reg_re[0];
  assign Delay5_reg_next_im[1] = Delay5_reg_im[0];
  assign Delay5_reg_next_re[2] = Delay5_reg_re[1];
  assign Delay5_reg_next_im[2] = Delay5_reg_im[1];
  assign Delay5_reg_next_re[3] = Delay5_reg_re[2];
  assign Delay5_reg_next_im[3] = Delay5_reg_im[2];
  assign Delay5_reg_next_re[4] = Delay5_reg_re[3];
  assign Delay5_reg_next_im[4] = Delay5_reg_im[3];
  assign Delay5_reg_next_re[5] = Delay5_reg_re[4];
  assign Delay5_reg_next_im[5] = Delay5_reg_im[4];



  NCO u_NCO (.clk(clk),
             .reset(reset),
             .enb(enb),
             .validIn(CIC_Valid),
             .complexexp_re(NCO_out1_re),  // sfix18_En16
             .complexexp_im(NCO_out1_im)  // sfix18_En16
             );

  Mixer u_Mixer (.clk(clk),
                 .enb(enb),
                 .dataIn_re(Delay5_out1_re),  // sfix18_En14
                 .dataIn_im(Delay5_out1_im),  // sfix18_En14
                 .ncoIn_re(NCO_out1_re),  // sfix18_En16
                 .ncoIn_im(NCO_out1_im),  // sfix18_En16
                 .mixedOut_re(Mixer_out1_re),  // sfix18_En16
                 .mixedOut_im(Mixer_out1_im)  // sfix18_En16
                 );

  assign Out1_re = Mixer_out1_re;

  assign Out1_im = Mixer_out1_im;

  always @(posedge clk or posedge reset)
    begin : Delay8_process
      if (reset == 1'b1) begin
        Delay8_reg[0] <= 1'b0;
        Delay8_reg[1] <= 1'b0;
        Delay8_reg[2] <= 1'b0;
        Delay8_reg[3] <= 1'b0;
        Delay8_reg[4] <= 1'b0;
        Delay8_reg[5] <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay8_reg[0] <= Delay8_reg_next[0];
          Delay8_reg[1] <= Delay8_reg_next[1];
          Delay8_reg[2] <= Delay8_reg_next[2];
          Delay8_reg[3] <= Delay8_reg_next[3];
          Delay8_reg[4] <= Delay8_reg_next[4];
          Delay8_reg[5] <= Delay8_reg_next[5];
        end
      end
    end

  assign Delay8_out1 = Delay8_reg[5];
  assign Delay8_reg_next[0] = CIC_Valid;
  assign Delay8_reg_next[1] = Delay8_reg[0];
  assign Delay8_reg_next[2] = Delay8_reg[1];
  assign Delay8_reg_next[3] = Delay8_reg[2];
  assign Delay8_reg_next[4] = Delay8_reg[3];
  assign Delay8_reg_next[5] = Delay8_reg[4];



  assign Out2 = Delay8_out1;

  assign ce_out = enb_1_1_1;

endmodule  // HDL_DUC

