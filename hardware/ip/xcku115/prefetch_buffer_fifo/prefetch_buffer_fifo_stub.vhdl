-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.1 (lin64) Build 1538259 Fri Apr  8 15:45:23 MDT 2016
-- Date        : Sat Mar 31 22:56:08 2018
-- Host        : redrealm.cse.psu.edu running 64-bit unknown
-- Command     : write_vhdl -force -mode synth_stub
--               /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/prefetch_buffer_fifo/prefetch_buffer_fifo_stub.vhdl
-- Design      : prefetch_buffer_fifo
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku115-flva1517-3-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prefetch_buffer_fifo is
  Port ( 
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 15 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC
  );

end prefetch_buffer_fifo;

architecture stub of prefetch_buffer_fifo is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "wr_clk,rd_clk,din[15:0],wr_en,rd_en,dout[15:0],full,empty";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fifo_generator_v13_1_0,Vivado 2016.1";
begin
end;
