// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Frame_Controller.v
// Created: 2023-05-02 12:36:36
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Frame_Controller
// Source Path: whdlOFDMTx/Frame Controller and Input Sampler/Frame Controller
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Frame_Controller
          (clk,
           reset,
           enb_1_2_0,
           valid,
           trBlkSize,
           sampleInParam,
           dataValid,
           resetRAM,
           dataSet,
           ofdmModReady,
           ready);


  input   clk;
  input   reset;
  input   enb_1_2_0;
  input   valid;
  input   [13:0] trBlkSize;  // ufix14
  output  sampleInParam;
  output  dataValid;
  output  resetRAM;
  output  dataSet;
  output  ofdmModReady;
  output  ready;


  wire Generate_Transmitter_Ready_out3;
  wire Generate_OFDM_Modulator_Ready_out1;
  wire Generate_OFDM_Modulator_Ready_out2;
  wire out;
  wire Generate_OFDM_Modulator_Ready_out4;
  reg  Delay_out1;
  wire Generate_Transmitter_Ready_out1;
  wire Generate_Transmitter_Ready_out2;


  whdlOFDMTx_Generate_OFDM_Modulator_Ready u_Generate_OFDM_Modulator_Ready (.clk(clk),
                                                                            .reset(reset),
                                                                            .enb_1_2_0(enb_1_2_0),
                                                                            .ready(Generate_Transmitter_Ready_out3),
                                                                            .trBlkSize(trBlkSize),  // ufix14
                                                                            .resetRAM(Generate_OFDM_Modulator_Ready_out1),
                                                                            .dataSet(Generate_OFDM_Modulator_Ready_out2),
                                                                            .ofdmModReady(out),
                                                                            .reset_1(Generate_OFDM_Modulator_Ready_out4)
                                                                            );

  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay_out1 <= Generate_OFDM_Modulator_Ready_out4;
        end
      end
    end



  whdlOFDMTx_Generate_Transmitter_Ready u_Generate_Transmitter_Ready (.clk(clk),
                                                                      .reset(reset),
                                                                      .enb_1_2_0(enb_1_2_0),
                                                                      .valid(valid),
                                                                      .reset_1(Delay_out1),
                                                                      .trBlkSize(trBlkSize),  // ufix14
                                                                      .sampleInParam(Generate_Transmitter_Ready_out1),
                                                                      .dataValid(Generate_Transmitter_Ready_out2),
                                                                      .ready(Generate_Transmitter_Ready_out3)
                                                                      );

  assign sampleInParam = Generate_Transmitter_Ready_out1;

  assign dataValid = Generate_Transmitter_Ready_out2;

  assign resetRAM = Generate_OFDM_Modulator_Ready_out1;

  assign dataSet = Generate_OFDM_Modulator_Ready_out2;

  assign ofdmModReady = out;

  assign ready = Generate_Transmitter_Ready_out3;

endmodule  // whdlOFDMTx_Frame_Controller

