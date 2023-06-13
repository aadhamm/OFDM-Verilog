`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Marwan Ahmed Elsayed
// 
// Create Date: 02/05/2023 09:14:00 AM
// Design Name: DUC to DAC Connection
// Module Name: DUC_DAC
// Project Name: OFDM
// Target Devices: Zedboard 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DUC_DAC(
  input   clk_in,
  input   rst,
  input   clk_enable,
  
  input   data,
  input   valid,
  
  input   [1:0] modTypeIndex,  // ufix2
  input   [1:0] codeRateIndex,  // ufix2
  
  output ce_out_0,
  output ce_out,
 // output reg  clk_out2,
  output  clk_out2,
//  output  signed [15:0] txData_re,  // sfix16_En13
//  output  signed [15:0] txData_im,  // sfix16_En13
  output  Out3,
  output  ce_out_1,
  output  txValid,
  output  ready,

  output  signed [15:0] Out4_re_out  // sfix18_En16
//  output  signed [15:0] Out4_im_out,  // sfix18_En16
  );

  ///////////////////////
  // Wires And Registers
  //////////////////////

  wire signed [15:0] txData_re;
  wire signed [15:0] txData_im;
  
  wire signed [17:0] Out4_re;
  wire signed [17:0] Out4_im;
  wire signed [17:0] Out4_re1;
  
  //reg signed [15:0] data_re = 16'h7F00;
  //reg signed [15:0] data_im = 16'h0000;
  
  wire clk_out_8_192_MHz;
  wire clk_out_4_096_MHz;
  wire clk_out_2_048_MHz;
  wire signed [15:0] txData_re_mid;
  wire signed [15:0] txData_re_in;
  wire signed [15:0] txData_im_in;
  
  wire clk_out1;
  wire clk_out3;
  //reg [1:0] clk;
  reg [15:0] out_re;
  
  assign clk_out2 = !clk_out_2_048_MHz;
//  assign Out4_im_out = {!Out4_im[17], Out4_im[16:2]};
  assign Out4_re_out = {!Out4_re[16], Out4_re[15:1]};
//  assign clk_out = clk_out1;
  
  
  
  
  
  
   Div_by_two  Div_by_two11(.clk(clk_out_8_192_MHz),
                            .out_clk(clk_out_4_096_MHz));
                            
   Div_by_two Div_by_two22(.clk(clk_out_4_096_MHz),
                         .out_clk(clk_out_2_048_MHz));
                         
                         
   assign txData_re_in = txData_re << 3'b011;
   assign txData_im_in = txData_im << 3'b011;

  
    
  HDL_DUC HDL_DUC1(.clk(clk_out_2_048_MHz),
           .reset(rst),  // Positive Edge Reset
           .clk_enable(clk_enable),
           .dataIn_re(txData_re_in),
           .dataIn_im(txData_im_in),
           .ValidIn(txValid),
           .ce_out(ce_out),
           .Out2(Out3),
           .Out1_re(Out4_re),
           .Out1_im(Out4_im));
           
        
  OFDM_Transmitter OFDM_Transmitter1(.clk(clk_out_4_096_MHz),
           .reset(rst),  // Positive Edge Resetc
           .clk_enable(clk_enable),
           .modTypeIndex(modTypeIndex),
           .codeRateIndex(codeRateIndex),
           .data(data),
           .valid(valid),
           
           .ce_out_0(ce_out_0),
           .ce_out_1(ce_out_1),
           
           .txData_re(txData_re),
           .txData_im(txData_im),
           
           .txValid(txValid),
           .ready(ready));      
          
  clk_wiz_0 clk_wiz_inst(
    // Clock out ports
    .clk_out1(clk_out_8_192_MHz), // DAC Clock 
    .reset(rst), 
    // Clock in ports
    .clk_in1(clk_in)
    );
    
endmodule