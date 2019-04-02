// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1733598 Wed Dec 14 22:35:42 MST 2016
// Date        : Thu Mar 14 17:49:16 2019
// Host        : redrealm.cse.psu.edu running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcku115/prefetch_buffer_fifo/prefetch_buffer_fifo_stub.v
// Design      : prefetch_buffer_fifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku115-flva1517-3-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_1_3,Vivado 2016.4" *)
module prefetch_buffer_fifo(wr_clk, rd_clk, din, wr_en, rd_en, dout, full, empty)
/* synthesis syn_black_box black_box_pad_pin="wr_clk,rd_clk,din[15:0],wr_en,rd_en,dout[15:0],full,empty" */;
  input wr_clk;
  input rd_clk;
  input [15:0]din;
  input wr_en;
  input rd_en;
  output [15:0]dout;
  output full;
  output empty;
endmodule
