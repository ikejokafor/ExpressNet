-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.1 (lin64) Build 1538259 Fri Apr  8 15:45:23 MDT 2016
-- Date        : Tue Mar 20 15:45:55 2018
-- Host        : redrealm.cse.psu.edu running 64-bit unknown
-- Command     : write_vhdl -force -mode synth_stub
--               /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/xilinx_dual_port_2_clock_ram/xilinx_dual_port_2_clock_ram_stub.vhdl
-- Design      : xilinx_dual_port_2_clock_ram
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku115-flva1517-3-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xilinx_dual_port_2_clock_ram is
  Port ( 
    clka : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 127 downto 0 );
    clkb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 11 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end xilinx_dual_port_2_clock_ram;

architecture stub of xilinx_dual_port_2_clock_ram is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,wea[0:0],addra[8:0],dina[127:0],clkb,addrb[11:0],doutb[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_3_2,Vivado 2016.1";
begin
end;
