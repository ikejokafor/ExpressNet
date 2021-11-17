// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Wed Nov 17 18:11:43 2021
// Host        : e5-cse-322-16 running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/clk_wiz/clk_wiz_stub.v
// Design      : clk_wiz
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu37p-fsvh2892-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz(clk_out1, clk_out2, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,clk_out2,clk_in1" */;
  output clk_out1;
  output clk_out2;
  input clk_in1;
endmodule
