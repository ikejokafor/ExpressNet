-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Wed Jun 16 18:41:37 2021
-- Host        : e5-cse-322-17 running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode funcsim
--               /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/conv1x1_dwc_fifo/conv1x1_dwc_fifo_sim_netlist.vhdl
-- Design      : conv1x1_dwc_fifo
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcvu37p-fsvh2892-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_31 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_31 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_31;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_31 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_32 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_32 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_32;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_32 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_33 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_33 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_33;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_33 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_34 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_34 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_34;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_34 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_35 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_35 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_35;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_35 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_36 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_36 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_36;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_36 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_37 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_37 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_37;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_37 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_38 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_38 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_38;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_38 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_39 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_39 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_39;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_39 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_40 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_40 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_40;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_40 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_41 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_41 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_41;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_41 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_42 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_42 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_42;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_42 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_43 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_43 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_43;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_43 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_44 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_44 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_44;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_44 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_45 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_45 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_45;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_45 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_46 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_46 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_46;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_46 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_47 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_47 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_47;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_47 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_48 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_48 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_48;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_48 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_49 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_49 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_49;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_49 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_50 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_50 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_50;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_50 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_51 is
  port (
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_51 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_51;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_51 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal p_4_out : STD_LOGIC;
  signal p_5_out : STD_LOGIC;
  signal p_6_out : STD_LOGIC;
  signal p_7_out : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => p_4_out,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => empty,
      FULL => full,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => p_6_out,
      RDRSTBUSY => rd_rst_busy,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => p_5_out,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => p_7_out,
      WRRSTBUSY => wr_rst_busy
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_52 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_52 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_52;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_52 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_53 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_53 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_53;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_53 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_54 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_54 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_54;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_54 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_55 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_55 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_55;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_55 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_56 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_56 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_56;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_56 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_57 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_57 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_57;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_57 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_58 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_58 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_58;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_58 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_59 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_59 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_59;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_59 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_60 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_60 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_60;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_60 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_prim_61 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_prim_61 : entity is "builtin_prim";
end conv1x1_dwc_fifo_builtin_prim_61;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_prim_61 is
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_11\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_184\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_185\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_186\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_187\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_188\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_189\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_19\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_190\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_191\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_2\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_20\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_21\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_22\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_23\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_24\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_25\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_26\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_27\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_28\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_29\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_3\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_30\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_31\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_32\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_33\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_34\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_35\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_36\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_37\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_38\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_39\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_4\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_6\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_72\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_73\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_74\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_75\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_76\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_77\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_78\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_79\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_8\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_80\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_81\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_82\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_83\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_84\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_85\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_86\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_87\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_88\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_89\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_9\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_90\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_91\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_92\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_93\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_94\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_95\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_96\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_97\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_98\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_99\ : STD_LOGIC;
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "COMMON",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 2,
      PROG_FULL_THRESH => 8190,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 4
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED\(63 downto 32),
      CASDOUT(31) => \gf36e2_inst.sngfifo36e2_n_72\,
      CASDOUT(30) => \gf36e2_inst.sngfifo36e2_n_73\,
      CASDOUT(29) => \gf36e2_inst.sngfifo36e2_n_74\,
      CASDOUT(28) => \gf36e2_inst.sngfifo36e2_n_75\,
      CASDOUT(27) => \gf36e2_inst.sngfifo36e2_n_76\,
      CASDOUT(26) => \gf36e2_inst.sngfifo36e2_n_77\,
      CASDOUT(25) => \gf36e2_inst.sngfifo36e2_n_78\,
      CASDOUT(24) => \gf36e2_inst.sngfifo36e2_n_79\,
      CASDOUT(23) => \gf36e2_inst.sngfifo36e2_n_80\,
      CASDOUT(22) => \gf36e2_inst.sngfifo36e2_n_81\,
      CASDOUT(21) => \gf36e2_inst.sngfifo36e2_n_82\,
      CASDOUT(20) => \gf36e2_inst.sngfifo36e2_n_83\,
      CASDOUT(19) => \gf36e2_inst.sngfifo36e2_n_84\,
      CASDOUT(18) => \gf36e2_inst.sngfifo36e2_n_85\,
      CASDOUT(17) => \gf36e2_inst.sngfifo36e2_n_86\,
      CASDOUT(16) => \gf36e2_inst.sngfifo36e2_n_87\,
      CASDOUT(15) => \gf36e2_inst.sngfifo36e2_n_88\,
      CASDOUT(14) => \gf36e2_inst.sngfifo36e2_n_89\,
      CASDOUT(13) => \gf36e2_inst.sngfifo36e2_n_90\,
      CASDOUT(12) => \gf36e2_inst.sngfifo36e2_n_91\,
      CASDOUT(11) => \gf36e2_inst.sngfifo36e2_n_92\,
      CASDOUT(10) => \gf36e2_inst.sngfifo36e2_n_93\,
      CASDOUT(9) => \gf36e2_inst.sngfifo36e2_n_94\,
      CASDOUT(8) => \gf36e2_inst.sngfifo36e2_n_95\,
      CASDOUT(7) => \gf36e2_inst.sngfifo36e2_n_96\,
      CASDOUT(6) => \gf36e2_inst.sngfifo36e2_n_97\,
      CASDOUT(5) => \gf36e2_inst.sngfifo36e2_n_98\,
      CASDOUT(4) => \gf36e2_inst.sngfifo36e2_n_99\,
      CASDOUT(3) => \gf36e2_inst.sngfifo36e2_n_100\,
      CASDOUT(2) => \gf36e2_inst.sngfifo36e2_n_101\,
      CASDOUT(1) => \gf36e2_inst.sngfifo36e2_n_102\,
      CASDOUT(0) => \gf36e2_inst.sngfifo36e2_n_103\,
      CASDOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED\(7 downto 0),
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => \gf36e2_inst.sngfifo36e2_n_2\,
      DIN(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DIN(3 downto 0) => din(3 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63 downto 32) => \NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED\(63 downto 32),
      DOUT(31 downto 28) => dout(3 downto 0),
      DOUT(27 downto 24) => dout(7 downto 4),
      DOUT(23 downto 20) => dout(11 downto 8),
      DOUT(19 downto 16) => dout(15 downto 12),
      DOUT(15 downto 12) => dout(19 downto 16),
      DOUT(11 downto 8) => dout(23 downto 20),
      DOUT(7 downto 4) => dout(27 downto 24),
      DOUT(3 downto 0) => dout(31 downto 28),
      DOUTP(7 downto 0) => \NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \gf36e2_inst.sngfifo36e2_n_3\,
      FULL => \gf36e2_inst.sngfifo36e2_n_4\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => \gf36e2_inst.sngfifo36e2_n_6\,
      RDCLK => clk,
      RDCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_12\,
      RDCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_13\,
      RDCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_14\,
      RDCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_15\,
      RDCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_16\,
      RDCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_17\,
      RDCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_18\,
      RDCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_19\,
      RDCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_20\,
      RDCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_21\,
      RDCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_22\,
      RDCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_23\,
      RDCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_24\,
      RDCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_25\,
      RDEN => rd_en,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => \gf36e2_inst.sngfifo36e2_n_8\,
      REGCE => rd_en,
      RST => srst,
      RSTREG => srst,
      SBITERR => \gf36e2_inst.sngfifo36e2_n_9\,
      SLEEP => '0',
      WRCLK => clk,
      WRCOUNT(13) => \gf36e2_inst.sngfifo36e2_n_26\,
      WRCOUNT(12) => \gf36e2_inst.sngfifo36e2_n_27\,
      WRCOUNT(11) => \gf36e2_inst.sngfifo36e2_n_28\,
      WRCOUNT(10) => \gf36e2_inst.sngfifo36e2_n_29\,
      WRCOUNT(9) => \gf36e2_inst.sngfifo36e2_n_30\,
      WRCOUNT(8) => \gf36e2_inst.sngfifo36e2_n_31\,
      WRCOUNT(7) => \gf36e2_inst.sngfifo36e2_n_32\,
      WRCOUNT(6) => \gf36e2_inst.sngfifo36e2_n_33\,
      WRCOUNT(5) => \gf36e2_inst.sngfifo36e2_n_34\,
      WRCOUNT(4) => \gf36e2_inst.sngfifo36e2_n_35\,
      WRCOUNT(3) => \gf36e2_inst.sngfifo36e2_n_36\,
      WRCOUNT(2) => \gf36e2_inst.sngfifo36e2_n_37\,
      WRCOUNT(1) => \gf36e2_inst.sngfifo36e2_n_38\,
      WRCOUNT(0) => \gf36e2_inst.sngfifo36e2_n_39\,
      WREN => wr_en,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => \gf36e2_inst.sngfifo36e2_n_11\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_61
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[10].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[10].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_0 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_0;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_0 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_60
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[11].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[11].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_1 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_1;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_1 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_59
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[12].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[12].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_10 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_10 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_10;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_10 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_50
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[20].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[20].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_11 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_11 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_11;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_11 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_49
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[21].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[21].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_12 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_12 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_12;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_12 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_48
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[22].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[22].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_13 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_13 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_13;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_13 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_47
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[23].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[23].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_14 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_14 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_14;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_14 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_46
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[24].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[24].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_15 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_15 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_15;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_15 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_45
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[25].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[25].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_16 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_16 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_16;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_16 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_44
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[26].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[26].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_17 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_17 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_17;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_17 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_43
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[27].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[27].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_18 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_18 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_18;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_18 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_42
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[28].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[28].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_19 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_19 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_19;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_19 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_41
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[29].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[29].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_2 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_2 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_2;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_2 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_58
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[13].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[13].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_20 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_20 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_20;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_20 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_40
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[2].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[2].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_21 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_21 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_21;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_21 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_39
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[30].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[30].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_22 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_22 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_22;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_22 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_38
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[31].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[31].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_23 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_23 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_23;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_23 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_37
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[32].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[32].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_24 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_24 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_24;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_24 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_36
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[3].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[3].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_25 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_25 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_25;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_25 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_35
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[4].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[4].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_26 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_26 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_26;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_26 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_34
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[5].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[5].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_27 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_27 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_27;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_27 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_33
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[6].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[6].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_28 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_28 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_28;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_28 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_32
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[7].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[7].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_29 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_29 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_29;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_29 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_31
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[8].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[8].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_3 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_3 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_3;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_3 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_57
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[14].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[14].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_30 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_30 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_30;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_30 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[9].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[9].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_4 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_4 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_4;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_4 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_56
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[15].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[15].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_5 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_5 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_5;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_5 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_55
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[16].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[16].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_6 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_6 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_6;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_6 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_54
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[17].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[17].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_7 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_7 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_7;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_7 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_53
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[18].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[18].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_8 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_8 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_8;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_8 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_52
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[19].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[19].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_extdepth_9 is
  port (
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_extdepth_9 : entity is "builtin_extdepth";
end conv1x1_dwc_fifo_builtin_extdepth_9;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_extdepth_9 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.conv1x1_dwc_fifo_builtin_prim_51
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      empty => empty,
      full => full,
      rd_en => rd_en,
      rd_rst_busy => rd_rst_busy,
      srst => srst,
      wr_en => wr_en,
      wr_rst_busy => wr_rst_busy
    );
\rst_val_asym.gextw_asym[1].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_asym.gextw_asym[1].inst_extdi_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_builtin_top is
  port (
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 127 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_builtin_top : entity is "builtin_top";
end conv1x1_dwc_fifo_builtin_top;

architecture STRUCTURE of conv1x1_dwc_fifo_builtin_top is
begin
\rst_val_asym.gextw_asym[10].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth
     port map (
      clk => clk,
      din(3 downto 0) => din(39 downto 36),
      dout(31 downto 28) => dout(935 downto 932),
      dout(27 downto 24) => dout(807 downto 804),
      dout(23 downto 20) => dout(679 downto 676),
      dout(19 downto 16) => dout(551 downto 548),
      dout(15 downto 12) => dout(423 downto 420),
      dout(11 downto 8) => dout(295 downto 292),
      dout(7 downto 4) => dout(167 downto 164),
      dout(3 downto 0) => dout(39 downto 36),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[11].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_0
     port map (
      clk => clk,
      din(3 downto 0) => din(43 downto 40),
      dout(31 downto 28) => dout(939 downto 936),
      dout(27 downto 24) => dout(811 downto 808),
      dout(23 downto 20) => dout(683 downto 680),
      dout(19 downto 16) => dout(555 downto 552),
      dout(15 downto 12) => dout(427 downto 424),
      dout(11 downto 8) => dout(299 downto 296),
      dout(7 downto 4) => dout(171 downto 168),
      dout(3 downto 0) => dout(43 downto 40),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[12].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_1
     port map (
      clk => clk,
      din(3 downto 0) => din(47 downto 44),
      dout(31 downto 28) => dout(943 downto 940),
      dout(27 downto 24) => dout(815 downto 812),
      dout(23 downto 20) => dout(687 downto 684),
      dout(19 downto 16) => dout(559 downto 556),
      dout(15 downto 12) => dout(431 downto 428),
      dout(11 downto 8) => dout(303 downto 300),
      dout(7 downto 4) => dout(175 downto 172),
      dout(3 downto 0) => dout(47 downto 44),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[13].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_2
     port map (
      clk => clk,
      din(3 downto 0) => din(51 downto 48),
      dout(31 downto 28) => dout(947 downto 944),
      dout(27 downto 24) => dout(819 downto 816),
      dout(23 downto 20) => dout(691 downto 688),
      dout(19 downto 16) => dout(563 downto 560),
      dout(15 downto 12) => dout(435 downto 432),
      dout(11 downto 8) => dout(307 downto 304),
      dout(7 downto 4) => dout(179 downto 176),
      dout(3 downto 0) => dout(51 downto 48),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[14].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_3
     port map (
      clk => clk,
      din(3 downto 0) => din(55 downto 52),
      dout(31 downto 28) => dout(951 downto 948),
      dout(27 downto 24) => dout(823 downto 820),
      dout(23 downto 20) => dout(695 downto 692),
      dout(19 downto 16) => dout(567 downto 564),
      dout(15 downto 12) => dout(439 downto 436),
      dout(11 downto 8) => dout(311 downto 308),
      dout(7 downto 4) => dout(183 downto 180),
      dout(3 downto 0) => dout(55 downto 52),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[15].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_4
     port map (
      clk => clk,
      din(3 downto 0) => din(59 downto 56),
      dout(31 downto 28) => dout(955 downto 952),
      dout(27 downto 24) => dout(827 downto 824),
      dout(23 downto 20) => dout(699 downto 696),
      dout(19 downto 16) => dout(571 downto 568),
      dout(15 downto 12) => dout(443 downto 440),
      dout(11 downto 8) => dout(315 downto 312),
      dout(7 downto 4) => dout(187 downto 184),
      dout(3 downto 0) => dout(59 downto 56),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[16].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_5
     port map (
      clk => clk,
      din(3 downto 0) => din(63 downto 60),
      dout(31 downto 28) => dout(959 downto 956),
      dout(27 downto 24) => dout(831 downto 828),
      dout(23 downto 20) => dout(703 downto 700),
      dout(19 downto 16) => dout(575 downto 572),
      dout(15 downto 12) => dout(447 downto 444),
      dout(11 downto 8) => dout(319 downto 316),
      dout(7 downto 4) => dout(191 downto 188),
      dout(3 downto 0) => dout(63 downto 60),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[17].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_6
     port map (
      clk => clk,
      din(3 downto 0) => din(67 downto 64),
      dout(31 downto 28) => dout(963 downto 960),
      dout(27 downto 24) => dout(835 downto 832),
      dout(23 downto 20) => dout(707 downto 704),
      dout(19 downto 16) => dout(579 downto 576),
      dout(15 downto 12) => dout(451 downto 448),
      dout(11 downto 8) => dout(323 downto 320),
      dout(7 downto 4) => dout(195 downto 192),
      dout(3 downto 0) => dout(67 downto 64),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[18].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_7
     port map (
      clk => clk,
      din(3 downto 0) => din(71 downto 68),
      dout(31 downto 28) => dout(967 downto 964),
      dout(27 downto 24) => dout(839 downto 836),
      dout(23 downto 20) => dout(711 downto 708),
      dout(19 downto 16) => dout(583 downto 580),
      dout(15 downto 12) => dout(455 downto 452),
      dout(11 downto 8) => dout(327 downto 324),
      dout(7 downto 4) => dout(199 downto 196),
      dout(3 downto 0) => dout(71 downto 68),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[19].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_8
     port map (
      clk => clk,
      din(3 downto 0) => din(75 downto 72),
      dout(31 downto 28) => dout(971 downto 968),
      dout(27 downto 24) => dout(843 downto 840),
      dout(23 downto 20) => dout(715 downto 712),
      dout(19 downto 16) => dout(587 downto 584),
      dout(15 downto 12) => dout(459 downto 456),
      dout(11 downto 8) => dout(331 downto 328),
      dout(7 downto 4) => dout(203 downto 200),
      dout(3 downto 0) => dout(75 downto 72),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[1].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_9
     port map (
      clk => clk,
      din(3 downto 0) => din(3 downto 0),
      dout(31 downto 28) => dout(899 downto 896),
      dout(27 downto 24) => dout(771 downto 768),
      dout(23 downto 20) => dout(643 downto 640),
      dout(19 downto 16) => dout(515 downto 512),
      dout(15 downto 12) => dout(387 downto 384),
      dout(11 downto 8) => dout(259 downto 256),
      dout(7 downto 4) => dout(131 downto 128),
      dout(3 downto 0) => dout(3 downto 0),
      empty => empty,
      full => full,
      rd_en => rd_en,
      rd_rst_busy => rd_rst_busy,
      srst => srst,
      wr_en => wr_en,
      wr_rst_busy => wr_rst_busy
    );
\rst_val_asym.gextw_asym[20].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_10
     port map (
      clk => clk,
      din(3 downto 0) => din(79 downto 76),
      dout(31 downto 28) => dout(975 downto 972),
      dout(27 downto 24) => dout(847 downto 844),
      dout(23 downto 20) => dout(719 downto 716),
      dout(19 downto 16) => dout(591 downto 588),
      dout(15 downto 12) => dout(463 downto 460),
      dout(11 downto 8) => dout(335 downto 332),
      dout(7 downto 4) => dout(207 downto 204),
      dout(3 downto 0) => dout(79 downto 76),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[21].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_11
     port map (
      clk => clk,
      din(3 downto 0) => din(83 downto 80),
      dout(31 downto 28) => dout(979 downto 976),
      dout(27 downto 24) => dout(851 downto 848),
      dout(23 downto 20) => dout(723 downto 720),
      dout(19 downto 16) => dout(595 downto 592),
      dout(15 downto 12) => dout(467 downto 464),
      dout(11 downto 8) => dout(339 downto 336),
      dout(7 downto 4) => dout(211 downto 208),
      dout(3 downto 0) => dout(83 downto 80),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[22].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_12
     port map (
      clk => clk,
      din(3 downto 0) => din(87 downto 84),
      dout(31 downto 28) => dout(983 downto 980),
      dout(27 downto 24) => dout(855 downto 852),
      dout(23 downto 20) => dout(727 downto 724),
      dout(19 downto 16) => dout(599 downto 596),
      dout(15 downto 12) => dout(471 downto 468),
      dout(11 downto 8) => dout(343 downto 340),
      dout(7 downto 4) => dout(215 downto 212),
      dout(3 downto 0) => dout(87 downto 84),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[23].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_13
     port map (
      clk => clk,
      din(3 downto 0) => din(91 downto 88),
      dout(31 downto 28) => dout(987 downto 984),
      dout(27 downto 24) => dout(859 downto 856),
      dout(23 downto 20) => dout(731 downto 728),
      dout(19 downto 16) => dout(603 downto 600),
      dout(15 downto 12) => dout(475 downto 472),
      dout(11 downto 8) => dout(347 downto 344),
      dout(7 downto 4) => dout(219 downto 216),
      dout(3 downto 0) => dout(91 downto 88),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[24].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_14
     port map (
      clk => clk,
      din(3 downto 0) => din(95 downto 92),
      dout(31 downto 28) => dout(991 downto 988),
      dout(27 downto 24) => dout(863 downto 860),
      dout(23 downto 20) => dout(735 downto 732),
      dout(19 downto 16) => dout(607 downto 604),
      dout(15 downto 12) => dout(479 downto 476),
      dout(11 downto 8) => dout(351 downto 348),
      dout(7 downto 4) => dout(223 downto 220),
      dout(3 downto 0) => dout(95 downto 92),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[25].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_15
     port map (
      clk => clk,
      din(3 downto 0) => din(99 downto 96),
      dout(31 downto 28) => dout(995 downto 992),
      dout(27 downto 24) => dout(867 downto 864),
      dout(23 downto 20) => dout(739 downto 736),
      dout(19 downto 16) => dout(611 downto 608),
      dout(15 downto 12) => dout(483 downto 480),
      dout(11 downto 8) => dout(355 downto 352),
      dout(7 downto 4) => dout(227 downto 224),
      dout(3 downto 0) => dout(99 downto 96),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[26].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_16
     port map (
      clk => clk,
      din(3 downto 0) => din(103 downto 100),
      dout(31 downto 28) => dout(999 downto 996),
      dout(27 downto 24) => dout(871 downto 868),
      dout(23 downto 20) => dout(743 downto 740),
      dout(19 downto 16) => dout(615 downto 612),
      dout(15 downto 12) => dout(487 downto 484),
      dout(11 downto 8) => dout(359 downto 356),
      dout(7 downto 4) => dout(231 downto 228),
      dout(3 downto 0) => dout(103 downto 100),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[27].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_17
     port map (
      clk => clk,
      din(3 downto 0) => din(107 downto 104),
      dout(31 downto 28) => dout(1003 downto 1000),
      dout(27 downto 24) => dout(875 downto 872),
      dout(23 downto 20) => dout(747 downto 744),
      dout(19 downto 16) => dout(619 downto 616),
      dout(15 downto 12) => dout(491 downto 488),
      dout(11 downto 8) => dout(363 downto 360),
      dout(7 downto 4) => dout(235 downto 232),
      dout(3 downto 0) => dout(107 downto 104),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[28].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_18
     port map (
      clk => clk,
      din(3 downto 0) => din(111 downto 108),
      dout(31 downto 28) => dout(1007 downto 1004),
      dout(27 downto 24) => dout(879 downto 876),
      dout(23 downto 20) => dout(751 downto 748),
      dout(19 downto 16) => dout(623 downto 620),
      dout(15 downto 12) => dout(495 downto 492),
      dout(11 downto 8) => dout(367 downto 364),
      dout(7 downto 4) => dout(239 downto 236),
      dout(3 downto 0) => dout(111 downto 108),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[29].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_19
     port map (
      clk => clk,
      din(3 downto 0) => din(115 downto 112),
      dout(31 downto 28) => dout(1011 downto 1008),
      dout(27 downto 24) => dout(883 downto 880),
      dout(23 downto 20) => dout(755 downto 752),
      dout(19 downto 16) => dout(627 downto 624),
      dout(15 downto 12) => dout(499 downto 496),
      dout(11 downto 8) => dout(371 downto 368),
      dout(7 downto 4) => dout(243 downto 240),
      dout(3 downto 0) => dout(115 downto 112),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[2].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_20
     port map (
      clk => clk,
      din(3 downto 0) => din(7 downto 4),
      dout(31 downto 28) => dout(903 downto 900),
      dout(27 downto 24) => dout(775 downto 772),
      dout(23 downto 20) => dout(647 downto 644),
      dout(19 downto 16) => dout(519 downto 516),
      dout(15 downto 12) => dout(391 downto 388),
      dout(11 downto 8) => dout(263 downto 260),
      dout(7 downto 4) => dout(135 downto 132),
      dout(3 downto 0) => dout(7 downto 4),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[30].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_21
     port map (
      clk => clk,
      din(3 downto 0) => din(119 downto 116),
      dout(31 downto 28) => dout(1015 downto 1012),
      dout(27 downto 24) => dout(887 downto 884),
      dout(23 downto 20) => dout(759 downto 756),
      dout(19 downto 16) => dout(631 downto 628),
      dout(15 downto 12) => dout(503 downto 500),
      dout(11 downto 8) => dout(375 downto 372),
      dout(7 downto 4) => dout(247 downto 244),
      dout(3 downto 0) => dout(119 downto 116),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[31].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_22
     port map (
      clk => clk,
      din(3 downto 0) => din(123 downto 120),
      dout(31 downto 28) => dout(1019 downto 1016),
      dout(27 downto 24) => dout(891 downto 888),
      dout(23 downto 20) => dout(763 downto 760),
      dout(19 downto 16) => dout(635 downto 632),
      dout(15 downto 12) => dout(507 downto 504),
      dout(11 downto 8) => dout(379 downto 376),
      dout(7 downto 4) => dout(251 downto 248),
      dout(3 downto 0) => dout(123 downto 120),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[32].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_23
     port map (
      clk => clk,
      din(3 downto 0) => din(127 downto 124),
      dout(31 downto 28) => dout(1023 downto 1020),
      dout(27 downto 24) => dout(895 downto 892),
      dout(23 downto 20) => dout(767 downto 764),
      dout(19 downto 16) => dout(639 downto 636),
      dout(15 downto 12) => dout(511 downto 508),
      dout(11 downto 8) => dout(383 downto 380),
      dout(7 downto 4) => dout(255 downto 252),
      dout(3 downto 0) => dout(127 downto 124),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[3].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_24
     port map (
      clk => clk,
      din(3 downto 0) => din(11 downto 8),
      dout(31 downto 28) => dout(907 downto 904),
      dout(27 downto 24) => dout(779 downto 776),
      dout(23 downto 20) => dout(651 downto 648),
      dout(19 downto 16) => dout(523 downto 520),
      dout(15 downto 12) => dout(395 downto 392),
      dout(11 downto 8) => dout(267 downto 264),
      dout(7 downto 4) => dout(139 downto 136),
      dout(3 downto 0) => dout(11 downto 8),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[4].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_25
     port map (
      clk => clk,
      din(3 downto 0) => din(15 downto 12),
      dout(31 downto 28) => dout(911 downto 908),
      dout(27 downto 24) => dout(783 downto 780),
      dout(23 downto 20) => dout(655 downto 652),
      dout(19 downto 16) => dout(527 downto 524),
      dout(15 downto 12) => dout(399 downto 396),
      dout(11 downto 8) => dout(271 downto 268),
      dout(7 downto 4) => dout(143 downto 140),
      dout(3 downto 0) => dout(15 downto 12),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[5].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_26
     port map (
      clk => clk,
      din(3 downto 0) => din(19 downto 16),
      dout(31 downto 28) => dout(915 downto 912),
      dout(27 downto 24) => dout(787 downto 784),
      dout(23 downto 20) => dout(659 downto 656),
      dout(19 downto 16) => dout(531 downto 528),
      dout(15 downto 12) => dout(403 downto 400),
      dout(11 downto 8) => dout(275 downto 272),
      dout(7 downto 4) => dout(147 downto 144),
      dout(3 downto 0) => dout(19 downto 16),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[6].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_27
     port map (
      clk => clk,
      din(3 downto 0) => din(23 downto 20),
      dout(31 downto 28) => dout(919 downto 916),
      dout(27 downto 24) => dout(791 downto 788),
      dout(23 downto 20) => dout(663 downto 660),
      dout(19 downto 16) => dout(535 downto 532),
      dout(15 downto 12) => dout(407 downto 404),
      dout(11 downto 8) => dout(279 downto 276),
      dout(7 downto 4) => dout(151 downto 148),
      dout(3 downto 0) => dout(23 downto 20),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[7].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_28
     port map (
      clk => clk,
      din(3 downto 0) => din(27 downto 24),
      dout(31 downto 28) => dout(923 downto 920),
      dout(27 downto 24) => dout(795 downto 792),
      dout(23 downto 20) => dout(667 downto 664),
      dout(19 downto 16) => dout(539 downto 536),
      dout(15 downto 12) => dout(411 downto 408),
      dout(11 downto 8) => dout(283 downto 280),
      dout(7 downto 4) => dout(155 downto 152),
      dout(3 downto 0) => dout(27 downto 24),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[8].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_29
     port map (
      clk => clk,
      din(3 downto 0) => din(31 downto 28),
      dout(31 downto 28) => dout(927 downto 924),
      dout(27 downto 24) => dout(799 downto 796),
      dout(23 downto 20) => dout(671 downto 668),
      dout(19 downto 16) => dout(543 downto 540),
      dout(15 downto 12) => dout(415 downto 412),
      dout(11 downto 8) => dout(287 downto 284),
      dout(7 downto 4) => dout(159 downto 156),
      dout(3 downto 0) => dout(31 downto 28),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
\rst_val_asym.gextw_asym[9].inst_extd\: entity work.conv1x1_dwc_fifo_builtin_extdepth_30
     port map (
      clk => clk,
      din(3 downto 0) => din(35 downto 32),
      dout(31 downto 28) => dout(931 downto 928),
      dout(27 downto 24) => dout(803 downto 800),
      dout(23 downto 20) => dout(675 downto 672),
      dout(19 downto 16) => dout(547 downto 544),
      dout(15 downto 12) => dout(419 downto 416),
      dout(11 downto 8) => dout(291 downto 288),
      dout(7 downto 4) => dout(163 downto 160),
      dout(3 downto 0) => dout(35 downto 32),
      rd_en => rd_en,
      srst => srst,
      wr_en => wr_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_fifo_generator_v13_2_4_builtin is
  port (
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 127 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_fifo_generator_v13_2_4_builtin : entity is "fifo_generator_v13_2_4_builtin";
end conv1x1_dwc_fifo_fifo_generator_v13_2_4_builtin;

architecture STRUCTURE of conv1x1_dwc_fifo_fifo_generator_v13_2_4_builtin is
begin
\v8_fifo.fblk\: entity work.conv1x1_dwc_fifo_builtin_top
     port map (
      clk => clk,
      din(127 downto 0) => din(127 downto 0),
      dout(1023 downto 0) => dout(1023 downto 0),
      empty => empty,
      full => full,
      rd_en => rd_en,
      rd_rst_busy => rd_rst_busy,
      srst => srst,
      wr_en => wr_en,
      wr_rst_busy => wr_rst_busy
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_fifo_generator_top is
  port (
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 127 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_fifo_generator_top : entity is "fifo_generator_top";
end conv1x1_dwc_fifo_fifo_generator_top;

architecture STRUCTURE of conv1x1_dwc_fifo_fifo_generator_top is
begin
\gbi.bi\: entity work.conv1x1_dwc_fifo_fifo_generator_v13_2_4_builtin
     port map (
      clk => clk,
      din(127 downto 0) => din(127 downto 0),
      dout(1023 downto 0) => dout(1023 downto 0),
      empty => empty,
      full => full,
      rd_en => rd_en,
      rd_rst_busy => rd_rst_busy,
      srst => srst,
      wr_en => wr_en,
      wr_rst_busy => wr_rst_busy
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_fifo_generator_v13_2_4_synth is
  port (
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 127 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_fifo_generator_v13_2_4_synth : entity is "fifo_generator_v13_2_4_synth";
end conv1x1_dwc_fifo_fifo_generator_v13_2_4_synth;

architecture STRUCTURE of conv1x1_dwc_fifo_fifo_generator_v13_2_4_synth is
begin
\gconvfifo.rf\: entity work.conv1x1_dwc_fifo_fifo_generator_top
     port map (
      clk => clk,
      din(127 downto 0) => din(127 downto 0),
      dout(1023 downto 0) => dout(1023 downto 0),
      empty => empty,
      full => full,
      rd_en => rd_en,
      rd_rst_busy => rd_rst_busy,
      srst => srst,
      wr_en => wr_en,
      wr_rst_busy => wr_rst_busy
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo_fifo_generator_v13_2_4 is
  port (
    backup : in STD_LOGIC;
    backup_marker : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_rst : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 127 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    prog_empty_thresh_assert : in STD_LOGIC_VECTOR ( 9 downto 0 );
    prog_empty_thresh_negate : in STD_LOGIC_VECTOR ( 9 downto 0 );
    prog_full_thresh : in STD_LOGIC_VECTOR ( 12 downto 0 );
    prog_full_thresh_assert : in STD_LOGIC_VECTOR ( 12 downto 0 );
    prog_full_thresh_negate : in STD_LOGIC_VECTOR ( 12 downto 0 );
    int_clk : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    injectsbiterr : in STD_LOGIC;
    sleep : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    full : out STD_LOGIC;
    almost_full : out STD_LOGIC;
    wr_ack : out STD_LOGIC;
    overflow : out STD_LOGIC;
    empty : out STD_LOGIC;
    almost_empty : out STD_LOGIC;
    valid : out STD_LOGIC;
    underflow : out STD_LOGIC;
    data_count : out STD_LOGIC_VECTOR ( 12 downto 0 );
    rd_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    wr_data_count : out STD_LOGIC_VECTOR ( 12 downto 0 );
    prog_full : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    m_aclk_en : in STD_LOGIC;
    s_aclk_en : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_buser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_buser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_ruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_ruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_injectsbiterr : in STD_LOGIC;
    axi_aw_injectdbiterr : in STD_LOGIC;
    axi_aw_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_sbiterr : out STD_LOGIC;
    axi_aw_dbiterr : out STD_LOGIC;
    axi_aw_overflow : out STD_LOGIC;
    axi_aw_underflow : out STD_LOGIC;
    axi_aw_prog_full : out STD_LOGIC;
    axi_aw_prog_empty : out STD_LOGIC;
    axi_w_injectsbiterr : in STD_LOGIC;
    axi_w_injectdbiterr : in STD_LOGIC;
    axi_w_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_sbiterr : out STD_LOGIC;
    axi_w_dbiterr : out STD_LOGIC;
    axi_w_overflow : out STD_LOGIC;
    axi_w_underflow : out STD_LOGIC;
    axi_w_prog_full : out STD_LOGIC;
    axi_w_prog_empty : out STD_LOGIC;
    axi_b_injectsbiterr : in STD_LOGIC;
    axi_b_injectdbiterr : in STD_LOGIC;
    axi_b_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_sbiterr : out STD_LOGIC;
    axi_b_dbiterr : out STD_LOGIC;
    axi_b_overflow : out STD_LOGIC;
    axi_b_underflow : out STD_LOGIC;
    axi_b_prog_full : out STD_LOGIC;
    axi_b_prog_empty : out STD_LOGIC;
    axi_ar_injectsbiterr : in STD_LOGIC;
    axi_ar_injectdbiterr : in STD_LOGIC;
    axi_ar_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_sbiterr : out STD_LOGIC;
    axi_ar_dbiterr : out STD_LOGIC;
    axi_ar_overflow : out STD_LOGIC;
    axi_ar_underflow : out STD_LOGIC;
    axi_ar_prog_full : out STD_LOGIC;
    axi_ar_prog_empty : out STD_LOGIC;
    axi_r_injectsbiterr : in STD_LOGIC;
    axi_r_injectdbiterr : in STD_LOGIC;
    axi_r_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_sbiterr : out STD_LOGIC;
    axi_r_dbiterr : out STD_LOGIC;
    axi_r_overflow : out STD_LOGIC;
    axi_r_underflow : out STD_LOGIC;
    axi_r_prog_full : out STD_LOGIC;
    axi_r_prog_empty : out STD_LOGIC;
    axis_injectsbiterr : in STD_LOGIC;
    axis_injectdbiterr : in STD_LOGIC;
    axis_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_sbiterr : out STD_LOGIC;
    axis_dbiterr : out STD_LOGIC;
    axis_overflow : out STD_LOGIC;
    axis_underflow : out STD_LOGIC;
    axis_prog_full : out STD_LOGIC;
    axis_prog_empty : out STD_LOGIC
  );
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 8;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 4;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 13;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 128;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1024;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is "virtexuplusHBM";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 6;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 2;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 2;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 2;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 4;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 2;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is "8kx4";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is "1kx18";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is "512x72";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is "512x72";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 2;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 3;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 8190;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 8189;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 10;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1024;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 10;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_SELECT_XPM : integer;
  attribute C_SELECT_XPM of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 2;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 13;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 8192;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1024;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 13;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of conv1x1_dwc_fifo_fifo_generator_v13_2_4 : entity is "fifo_generator_v13_2_4";
end conv1x1_dwc_fifo_fifo_generator_v13_2_4;

architecture STRUCTURE of conv1x1_dwc_fifo_fifo_generator_v13_2_4 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
begin
  almost_empty <= \<const0>\;
  almost_full <= \<const0>\;
  axi_ar_data_count(4) <= \<const0>\;
  axi_ar_data_count(3) <= \<const0>\;
  axi_ar_data_count(2) <= \<const0>\;
  axi_ar_data_count(1) <= \<const0>\;
  axi_ar_data_count(0) <= \<const0>\;
  axi_ar_dbiterr <= \<const0>\;
  axi_ar_overflow <= \<const0>\;
  axi_ar_prog_empty <= \<const1>\;
  axi_ar_prog_full <= \<const0>\;
  axi_ar_rd_data_count(4) <= \<const0>\;
  axi_ar_rd_data_count(3) <= \<const0>\;
  axi_ar_rd_data_count(2) <= \<const0>\;
  axi_ar_rd_data_count(1) <= \<const0>\;
  axi_ar_rd_data_count(0) <= \<const0>\;
  axi_ar_sbiterr <= \<const0>\;
  axi_ar_underflow <= \<const0>\;
  axi_ar_wr_data_count(4) <= \<const0>\;
  axi_ar_wr_data_count(3) <= \<const0>\;
  axi_ar_wr_data_count(2) <= \<const0>\;
  axi_ar_wr_data_count(1) <= \<const0>\;
  axi_ar_wr_data_count(0) <= \<const0>\;
  axi_aw_data_count(4) <= \<const0>\;
  axi_aw_data_count(3) <= \<const0>\;
  axi_aw_data_count(2) <= \<const0>\;
  axi_aw_data_count(1) <= \<const0>\;
  axi_aw_data_count(0) <= \<const0>\;
  axi_aw_dbiterr <= \<const0>\;
  axi_aw_overflow <= \<const0>\;
  axi_aw_prog_empty <= \<const1>\;
  axi_aw_prog_full <= \<const0>\;
  axi_aw_rd_data_count(4) <= \<const0>\;
  axi_aw_rd_data_count(3) <= \<const0>\;
  axi_aw_rd_data_count(2) <= \<const0>\;
  axi_aw_rd_data_count(1) <= \<const0>\;
  axi_aw_rd_data_count(0) <= \<const0>\;
  axi_aw_sbiterr <= \<const0>\;
  axi_aw_underflow <= \<const0>\;
  axi_aw_wr_data_count(4) <= \<const0>\;
  axi_aw_wr_data_count(3) <= \<const0>\;
  axi_aw_wr_data_count(2) <= \<const0>\;
  axi_aw_wr_data_count(1) <= \<const0>\;
  axi_aw_wr_data_count(0) <= \<const0>\;
  axi_b_data_count(4) <= \<const0>\;
  axi_b_data_count(3) <= \<const0>\;
  axi_b_data_count(2) <= \<const0>\;
  axi_b_data_count(1) <= \<const0>\;
  axi_b_data_count(0) <= \<const0>\;
  axi_b_dbiterr <= \<const0>\;
  axi_b_overflow <= \<const0>\;
  axi_b_prog_empty <= \<const1>\;
  axi_b_prog_full <= \<const0>\;
  axi_b_rd_data_count(4) <= \<const0>\;
  axi_b_rd_data_count(3) <= \<const0>\;
  axi_b_rd_data_count(2) <= \<const0>\;
  axi_b_rd_data_count(1) <= \<const0>\;
  axi_b_rd_data_count(0) <= \<const0>\;
  axi_b_sbiterr <= \<const0>\;
  axi_b_underflow <= \<const0>\;
  axi_b_wr_data_count(4) <= \<const0>\;
  axi_b_wr_data_count(3) <= \<const0>\;
  axi_b_wr_data_count(2) <= \<const0>\;
  axi_b_wr_data_count(1) <= \<const0>\;
  axi_b_wr_data_count(0) <= \<const0>\;
  axi_r_data_count(10) <= \<const0>\;
  axi_r_data_count(9) <= \<const0>\;
  axi_r_data_count(8) <= \<const0>\;
  axi_r_data_count(7) <= \<const0>\;
  axi_r_data_count(6) <= \<const0>\;
  axi_r_data_count(5) <= \<const0>\;
  axi_r_data_count(4) <= \<const0>\;
  axi_r_data_count(3) <= \<const0>\;
  axi_r_data_count(2) <= \<const0>\;
  axi_r_data_count(1) <= \<const0>\;
  axi_r_data_count(0) <= \<const0>\;
  axi_r_dbiterr <= \<const0>\;
  axi_r_overflow <= \<const0>\;
  axi_r_prog_empty <= \<const1>\;
  axi_r_prog_full <= \<const0>\;
  axi_r_rd_data_count(10) <= \<const0>\;
  axi_r_rd_data_count(9) <= \<const0>\;
  axi_r_rd_data_count(8) <= \<const0>\;
  axi_r_rd_data_count(7) <= \<const0>\;
  axi_r_rd_data_count(6) <= \<const0>\;
  axi_r_rd_data_count(5) <= \<const0>\;
  axi_r_rd_data_count(4) <= \<const0>\;
  axi_r_rd_data_count(3) <= \<const0>\;
  axi_r_rd_data_count(2) <= \<const0>\;
  axi_r_rd_data_count(1) <= \<const0>\;
  axi_r_rd_data_count(0) <= \<const0>\;
  axi_r_sbiterr <= \<const0>\;
  axi_r_underflow <= \<const0>\;
  axi_r_wr_data_count(10) <= \<const0>\;
  axi_r_wr_data_count(9) <= \<const0>\;
  axi_r_wr_data_count(8) <= \<const0>\;
  axi_r_wr_data_count(7) <= \<const0>\;
  axi_r_wr_data_count(6) <= \<const0>\;
  axi_r_wr_data_count(5) <= \<const0>\;
  axi_r_wr_data_count(4) <= \<const0>\;
  axi_r_wr_data_count(3) <= \<const0>\;
  axi_r_wr_data_count(2) <= \<const0>\;
  axi_r_wr_data_count(1) <= \<const0>\;
  axi_r_wr_data_count(0) <= \<const0>\;
  axi_w_data_count(10) <= \<const0>\;
  axi_w_data_count(9) <= \<const0>\;
  axi_w_data_count(8) <= \<const0>\;
  axi_w_data_count(7) <= \<const0>\;
  axi_w_data_count(6) <= \<const0>\;
  axi_w_data_count(5) <= \<const0>\;
  axi_w_data_count(4) <= \<const0>\;
  axi_w_data_count(3) <= \<const0>\;
  axi_w_data_count(2) <= \<const0>\;
  axi_w_data_count(1) <= \<const0>\;
  axi_w_data_count(0) <= \<const0>\;
  axi_w_dbiterr <= \<const0>\;
  axi_w_overflow <= \<const0>\;
  axi_w_prog_empty <= \<const1>\;
  axi_w_prog_full <= \<const0>\;
  axi_w_rd_data_count(10) <= \<const0>\;
  axi_w_rd_data_count(9) <= \<const0>\;
  axi_w_rd_data_count(8) <= \<const0>\;
  axi_w_rd_data_count(7) <= \<const0>\;
  axi_w_rd_data_count(6) <= \<const0>\;
  axi_w_rd_data_count(5) <= \<const0>\;
  axi_w_rd_data_count(4) <= \<const0>\;
  axi_w_rd_data_count(3) <= \<const0>\;
  axi_w_rd_data_count(2) <= \<const0>\;
  axi_w_rd_data_count(1) <= \<const0>\;
  axi_w_rd_data_count(0) <= \<const0>\;
  axi_w_sbiterr <= \<const0>\;
  axi_w_underflow <= \<const0>\;
  axi_w_wr_data_count(10) <= \<const0>\;
  axi_w_wr_data_count(9) <= \<const0>\;
  axi_w_wr_data_count(8) <= \<const0>\;
  axi_w_wr_data_count(7) <= \<const0>\;
  axi_w_wr_data_count(6) <= \<const0>\;
  axi_w_wr_data_count(5) <= \<const0>\;
  axi_w_wr_data_count(4) <= \<const0>\;
  axi_w_wr_data_count(3) <= \<const0>\;
  axi_w_wr_data_count(2) <= \<const0>\;
  axi_w_wr_data_count(1) <= \<const0>\;
  axi_w_wr_data_count(0) <= \<const0>\;
  axis_data_count(10) <= \<const0>\;
  axis_data_count(9) <= \<const0>\;
  axis_data_count(8) <= \<const0>\;
  axis_data_count(7) <= \<const0>\;
  axis_data_count(6) <= \<const0>\;
  axis_data_count(5) <= \<const0>\;
  axis_data_count(4) <= \<const0>\;
  axis_data_count(3) <= \<const0>\;
  axis_data_count(2) <= \<const0>\;
  axis_data_count(1) <= \<const0>\;
  axis_data_count(0) <= \<const0>\;
  axis_dbiterr <= \<const0>\;
  axis_overflow <= \<const0>\;
  axis_prog_empty <= \<const1>\;
  axis_prog_full <= \<const0>\;
  axis_rd_data_count(10) <= \<const0>\;
  axis_rd_data_count(9) <= \<const0>\;
  axis_rd_data_count(8) <= \<const0>\;
  axis_rd_data_count(7) <= \<const0>\;
  axis_rd_data_count(6) <= \<const0>\;
  axis_rd_data_count(5) <= \<const0>\;
  axis_rd_data_count(4) <= \<const0>\;
  axis_rd_data_count(3) <= \<const0>\;
  axis_rd_data_count(2) <= \<const0>\;
  axis_rd_data_count(1) <= \<const0>\;
  axis_rd_data_count(0) <= \<const0>\;
  axis_sbiterr <= \<const0>\;
  axis_underflow <= \<const0>\;
  axis_wr_data_count(10) <= \<const0>\;
  axis_wr_data_count(9) <= \<const0>\;
  axis_wr_data_count(8) <= \<const0>\;
  axis_wr_data_count(7) <= \<const0>\;
  axis_wr_data_count(6) <= \<const0>\;
  axis_wr_data_count(5) <= \<const0>\;
  axis_wr_data_count(4) <= \<const0>\;
  axis_wr_data_count(3) <= \<const0>\;
  axis_wr_data_count(2) <= \<const0>\;
  axis_wr_data_count(1) <= \<const0>\;
  axis_wr_data_count(0) <= \<const0>\;
  data_count(12) <= \<const0>\;
  data_count(11) <= \<const0>\;
  data_count(10) <= \<const0>\;
  data_count(9) <= \<const0>\;
  data_count(8) <= \<const0>\;
  data_count(7) <= \<const0>\;
  data_count(6) <= \<const0>\;
  data_count(5) <= \<const0>\;
  data_count(4) <= \<const0>\;
  data_count(3) <= \<const0>\;
  data_count(2) <= \<const0>\;
  data_count(1) <= \<const0>\;
  data_count(0) <= \<const0>\;
  dbiterr <= \<const0>\;
  m_axi_araddr(31) <= \<const0>\;
  m_axi_araddr(30) <= \<const0>\;
  m_axi_araddr(29) <= \<const0>\;
  m_axi_araddr(28) <= \<const0>\;
  m_axi_araddr(27) <= \<const0>\;
  m_axi_araddr(26) <= \<const0>\;
  m_axi_araddr(25) <= \<const0>\;
  m_axi_araddr(24) <= \<const0>\;
  m_axi_araddr(23) <= \<const0>\;
  m_axi_araddr(22) <= \<const0>\;
  m_axi_araddr(21) <= \<const0>\;
  m_axi_araddr(20) <= \<const0>\;
  m_axi_araddr(19) <= \<const0>\;
  m_axi_araddr(18) <= \<const0>\;
  m_axi_araddr(17) <= \<const0>\;
  m_axi_araddr(16) <= \<const0>\;
  m_axi_araddr(15) <= \<const0>\;
  m_axi_araddr(14) <= \<const0>\;
  m_axi_araddr(13) <= \<const0>\;
  m_axi_araddr(12) <= \<const0>\;
  m_axi_araddr(11) <= \<const0>\;
  m_axi_araddr(10) <= \<const0>\;
  m_axi_araddr(9) <= \<const0>\;
  m_axi_araddr(8) <= \<const0>\;
  m_axi_araddr(7) <= \<const0>\;
  m_axi_araddr(6) <= \<const0>\;
  m_axi_araddr(5) <= \<const0>\;
  m_axi_araddr(4) <= \<const0>\;
  m_axi_araddr(3) <= \<const0>\;
  m_axi_araddr(2) <= \<const0>\;
  m_axi_araddr(1) <= \<const0>\;
  m_axi_araddr(0) <= \<const0>\;
  m_axi_arburst(1) <= \<const0>\;
  m_axi_arburst(0) <= \<const0>\;
  m_axi_arcache(3) <= \<const0>\;
  m_axi_arcache(2) <= \<const0>\;
  m_axi_arcache(1) <= \<const0>\;
  m_axi_arcache(0) <= \<const0>\;
  m_axi_arid(0) <= \<const0>\;
  m_axi_arlen(7) <= \<const0>\;
  m_axi_arlen(6) <= \<const0>\;
  m_axi_arlen(5) <= \<const0>\;
  m_axi_arlen(4) <= \<const0>\;
  m_axi_arlen(3) <= \<const0>\;
  m_axi_arlen(2) <= \<const0>\;
  m_axi_arlen(1) <= \<const0>\;
  m_axi_arlen(0) <= \<const0>\;
  m_axi_arlock(0) <= \<const0>\;
  m_axi_arprot(2) <= \<const0>\;
  m_axi_arprot(1) <= \<const0>\;
  m_axi_arprot(0) <= \<const0>\;
  m_axi_arqos(3) <= \<const0>\;
  m_axi_arqos(2) <= \<const0>\;
  m_axi_arqos(1) <= \<const0>\;
  m_axi_arqos(0) <= \<const0>\;
  m_axi_arregion(3) <= \<const0>\;
  m_axi_arregion(2) <= \<const0>\;
  m_axi_arregion(1) <= \<const0>\;
  m_axi_arregion(0) <= \<const0>\;
  m_axi_arsize(2) <= \<const0>\;
  m_axi_arsize(1) <= \<const0>\;
  m_axi_arsize(0) <= \<const0>\;
  m_axi_aruser(0) <= \<const0>\;
  m_axi_arvalid <= \<const0>\;
  m_axi_awaddr(31) <= \<const0>\;
  m_axi_awaddr(30) <= \<const0>\;
  m_axi_awaddr(29) <= \<const0>\;
  m_axi_awaddr(28) <= \<const0>\;
  m_axi_awaddr(27) <= \<const0>\;
  m_axi_awaddr(26) <= \<const0>\;
  m_axi_awaddr(25) <= \<const0>\;
  m_axi_awaddr(24) <= \<const0>\;
  m_axi_awaddr(23) <= \<const0>\;
  m_axi_awaddr(22) <= \<const0>\;
  m_axi_awaddr(21) <= \<const0>\;
  m_axi_awaddr(20) <= \<const0>\;
  m_axi_awaddr(19) <= \<const0>\;
  m_axi_awaddr(18) <= \<const0>\;
  m_axi_awaddr(17) <= \<const0>\;
  m_axi_awaddr(16) <= \<const0>\;
  m_axi_awaddr(15) <= \<const0>\;
  m_axi_awaddr(14) <= \<const0>\;
  m_axi_awaddr(13) <= \<const0>\;
  m_axi_awaddr(12) <= \<const0>\;
  m_axi_awaddr(11) <= \<const0>\;
  m_axi_awaddr(10) <= \<const0>\;
  m_axi_awaddr(9) <= \<const0>\;
  m_axi_awaddr(8) <= \<const0>\;
  m_axi_awaddr(7) <= \<const0>\;
  m_axi_awaddr(6) <= \<const0>\;
  m_axi_awaddr(5) <= \<const0>\;
  m_axi_awaddr(4) <= \<const0>\;
  m_axi_awaddr(3) <= \<const0>\;
  m_axi_awaddr(2) <= \<const0>\;
  m_axi_awaddr(1) <= \<const0>\;
  m_axi_awaddr(0) <= \<const0>\;
  m_axi_awburst(1) <= \<const0>\;
  m_axi_awburst(0) <= \<const0>\;
  m_axi_awcache(3) <= \<const0>\;
  m_axi_awcache(2) <= \<const0>\;
  m_axi_awcache(1) <= \<const0>\;
  m_axi_awcache(0) <= \<const0>\;
  m_axi_awid(0) <= \<const0>\;
  m_axi_awlen(7) <= \<const0>\;
  m_axi_awlen(6) <= \<const0>\;
  m_axi_awlen(5) <= \<const0>\;
  m_axi_awlen(4) <= \<const0>\;
  m_axi_awlen(3) <= \<const0>\;
  m_axi_awlen(2) <= \<const0>\;
  m_axi_awlen(1) <= \<const0>\;
  m_axi_awlen(0) <= \<const0>\;
  m_axi_awlock(0) <= \<const0>\;
  m_axi_awprot(2) <= \<const0>\;
  m_axi_awprot(1) <= \<const0>\;
  m_axi_awprot(0) <= \<const0>\;
  m_axi_awqos(3) <= \<const0>\;
  m_axi_awqos(2) <= \<const0>\;
  m_axi_awqos(1) <= \<const0>\;
  m_axi_awqos(0) <= \<const0>\;
  m_axi_awregion(3) <= \<const0>\;
  m_axi_awregion(2) <= \<const0>\;
  m_axi_awregion(1) <= \<const0>\;
  m_axi_awregion(0) <= \<const0>\;
  m_axi_awsize(2) <= \<const0>\;
  m_axi_awsize(1) <= \<const0>\;
  m_axi_awsize(0) <= \<const0>\;
  m_axi_awuser(0) <= \<const0>\;
  m_axi_awvalid <= \<const0>\;
  m_axi_bready <= \<const0>\;
  m_axi_rready <= \<const0>\;
  m_axi_wdata(63) <= \<const0>\;
  m_axi_wdata(62) <= \<const0>\;
  m_axi_wdata(61) <= \<const0>\;
  m_axi_wdata(60) <= \<const0>\;
  m_axi_wdata(59) <= \<const0>\;
  m_axi_wdata(58) <= \<const0>\;
  m_axi_wdata(57) <= \<const0>\;
  m_axi_wdata(56) <= \<const0>\;
  m_axi_wdata(55) <= \<const0>\;
  m_axi_wdata(54) <= \<const0>\;
  m_axi_wdata(53) <= \<const0>\;
  m_axi_wdata(52) <= \<const0>\;
  m_axi_wdata(51) <= \<const0>\;
  m_axi_wdata(50) <= \<const0>\;
  m_axi_wdata(49) <= \<const0>\;
  m_axi_wdata(48) <= \<const0>\;
  m_axi_wdata(47) <= \<const0>\;
  m_axi_wdata(46) <= \<const0>\;
  m_axi_wdata(45) <= \<const0>\;
  m_axi_wdata(44) <= \<const0>\;
  m_axi_wdata(43) <= \<const0>\;
  m_axi_wdata(42) <= \<const0>\;
  m_axi_wdata(41) <= \<const0>\;
  m_axi_wdata(40) <= \<const0>\;
  m_axi_wdata(39) <= \<const0>\;
  m_axi_wdata(38) <= \<const0>\;
  m_axi_wdata(37) <= \<const0>\;
  m_axi_wdata(36) <= \<const0>\;
  m_axi_wdata(35) <= \<const0>\;
  m_axi_wdata(34) <= \<const0>\;
  m_axi_wdata(33) <= \<const0>\;
  m_axi_wdata(32) <= \<const0>\;
  m_axi_wdata(31) <= \<const0>\;
  m_axi_wdata(30) <= \<const0>\;
  m_axi_wdata(29) <= \<const0>\;
  m_axi_wdata(28) <= \<const0>\;
  m_axi_wdata(27) <= \<const0>\;
  m_axi_wdata(26) <= \<const0>\;
  m_axi_wdata(25) <= \<const0>\;
  m_axi_wdata(24) <= \<const0>\;
  m_axi_wdata(23) <= \<const0>\;
  m_axi_wdata(22) <= \<const0>\;
  m_axi_wdata(21) <= \<const0>\;
  m_axi_wdata(20) <= \<const0>\;
  m_axi_wdata(19) <= \<const0>\;
  m_axi_wdata(18) <= \<const0>\;
  m_axi_wdata(17) <= \<const0>\;
  m_axi_wdata(16) <= \<const0>\;
  m_axi_wdata(15) <= \<const0>\;
  m_axi_wdata(14) <= \<const0>\;
  m_axi_wdata(13) <= \<const0>\;
  m_axi_wdata(12) <= \<const0>\;
  m_axi_wdata(11) <= \<const0>\;
  m_axi_wdata(10) <= \<const0>\;
  m_axi_wdata(9) <= \<const0>\;
  m_axi_wdata(8) <= \<const0>\;
  m_axi_wdata(7) <= \<const0>\;
  m_axi_wdata(6) <= \<const0>\;
  m_axi_wdata(5) <= \<const0>\;
  m_axi_wdata(4) <= \<const0>\;
  m_axi_wdata(3) <= \<const0>\;
  m_axi_wdata(2) <= \<const0>\;
  m_axi_wdata(1) <= \<const0>\;
  m_axi_wdata(0) <= \<const0>\;
  m_axi_wid(0) <= \<const0>\;
  m_axi_wlast <= \<const0>\;
  m_axi_wstrb(7) <= \<const0>\;
  m_axi_wstrb(6) <= \<const0>\;
  m_axi_wstrb(5) <= \<const0>\;
  m_axi_wstrb(4) <= \<const0>\;
  m_axi_wstrb(3) <= \<const0>\;
  m_axi_wstrb(2) <= \<const0>\;
  m_axi_wstrb(1) <= \<const0>\;
  m_axi_wstrb(0) <= \<const0>\;
  m_axi_wuser(0) <= \<const0>\;
  m_axi_wvalid <= \<const0>\;
  m_axis_tdata(7) <= \<const0>\;
  m_axis_tdata(6) <= \<const0>\;
  m_axis_tdata(5) <= \<const0>\;
  m_axis_tdata(4) <= \<const0>\;
  m_axis_tdata(3) <= \<const0>\;
  m_axis_tdata(2) <= \<const0>\;
  m_axis_tdata(1) <= \<const0>\;
  m_axis_tdata(0) <= \<const0>\;
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tkeep(0) <= \<const0>\;
  m_axis_tlast <= \<const0>\;
  m_axis_tstrb(0) <= \<const0>\;
  m_axis_tuser(3) <= \<const0>\;
  m_axis_tuser(2) <= \<const0>\;
  m_axis_tuser(1) <= \<const0>\;
  m_axis_tuser(0) <= \<const0>\;
  m_axis_tvalid <= \<const0>\;
  overflow <= \<const0>\;
  prog_empty <= \<const0>\;
  prog_full <= \<const0>\;
  rd_data_count(9) <= \<const0>\;
  rd_data_count(8) <= \<const0>\;
  rd_data_count(7) <= \<const0>\;
  rd_data_count(6) <= \<const0>\;
  rd_data_count(5) <= \<const0>\;
  rd_data_count(4) <= \<const0>\;
  rd_data_count(3) <= \<const0>\;
  rd_data_count(2) <= \<const0>\;
  rd_data_count(1) <= \<const0>\;
  rd_data_count(0) <= \<const0>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bid(0) <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_buser(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_rdata(63) <= \<const0>\;
  s_axi_rdata(62) <= \<const0>\;
  s_axi_rdata(61) <= \<const0>\;
  s_axi_rdata(60) <= \<const0>\;
  s_axi_rdata(59) <= \<const0>\;
  s_axi_rdata(58) <= \<const0>\;
  s_axi_rdata(57) <= \<const0>\;
  s_axi_rdata(56) <= \<const0>\;
  s_axi_rdata(55) <= \<const0>\;
  s_axi_rdata(54) <= \<const0>\;
  s_axi_rdata(53) <= \<const0>\;
  s_axi_rdata(52) <= \<const0>\;
  s_axi_rdata(51) <= \<const0>\;
  s_axi_rdata(50) <= \<const0>\;
  s_axi_rdata(49) <= \<const0>\;
  s_axi_rdata(48) <= \<const0>\;
  s_axi_rdata(47) <= \<const0>\;
  s_axi_rdata(46) <= \<const0>\;
  s_axi_rdata(45) <= \<const0>\;
  s_axi_rdata(44) <= \<const0>\;
  s_axi_rdata(43) <= \<const0>\;
  s_axi_rdata(42) <= \<const0>\;
  s_axi_rdata(41) <= \<const0>\;
  s_axi_rdata(40) <= \<const0>\;
  s_axi_rdata(39) <= \<const0>\;
  s_axi_rdata(38) <= \<const0>\;
  s_axi_rdata(37) <= \<const0>\;
  s_axi_rdata(36) <= \<const0>\;
  s_axi_rdata(35) <= \<const0>\;
  s_axi_rdata(34) <= \<const0>\;
  s_axi_rdata(33) <= \<const0>\;
  s_axi_rdata(32) <= \<const0>\;
  s_axi_rdata(31) <= \<const0>\;
  s_axi_rdata(30) <= \<const0>\;
  s_axi_rdata(29) <= \<const0>\;
  s_axi_rdata(28) <= \<const0>\;
  s_axi_rdata(27) <= \<const0>\;
  s_axi_rdata(26) <= \<const0>\;
  s_axi_rdata(25) <= \<const0>\;
  s_axi_rdata(24) <= \<const0>\;
  s_axi_rdata(23) <= \<const0>\;
  s_axi_rdata(22) <= \<const0>\;
  s_axi_rdata(21) <= \<const0>\;
  s_axi_rdata(20) <= \<const0>\;
  s_axi_rdata(19) <= \<const0>\;
  s_axi_rdata(18) <= \<const0>\;
  s_axi_rdata(17) <= \<const0>\;
  s_axi_rdata(16) <= \<const0>\;
  s_axi_rdata(15) <= \<const0>\;
  s_axi_rdata(14) <= \<const0>\;
  s_axi_rdata(13) <= \<const0>\;
  s_axi_rdata(12) <= \<const0>\;
  s_axi_rdata(11) <= \<const0>\;
  s_axi_rdata(10) <= \<const0>\;
  s_axi_rdata(9) <= \<const0>\;
  s_axi_rdata(8) <= \<const0>\;
  s_axi_rdata(7) <= \<const0>\;
  s_axi_rdata(6) <= \<const0>\;
  s_axi_rdata(5) <= \<const0>\;
  s_axi_rdata(4) <= \<const0>\;
  s_axi_rdata(3) <= \<const0>\;
  s_axi_rdata(2) <= \<const0>\;
  s_axi_rdata(1) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rid(0) <= \<const0>\;
  s_axi_rlast <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_ruser(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_wready <= \<const0>\;
  s_axis_tready <= \<const0>\;
  sbiterr <= \<const0>\;
  underflow <= \<const0>\;
  valid <= \<const0>\;
  wr_ack <= \<const0>\;
  wr_data_count(12) <= \<const0>\;
  wr_data_count(11) <= \<const0>\;
  wr_data_count(10) <= \<const0>\;
  wr_data_count(9) <= \<const0>\;
  wr_data_count(8) <= \<const0>\;
  wr_data_count(7) <= \<const0>\;
  wr_data_count(6) <= \<const0>\;
  wr_data_count(5) <= \<const0>\;
  wr_data_count(4) <= \<const0>\;
  wr_data_count(3) <= \<const0>\;
  wr_data_count(2) <= \<const0>\;
  wr_data_count(1) <= \<const0>\;
  wr_data_count(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst_fifo_gen: entity work.conv1x1_dwc_fifo_fifo_generator_v13_2_4_synth
     port map (
      clk => clk,
      din(127 downto 0) => din(127 downto 0),
      dout(1023 downto 0) => dout(1023 downto 0),
      empty => empty,
      full => full,
      rd_en => rd_en,
      rd_rst_busy => rd_rst_busy,
      srst => srst,
      wr_en => wr_en,
      wr_rst_busy => wr_rst_busy
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity conv1x1_dwc_fifo is
  port (
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 127 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of conv1x1_dwc_fifo : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of conv1x1_dwc_fifo : entity is "conv1x1_dwc_fifo,fifo_generator_v13_2_4,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of conv1x1_dwc_fifo : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of conv1x1_dwc_fifo : entity is "fifo_generator_v13_2_4,Vivado 2019.1";
end conv1x1_dwc_fifo;

architecture STRUCTURE of conv1x1_dwc_fifo is
  signal NLW_U0_almost_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_almost_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axis_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axis_tready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_valid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_wr_ack_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_ar_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_ar_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_r_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_r_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_r_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal NLW_U0_m_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_arlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_awlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_awqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_m_axi_wid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 12 downto 0 );
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of U0 : label is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of U0 : label is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of U0 : label is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of U0 : label is 8;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of U0 : label is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of U0 : label is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of U0 : label is 1;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of U0 : label is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of U0 : label is 4;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of U0 : label is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of U0 : label is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of U0 : label is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of U0 : label is 1;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of U0 : label is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of U0 : label is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of U0 : label is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of U0 : label is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of U0 : label is 1;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of U0 : label is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of U0 : label is 13;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of U0 : label is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of U0 : label is 128;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of U0 : label is 1;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of U0 : label is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of U0 : label is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of U0 : label is 1;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of U0 : label is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of U0 : label is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of U0 : label is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of U0 : label is 1024;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of U0 : label is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of U0 : label is 1;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of U0 : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "virtexuplusHBM";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of U0 : label is 0;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of U0 : label is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of U0 : label is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of U0 : label is 1;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of U0 : label is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of U0 : label is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of U0 : label is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of U0 : label is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of U0 : label is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of U0 : label is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of U0 : label is 1;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of U0 : label is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of U0 : label is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of U0 : label is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of U0 : label is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of U0 : label is 1;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of U0 : label is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of U0 : label is 1;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of U0 : label is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of U0 : label is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of U0 : label is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of U0 : label is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of U0 : label is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of U0 : label is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of U0 : label is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of U0 : label is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of U0 : label is 0;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of U0 : label is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of U0 : label is 1;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of U0 : label is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of U0 : label is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of U0 : label is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of U0 : label is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of U0 : label is 6;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of U0 : label is 2;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of U0 : label is 2;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of U0 : label is 2;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of U0 : label is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of U0 : label is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of U0 : label is 4;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of U0 : label is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of U0 : label is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of U0 : label is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of U0 : label is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of U0 : label is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of U0 : label is 2;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of U0 : label is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of U0 : label is "8kx4";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of U0 : label is "1kx18";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of U0 : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of U0 : label is "512x72";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of U0 : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of U0 : label is "512x72";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of U0 : label is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of U0 : label is 2;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of U0 : label is 3;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of U0 : label is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of U0 : label is 8190;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of U0 : label is 8189;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of U0 : label is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of U0 : label is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of U0 : label is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of U0 : label is 10;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of U0 : label is 1024;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of U0 : label is 1;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of U0 : label is 10;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of U0 : label is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of U0 : label is 0;
  attribute C_SELECT_XPM : integer;
  attribute C_SELECT_XPM of U0 : label is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of U0 : label is 2;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of U0 : label is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of U0 : label is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of U0 : label is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of U0 : label is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of U0 : label is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of U0 : label is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of U0 : label is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of U0 : label is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of U0 : label is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of U0 : label is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of U0 : label is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of U0 : label is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of U0 : label is 1;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of U0 : label is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of U0 : label is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of U0 : label is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of U0 : label is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of U0 : label is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of U0 : label is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of U0 : label is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of U0 : label is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of U0 : label is 13;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of U0 : label is 8192;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of U0 : label is 1024;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of U0 : label is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of U0 : label is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of U0 : label is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of U0 : label is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of U0 : label is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of U0 : label is 1;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of U0 : label is 13;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of U0 : label is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of U0 : label is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of U0 : label is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of U0 : label is 1;
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 core_clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  attribute x_interface_info of empty : signal is "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY";
  attribute x_interface_info of full : signal is "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL";
  attribute x_interface_info of rd_en : signal is "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN";
  attribute x_interface_info of wr_en : signal is "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN";
  attribute x_interface_info of din : signal is "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA";
  attribute x_interface_info of dout : signal is "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA";
begin
U0: entity work.conv1x1_dwc_fifo_fifo_generator_v13_2_4
     port map (
      almost_empty => NLW_U0_almost_empty_UNCONNECTED,
      almost_full => NLW_U0_almost_full_UNCONNECTED,
      axi_ar_data_count(4 downto 0) => NLW_U0_axi_ar_data_count_UNCONNECTED(4 downto 0),
      axi_ar_dbiterr => NLW_U0_axi_ar_dbiterr_UNCONNECTED,
      axi_ar_injectdbiterr => '0',
      axi_ar_injectsbiterr => '0',
      axi_ar_overflow => NLW_U0_axi_ar_overflow_UNCONNECTED,
      axi_ar_prog_empty => NLW_U0_axi_ar_prog_empty_UNCONNECTED,
      axi_ar_prog_empty_thresh(3 downto 0) => B"0000",
      axi_ar_prog_full => NLW_U0_axi_ar_prog_full_UNCONNECTED,
      axi_ar_prog_full_thresh(3 downto 0) => B"0000",
      axi_ar_rd_data_count(4 downto 0) => NLW_U0_axi_ar_rd_data_count_UNCONNECTED(4 downto 0),
      axi_ar_sbiterr => NLW_U0_axi_ar_sbiterr_UNCONNECTED,
      axi_ar_underflow => NLW_U0_axi_ar_underflow_UNCONNECTED,
      axi_ar_wr_data_count(4 downto 0) => NLW_U0_axi_ar_wr_data_count_UNCONNECTED(4 downto 0),
      axi_aw_data_count(4 downto 0) => NLW_U0_axi_aw_data_count_UNCONNECTED(4 downto 0),
      axi_aw_dbiterr => NLW_U0_axi_aw_dbiterr_UNCONNECTED,
      axi_aw_injectdbiterr => '0',
      axi_aw_injectsbiterr => '0',
      axi_aw_overflow => NLW_U0_axi_aw_overflow_UNCONNECTED,
      axi_aw_prog_empty => NLW_U0_axi_aw_prog_empty_UNCONNECTED,
      axi_aw_prog_empty_thresh(3 downto 0) => B"0000",
      axi_aw_prog_full => NLW_U0_axi_aw_prog_full_UNCONNECTED,
      axi_aw_prog_full_thresh(3 downto 0) => B"0000",
      axi_aw_rd_data_count(4 downto 0) => NLW_U0_axi_aw_rd_data_count_UNCONNECTED(4 downto 0),
      axi_aw_sbiterr => NLW_U0_axi_aw_sbiterr_UNCONNECTED,
      axi_aw_underflow => NLW_U0_axi_aw_underflow_UNCONNECTED,
      axi_aw_wr_data_count(4 downto 0) => NLW_U0_axi_aw_wr_data_count_UNCONNECTED(4 downto 0),
      axi_b_data_count(4 downto 0) => NLW_U0_axi_b_data_count_UNCONNECTED(4 downto 0),
      axi_b_dbiterr => NLW_U0_axi_b_dbiterr_UNCONNECTED,
      axi_b_injectdbiterr => '0',
      axi_b_injectsbiterr => '0',
      axi_b_overflow => NLW_U0_axi_b_overflow_UNCONNECTED,
      axi_b_prog_empty => NLW_U0_axi_b_prog_empty_UNCONNECTED,
      axi_b_prog_empty_thresh(3 downto 0) => B"0000",
      axi_b_prog_full => NLW_U0_axi_b_prog_full_UNCONNECTED,
      axi_b_prog_full_thresh(3 downto 0) => B"0000",
      axi_b_rd_data_count(4 downto 0) => NLW_U0_axi_b_rd_data_count_UNCONNECTED(4 downto 0),
      axi_b_sbiterr => NLW_U0_axi_b_sbiterr_UNCONNECTED,
      axi_b_underflow => NLW_U0_axi_b_underflow_UNCONNECTED,
      axi_b_wr_data_count(4 downto 0) => NLW_U0_axi_b_wr_data_count_UNCONNECTED(4 downto 0),
      axi_r_data_count(10 downto 0) => NLW_U0_axi_r_data_count_UNCONNECTED(10 downto 0),
      axi_r_dbiterr => NLW_U0_axi_r_dbiterr_UNCONNECTED,
      axi_r_injectdbiterr => '0',
      axi_r_injectsbiterr => '0',
      axi_r_overflow => NLW_U0_axi_r_overflow_UNCONNECTED,
      axi_r_prog_empty => NLW_U0_axi_r_prog_empty_UNCONNECTED,
      axi_r_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_r_prog_full => NLW_U0_axi_r_prog_full_UNCONNECTED,
      axi_r_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_r_rd_data_count(10 downto 0) => NLW_U0_axi_r_rd_data_count_UNCONNECTED(10 downto 0),
      axi_r_sbiterr => NLW_U0_axi_r_sbiterr_UNCONNECTED,
      axi_r_underflow => NLW_U0_axi_r_underflow_UNCONNECTED,
      axi_r_wr_data_count(10 downto 0) => NLW_U0_axi_r_wr_data_count_UNCONNECTED(10 downto 0),
      axi_w_data_count(10 downto 0) => NLW_U0_axi_w_data_count_UNCONNECTED(10 downto 0),
      axi_w_dbiterr => NLW_U0_axi_w_dbiterr_UNCONNECTED,
      axi_w_injectdbiterr => '0',
      axi_w_injectsbiterr => '0',
      axi_w_overflow => NLW_U0_axi_w_overflow_UNCONNECTED,
      axi_w_prog_empty => NLW_U0_axi_w_prog_empty_UNCONNECTED,
      axi_w_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_w_prog_full => NLW_U0_axi_w_prog_full_UNCONNECTED,
      axi_w_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_w_rd_data_count(10 downto 0) => NLW_U0_axi_w_rd_data_count_UNCONNECTED(10 downto 0),
      axi_w_sbiterr => NLW_U0_axi_w_sbiterr_UNCONNECTED,
      axi_w_underflow => NLW_U0_axi_w_underflow_UNCONNECTED,
      axi_w_wr_data_count(10 downto 0) => NLW_U0_axi_w_wr_data_count_UNCONNECTED(10 downto 0),
      axis_data_count(10 downto 0) => NLW_U0_axis_data_count_UNCONNECTED(10 downto 0),
      axis_dbiterr => NLW_U0_axis_dbiterr_UNCONNECTED,
      axis_injectdbiterr => '0',
      axis_injectsbiterr => '0',
      axis_overflow => NLW_U0_axis_overflow_UNCONNECTED,
      axis_prog_empty => NLW_U0_axis_prog_empty_UNCONNECTED,
      axis_prog_empty_thresh(9 downto 0) => B"0000000000",
      axis_prog_full => NLW_U0_axis_prog_full_UNCONNECTED,
      axis_prog_full_thresh(9 downto 0) => B"0000000000",
      axis_rd_data_count(10 downto 0) => NLW_U0_axis_rd_data_count_UNCONNECTED(10 downto 0),
      axis_sbiterr => NLW_U0_axis_sbiterr_UNCONNECTED,
      axis_underflow => NLW_U0_axis_underflow_UNCONNECTED,
      axis_wr_data_count(10 downto 0) => NLW_U0_axis_wr_data_count_UNCONNECTED(10 downto 0),
      backup => '0',
      backup_marker => '0',
      clk => clk,
      data_count(12 downto 0) => NLW_U0_data_count_UNCONNECTED(12 downto 0),
      dbiterr => NLW_U0_dbiterr_UNCONNECTED,
      din(127 downto 0) => din(127 downto 0),
      dout(1023 downto 0) => dout(1023 downto 0),
      empty => empty,
      full => full,
      injectdbiterr => '0',
      injectsbiterr => '0',
      int_clk => '0',
      m_aclk => '0',
      m_aclk_en => '0',
      m_axi_araddr(31 downto 0) => NLW_U0_m_axi_araddr_UNCONNECTED(31 downto 0),
      m_axi_arburst(1 downto 0) => NLW_U0_m_axi_arburst_UNCONNECTED(1 downto 0),
      m_axi_arcache(3 downto 0) => NLW_U0_m_axi_arcache_UNCONNECTED(3 downto 0),
      m_axi_arid(0) => NLW_U0_m_axi_arid_UNCONNECTED(0),
      m_axi_arlen(7 downto 0) => NLW_U0_m_axi_arlen_UNCONNECTED(7 downto 0),
      m_axi_arlock(0) => NLW_U0_m_axi_arlock_UNCONNECTED(0),
      m_axi_arprot(2 downto 0) => NLW_U0_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arqos(3 downto 0) => NLW_U0_m_axi_arqos_UNCONNECTED(3 downto 0),
      m_axi_arready => '0',
      m_axi_arregion(3 downto 0) => NLW_U0_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => NLW_U0_m_axi_arsize_UNCONNECTED(2 downto 0),
      m_axi_aruser(0) => NLW_U0_m_axi_aruser_UNCONNECTED(0),
      m_axi_arvalid => NLW_U0_m_axi_arvalid_UNCONNECTED,
      m_axi_awaddr(31 downto 0) => NLW_U0_m_axi_awaddr_UNCONNECTED(31 downto 0),
      m_axi_awburst(1 downto 0) => NLW_U0_m_axi_awburst_UNCONNECTED(1 downto 0),
      m_axi_awcache(3 downto 0) => NLW_U0_m_axi_awcache_UNCONNECTED(3 downto 0),
      m_axi_awid(0) => NLW_U0_m_axi_awid_UNCONNECTED(0),
      m_axi_awlen(7 downto 0) => NLW_U0_m_axi_awlen_UNCONNECTED(7 downto 0),
      m_axi_awlock(0) => NLW_U0_m_axi_awlock_UNCONNECTED(0),
      m_axi_awprot(2 downto 0) => NLW_U0_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awqos(3 downto 0) => NLW_U0_m_axi_awqos_UNCONNECTED(3 downto 0),
      m_axi_awready => '0',
      m_axi_awregion(3 downto 0) => NLW_U0_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => NLW_U0_m_axi_awsize_UNCONNECTED(2 downto 0),
      m_axi_awuser(0) => NLW_U0_m_axi_awuser_UNCONNECTED(0),
      m_axi_awvalid => NLW_U0_m_axi_awvalid_UNCONNECTED,
      m_axi_bid(0) => '0',
      m_axi_bready => NLW_U0_m_axi_bready_UNCONNECTED,
      m_axi_bresp(1 downto 0) => B"00",
      m_axi_buser(0) => '0',
      m_axi_bvalid => '0',
      m_axi_rdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      m_axi_rid(0) => '0',
      m_axi_rlast => '0',
      m_axi_rready => NLW_U0_m_axi_rready_UNCONNECTED,
      m_axi_rresp(1 downto 0) => B"00",
      m_axi_ruser(0) => '0',
      m_axi_rvalid => '0',
      m_axi_wdata(63 downto 0) => NLW_U0_m_axi_wdata_UNCONNECTED(63 downto 0),
      m_axi_wid(0) => NLW_U0_m_axi_wid_UNCONNECTED(0),
      m_axi_wlast => NLW_U0_m_axi_wlast_UNCONNECTED,
      m_axi_wready => '0',
      m_axi_wstrb(7 downto 0) => NLW_U0_m_axi_wstrb_UNCONNECTED(7 downto 0),
      m_axi_wuser(0) => NLW_U0_m_axi_wuser_UNCONNECTED(0),
      m_axi_wvalid => NLW_U0_m_axi_wvalid_UNCONNECTED,
      m_axis_tdata(7 downto 0) => NLW_U0_m_axis_tdata_UNCONNECTED(7 downto 0),
      m_axis_tdest(0) => NLW_U0_m_axis_tdest_UNCONNECTED(0),
      m_axis_tid(0) => NLW_U0_m_axis_tid_UNCONNECTED(0),
      m_axis_tkeep(0) => NLW_U0_m_axis_tkeep_UNCONNECTED(0),
      m_axis_tlast => NLW_U0_m_axis_tlast_UNCONNECTED,
      m_axis_tready => '0',
      m_axis_tstrb(0) => NLW_U0_m_axis_tstrb_UNCONNECTED(0),
      m_axis_tuser(3 downto 0) => NLW_U0_m_axis_tuser_UNCONNECTED(3 downto 0),
      m_axis_tvalid => NLW_U0_m_axis_tvalid_UNCONNECTED,
      overflow => NLW_U0_overflow_UNCONNECTED,
      prog_empty => NLW_U0_prog_empty_UNCONNECTED,
      prog_empty_thresh(9 downto 0) => B"0000000000",
      prog_empty_thresh_assert(9 downto 0) => B"0000000000",
      prog_empty_thresh_negate(9 downto 0) => B"0000000000",
      prog_full => NLW_U0_prog_full_UNCONNECTED,
      prog_full_thresh(12 downto 0) => B"0000000000000",
      prog_full_thresh_assert(12 downto 0) => B"0000000000000",
      prog_full_thresh_negate(12 downto 0) => B"0000000000000",
      rd_clk => '0',
      rd_data_count(9 downto 0) => NLW_U0_rd_data_count_UNCONNECTED(9 downto 0),
      rd_en => rd_en,
      rd_rst => '0',
      rd_rst_busy => rd_rst_busy,
      rst => '0',
      s_aclk => '0',
      s_aclk_en => '0',
      s_aresetn => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arburst(1 downto 0) => B"00",
      s_axi_arcache(3 downto 0) => B"0000",
      s_axi_arid(0) => '0',
      s_axi_arlen(7 downto 0) => B"00000000",
      s_axi_arlock(0) => '0',
      s_axi_arprot(2 downto 0) => B"000",
      s_axi_arqos(3 downto 0) => B"0000",
      s_axi_arready => NLW_U0_s_axi_arready_UNCONNECTED,
      s_axi_arregion(3 downto 0) => B"0000",
      s_axi_arsize(2 downto 0) => B"000",
      s_axi_aruser(0) => '0',
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awcache(3 downto 0) => B"0000",
      s_axi_awid(0) => '0',
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awlock(0) => '0',
      s_axi_awprot(2 downto 0) => B"000",
      s_axi_awqos(3 downto 0) => B"0000",
      s_axi_awready => NLW_U0_s_axi_awready_UNCONNECTED,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awuser(0) => '0',
      s_axi_awvalid => '0',
      s_axi_bid(0) => NLW_U0_s_axi_bid_UNCONNECTED(0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_U0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_buser(0) => NLW_U0_s_axi_buser_UNCONNECTED(0),
      s_axi_bvalid => NLW_U0_s_axi_bvalid_UNCONNECTED,
      s_axi_rdata(63 downto 0) => NLW_U0_s_axi_rdata_UNCONNECTED(63 downto 0),
      s_axi_rid(0) => NLW_U0_s_axi_rid_UNCONNECTED(0),
      s_axi_rlast => NLW_U0_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_U0_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_ruser(0) => NLW_U0_s_axi_ruser_UNCONNECTED(0),
      s_axi_rvalid => NLW_U0_s_axi_rvalid_UNCONNECTED,
      s_axi_wdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axi_wid(0) => '0',
      s_axi_wlast => '0',
      s_axi_wready => NLW_U0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(7 downto 0) => B"00000000",
      s_axi_wuser(0) => '0',
      s_axi_wvalid => '0',
      s_axis_tdata(7 downto 0) => B"00000000",
      s_axis_tdest(0) => '0',
      s_axis_tid(0) => '0',
      s_axis_tkeep(0) => '0',
      s_axis_tlast => '0',
      s_axis_tready => NLW_U0_s_axis_tready_UNCONNECTED,
      s_axis_tstrb(0) => '0',
      s_axis_tuser(3 downto 0) => B"0000",
      s_axis_tvalid => '0',
      sbiterr => NLW_U0_sbiterr_UNCONNECTED,
      sleep => '0',
      srst => srst,
      underflow => NLW_U0_underflow_UNCONNECTED,
      valid => NLW_U0_valid_UNCONNECTED,
      wr_ack => NLW_U0_wr_ack_UNCONNECTED,
      wr_clk => '0',
      wr_data_count(12 downto 0) => NLW_U0_wr_data_count_UNCONNECTED(12 downto 0),
      wr_en => wr_en,
      wr_rst => '0',
      wr_rst_busy => wr_rst_busy
    );
end STRUCTURE;
