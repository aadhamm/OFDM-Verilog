// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Priority_Encoder.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Priority_Encoder
// Source Path: whdlOFDMTx/Multiplexer/Multiplex Preamble Signals/Priority Encoder
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Priority_Encoder
          (ssValid,
           rsValid,
           pilotValid,
           selLine);


  input   ssValid;
  input   rsValid;
  input   pilotValid;
  output  [2:0] selLine;  // ufix3


  reg [2:0] selLine_1;  // ufix3


  always @(pilotValid, rsValid, ssValid) begin
    if (ssValid) begin
      selLine_1 = 3'b000;
    end
    else if (rsValid) begin
      selLine_1 = 3'b001;
    end
    else if (pilotValid) begin
      selLine_1 = 3'b010;
    end
    else begin
      selLine_1 = 3'b000;
    end
  end



  assign selLine = selLine_1;

endmodule  // whdlOFDMTx_Priority_Encoder

