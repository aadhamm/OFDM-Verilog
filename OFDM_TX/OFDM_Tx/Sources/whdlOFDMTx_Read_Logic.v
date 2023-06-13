// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Read_Logic.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Read_Logic
// Source Path: whdlOFDMTx/Frame Generator/Data/Data Chain/Symbol Interleaver/Interleaver/Read Logic
// Hierarchy Level: 7
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Read_Logic
          (clk,
           reset,
           enb,
           fifoData,
           fifoCount,
           rdAddr,
           valid,
           pop,
           advPop);


  input   clk;
  input   reset;
  input   enb;
  input   [8:0] fifoData;  // ufix9
  input   [2:0] fifoCount;  // ufix3
  output  [9:0] rdAddr;  // ufix10
  output  valid;
  output  pop;
  output  advPop;


  reg [2:0] Delay3_out1;  // ufix3
  wire Relational_Operator1_relop1;
  wire readStart;
  reg [8:0] blockLen;  // ufix9
  wire out;
  wire [8:0] Generate_Read_Address_out1;  // ufix9
  wire [8:0] Generate_Read_Address_out2;  // ufix9
  wire [8:0] Generate_Base_Read_Address_out1;  // ufix9
  reg [8:0] Delay1_reg [0:4];  // ufix9 [5]
  wire [8:0] Delay1_reg_next [0:4];  // ufix9 [5]
  wire [8:0] Delay1_out1;  // ufix9
  wire [9:0] Add1_1;  // ufix10
  wire [9:0] Add1_2;  // ufix10
  wire [9:0] Add1_out1;  // ufix10
  reg [9:0] Delay7_out1;  // ufix10
  reg [8:0] Delay4_reg [0:4];  // ufix9 [5]
  wire [8:0] Delay4_reg_next [0:4];  // ufix9 [5]
  wire [8:0] Delay4_out1;  // ufix9
  reg  [0:4] Delay2_reg;  // ufix1 [5]
  wire [0:4] Delay2_reg_next;  // ufix1 [5]
  wire Delay2_out1;
  wire Generate_Output_Control_Signals_out3;
  wire Generate_Output_Control_Signals_out4;
  wire Generate_Output_Control_Signals_out5;


  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        Delay3_out1 <= 3'b000;
      end
      else begin
        if (enb) begin
          Delay3_out1 <= fifoCount;
        end
      end
    end



  assign Relational_Operator1_relop1 = fifoCount < Delay3_out1;



  assign readStart = Relational_Operator1_relop1;

  always @(posedge clk or posedge reset)
    begin : Unit_Delay_Enabled_Synchronous1_process
      if (reset == 1'b1) begin
        blockLen <= 9'b101100111;
      end
      else begin
        if (enb && readStart) begin
          blockLen <= fifoData;
        end
      end
    end



  whdlOFDMTx_MATLAB_Function u_MATLAB_Function (.clk(clk),
                                                .reset(reset),
                                                .enb(enb),
                                                .trigger(Relational_Operator1_relop1),
                                                .out(out)
                                                );

  whdlOFDMTx_Generate_Read_Address u_Generate_Read_Address (.clk(clk),
                                                            .reset(reset),
                                                            .enb(enb),
                                                            .blockLen(blockLen),  // ufix9
                                                            .enable(out),
                                                            .reset_1(Relational_Operator1_relop1),
                                                            .blockDataCount(Generate_Read_Address_out1),  // ufix9
                                                            .currentAddr(Generate_Read_Address_out2)  // ufix9
                                                            );

  whdlOFDMTx_Generate_Base_Read_Address u_Generate_Base_Read_Address (.clk(clk),
                                                                      .reset(reset),
                                                                      .enb(enb),
                                                                      .readStart(Relational_Operator1_relop1),
                                                                      .baseAddr(Generate_Base_Read_Address_out1)  // ufix9
                                                                      );

  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_reg[0] <= 9'b000000000;
        Delay1_reg[1] <= 9'b000000000;
        Delay1_reg[2] <= 9'b000000000;
        Delay1_reg[3] <= 9'b000000000;
        Delay1_reg[4] <= 9'b000000000;
      end
      else begin
        if (enb) begin
          Delay1_reg[0] <= Delay1_reg_next[0];
          Delay1_reg[1] <= Delay1_reg_next[1];
          Delay1_reg[2] <= Delay1_reg_next[2];
          Delay1_reg[3] <= Delay1_reg_next[3];
          Delay1_reg[4] <= Delay1_reg_next[4];
        end
      end
    end

  assign Delay1_out1 = Delay1_reg[4];
  assign Delay1_reg_next[0] = Generate_Base_Read_Address_out1;
  assign Delay1_reg_next[1] = Delay1_reg[0];
  assign Delay1_reg_next[2] = Delay1_reg[1];
  assign Delay1_reg_next[3] = Delay1_reg[2];
  assign Delay1_reg_next[4] = Delay1_reg[3];



  assign Add1_1 = {1'b0, Generate_Read_Address_out2};
  assign Add1_2 = {1'b0, Delay1_out1};
  assign Add1_out1 = Add1_1 + Add1_2;



  always @(posedge clk or posedge reset)
    begin : Delay7_process
      if (reset == 1'b1) begin
        Delay7_out1 <= 10'b0000000000;
      end
      else begin
        if (enb) begin
          Delay7_out1 <= Add1_out1;
        end
      end
    end



  assign rdAddr = Delay7_out1;

  always @(posedge clk or posedge reset)
    begin : Delay4_process
      if (reset == 1'b1) begin
        Delay4_reg[0] <= 9'b000000000;
        Delay4_reg[1] <= 9'b000000000;
        Delay4_reg[2] <= 9'b000000000;
        Delay4_reg[3] <= 9'b000000000;
        Delay4_reg[4] <= 9'b000000000;
      end
      else begin
        if (enb) begin
          Delay4_reg[0] <= Delay4_reg_next[0];
          Delay4_reg[1] <= Delay4_reg_next[1];
          Delay4_reg[2] <= Delay4_reg_next[2];
          Delay4_reg[3] <= Delay4_reg_next[3];
          Delay4_reg[4] <= Delay4_reg_next[4];
        end
      end
    end

  assign Delay4_out1 = Delay4_reg[4];
  assign Delay4_reg_next[0] = blockLen;
  assign Delay4_reg_next[1] = Delay4_reg[0];
  assign Delay4_reg_next[2] = Delay4_reg[1];
  assign Delay4_reg_next[3] = Delay4_reg[2];
  assign Delay4_reg_next[4] = Delay4_reg[3];



  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        Delay2_reg[0] <= 1'b0;
        Delay2_reg[1] <= 1'b0;
        Delay2_reg[2] <= 1'b0;
        Delay2_reg[3] <= 1'b0;
        Delay2_reg[4] <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay2_reg[0] <= Delay2_reg_next[0];
          Delay2_reg[1] <= Delay2_reg_next[1];
          Delay2_reg[2] <= Delay2_reg_next[2];
          Delay2_reg[3] <= Delay2_reg_next[3];
          Delay2_reg[4] <= Delay2_reg_next[4];
        end
      end
    end

  assign Delay2_out1 = Delay2_reg[4];
  assign Delay2_reg_next[0] = out;
  assign Delay2_reg_next[1] = Delay2_reg[0];
  assign Delay2_reg_next[2] = Delay2_reg[1];
  assign Delay2_reg_next[3] = Delay2_reg[2];
  assign Delay2_reg_next[4] = Delay2_reg[3];



  whdlOFDMTx_Generate_Output_Control_Signals u_Generate_Output_Control_Signals (.clk(clk),
                                                                                .reset(reset),
                                                                                .enb(enb),
                                                                                .blockLen(Delay4_out1),  // ufix9
                                                                                .blockValid(Delay2_out1),
                                                                                .blockCount(Generate_Read_Address_out1),  // ufix9
                                                                                .valid(Generate_Output_Control_Signals_out3),
                                                                                .pop(Generate_Output_Control_Signals_out4),
                                                                                .advPop(Generate_Output_Control_Signals_out5)
                                                                                );

  assign valid = Generate_Output_Control_Signals_out3;

  assign pop = Generate_Output_Control_Signals_out4;

  assign advPop = Generate_Output_Control_Signals_out5;

endmodule  // whdlOFDMTx_Read_Logic

