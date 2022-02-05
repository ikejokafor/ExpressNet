// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *)
module pixel_sequence_data_bram(clka, wea, addra, dina, clkb, enb, addrb, doutb);
  input clka;
  input [0:0]wea;
  input [8:0]addra;
  input [127:0]dina;
  input clkb;
  input enb;
  input [11:0]addrb;
  output [15:0]doutb;
endmodule
