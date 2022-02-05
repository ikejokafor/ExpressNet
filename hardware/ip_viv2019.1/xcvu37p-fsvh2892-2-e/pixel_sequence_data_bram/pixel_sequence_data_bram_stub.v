// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1733598 Wed Dec 14 22:35:42 MST 2016
// Date        : Wed May  2 17:06:45 2018
// Host        : redrealm.cse.psu.edu running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/pixel_sequence_data_bram/pixel_sequence_data_bram_stub.v
// Design      : pixel_sequence_data_bram
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku115-flva1517-3-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *)
module pixel_sequence_data_bram(clka, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[8:0],dina[127:0],clkb,enb,addrb[11:0],doutb[15:0]" */;
  input clka;
  input [0:0]wea;
  input [8:0]addra;
  input [127:0]dina;
  input clkb;
  input enb;
  input [11:0]addrb;
  output [15:0]doutb;
endmodule
