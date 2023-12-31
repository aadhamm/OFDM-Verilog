// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_General_CRC_Generator_HDL_Optimized_block.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_General_CRC_Generator_HDL_Optimized_block
// Source Path: whdlOFDMTx/Frame Generator/Header/General CRC Generator HDL Optimized
// Hierarchy Level: 4
// 
// CRC Generator HDL Optimized
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_General_CRC_Generator_HDL_Optimized_block
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


  wire startIn_vld;
  wire endIn_vld;
  wire tstartout;
  wire processMsg;
  wire padZero;
  wire outputCRC;
  wire lastfout;
  wire validdata;
  wire [3:0] counter;  // ufix4
  wire [3:0] counter_opcrc;  // ufix4
  wire const0;  // ufix1
  wire msgenb;
  reg  datainReg;
  reg  [0:15] alpha_reg;  // ufix1 [16]
  wire [0:15] alpha_reg_next;  // ufix1 [16]
  wire dataBuffer;  // ufix1
  wire crcCheckSum_0;
  wire crcCheckSum_1;
  wire crcCheckSum_2;
  wire crcCheckSum_3;
  wire crcCheckSum_4;
  wire crcCheckSum_5;
  wire crcCheckSum_6;
  wire crcCheckSum_7;
  wire crcCheckSum_8;
  wire crcCheckSum_9;
  wire crcCheckSum_10;
  wire crcCheckSum_11;
  wire crcCheckSum_12;
  wire crcCheckSum_13;
  wire crcCheckSum_14;
  wire crcCheckSum_15;
  wire crcOut;  // ufix1
  wire msgcrc;  // ufix1
  wire tdataout;  // ufix1
  reg  dataOut_1;
  reg  startOut_1;
  reg  endOut_1;
  reg  validOut_1;


  assign startIn_vld = startIn & validIn;



  assign endIn_vld = endIn & validIn;



  whdlOFDMTx_CRCGenControl_block u_Controlsignal_inst (.clk(clk),
                                                       .reset(reset),
                                                       .enb_1_2_0(enb_1_2_0),
                                                       .startIn(startIn_vld),
                                                       .endIn(endIn_vld),
                                                       .validIn(validIn),
                                                       .startOut(tstartout),
                                                       .processMsg(processMsg),
                                                       .padZero(padZero),
                                                       .outputCRC(outputCRC),
                                                       .endOut(lastfout),
                                                       .validOut(validdata),
                                                       .counter(counter),  // ufix4
                                                       .counter_outputCRC(counter_opcrc)  // ufix4
                                                       );

  // Constant Zero
  assign const0 = 1'b0;



  assign msgenb = processMsg | padZero;



  always @(posedge clk or posedge reset)
    begin : datainput_register_process
      if (reset == 1'b1) begin
        datainReg <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          datainReg <= dataIn;
        end
      end
    end



  // Buffer Input Data
  always @(posedge clk or posedge reset)
    begin : c_process
      if (reset == 1'b1) begin
        alpha_reg[0] <= 1'b0;
        alpha_reg[1] <= 1'b0;
        alpha_reg[2] <= 1'b0;
        alpha_reg[3] <= 1'b0;
        alpha_reg[4] <= 1'b0;
        alpha_reg[5] <= 1'b0;
        alpha_reg[6] <= 1'b0;
        alpha_reg[7] <= 1'b0;
        alpha_reg[8] <= 1'b0;
        alpha_reg[9] <= 1'b0;
        alpha_reg[10] <= 1'b0;
        alpha_reg[11] <= 1'b0;
        alpha_reg[12] <= 1'b0;
        alpha_reg[13] <= 1'b0;
        alpha_reg[14] <= 1'b0;
        alpha_reg[15] <= 1'b0;
      end
      else begin
        if (enb_1_2_0 && msgenb) begin
          alpha_reg[0] <= alpha_reg_next[0];
          alpha_reg[1] <= alpha_reg_next[1];
          alpha_reg[2] <= alpha_reg_next[2];
          alpha_reg[3] <= alpha_reg_next[3];
          alpha_reg[4] <= alpha_reg_next[4];
          alpha_reg[5] <= alpha_reg_next[5];
          alpha_reg[6] <= alpha_reg_next[6];
          alpha_reg[7] <= alpha_reg_next[7];
          alpha_reg[8] <= alpha_reg_next[8];
          alpha_reg[9] <= alpha_reg_next[9];
          alpha_reg[10] <= alpha_reg_next[10];
          alpha_reg[11] <= alpha_reg_next[11];
          alpha_reg[12] <= alpha_reg_next[12];
          alpha_reg[13] <= alpha_reg_next[13];
          alpha_reg[14] <= alpha_reg_next[14];
          alpha_reg[15] <= alpha_reg_next[15];
        end
      end
    end

  assign dataBuffer = alpha_reg[15];
  assign alpha_reg_next[0] = datainReg;
  assign alpha_reg_next[1] = alpha_reg[0];
  assign alpha_reg_next[2] = alpha_reg[1];
  assign alpha_reg_next[3] = alpha_reg[2];
  assign alpha_reg_next[4] = alpha_reg[3];
  assign alpha_reg_next[5] = alpha_reg[4];
  assign alpha_reg_next[6] = alpha_reg[5];
  assign alpha_reg_next[7] = alpha_reg[6];
  assign alpha_reg_next[8] = alpha_reg[7];
  assign alpha_reg_next[9] = alpha_reg[8];
  assign alpha_reg_next[10] = alpha_reg[9];
  assign alpha_reg_next[11] = alpha_reg[10];
  assign alpha_reg_next[12] = alpha_reg[11];
  assign alpha_reg_next[13] = alpha_reg[12];
  assign alpha_reg_next[14] = alpha_reg[13];
  assign alpha_reg_next[15] = alpha_reg[14];



  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  whdlOFDMTx_CRCGenCompute_block u_ComputeCRC_inst (.clk(clk),
                                                    .reset(reset),
                                                    .enb_1_2_0(enb_1_2_0),
                                                    .datainReg(datainReg),
                                                    .validIn(validIn),
                                                    .processMsg(processMsg),
                                                    .padZero(padZero),
                                                    .counter(counter),  // ufix4
                                                    .crcChecksum_0(crcCheckSum_0),
                                                    .crcChecksum_1(crcCheckSum_1),
                                                    .crcChecksum_2(crcCheckSum_2),
                                                    .crcChecksum_3(crcCheckSum_3),
                                                    .crcChecksum_4(crcCheckSum_4),
                                                    .crcChecksum_5(crcCheckSum_5),
                                                    .crcChecksum_6(crcCheckSum_6),
                                                    .crcChecksum_7(crcCheckSum_7),
                                                    .crcChecksum_8(crcCheckSum_8),
                                                    .crcChecksum_9(crcCheckSum_9),
                                                    .crcChecksum_10(crcCheckSum_10),
                                                    .crcChecksum_11(crcCheckSum_11),
                                                    .crcChecksum_12(crcCheckSum_12),
                                                    .crcChecksum_13(crcCheckSum_13),
                                                    .crcChecksum_14(crcCheckSum_14),
                                                    .crcChecksum_15(crcCheckSum_15)
                                                    );

  assign crcOut = (counter_opcrc == 4'b0000 ? crcCheckSum_0 :
              (counter_opcrc == 4'b0001 ? crcCheckSum_1 :
              (counter_opcrc == 4'b0010 ? crcCheckSum_2 :
              (counter_opcrc == 4'b0011 ? crcCheckSum_3 :
              (counter_opcrc == 4'b0100 ? crcCheckSum_4 :
              (counter_opcrc == 4'b0101 ? crcCheckSum_5 :
              (counter_opcrc == 4'b0110 ? crcCheckSum_6 :
              (counter_opcrc == 4'b0111 ? crcCheckSum_7 :
              (counter_opcrc == 4'b1000 ? crcCheckSum_8 :
              (counter_opcrc == 4'b1001 ? crcCheckSum_9 :
              (counter_opcrc == 4'b1010 ? crcCheckSum_10 :
              (counter_opcrc == 4'b1011 ? crcCheckSum_11 :
              (counter_opcrc == 4'b1100 ? crcCheckSum_12 :
              (counter_opcrc == 4'b1101 ? crcCheckSum_13 :
              (counter_opcrc == 4'b1110 ? crcCheckSum_14 :
              crcCheckSum_15)))))))))))))));



  assign msgcrc = (outputCRC == 1'b0 ? dataBuffer :
              crcOut);



  // Output data and CRC CheckSum
  assign tdataout = (validdata == 1'b0 ? const0 :
              msgcrc);



  // Data output register
  always @(posedge clk or posedge reset)
    begin : dataOut_register_process
      if (reset == 1'b1) begin
        dataOut_1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          dataOut_1 <= tdataout;
        end
      end
    end



  // startOut output register
  always @(posedge clk or posedge reset)
    begin : startOut_register_process
      if (reset == 1'b1) begin
        startOut_1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          startOut_1 <= tstartout;
        end
      end
    end



  // endOut output register
  always @(posedge clk or posedge reset)
    begin : endout_register_process
      if (reset == 1'b1) begin
        endOut_1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          endOut_1 <= lastfout;
        end
      end
    end



  // validOut output register
  always @(posedge clk or posedge reset)
    begin : validout_register_process
      if (reset == 1'b1) begin
        validOut_1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          validOut_1 <= validdata;
        end
      end
    end



  assign dataOut = dataOut_1;

  assign startOut = startOut_1;

  assign endOut = endOut_1;

  assign validOut = validOut_1;

endmodule  // whdlOFDMTx_General_CRC_Generator_HDL_Optimized_block

