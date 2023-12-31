// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Reference_Signals.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Reference_Signals
// Source Path: whdlOFDMTx/Frame Generator/Reference Signals
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Reference_Signals
          (clk,
           reset,
           enb,
           enb_1_2_0,
           rs_set,
           rs,
           rsValid);


  input   clk;
  input   reset;
  input   enb;
  input   enb_1_2_0;
  input   rs_set;
  output  signed [15:0] rs;  // sfix16_En14
  output  rsValid;


  reg  Upsample_muxsel;  // ufix1
  wire [6:0] count_step;  // ufix7
  wire [6:0] count_from;  // ufix7
  reg [6:0] RS_Counter_out1;  // ufix7
  wire [6:0] count;  // ufix7
  wire need_to_wrap;
  wire [6:0] count_value;  // ufix7
  wire [6:0] count_1;  // ufix7
  wire [6:0] RS_LUT_k;  // ufix7
  wire signed [15:0] RS_LUT_table_data [0:71];  // sfix16_En14 [72]
  wire signed [15:0] RS_LUT_out1;  // sfix16_En14
  reg signed [15:0] Delay_out1;  // sfix16_En14
  wire signed [15:0] Upsample_zero;  // sfix16_En14
  wire signed [15:0] Upsample_out1;  // sfix16_En14
  reg  Upsample1_muxsel;  // ufix1
  reg  Delay2_out1;
  wire Upsample1_zero;
  wire Upsample1_out1;

  // Upsampling is done to compensate the rate change due to Convolutional Encoder 
  // in Header and Data subsystems.
  // Access reference signal from LUT.


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



  assign count = RS_Counter_out1 + count_step;



  assign need_to_wrap = RS_Counter_out1 == 7'b1000111;



  assign count_value = (need_to_wrap == 1'b0 ? count :
              count_from);



  assign count_1 = (rs_set == 1'b0 ? RS_Counter_out1 :
              count_value);



  always @(posedge clk or posedge reset)
    begin : RS_Counter_process
      if (reset == 1'b1) begin
        RS_Counter_out1 <= 7'b0000000;
      end
      else begin
        if (enb_1_2_0) begin
          RS_Counter_out1 <= count_1;
        end
      end
    end



  assign RS_LUT_table_data[0] = 16'sb1100000000000000;
  assign RS_LUT_table_data[1] = 16'sb1100000000000000;
  assign RS_LUT_table_data[2] = 16'sb0100000000000000;
  assign RS_LUT_table_data[3] = 16'sb1100000000000000;
  assign RS_LUT_table_data[4] = 16'sb0100000000000000;
  assign RS_LUT_table_data[5] = 16'sb1100000000000000;
  assign RS_LUT_table_data[6] = 16'sb0100000000000000;
  assign RS_LUT_table_data[7] = 16'sb0100000000000000;
  assign RS_LUT_table_data[8] = 16'sb0100000000000000;
  assign RS_LUT_table_data[9] = 16'sb0100000000000000;
  assign RS_LUT_table_data[10] = 16'sb0100000000000000;
  assign RS_LUT_table_data[11] = 16'sb0100000000000000;
  assign RS_LUT_table_data[12] = 16'sb1100000000000000;
  assign RS_LUT_table_data[13] = 16'sb1100000000000000;
  assign RS_LUT_table_data[14] = 16'sb0100000000000000;
  assign RS_LUT_table_data[15] = 16'sb0100000000000000;
  assign RS_LUT_table_data[16] = 16'sb1100000000000000;
  assign RS_LUT_table_data[17] = 16'sb0100000000000000;
  assign RS_LUT_table_data[18] = 16'sb1100000000000000;
  assign RS_LUT_table_data[19] = 16'sb0100000000000000;
  assign RS_LUT_table_data[20] = 16'sb0100000000000000;
  assign RS_LUT_table_data[21] = 16'sb0100000000000000;
  assign RS_LUT_table_data[22] = 16'sb0100000000000000;
  assign RS_LUT_table_data[23] = 16'sb0100000000000000;
  assign RS_LUT_table_data[24] = 16'sb0100000000000000;
  assign RS_LUT_table_data[25] = 16'sb1100000000000000;
  assign RS_LUT_table_data[26] = 16'sb1100000000000000;
  assign RS_LUT_table_data[27] = 16'sb0100000000000000;
  assign RS_LUT_table_data[28] = 16'sb0100000000000000;
  assign RS_LUT_table_data[29] = 16'sb1100000000000000;
  assign RS_LUT_table_data[30] = 16'sb0100000000000000;
  assign RS_LUT_table_data[31] = 16'sb1100000000000000;
  assign RS_LUT_table_data[32] = 16'sb0100000000000000;
  assign RS_LUT_table_data[33] = 16'sb0100000000000000;
  assign RS_LUT_table_data[34] = 16'sb0100000000000000;
  assign RS_LUT_table_data[35] = 16'sb0100000000000000;
  assign RS_LUT_table_data[36] = 16'sb0100000000000000;
  assign RS_LUT_table_data[37] = 16'sb1100000000000000;
  assign RS_LUT_table_data[38] = 16'sb1100000000000000;
  assign RS_LUT_table_data[39] = 16'sb0100000000000000;
  assign RS_LUT_table_data[40] = 16'sb0100000000000000;
  assign RS_LUT_table_data[41] = 16'sb1100000000000000;
  assign RS_LUT_table_data[42] = 16'sb0100000000000000;
  assign RS_LUT_table_data[43] = 16'sb1100000000000000;
  assign RS_LUT_table_data[44] = 16'sb0100000000000000;
  assign RS_LUT_table_data[45] = 16'sb1100000000000000;
  assign RS_LUT_table_data[46] = 16'sb1100000000000000;
  assign RS_LUT_table_data[47] = 16'sb1100000000000000;
  assign RS_LUT_table_data[48] = 16'sb1100000000000000;
  assign RS_LUT_table_data[49] = 16'sb1100000000000000;
  assign RS_LUT_table_data[50] = 16'sb0100000000000000;
  assign RS_LUT_table_data[51] = 16'sb0100000000000000;
  assign RS_LUT_table_data[52] = 16'sb1100000000000000;
  assign RS_LUT_table_data[53] = 16'sb1100000000000000;
  assign RS_LUT_table_data[54] = 16'sb0100000000000000;
  assign RS_LUT_table_data[55] = 16'sb1100000000000000;
  assign RS_LUT_table_data[56] = 16'sb0100000000000000;
  assign RS_LUT_table_data[57] = 16'sb1100000000000000;
  assign RS_LUT_table_data[58] = 16'sb0100000000000000;
  assign RS_LUT_table_data[59] = 16'sb0100000000000000;
  assign RS_LUT_table_data[60] = 16'sb0100000000000000;
  assign RS_LUT_table_data[61] = 16'sb0100000000000000;
  assign RS_LUT_table_data[62] = 16'sb0100000000000000;
  assign RS_LUT_table_data[63] = 16'sb0100000000000000;
  assign RS_LUT_table_data[64] = 16'sb1100000000000000;
  assign RS_LUT_table_data[65] = 16'sb1100000000000000;
  assign RS_LUT_table_data[66] = 16'sb0100000000000000;
  assign RS_LUT_table_data[67] = 16'sb0100000000000000;
  assign RS_LUT_table_data[68] = 16'sb1100000000000000;
  assign RS_LUT_table_data[69] = 16'sb0100000000000000;
  assign RS_LUT_table_data[70] = 16'sb1100000000000000;
  assign RS_LUT_table_data[71] = 16'sb0100000000000000;
  assign RS_LUT_k = (RS_Counter_out1 == 7'b0000000 ? 7'b0000000 :
              (RS_Counter_out1 >= 7'b1000111 ? 7'b1000111 :
              RS_Counter_out1));
  assign RS_LUT_out1 = RS_LUT_table_data[RS_LUT_k];



  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_2_0) begin
          Delay_out1 <= RS_LUT_out1;
        end
      end
    end



  assign Upsample_zero = 16'sb0000000000000000;



  assign Upsample_out1 = (Upsample_muxsel == 1'b1 ? Delay_out1 :
              Upsample_zero);



  assign rs = Upsample_out1;

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
          Delay2_out1 <= rs_set;
        end
      end
    end



  assign Upsample1_zero = 1'b0;



  assign Upsample1_out1 = (Upsample1_muxsel == 1'b1 ? Delay2_out1 :
              Upsample1_zero);



  assign rsValid = Upsample1_out1;

endmodule  // whdlOFDMTx_Reference_Signals

