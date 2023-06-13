// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Synchronization_Sequence.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Synchronization_Sequence
// Source Path: whdlOFDMTx/Frame Generator/Synchronization Sequence
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Synchronization_Sequence
          (clk,
           reset,
           enb,
           enb_1_2_0,
           ss_set,
           ss_re,
           ss_im,
           ssValid);


  input   clk;
  input   reset;
  input   enb;
  input   enb_1_2_0;
  input   ss_set;
  output  signed [15:0] ss_re;  // sfix16_En14
  output  signed [15:0] ss_im;  // sfix16_En14
  output  ssValid;


  reg  Upsample_muxsel;  // ufix1
  wire [6:0] count_step;  // ufix7
  wire [6:0] count_from;  // ufix7
  reg [6:0] SS_Counter_out1;  // ufix7
  wire [6:0] count;  // ufix7
  wire need_to_wrap;
  wire [6:0] count_value;  // ufix7
  wire [6:0] count_1;  // ufix7
  wire [6:0] SS_LUT_k;  // ufix7
  wire signed [15:0] SS_LUT_table_data_re [0:71];  // sfix16_En14 [72]
  wire signed [15:0] SS_LUT_table_data_im [0:71];  // sfix16_En14 [72]
  wire signed [15:0] SS_LUT_out1_re;  // sfix16_En14
  wire signed [15:0] SS_LUT_out1_im;  // sfix16_En14
  reg signed [15:0] Delay_out1_re;  // sfix16_En14
  reg signed [15:0] Delay_out1_im;  // sfix16_En14
  wire signed [15:0] Upsample_zero_re;  // sfix16_En14
  wire signed [15:0] Upsample_zero_im;  // sfix16_En14
  wire signed [15:0] Upsample_out1_re;  // sfix16_En14
  wire signed [15:0] Upsample_out1_im;  // sfix16_En14
  reg  Upsample1_muxsel;  // ufix1
  reg  Delay2_out1;
  wire Upsample1_zero;
  wire Upsample1_out1;

  // Upsampling is done to compensate the rate change due to Convolutional Encoder 
  // in Header and Data subsystems.
  // Access synchronization sequence from LUT.


  // Free running, Unsigned Counter
  //  initial value   = 1
  //  step value      = 1
  // Upsample: Upsample by 2, Sample offset 0 
  always @(posedge clk or posedge reset)
    begin : Upsample_cnt_process
      if (reset == 1'b1) begin
        Upsample_muxsel <= 1'b1;
      end
      else begin
        if (enb) begin
          Upsample_muxsel <=  ~ Upsample_muxsel;
        end
      end
    end



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 71
  assign count_step = 7'b0000001;



  assign count_from = 7'b0000000;



  assign count = SS_Counter_out1 + count_step;



  assign need_to_wrap = SS_Counter_out1 == 7'b1000111;



  assign count_value = (need_to_wrap == 1'b0 ? count :
              count_from);



  assign count_1 = (ss_set == 1'b0 ? SS_Counter_out1 :
              count_value);



  always @(posedge clk or posedge reset)
    begin : SS_Counter_process
      if (reset == 1'b1) begin
        SS_Counter_out1 <= 7'b0000000;
      end
      else begin
        if (enb_1_2_0) begin
          SS_Counter_out1 <= count_1;
        end
      end
    end



  assign SS_LUT_table_data_re[0] = 16'sb0000000000000000;
  assign SS_LUT_table_data_re[1] = 16'sb0000000000000000;
  assign SS_LUT_table_data_re[2] = 16'sb0000000000000000;
  assign SS_LUT_table_data_re[3] = 16'sb0000000000000000;
  assign SS_LUT_table_data_re[4] = 16'sb0000000000000000;
  assign SS_LUT_table_data_re[5] = 16'sb0100000000000000;
  assign SS_LUT_table_data_re[6] = 16'sb1100110011111100;
  assign SS_LUT_table_data_re[7] = 16'sb0001011101100010;
  assign SS_LUT_table_data_re[8] = 16'sb1101000100010110;
  assign SS_LUT_table_data_re[9] = 16'sb0011111010111011;
  assign SS_LUT_table_data_re[10] = 16'sb0011110100101000;
  assign SS_LUT_table_data_re[11] = 16'sb1110000000000000;
  assign SS_LUT_table_data_re[12] = 16'sb0011000100000111;
  assign SS_LUT_table_data_re[13] = 16'sb1111000111000010;
  assign SS_LUT_table_data_re[14] = 16'sb0010011111100111;
  assign SS_LUT_table_data_re[15] = 16'sb0001110100110011;
  assign SS_LUT_table_data_re[16] = 16'sb0001011101100010;
  assign SS_LUT_table_data_re[17] = 16'sb0011110100101000;
  assign SS_LUT_table_data_re[18] = 16'sb0011000100000111;
  assign SS_LUT_table_data_re[19] = 16'sb1110000000000000;
  assign SS_LUT_table_data_re[20] = 16'sb1101000100010110;
  assign SS_LUT_table_data_re[21] = 16'sb0011111010111011;
  assign SS_LUT_table_data_re[22] = 16'sb1111000111000010;
  assign SS_LUT_table_data_re[23] = 16'sb0010011111100111;
  assign SS_LUT_table_data_re[24] = 16'sb1100110011111100;
  assign SS_LUT_table_data_re[25] = 16'sb1110000000000000;
  assign SS_LUT_table_data_re[26] = 16'sb1110000000000000;
  assign SS_LUT_table_data_re[27] = 16'sb1100110011111100;
  assign SS_LUT_table_data_re[28] = 16'sb1100000010110111;
  assign SS_LUT_table_data_re[29] = 16'sb0011110100101000;
  assign SS_LUT_table_data_re[30] = 16'sb0011111010111011;
  assign SS_LUT_table_data_re[31] = 16'sb1111000111000010;
  assign SS_LUT_table_data_re[32] = 16'sb0100000000000000;
  assign SS_LUT_table_data_re[33] = 16'sb0011000100000111;
  assign SS_LUT_table_data_re[34] = 16'sb1101000100010110;
  assign SS_LUT_table_data_re[35] = 16'sb1100000010110111;
  assign SS_LUT_table_data_re[36] = 16'sb1100000010110111;
  assign SS_LUT_table_data_re[37] = 16'sb1101000100010110;
  assign SS_LUT_table_data_re[38] = 16'sb0011000100000111;
  assign SS_LUT_table_data_re[39] = 16'sb0100000000000000;
  assign SS_LUT_table_data_re[40] = 16'sb1111000111000010;
  assign SS_LUT_table_data_re[41] = 16'sb0011111010111011;
  assign SS_LUT_table_data_re[42] = 16'sb0011110100101000;
  assign SS_LUT_table_data_re[43] = 16'sb1100000010110111;
  assign SS_LUT_table_data_re[44] = 16'sb1100110011111100;
  assign SS_LUT_table_data_re[45] = 16'sb1110000000000000;
  assign SS_LUT_table_data_re[46] = 16'sb1110000000000000;
  assign SS_LUT_table_data_re[47] = 16'sb1100110011111100;
  assign SS_LUT_table_data_re[48] = 16'sb0010011111100111;
  assign SS_LUT_table_data_re[49] = 16'sb1111000111000010;
  assign SS_LUT_table_data_re[50] = 16'sb0011111010111011;
  assign SS_LUT_table_data_re[51] = 16'sb1101000100010110;
  assign SS_LUT_table_data_re[52] = 16'sb1110000000000000;
  assign SS_LUT_table_data_re[53] = 16'sb0011000100000111;
  assign SS_LUT_table_data_re[54] = 16'sb0011110100101000;
  assign SS_LUT_table_data_re[55] = 16'sb0001011101100010;
  assign SS_LUT_table_data_re[56] = 16'sb0001110100110011;
  assign SS_LUT_table_data_re[57] = 16'sb0010011111100111;
  assign SS_LUT_table_data_re[58] = 16'sb1111000111000010;
  assign SS_LUT_table_data_re[59] = 16'sb0011000100000111;
  assign SS_LUT_table_data_re[60] = 16'sb1110000000000000;
  assign SS_LUT_table_data_re[61] = 16'sb0011110100101000;
  assign SS_LUT_table_data_re[62] = 16'sb0011111010111011;
  assign SS_LUT_table_data_re[63] = 16'sb1101000100010110;
  assign SS_LUT_table_data_re[64] = 16'sb0001011101100010;
  assign SS_LUT_table_data_re[65] = 16'sb1100110011111100;
  assign SS_LUT_table_data_re[66] = 16'sb0100000000000000;
  assign SS_LUT_table_data_re[67] = 16'sb0000000000000000;
  assign SS_LUT_table_data_re[68] = 16'sb0000000000000000;
  assign SS_LUT_table_data_re[69] = 16'sb0000000000000000;
  assign SS_LUT_table_data_re[70] = 16'sb0000000000000000;
  assign SS_LUT_table_data_re[71] = 16'sb0000000000000000;
  assign SS_LUT_table_data_im[0] = 16'sb0000000000000000;
  assign SS_LUT_table_data_im[1] = 16'sb0000000000000000;
  assign SS_LUT_table_data_im[2] = 16'sb0000000000000000;
  assign SS_LUT_table_data_im[3] = 16'sb0000000000000000;
  assign SS_LUT_table_data_im[4] = 16'sb0000000000000000;
  assign SS_LUT_table_data_im[5] = 16'sb0000000000000000;
  assign SS_LUT_table_data_im[6] = 16'sb1101100101011011;
  assign SS_LUT_table_data_im[7] = 16'sb1100010001101101;
  assign SS_LUT_table_data_im[8] = 16'sb1101010001111000;
  assign SS_LUT_table_data_im[9] = 16'sb0000110010101110;
  assign SS_LUT_table_data_im[10] = 16'sb0001001011011101;
  assign SS_LUT_table_data_im[11] = 16'sb1100100010010011;
  assign SS_LUT_table_data_im[12] = 16'sb1101011011011101;
  assign SS_LUT_table_data_im[13] = 16'sb1100000110011011;
  assign SS_LUT_table_data_im[14] = 16'sb0011001000001010;
  assign SS_LUT_table_data_im[15] = 16'sb0011100011110100;
  assign SS_LUT_table_data_im[16] = 16'sb1100010001101101;
  assign SS_LUT_table_data_im[17] = 16'sb0001001011011101;
  assign SS_LUT_table_data_im[18] = 16'sb1101011011011101;
  assign SS_LUT_table_data_im[19] = 16'sb0011011101101101;
  assign SS_LUT_table_data_im[20] = 16'sb0010101110001000;
  assign SS_LUT_table_data_im[21] = 16'sb0000110010101110;
  assign SS_LUT_table_data_im[22] = 16'sb0011111001100101;
  assign SS_LUT_table_data_im[23] = 16'sb0011001000001010;
  assign SS_LUT_table_data_im[24] = 16'sb1101100101011011;
  assign SS_LUT_table_data_im[25] = 16'sb1100100010010011;
  assign SS_LUT_table_data_im[26] = 16'sb0011011101101101;
  assign SS_LUT_table_data_im[27] = 16'sb1101100101011011;
  assign SS_LUT_table_data_im[28] = 16'sb0000100110001010;
  assign SS_LUT_table_data_im[29] = 16'sb1110110100100011;
  assign SS_LUT_table_data_im[30] = 16'sb0000110010101110;
  assign SS_LUT_table_data_im[31] = 16'sb1100000110011011;
  assign SS_LUT_table_data_im[32] = 16'sb0000000000000000;
  assign SS_LUT_table_data_im[33] = 16'sb1101011011011101;
  assign SS_LUT_table_data_im[34] = 16'sb0010101110001000;
  assign SS_LUT_table_data_im[35] = 16'sb0000100110001010;
  assign SS_LUT_table_data_im[36] = 16'sb0000100110001010;
  assign SS_LUT_table_data_im[37] = 16'sb0010101110001000;
  assign SS_LUT_table_data_im[38] = 16'sb1101011011011101;
  assign SS_LUT_table_data_im[39] = 16'sb0000000000000000;
  assign SS_LUT_table_data_im[40] = 16'sb1100000110011011;
  assign SS_LUT_table_data_im[41] = 16'sb0000110010101110;
  assign SS_LUT_table_data_im[42] = 16'sb1110110100100011;
  assign SS_LUT_table_data_im[43] = 16'sb0000100110001010;
  assign SS_LUT_table_data_im[44] = 16'sb1101100101011011;
  assign SS_LUT_table_data_im[45] = 16'sb0011011101101101;
  assign SS_LUT_table_data_im[46] = 16'sb1100100010010011;
  assign SS_LUT_table_data_im[47] = 16'sb1101100101011011;
  assign SS_LUT_table_data_im[48] = 16'sb0011001000001010;
  assign SS_LUT_table_data_im[49] = 16'sb0011111001100101;
  assign SS_LUT_table_data_im[50] = 16'sb0000110010101110;
  assign SS_LUT_table_data_im[51] = 16'sb0010101110001000;
  assign SS_LUT_table_data_im[52] = 16'sb0011011101101101;
  assign SS_LUT_table_data_im[53] = 16'sb1101011011011101;
  assign SS_LUT_table_data_im[54] = 16'sb0001001011011101;
  assign SS_LUT_table_data_im[55] = 16'sb1100010001101101;
  assign SS_LUT_table_data_im[56] = 16'sb0011100011110100;
  assign SS_LUT_table_data_im[57] = 16'sb0011001000001010;
  assign SS_LUT_table_data_im[58] = 16'sb1100000110011011;
  assign SS_LUT_table_data_im[59] = 16'sb1101011011011101;
  assign SS_LUT_table_data_im[60] = 16'sb1100100010010011;
  assign SS_LUT_table_data_im[61] = 16'sb0001001011011101;
  assign SS_LUT_table_data_im[62] = 16'sb0000110010101110;
  assign SS_LUT_table_data_im[63] = 16'sb1101010001111000;
  assign SS_LUT_table_data_im[64] = 16'sb1100010001101101;
  assign SS_LUT_table_data_im[65] = 16'sb1101100101011011;
  assign SS_LUT_table_data_im[66] = 16'sb0000000000000000;
  assign SS_LUT_table_data_im[67] = 16'sb0000000000000000;
  assign SS_LUT_table_data_im[68] = 16'sb0000000000000000;
  assign SS_LUT_table_data_im[69] = 16'sb0000000000000000;
  assign SS_LUT_table_data_im[70] = 16'sb0000000000000000;
  assign SS_LUT_table_data_im[71] = 16'sb0000000000000000;
  assign SS_LUT_k = (SS_Counter_out1 == 7'b0000000 ? 7'b0000000 :
              (SS_Counter_out1 >= 7'b1000111 ? 7'b1000111 :
              SS_Counter_out1));
  assign SS_LUT_out1_re = SS_LUT_table_data_re[SS_LUT_k];
  assign SS_LUT_out1_im = SS_LUT_table_data_im[SS_LUT_k];



  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1_re <= 16'sb0000000000000000;
        Delay_out1_im <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_2_0) begin
          Delay_out1_re <= SS_LUT_out1_re;
          Delay_out1_im <= SS_LUT_out1_im;
        end
      end
    end



  assign Upsample_zero_re = 16'sb0000000000000000;
  assign Upsample_zero_im = 16'sb0000000000000000;



  assign Upsample_out1_re = (Upsample_muxsel == 1'b1 ? Delay_out1_re :
              Upsample_zero_re);
  assign Upsample_out1_im = (Upsample_muxsel == 1'b1 ? Delay_out1_im :
              Upsample_zero_im);



  assign ss_re = Upsample_out1_re;

  assign ss_im = Upsample_out1_im;

  // Free running, Unsigned Counter
  //  initial value   = 1
  //  step value      = 1
  // Upsample1: Upsample by 2, Sample offset 0 
  always @(posedge clk or posedge reset)
    begin : Upsample1_cnt_process
      if (reset == 1'b1) begin
        Upsample1_muxsel <= 1'b1;
      end
      else begin
        if (enb) begin
          Upsample1_muxsel <=  ~ Upsample1_muxsel;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        Delay2_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay2_out1 <= ss_set;
        end
      end
    end



  assign Upsample1_zero = 1'b0;



  assign Upsample1_out1 = (Upsample1_muxsel == 1'b1 ? Delay2_out1 :
              Upsample1_zero);



  assign ssValid = Upsample1_out1;

endmodule  // whdlOFDMTx_Synchronization_Sequence
