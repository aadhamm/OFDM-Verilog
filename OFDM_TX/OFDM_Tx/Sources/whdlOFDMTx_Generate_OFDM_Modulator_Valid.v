// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Generate_OFDM_Modulator_Valid.v
// Created: 2023-05-02 12:36:36
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Generate_OFDM_Modulator_Valid
// Source Path: whdlOFDMTx/Frame Formation and OFDM Modulation/Generate OFDM Modulator Valid
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Generate_OFDM_Modulator_Valid
          (clk,
           reset,
           enb_1_32_0,
           generatedReady,
           ofdmModReady,
           RAMAddress,
           ofdmModValid);


  input   clk;
  input   reset;
  input   enb_1_32_0;
  input   generatedReady;
  input   ofdmModReady;
  output  [11:0] RAMAddress;  // ufix12
  output  ofdmModValid;


  wire [11:0] Constant_out1;  // ufix12
  reg  [0:1] Delay_reg;  // ufix1 [2]
  wire [0:1] Delay_reg_next;  // ufix1 [2]
  wire Delay_out1;
  wire Logical_Operator4_out1;
  wire [11:0] out;  // ufix12
  wire [11:0] Switch_out1;  // ufix12


  assign Constant_out1 = 12'b101000100000;



  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_reg[0] <= 1'b0;
        Delay_reg[1] <= 1'b0;
      end
      else begin
        if (enb_1_32_0) begin
          Delay_reg[0] <= Delay_reg_next[0];
          Delay_reg[1] <= Delay_reg_next[1];
        end
      end
    end

  assign Delay_out1 = Delay_reg[1];
  assign Delay_reg_next[0] = generatedReady;
  assign Delay_reg_next[1] = Delay_reg[0];



  assign Logical_Operator4_out1 = Delay_out1 & ofdmModReady;



  whdlOFDMTx_Counter_for_Read_Address u_Counter_for_Read_Address (.clk(clk),
                                                                  .reset(reset),
                                                                  .enb_1_32_0(enb_1_32_0),
                                                                  .enableIn(Logical_Operator4_out1),
                                                                  .out(out)  // ufix12
                                                                  );

  assign Switch_out1 = (generatedReady == 1'b0 ? Constant_out1 :
              out);



  assign RAMAddress = Switch_out1;

  assign ofdmModValid = Logical_Operator4_out1;

endmodule  // whdlOFDMTx_Generate_OFDM_Modulator_Valid

