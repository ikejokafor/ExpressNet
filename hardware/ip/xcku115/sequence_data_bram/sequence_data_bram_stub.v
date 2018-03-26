// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.1 (lin64) Build 1538259 Fri Apr  8 15:45:23 MDT 2016
// Date        : Sun Mar 25 00:35:13 2018
// Host        : redrealm.cse.psu.edu running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/sequence_data_bram/sequence_data_bram_stub.v
// Design      : sequence_data_bram
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku115-flva1517-3-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_2,Vivado 2016.1" *)
module sequence_data_bram(clka, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[8:0],dina[127:0],clkb,enb,addrb[8:0],doutb[127:0]" */;
  input clka;
  input [0:0]wea;
  input [8:0]addra;
  input [127:0]dina;
  input clkb;
  input enb;
  input [8:0]addrb;
  output [127:0]doutb;
endmodule
