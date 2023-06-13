// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Generate_Write_Address.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Generate_Write_Address
// Source Path: whdlOFDMTx/Frame Generator/Data/Data Chain/Symbol Interleaver/Interleaver/Write Logic/Generate Write 
// Addres
// Hierarchy Level: 8
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Generate_Write_Address
          (clk,
           reset,
           enb,
           rst,
           enb_1,
           end_rsvd,
           wrAddr,
           count);


  input   clk;
  input   reset;
  input   enb;
  input   rst;
  input   enb_1;
  input   end_rsvd;
  output  [9:0] wrAddr;  // ufix10
  output  [8:0] count;  // ufix9


  wire [8:0] count_step;  // ufix9
  wire [8:0] count_from;  // ufix9
  wire [8:0] count_reset;  // ufix9
  reg [8:0] currentAddr;  // ufix9
  wire [8:0] count_1;  // ufix9
  wire need_to_wrap;
  wire [8:0] count_value;  // ufix9
  wire [8:0] count_2;  // ufix9
  wire [8:0] count_3;  // ufix9
  reg  Unit_Delay_Enabled_Synchronous2_out1;
  wire Logical_Operator7_out1;
  wire [8:0] Constant_out1;  // ufix9
  wire [8:0] Constant4_out1;  // ufix9
  wire [8:0] baseAddr;  // ufix9
  wire [9:0] Add_1;  // ufix10
  wire [9:0] Add_2;  // ufix10
  wire [9:0] Add_out1;  // ufix10


  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 360
  assign count_step = 9'b000000001;



  assign count_from = 9'b000000000;



  assign count_reset = 9'b000000000;



  assign count_1 = currentAddr + count_step;



  assign need_to_wrap = currentAddr == 9'b101101000;



  assign count_value = (need_to_wrap == 1'b0 ? count_1 :
              count_from);



  assign count_2 = (enb_1 == 1'b0 ? currentAddr :
              count_value);



  assign count_3 = (rst == 1'b0 ? count_2 :
              count_reset);



  always @(posedge clk or posedge reset)
    begin : HDL_Counter_process
      if (reset == 1'b1) begin
        currentAddr <= 9'b000000000;
      end
      else begin
        if (enb) begin
          currentAddr <= count_3;
        end
      end
    end



  assign Logical_Operator7_out1 =  ~ Unit_Delay_Enabled_Synchronous2_out1;



  always @(posedge clk or posedge reset)
    begin : Unit_Delay_Enabled_Synchronous2_process
      if (reset == 1'b1) begin
        Unit_Delay_Enabled_Synchronous2_out1 <= 1'b0;
      end
      else begin
        if (enb && end_rsvd) begin
          Unit_Delay_Enabled_Synchronous2_out1 <= Logical_Operator7_out1;
        end
      end
    end



  assign Constant_out1 = 9'b000000000;



  assign Constant4_out1 = 9'b101101000;



  assign baseAddr = (Unit_Delay_Enabled_Synchronous2_out1 == 1'b0 ? Constant_out1 :
              Constant4_out1);



  assign Add_1 = {1'b0, currentAddr};
  assign Add_2 = {1'b0, baseAddr};
  assign Add_out1 = Add_1 + Add_2;



  assign wrAddr = Add_out1;

  assign count = currentAddr;

endmodule  // whdlOFDMTx_Generate_Write_Address

