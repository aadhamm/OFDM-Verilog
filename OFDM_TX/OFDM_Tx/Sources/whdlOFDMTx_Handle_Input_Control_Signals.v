// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Handle_Input_Control_Signals.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Handle_Input_Control_Signals
// Source Path: whdlOFDMTx/Frame Generator/Data/Data Chain/Symbol Interleaver/Interleaver/Write Logic/Handle Input 
// Control Signal
// Hierarchy Level: 8
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Handle_Input_Control_Signals
          (clk,
           reset,
           enb,
           start,
           valid,
           end_rsvd,
           reset_1,
           countEnb,
           endOut,
           endReady);


  input   clk;
  input   reset;
  input   enb;
  input   start;
  input   valid;
  input   end_rsvd;
  output  reset_1;
  output  countEnb;
  output  endOut;
  output  endReady;


  wire Logical_Operator2_out1;
  reg  Delay2_out1;
  reg  Delay4_out1;
  wire Generate_Current_Frame_Status_out1;
  wire Generate_Forced_End_out1;
  reg  Delay1_out1;
  wire Logical_Operator1_out1;
  wire Logical_Operator3_out1;
  wire Logical_Operator_out1;
  wire Logical_Operator5_out1;
  reg  Delay3_out1;
  reg  Delay5_out1;


  assign Logical_Operator2_out1 = start & valid;



  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        Delay2_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay2_out1 <= Logical_Operator2_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay4_process
      if (reset == 1'b1) begin
        Delay4_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay4_out1 <= valid;
        end
      end
    end



  whdlOFDMTx_Generate_Forced_End u_Generate_Forced_End (.clk(clk),
                                                        .reset(reset),
                                                        .enb(enb),
                                                        .rst(Logical_Operator2_out1),
                                                        .valid(valid),
                                                        .frameOn(Generate_Current_Frame_Status_out1),
                                                        .forcedEnd(Generate_Forced_End_out1)
                                                        );

  assign Logical_Operator1_out1 =  ~ Delay1_out1;



  assign Logical_Operator3_out1 = Logical_Operator1_out1 & (Generate_Current_Frame_Status_out1 & (valid & end_rsvd));



  assign Logical_Operator_out1 = Logical_Operator3_out1 | Generate_Forced_End_out1;



  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= Logical_Operator_out1;
        end
      end
    end



  whdlOFDMTx_Generate_Current_Frame_Status u_Generate_Current_Frame_Status (.clk(clk),
                                                                            .reset(reset),
                                                                            .enb(enb),
                                                                            .start(Logical_Operator2_out1),
                                                                            .end_rsvd(Delay1_out1),
                                                                            .frameOn(Generate_Current_Frame_Status_out1)
                                                                            );

  assign Logical_Operator5_out1 = Delay4_out1 & Generate_Current_Frame_Status_out1;



  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        Delay3_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay3_out1 <= Logical_Operator5_out1;
        end
      end
    end



  assign countEnb = Delay3_out1;

  always @(posedge clk or posedge reset)
    begin : Delay5_process
      if (reset == 1'b1) begin
        Delay5_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay5_out1 <= Delay1_out1;
        end
      end
    end



  assign endOut = Delay5_out1;

  assign endReady = Logical_Operator_out1;

  assign reset_1 = Delay2_out1;

endmodule  // whdlOFDMTx_Handle_Input_Control_Signals

