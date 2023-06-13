// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Interleaver_block.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Interleaver_block
// Source Path: whdlOFDMTx/Frame Generator/Header/Interleaver
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Interleaver_block
          (clk,
           reset,
           enb,
           dataIn,
           startIn,
           endIn,
           validIn,
           dataOut,
           validOut);


  input   clk;
  input   reset;
  input   enb;
  input   dataIn;
  input   startIn;
  input   endIn;
  input   validIn;
  output  dataOut;
  output  validOut;


  wire Write_Logic_out4;
  reg  Delay11_out1;
  wire Read_Logic_out5;
  reg  Delay8_out1;
  wire Read_Logic_out6;
  wire [2:0] Store_Block_Lengths_out2;  // ufix3
  wire Write_Logic_out5;
  wire Generate_Ready_out1;
  reg  Delay7_out1;
  wire Logical_Operator_out1;
  wire [7:0] Write_Logic_out1;  // uint8
  wire Write_Logic_out2;
  wire [6:0] Write_Logic_out3;  // ufix7
  reg [6:0] Delay9_out1;  // ufix7
  wire [6:0] Store_Block_Lengths_out1;  // ufix7
  wire [7:0] Read_Logic_out1;  // uint8
  wire Read_Logic_out4;
  reg  Delay10_out1;
  wire Constant_out1;
  reg  [0:1] Delay2_reg;  // ufix1 [2]
  wire [0:1] Delay2_reg_next;  // ufix1 [2]
  wire Delay2_out1;
  reg  Delay1_out1;
  reg  [0:1] Delay17_reg;  // ufix1 [2]
  wire [0:1] Delay17_reg_next;  // ufix1 [2]
  wire Delay17_out1;
  reg  [0:6] Delay14_reg;  // ufix1 [7]
  wire [0:6] Delay14_reg_next;  // ufix1 [7]
  wire Delay14_out1;
  reg [7:0] Delay3_out1;  // uint8
  reg [7:0] Delay16_reg [0:1];  // ufix8 [2]
  wire [7:0] Delay16_reg_next [0:1];  // ufix8 [2]
  wire [7:0] Delay16_out1;  // uint8
  reg [7:0] Delay12_reg [0:6];  // ufix8 [7]
  wire [7:0] Delay12_reg_next [0:6];  // ufix8 [7]
  wire [7:0] Delay12_out1;  // uint8
  reg  Delay4_out1;
  reg  [0:1] Delay15_reg;  // ufix1 [2]
  wire [0:1] Delay15_reg_next;  // ufix1 [2]
  wire Delay15_out1;
  reg  [0:6] Delay13_reg;  // ufix1 [7]
  wire [0:6] Delay13_reg_next;  // ufix1 [7]
  wire Delay13_out1;
  wire Simple_Dual_Port_RAM_out1;
  wire Switch_out1;

  // Give null output if valid is LOW


  always @(posedge clk or posedge reset)
    begin : Delay11_process
      if (reset == 1'b1) begin
        Delay11_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay11_out1 <= Write_Logic_out4;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay8_process
      if (reset == 1'b1) begin
        Delay8_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          Delay8_out1 <= Read_Logic_out5;
        end
      end
    end



  whdlOFDMTx_Generate_Ready_block u_Generate_Ready (.clk(clk),
                                                    .reset(reset),
                                                    .enb(enb),
                                                    .advPop(Read_Logic_out6),
                                                    .fifoCount(Store_Block_Lengths_out2),  // ufix3
                                                    .pop(Delay8_out1),
                                                    .endReady(Write_Logic_out5),
                                                    .ready(Generate_Ready_out1)
                                                    );

  always @(posedge clk or posedge reset)
    begin : Delay7_process
      if (reset == 1'b1) begin
        Delay7_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          Delay7_out1 <= Generate_Ready_out1;
        end
      end
    end



  assign Logical_Operator_out1 = validIn & Delay7_out1;



  whdlOFDMTx_Write_Logic_block u_Write_Logic (.clk(clk),
                                              .reset(reset),
                                              .enb(enb),
                                              .start(startIn),
                                              .valid(Logical_Operator_out1),
                                              .end_rsvd(endIn),
                                              .wrAddr(Write_Logic_out1),  // uint8
                                              .wrValid(Write_Logic_out2),
                                              .count(Write_Logic_out3),  // ufix7
                                              .endOut(Write_Logic_out4),
                                              .endReady(Write_Logic_out5)
                                              );

  always @(posedge clk or posedge reset)
    begin : Delay9_process
      if (reset == 1'b1) begin
        Delay9_out1 <= 7'b0000000;
      end
      else begin
        if (enb) begin
          Delay9_out1 <= Write_Logic_out3;
        end
      end
    end



  whdlOFDMTx_Store_Block_Lengths_block u_Store_Block_Lengths (.clk(clk),
                                                              .reset(reset),
                                                              .enb(enb),
                                                              .In(Delay9_out1),  // ufix7
                                                              .Push(Delay11_out1),
                                                              .Pop(Delay8_out1),
                                                              .Out(Store_Block_Lengths_out1),  // ufix7
                                                              .Num(Store_Block_Lengths_out2)  // ufix3
                                                              );

  whdlOFDMTx_Read_Logic_block u_Read_Logic (.clk(clk),
                                            .reset(reset),
                                            .enb(enb),
                                            .fifoData(Store_Block_Lengths_out1),  // ufix7
                                            .fifoCount(Store_Block_Lengths_out2),  // ufix3
                                            .rdAddr(Read_Logic_out1),  // uint8
                                            .valid(Read_Logic_out4),
                                            .pop(Read_Logic_out5),
                                            .advPop(Read_Logic_out6)
                                            );

  always @(posedge clk or posedge reset)
    begin : Delay10_process
      if (reset == 1'b1) begin
        Delay10_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay10_out1 <= Read_Logic_out4;
        end
      end
    end



  assign Constant_out1 = 1'b0;



  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        Delay2_reg[0] <= 1'b0;
        Delay2_reg[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay2_reg[0] <= Delay2_reg_next[0];
          Delay2_reg[1] <= Delay2_reg_next[1];
        end
      end
    end

  assign Delay2_out1 = Delay2_reg[1];
  assign Delay2_reg_next[0] = dataIn;
  assign Delay2_reg_next[1] = Delay2_reg[0];



  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= Delay2_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay17_process
      if (reset == 1'b1) begin
        Delay17_reg[0] <= 1'b0;
        Delay17_reg[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay17_reg[0] <= Delay17_reg_next[0];
          Delay17_reg[1] <= Delay17_reg_next[1];
        end
      end
    end

  assign Delay17_out1 = Delay17_reg[1];
  assign Delay17_reg_next[0] = Delay1_out1;
  assign Delay17_reg_next[1] = Delay17_reg[0];



  always @(posedge clk or posedge reset)
    begin : Delay14_process
      if (reset == 1'b1) begin
        Delay14_reg[0] <= 1'b0;
        Delay14_reg[1] <= 1'b0;
        Delay14_reg[2] <= 1'b0;
        Delay14_reg[3] <= 1'b0;
        Delay14_reg[4] <= 1'b0;
        Delay14_reg[5] <= 1'b0;
        Delay14_reg[6] <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay14_reg[0] <= Delay14_reg_next[0];
          Delay14_reg[1] <= Delay14_reg_next[1];
          Delay14_reg[2] <= Delay14_reg_next[2];
          Delay14_reg[3] <= Delay14_reg_next[3];
          Delay14_reg[4] <= Delay14_reg_next[4];
          Delay14_reg[5] <= Delay14_reg_next[5];
          Delay14_reg[6] <= Delay14_reg_next[6];
        end
      end
    end

  assign Delay14_out1 = Delay14_reg[6];
  assign Delay14_reg_next[0] = Delay17_out1;
  assign Delay14_reg_next[1] = Delay14_reg[0];
  assign Delay14_reg_next[2] = Delay14_reg[1];
  assign Delay14_reg_next[3] = Delay14_reg[2];
  assign Delay14_reg_next[4] = Delay14_reg[3];
  assign Delay14_reg_next[5] = Delay14_reg[4];
  assign Delay14_reg_next[6] = Delay14_reg[5];



  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        Delay3_out1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay3_out1 <= Write_Logic_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay16_process
      if (reset == 1'b1) begin
        Delay16_reg[0] <= 8'b00000000;
        Delay16_reg[1] <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay16_reg[0] <= Delay16_reg_next[0];
          Delay16_reg[1] <= Delay16_reg_next[1];
        end
      end
    end

  assign Delay16_out1 = Delay16_reg[1];
  assign Delay16_reg_next[0] = Delay3_out1;
  assign Delay16_reg_next[1] = Delay16_reg[0];



  always @(posedge clk or posedge reset)
    begin : Delay12_process
      if (reset == 1'b1) begin
        Delay12_reg[0] <= 8'b00000000;
        Delay12_reg[1] <= 8'b00000000;
        Delay12_reg[2] <= 8'b00000000;
        Delay12_reg[3] <= 8'b00000000;
        Delay12_reg[4] <= 8'b00000000;
        Delay12_reg[5] <= 8'b00000000;
        Delay12_reg[6] <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay12_reg[0] <= Delay12_reg_next[0];
          Delay12_reg[1] <= Delay12_reg_next[1];
          Delay12_reg[2] <= Delay12_reg_next[2];
          Delay12_reg[3] <= Delay12_reg_next[3];
          Delay12_reg[4] <= Delay12_reg_next[4];
          Delay12_reg[5] <= Delay12_reg_next[5];
          Delay12_reg[6] <= Delay12_reg_next[6];
        end
      end
    end

  assign Delay12_out1 = Delay12_reg[6];
  assign Delay12_reg_next[0] = Delay16_out1;
  assign Delay12_reg_next[1] = Delay12_reg[0];
  assign Delay12_reg_next[2] = Delay12_reg[1];
  assign Delay12_reg_next[3] = Delay12_reg[2];
  assign Delay12_reg_next[4] = Delay12_reg[3];
  assign Delay12_reg_next[5] = Delay12_reg[4];
  assign Delay12_reg_next[6] = Delay12_reg[5];



  always @(posedge clk or posedge reset)
    begin : Delay4_process
      if (reset == 1'b1) begin
        Delay4_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay4_out1 <= Write_Logic_out2;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay15_process
      if (reset == 1'b1) begin
        Delay15_reg[0] <= 1'b0;
        Delay15_reg[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay15_reg[0] <= Delay15_reg_next[0];
          Delay15_reg[1] <= Delay15_reg_next[1];
        end
      end
    end

  assign Delay15_out1 = Delay15_reg[1];
  assign Delay15_reg_next[0] = Delay4_out1;
  assign Delay15_reg_next[1] = Delay15_reg[0];



  always @(posedge clk or posedge reset)
    begin : Delay13_process
      if (reset == 1'b1) begin
        Delay13_reg[0] <= 1'b0;
        Delay13_reg[1] <= 1'b0;
        Delay13_reg[2] <= 1'b0;
        Delay13_reg[3] <= 1'b0;
        Delay13_reg[4] <= 1'b0;
        Delay13_reg[5] <= 1'b0;
        Delay13_reg[6] <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay13_reg[0] <= Delay13_reg_next[0];
          Delay13_reg[1] <= Delay13_reg_next[1];
          Delay13_reg[2] <= Delay13_reg_next[2];
          Delay13_reg[3] <= Delay13_reg_next[3];
          Delay13_reg[4] <= Delay13_reg_next[4];
          Delay13_reg[5] <= Delay13_reg_next[5];
          Delay13_reg[6] <= Delay13_reg_next[6];
        end
      end
    end

  assign Delay13_out1 = Delay13_reg[6];
  assign Delay13_reg_next[0] = Delay15_out1;
  assign Delay13_reg_next[1] = Delay13_reg[0];
  assign Delay13_reg_next[2] = Delay13_reg[1];
  assign Delay13_reg_next[3] = Delay13_reg[2];
  assign Delay13_reg_next[4] = Delay13_reg[3];
  assign Delay13_reg_next[5] = Delay13_reg[4];
  assign Delay13_reg_next[6] = Delay13_reg[5];



  whdlOFDMTx_SimpleDualPortRAM_singlebit #(.AddrWidth(8),
                                           .DataWidth(1)
                                           )
                                         u_Simple_Dual_Port_RAM (.clk(clk),
                                                                 .enb(enb),
                                                                 .wr_din(Delay14_out1),
                                                                 .wr_addr(Delay12_out1),
                                                                 .wr_en(Delay13_out1),
                                                                 .rd_addr(Read_Logic_out1),
                                                                 .rd_dout(Simple_Dual_Port_RAM_out1)
                                                                 );

  assign Switch_out1 = (Delay10_out1 == 1'b0 ? Constant_out1 :
              Simple_Dual_Port_RAM_out1);



  assign dataOut = Switch_out1;

  assign validOut = Delay10_out1;

endmodule  // whdlOFDMTx_Interleaver_block

