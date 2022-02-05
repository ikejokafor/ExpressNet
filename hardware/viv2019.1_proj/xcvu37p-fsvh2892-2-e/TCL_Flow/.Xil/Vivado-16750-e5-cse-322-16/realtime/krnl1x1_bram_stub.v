// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_3,Vivado 2019.1" *)
module krnl1x1_bram(clka, ena, wea, addra, dina, clkb, enb, addrb, doutb);
  input clka;
  input ena;
  input [0:0]wea;
  input [12:0]addra;
  input [1023:0]dina;
  input clkb;
  input enb;
  input [12:0]addrb;
  output [1023:0]doutb;
endmodule
