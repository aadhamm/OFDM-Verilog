// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_MATLAB_Function_block.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_MATLAB_Function_block
// Source Path: whdlOFDMTx/Frame Generator/Header/Interleaver/Read Logic/MATLAB Function
// Hierarchy Level: 6
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_MATLAB_Function_block
          (clk,
           reset,
           enb,
           trigger,
           out);


  input   clk;
  input   reset;
  input   enb;
  input   trigger;
  output  out;


  reg  out_1;
  reg [6:0] count;  // ufix7
  reg  state;
  reg [6:0] count_next;  // ufix7
  reg  state_next;
  reg [6:0] count_temp;  // ufix7
  reg  state_temp;


  always @(posedge clk or posedge reset)
    begin : MATLAB_Function_process
      if (reset == 1'b1) begin
        count <= 7'b0000000;
        state <= 1'b0;
      end
      else begin
        if (enb) begin
          count <= count_next;
          state <= state_next;
        end
      end
    end

  always @(count, state, trigger) begin
    count_temp = count;
    state_temp = state;
    // %% Executes in next clock cycle
    if (count == 7'b1001000) begin
      state_temp = 1'b0;
    end
    out_1 = state_temp;
    // %% Executes in current clock cycle
    if (trigger) begin
      state_temp = 1'b1;
      count_temp = 7'b0000000;
    end
    if (state_temp && ( ! trigger)) begin
      count_temp = count_temp + 7'b0000001;
    end
    count_next = count_temp;
    state_next = state_temp;
  end



  assign out = out_1;

endmodule  // whdlOFDMTx_MATLAB_Function_block

