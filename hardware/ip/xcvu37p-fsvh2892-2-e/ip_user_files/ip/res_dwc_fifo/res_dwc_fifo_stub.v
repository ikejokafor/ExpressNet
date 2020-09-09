// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Tue Sep  1 17:52:07 2020
// Host        : cse-p322mdl16.cse.psu.edu running 64-bit Ubuntu 16.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/res_dwc_fifo/res_dwc_fifo_stub.v
// Design      : res_dwc_fifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu37p-fsvh2892-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_3,Vivado 2018.3" *)
module res_dwc_fifo(clk, srst, din, wr_en, rd_en, dout, full, wr_ack, empty, 
  valid, rd_data_count, wr_rst_busy, rd_rst_busy)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[255:0],wr_en,rd_en,dout[1023:0],full,wr_ack,empty,valid,rd_data_count[9:0],wr_rst_busy,rd_rst_busy" */;
  input clk;
  input srst;
  input [255:0]din;
  input wr_en;
  input rd_en;
  output [1023:0]dout;
  output full;
  output wr_ack;
  output empty;
  output valid;
  output [9:0]rd_data_count;
  output wr_rst_busy;
  output rd_rst_busy;
endmodule