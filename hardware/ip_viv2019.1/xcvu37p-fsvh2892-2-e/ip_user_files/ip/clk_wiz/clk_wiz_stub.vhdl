-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Wed Nov 17 18:11:43 2021
-- Host        : e5-cse-322-16 running 64-bit Ubuntu 18.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/clk_wiz/clk_wiz_stub.vhdl
-- Design      : clk_wiz
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu37p-fsvh2892-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clk_wiz;

architecture stub of clk_wiz is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_out2,clk_in1";
begin
end;
