// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Thu Jun 17 18:32:26 2021
// Host        : e5-cse-322-17 running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ trans_in_pyld_fifo_stub.v
// Design      : trans_in_pyld_fifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu37p-fsvh2892-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_3,Vivado 2018.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(srst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  empty, wr_rst_busy, rd_rst_busy)
/* synthesis syn_black_box black_box_pad_pin="srst,wr_clk,rd_clk,din[1023:0],wr_en,rd_en,dout[1023:0],full,empty,wr_rst_busy,rd_rst_busy" */;
  input srst;
  input wr_clk;
  input rd_clk;
  input [1023:0]din;
  input wr_en;
  input rd_en;
  output [1023:0]dout;
  output full;
  output empty;
  output wr_rst_busy;
  output rd_rst_busy;
endmodule
