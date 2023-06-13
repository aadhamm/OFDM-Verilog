// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Scrambler.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Scrambler
// Source Path: whdlOFDMTx/Frame Generator/Data/Data Chain/Scrambler
// Hierarchy Level: 5
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Scrambler
          (clk,
           reset,
           enb_1_2_0,
           dataIn,
           startIn,
           endIn,
           validIn,
           dataOut,
           startOut,
           endOut,
           validOut);


  input   clk;
  input   reset;
  input   enb_1_2_0;
  input   dataIn;
  input   startIn;
  input   endIn;
  input   validIn;
  output  dataOut;
  output  startOut;
  output  endOut;
  output  validOut;


  reg  Delay14_out1;
  reg  Delay_out1;
  reg  Delay15_out1;
  reg  Delay1_out1;
  reg  Delay12_out1;
  wire switch_compare_1;
  wire LFSR_Enable;
  wire [6:0] Constant_out1;  // ufix7
  wire [6:0] Bit_Shift_out1;  // ufix7
  wire [6:0] Bit_Set_out1;  // ufix7
  reg [6:0] LFSR_state;  // ufix7
  wire [6:0] Bit_Clear_out1;  // ufix7
  wire Extract_Bits1_out1;  // ufix1_E6
  wire Extract_Bits1_out1_is_not0;
  wire dtc1;  // ufix1_E3
  wire Extract_Bits_out1;  // ufix1_E3
  wire Extract_Bits_out1_is_not0;
  wire Logical_Operator_out1;
  wire switch_compare_1_1;
  wire [6:0] Switch1_out1;  // ufix7
  wire [6:0] LFSR_In;  // ufix7
  reg  Delay2_out1;
  wire dtc1_1;  // ufix1
  wire scramblingSequence;  // ufix1
  wire Logical_Operator2_out1;
  reg  Delay8_out1;
  reg  Delay4_out1;
  reg  Delay6_out1;
  reg  Delay10_out1;
  reg  Delay13_out1;
  reg  Delay5_out1;
  reg  Delay7_out1;
  reg  Delay11_out1;
  reg  Delay3_out1;
  reg  Delay9_out1;

  // polynomial: 1 0 0 1 0 0 0


  always @(posedge clk or posedge reset)
    begin : Delay14_process
      if (reset == 1'b1) begin
        Delay14_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay14_out1 <= dataIn;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay_out1 <= Delay14_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay15_process
      if (reset == 1'b1) begin
        Delay15_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay15_out1 <= validIn;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay1_out1 <= Delay15_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay12_process
      if (reset == 1'b1) begin
        Delay12_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay12_out1 <= startIn;
        end
      end
    end



  assign switch_compare_1 = Delay12_out1 == 1'b1;



  assign LFSR_Enable = Delay1_out1 | Delay12_out1;



  assign Constant_out1 = 7'b1011101;



  assign Bit_Set_out1 = Bit_Shift_out1 | 7'b0000001;



  assign Bit_Shift_out1 = LFSR_state <<< 8'd1;



  assign Bit_Clear_out1 = Bit_Shift_out1 & 7'b1111110;



  assign Extract_Bits1_out1 = LFSR_state[6];



  assign Extract_Bits1_out1_is_not0 = Extract_Bits1_out1 != 1'b0;



  assign dtc1 = LFSR_state[3];



  assign Extract_Bits_out1 = dtc1;



  assign Extract_Bits_out1_is_not0 = Extract_Bits_out1 != 1'b0;



  assign Logical_Operator_out1 = Extract_Bits_out1_is_not0 ^ Extract_Bits1_out1_is_not0;



  assign switch_compare_1_1 = Logical_Operator_out1 == 1'b1;



  assign Switch1_out1 = (switch_compare_1_1 == 1'b0 ? Bit_Clear_out1 :
              Bit_Set_out1);



  assign LFSR_In = (switch_compare_1 == 1'b0 ? Switch1_out1 :
              Constant_out1);



  always @(posedge clk or posedge reset)
    begin : Unit_Delay_Enabled_Synchronous_process
      if (reset == 1'b1) begin
        LFSR_state <= 7'b0000000;
      end
      else begin
        if (enb_1_2_0 && LFSR_Enable) begin
          LFSR_state <= LFSR_In;
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
          Delay2_out1 <= Delay_out1;
        end
      end
    end



  assign dtc1_1 = LFSR_state[0];



  assign scramblingSequence = dtc1_1;



  assign Logical_Operator2_out1 = Delay2_out1 ^ scramblingSequence;



  always @(posedge clk or posedge reset)
    begin : Delay8_process
      if (reset == 1'b1) begin
        Delay8_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay8_out1 <= Logical_Operator2_out1;
        end
      end
    end



  assign dataOut = Delay8_out1;

  always @(posedge clk or posedge reset)
    begin : Delay4_process
      if (reset == 1'b1) begin
        Delay4_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay4_out1 <= Delay12_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay6_process
      if (reset == 1'b1) begin
        Delay6_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay6_out1 <= Delay4_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay10_process
      if (reset == 1'b1) begin
        Delay10_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay10_out1 <= Delay6_out1;
        end
      end
    end



  assign startOut = Delay10_out1;

  always @(posedge clk or posedge reset)
    begin : Delay13_process
      if (reset == 1'b1) begin
        Delay13_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay13_out1 <= endIn;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay5_process
      if (reset == 1'b1) begin
        Delay5_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay5_out1 <= Delay13_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay7_process
      if (reset == 1'b1) begin
        Delay7_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay7_out1 <= Delay5_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay11_process
      if (reset == 1'b1) begin
        Delay11_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay11_out1 <= Delay7_out1;
        end
      end
    end



  assign endOut = Delay11_out1;

  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        Delay3_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay3_out1 <= Delay1_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay9_process
      if (reset == 1'b1) begin
        Delay9_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay9_out1 <= Delay3_out1;
        end
      end
    end



  assign validOut = Delay9_out1;

endmodule  // whdlOFDMTx_Scrambler

