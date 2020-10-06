-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Wed Sep 23 14:49:29 2020
-- Host        : cse-p322mdl16.cse.psu.edu running 64-bit Ubuntu 16.04.6 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top trans_in_meta_fifo -prefix
--               trans_in_meta_fifo_ trans_in_fifo_sim_netlist.vhdl
-- Design      : trans_in_fifo
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcvu37p-fsvh2892-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_builtin_prim is
  port (
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    RD_EN : out STD_LOGIC;
    WR_EN : out STD_LOGIC;
    rd_clk_0 : out STD_LOGIC;
    rd_clk_1 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 );
    \^wr_en\ : in STD_LOGIC;
    \dout[639]\ : in STD_LOGIC;
    \dout[639]_0\ : in STD_LOGIC;
    \dout[639]_1\ : in STD_LOGIC;
    FULL : in STD_LOGIC;
    \^full\ : in STD_LOGIC;
    full_0 : in STD_LOGIC;
    \^rd_en\ : in STD_LOGIC;
    \gv.gv3.VALID_reg\ : in STD_LOGIC;
    \gv.gv3.VALID_reg_0\ : in STD_LOGIC;
    \gv.gv3.VALID_reg_1\ : in STD_LOGIC;
    EMPTY : in STD_LOGIC;
    \gv.gv3.VALID_reg_2\ : in STD_LOGIC;
    \gv.gv3.VALID_reg_3\ : in STD_LOGIC
  );
end trans_in_meta_fifo_builtin_prim;

architecture STRUCTURE of trans_in_meta_fifo_builtin_prim is
  signal \^rd_en_1\ : STD_LOGIC;
  signal \^wr_en_1\ : STD_LOGIC;
  signal dbiterr_col : STD_LOGIC_VECTOR ( 9 to 9 );
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_168\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_169\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_170\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_171\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_172\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_173\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_174\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_175\ : STD_LOGIC;
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
  signal \gf36e2_inst.sngfifo36e2_n_40\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_41\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_42\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_43\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_44\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_45\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_46\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_47\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_48\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_49\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_50\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_51\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_52\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_53\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_54\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_55\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_56\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_57\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_58\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_59\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_60\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_61\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_62\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_63\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_64\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_65\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_66\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_67\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_68\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_69\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_70\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_71\ : STD_LOGIC;
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
  signal p_58_out : STD_LOGIC;
  signal p_59_out : STD_LOGIC;
  signal p_60_out : STD_LOGIC;
  signal p_61_out : STD_LOGIC;
  signal \^rd_clk_0\ : STD_LOGIC;
  signal \^rd_clk_1\ : STD_LOGIC;
  signal sbiterr_col : STD_LOGIC_VECTOR ( 9 to 9 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
  RD_EN <= \^rd_en_1\;
  WR_EN <= \^wr_en_1\;
  rd_clk_0 <= \^rd_clk_0\;
  rd_clk_1 <= \^rd_clk_1\;
empty_INST_0_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => p_60_out,
      I1 => EMPTY,
      I2 => \gv.gv3.VALID_reg_2\,
      I3 => \gv.gv3.VALID_reg_3\,
      O => \^rd_clk_1\
    );
full_INST_0_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => p_61_out,
      I1 => FULL,
      I2 => \^full\,
      I3 => full_0,
      O => \^rd_clk_0\
    );
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
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
      PROG_EMPTY_THRESH => 5,
      PROG_FULL_THRESH => 511,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 72,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 72
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63) => \gf36e2_inst.sngfifo36e2_n_40\,
      CASDOUT(62) => \gf36e2_inst.sngfifo36e2_n_41\,
      CASDOUT(61) => \gf36e2_inst.sngfifo36e2_n_42\,
      CASDOUT(60) => \gf36e2_inst.sngfifo36e2_n_43\,
      CASDOUT(59) => \gf36e2_inst.sngfifo36e2_n_44\,
      CASDOUT(58) => \gf36e2_inst.sngfifo36e2_n_45\,
      CASDOUT(57) => \gf36e2_inst.sngfifo36e2_n_46\,
      CASDOUT(56) => \gf36e2_inst.sngfifo36e2_n_47\,
      CASDOUT(55) => \gf36e2_inst.sngfifo36e2_n_48\,
      CASDOUT(54) => \gf36e2_inst.sngfifo36e2_n_49\,
      CASDOUT(53) => \gf36e2_inst.sngfifo36e2_n_50\,
      CASDOUT(52) => \gf36e2_inst.sngfifo36e2_n_51\,
      CASDOUT(51) => \gf36e2_inst.sngfifo36e2_n_52\,
      CASDOUT(50) => \gf36e2_inst.sngfifo36e2_n_53\,
      CASDOUT(49) => \gf36e2_inst.sngfifo36e2_n_54\,
      CASDOUT(48) => \gf36e2_inst.sngfifo36e2_n_55\,
      CASDOUT(47) => \gf36e2_inst.sngfifo36e2_n_56\,
      CASDOUT(46) => \gf36e2_inst.sngfifo36e2_n_57\,
      CASDOUT(45) => \gf36e2_inst.sngfifo36e2_n_58\,
      CASDOUT(44) => \gf36e2_inst.sngfifo36e2_n_59\,
      CASDOUT(43) => \gf36e2_inst.sngfifo36e2_n_60\,
      CASDOUT(42) => \gf36e2_inst.sngfifo36e2_n_61\,
      CASDOUT(41) => \gf36e2_inst.sngfifo36e2_n_62\,
      CASDOUT(40) => \gf36e2_inst.sngfifo36e2_n_63\,
      CASDOUT(39) => \gf36e2_inst.sngfifo36e2_n_64\,
      CASDOUT(38) => \gf36e2_inst.sngfifo36e2_n_65\,
      CASDOUT(37) => \gf36e2_inst.sngfifo36e2_n_66\,
      CASDOUT(36) => \gf36e2_inst.sngfifo36e2_n_67\,
      CASDOUT(35) => \gf36e2_inst.sngfifo36e2_n_68\,
      CASDOUT(34) => \gf36e2_inst.sngfifo36e2_n_69\,
      CASDOUT(33) => \gf36e2_inst.sngfifo36e2_n_70\,
      CASDOUT(32) => \gf36e2_inst.sngfifo36e2_n_71\,
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
      CASDOUTP(7) => \gf36e2_inst.sngfifo36e2_n_168\,
      CASDOUTP(6) => \gf36e2_inst.sngfifo36e2_n_169\,
      CASDOUTP(5) => \gf36e2_inst.sngfifo36e2_n_170\,
      CASDOUTP(4) => \gf36e2_inst.sngfifo36e2_n_171\,
      CASDOUTP(3) => \gf36e2_inst.sngfifo36e2_n_172\,
      CASDOUTP(2) => \gf36e2_inst.sngfifo36e2_n_173\,
      CASDOUTP(1) => \gf36e2_inst.sngfifo36e2_n_174\,
      CASDOUTP(0) => \gf36e2_inst.sngfifo36e2_n_175\,
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => dbiterr_col(9),
      DIN(63 downto 0) => din(63 downto 0),
      DINP(7 downto 0) => din(71 downto 64),
      DOUT(63 downto 0) => dout(63 downto 0),
      DOUTP(7 downto 0) => dout(71 downto 64),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => p_60_out,
      FULL => p_61_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => p_58_out,
      PROGFULL => p_59_out,
      RDCLK => rd_clk,
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
      RDEN => \^rd_en_1\,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => RDRSTBUSY,
      REGCE => \^rd_en_1\,
      RST => srst,
      RSTREG => srst,
      SBITERR => sbiterr_col(9),
      SLEEP => '0',
      WRCLK => wr_clk,
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
      WREN => \^wr_en_1\,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => WRRSTBUSY
    );
\gf36e2_inst.sngfifo36e2_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \^rd_en\,
      I1 => \^rd_clk_1\,
      I2 => \gv.gv3.VALID_reg\,
      I3 => \gv.gv3.VALID_reg_0\,
      I4 => \gv.gv3.VALID_reg_1\,
      O => \^rd_en_1\
    );
\gf36e2_inst.sngfifo36e2_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \^wr_en\,
      I1 => \^rd_clk_0\,
      I2 => \dout[639]\,
      I3 => \dout[639]_0\,
      I4 => \dout[639]_1\,
      O => \^wr_en_1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_builtin_prim_14 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_prim_14 : entity is "builtin_prim";
end trans_in_meta_fifo_builtin_prim_14;

architecture STRUCTURE of trans_in_meta_fifo_builtin_prim_14 is
  signal dbiterr_col : STD_LOGIC_VECTOR ( 8 to 8 );
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_168\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_169\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_170\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_171\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_172\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_173\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_174\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_175\ : STD_LOGIC;
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
  signal \gf36e2_inst.sngfifo36e2_n_40\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_41\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_42\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_43\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_44\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_45\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_46\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_47\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_48\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_49\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_50\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_51\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_52\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_53\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_54\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_55\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_56\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_57\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_58\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_59\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_60\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_61\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_62\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_63\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_64\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_65\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_66\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_67\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_68\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_69\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_70\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_71\ : STD_LOGIC;
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
  signal p_67_out : STD_LOGIC;
  signal p_68_out : STD_LOGIC;
  signal sbiterr_col : STD_LOGIC_VECTOR ( 8 to 8 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
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
      PROG_EMPTY_THRESH => 5,
      PROG_FULL_THRESH => 511,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 72,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 72
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63) => \gf36e2_inst.sngfifo36e2_n_40\,
      CASDOUT(62) => \gf36e2_inst.sngfifo36e2_n_41\,
      CASDOUT(61) => \gf36e2_inst.sngfifo36e2_n_42\,
      CASDOUT(60) => \gf36e2_inst.sngfifo36e2_n_43\,
      CASDOUT(59) => \gf36e2_inst.sngfifo36e2_n_44\,
      CASDOUT(58) => \gf36e2_inst.sngfifo36e2_n_45\,
      CASDOUT(57) => \gf36e2_inst.sngfifo36e2_n_46\,
      CASDOUT(56) => \gf36e2_inst.sngfifo36e2_n_47\,
      CASDOUT(55) => \gf36e2_inst.sngfifo36e2_n_48\,
      CASDOUT(54) => \gf36e2_inst.sngfifo36e2_n_49\,
      CASDOUT(53) => \gf36e2_inst.sngfifo36e2_n_50\,
      CASDOUT(52) => \gf36e2_inst.sngfifo36e2_n_51\,
      CASDOUT(51) => \gf36e2_inst.sngfifo36e2_n_52\,
      CASDOUT(50) => \gf36e2_inst.sngfifo36e2_n_53\,
      CASDOUT(49) => \gf36e2_inst.sngfifo36e2_n_54\,
      CASDOUT(48) => \gf36e2_inst.sngfifo36e2_n_55\,
      CASDOUT(47) => \gf36e2_inst.sngfifo36e2_n_56\,
      CASDOUT(46) => \gf36e2_inst.sngfifo36e2_n_57\,
      CASDOUT(45) => \gf36e2_inst.sngfifo36e2_n_58\,
      CASDOUT(44) => \gf36e2_inst.sngfifo36e2_n_59\,
      CASDOUT(43) => \gf36e2_inst.sngfifo36e2_n_60\,
      CASDOUT(42) => \gf36e2_inst.sngfifo36e2_n_61\,
      CASDOUT(41) => \gf36e2_inst.sngfifo36e2_n_62\,
      CASDOUT(40) => \gf36e2_inst.sngfifo36e2_n_63\,
      CASDOUT(39) => \gf36e2_inst.sngfifo36e2_n_64\,
      CASDOUT(38) => \gf36e2_inst.sngfifo36e2_n_65\,
      CASDOUT(37) => \gf36e2_inst.sngfifo36e2_n_66\,
      CASDOUT(36) => \gf36e2_inst.sngfifo36e2_n_67\,
      CASDOUT(35) => \gf36e2_inst.sngfifo36e2_n_68\,
      CASDOUT(34) => \gf36e2_inst.sngfifo36e2_n_69\,
      CASDOUT(33) => \gf36e2_inst.sngfifo36e2_n_70\,
      CASDOUT(32) => \gf36e2_inst.sngfifo36e2_n_71\,
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
      CASDOUTP(7) => \gf36e2_inst.sngfifo36e2_n_168\,
      CASDOUTP(6) => \gf36e2_inst.sngfifo36e2_n_169\,
      CASDOUTP(5) => \gf36e2_inst.sngfifo36e2_n_170\,
      CASDOUTP(4) => \gf36e2_inst.sngfifo36e2_n_171\,
      CASDOUTP(3) => \gf36e2_inst.sngfifo36e2_n_172\,
      CASDOUTP(2) => \gf36e2_inst.sngfifo36e2_n_173\,
      CASDOUTP(1) => \gf36e2_inst.sngfifo36e2_n_174\,
      CASDOUTP(0) => \gf36e2_inst.sngfifo36e2_n_175\,
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => dbiterr_col(8),
      DIN(63 downto 0) => din(63 downto 0),
      DINP(7 downto 0) => din(71 downto 64),
      DOUT(63 downto 0) => dout(63 downto 0),
      DOUTP(7 downto 0) => dout(71 downto 64),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => EMPTY,
      FULL => FULL,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => p_67_out,
      PROGFULL => p_68_out,
      RDCLK => rd_clk,
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
      RDEN => RD_EN,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => RDRSTBUSY,
      REGCE => RD_EN,
      RST => srst,
      RSTREG => srst,
      SBITERR => sbiterr_col(8),
      SLEEP => '0',
      WRCLK => wr_clk,
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
      WREN => WR_EN,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => WRRSTBUSY
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_builtin_prim_15 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_prim_15 : entity is "builtin_prim";
end trans_in_meta_fifo_builtin_prim_15;

architecture STRUCTURE of trans_in_meta_fifo_builtin_prim_15 is
  signal dbiterr_col : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_168\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_169\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_170\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_171\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_172\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_173\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_174\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_175\ : STD_LOGIC;
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
  signal \gf36e2_inst.sngfifo36e2_n_40\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_41\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_42\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_43\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_44\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_45\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_46\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_47\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_48\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_49\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_50\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_51\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_52\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_53\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_54\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_55\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_56\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_57\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_58\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_59\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_60\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_61\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_62\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_63\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_64\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_65\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_66\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_67\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_68\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_69\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_70\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_71\ : STD_LOGIC;
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
  signal p_77_out : STD_LOGIC;
  signal sbiterr_col : STD_LOGIC_VECTOR ( 7 to 7 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
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
      PROG_EMPTY_THRESH => 5,
      PROG_FULL_THRESH => 511,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 72,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 72
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63) => \gf36e2_inst.sngfifo36e2_n_40\,
      CASDOUT(62) => \gf36e2_inst.sngfifo36e2_n_41\,
      CASDOUT(61) => \gf36e2_inst.sngfifo36e2_n_42\,
      CASDOUT(60) => \gf36e2_inst.sngfifo36e2_n_43\,
      CASDOUT(59) => \gf36e2_inst.sngfifo36e2_n_44\,
      CASDOUT(58) => \gf36e2_inst.sngfifo36e2_n_45\,
      CASDOUT(57) => \gf36e2_inst.sngfifo36e2_n_46\,
      CASDOUT(56) => \gf36e2_inst.sngfifo36e2_n_47\,
      CASDOUT(55) => \gf36e2_inst.sngfifo36e2_n_48\,
      CASDOUT(54) => \gf36e2_inst.sngfifo36e2_n_49\,
      CASDOUT(53) => \gf36e2_inst.sngfifo36e2_n_50\,
      CASDOUT(52) => \gf36e2_inst.sngfifo36e2_n_51\,
      CASDOUT(51) => \gf36e2_inst.sngfifo36e2_n_52\,
      CASDOUT(50) => \gf36e2_inst.sngfifo36e2_n_53\,
      CASDOUT(49) => \gf36e2_inst.sngfifo36e2_n_54\,
      CASDOUT(48) => \gf36e2_inst.sngfifo36e2_n_55\,
      CASDOUT(47) => \gf36e2_inst.sngfifo36e2_n_56\,
      CASDOUT(46) => \gf36e2_inst.sngfifo36e2_n_57\,
      CASDOUT(45) => \gf36e2_inst.sngfifo36e2_n_58\,
      CASDOUT(44) => \gf36e2_inst.sngfifo36e2_n_59\,
      CASDOUT(43) => \gf36e2_inst.sngfifo36e2_n_60\,
      CASDOUT(42) => \gf36e2_inst.sngfifo36e2_n_61\,
      CASDOUT(41) => \gf36e2_inst.sngfifo36e2_n_62\,
      CASDOUT(40) => \gf36e2_inst.sngfifo36e2_n_63\,
      CASDOUT(39) => \gf36e2_inst.sngfifo36e2_n_64\,
      CASDOUT(38) => \gf36e2_inst.sngfifo36e2_n_65\,
      CASDOUT(37) => \gf36e2_inst.sngfifo36e2_n_66\,
      CASDOUT(36) => \gf36e2_inst.sngfifo36e2_n_67\,
      CASDOUT(35) => \gf36e2_inst.sngfifo36e2_n_68\,
      CASDOUT(34) => \gf36e2_inst.sngfifo36e2_n_69\,
      CASDOUT(33) => \gf36e2_inst.sngfifo36e2_n_70\,
      CASDOUT(32) => \gf36e2_inst.sngfifo36e2_n_71\,
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
      CASDOUTP(7) => \gf36e2_inst.sngfifo36e2_n_168\,
      CASDOUTP(6) => \gf36e2_inst.sngfifo36e2_n_169\,
      CASDOUTP(5) => \gf36e2_inst.sngfifo36e2_n_170\,
      CASDOUTP(4) => \gf36e2_inst.sngfifo36e2_n_171\,
      CASDOUTP(3) => \gf36e2_inst.sngfifo36e2_n_172\,
      CASDOUTP(2) => \gf36e2_inst.sngfifo36e2_n_173\,
      CASDOUTP(1) => \gf36e2_inst.sngfifo36e2_n_174\,
      CASDOUTP(0) => \gf36e2_inst.sngfifo36e2_n_175\,
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => dbiterr_col(7),
      DIN(63 downto 0) => din(63 downto 0),
      DINP(7 downto 0) => din(71 downto 64),
      DOUT(63 downto 0) => dout(63 downto 0),
      DOUTP(7 downto 0) => dout(71 downto 64),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => EMPTY,
      FULL => FULL,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => p_77_out,
      RDCLK => rd_clk,
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
      RDEN => RD_EN,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => RDRSTBUSY,
      REGCE => RD_EN,
      RST => srst,
      RSTREG => srst,
      SBITERR => sbiterr_col(7),
      SLEEP => '0',
      WRCLK => wr_clk,
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
      WREN => WR_EN,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => WRRSTBUSY
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_builtin_prim_16 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_prim_16 : entity is "builtin_prim";
end trans_in_meta_fifo_builtin_prim_16;

architecture STRUCTURE of trans_in_meta_fifo_builtin_prim_16 is
  signal dbiterr_col : STD_LOGIC_VECTOR ( 6 to 6 );
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_168\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_169\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_170\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_171\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_172\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_173\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_174\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_175\ : STD_LOGIC;
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
  signal \gf36e2_inst.sngfifo36e2_n_40\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_41\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_42\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_43\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_44\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_45\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_46\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_47\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_48\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_49\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_50\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_51\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_52\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_53\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_54\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_55\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_56\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_57\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_58\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_59\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_60\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_61\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_62\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_63\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_64\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_65\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_66\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_67\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_68\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_69\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_70\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_71\ : STD_LOGIC;
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
  signal p_86_out : STD_LOGIC;
  signal sbiterr_col : STD_LOGIC_VECTOR ( 6 to 6 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
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
      PROG_EMPTY_THRESH => 5,
      PROG_FULL_THRESH => 511,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 72,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 72
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63) => \gf36e2_inst.sngfifo36e2_n_40\,
      CASDOUT(62) => \gf36e2_inst.sngfifo36e2_n_41\,
      CASDOUT(61) => \gf36e2_inst.sngfifo36e2_n_42\,
      CASDOUT(60) => \gf36e2_inst.sngfifo36e2_n_43\,
      CASDOUT(59) => \gf36e2_inst.sngfifo36e2_n_44\,
      CASDOUT(58) => \gf36e2_inst.sngfifo36e2_n_45\,
      CASDOUT(57) => \gf36e2_inst.sngfifo36e2_n_46\,
      CASDOUT(56) => \gf36e2_inst.sngfifo36e2_n_47\,
      CASDOUT(55) => \gf36e2_inst.sngfifo36e2_n_48\,
      CASDOUT(54) => \gf36e2_inst.sngfifo36e2_n_49\,
      CASDOUT(53) => \gf36e2_inst.sngfifo36e2_n_50\,
      CASDOUT(52) => \gf36e2_inst.sngfifo36e2_n_51\,
      CASDOUT(51) => \gf36e2_inst.sngfifo36e2_n_52\,
      CASDOUT(50) => \gf36e2_inst.sngfifo36e2_n_53\,
      CASDOUT(49) => \gf36e2_inst.sngfifo36e2_n_54\,
      CASDOUT(48) => \gf36e2_inst.sngfifo36e2_n_55\,
      CASDOUT(47) => \gf36e2_inst.sngfifo36e2_n_56\,
      CASDOUT(46) => \gf36e2_inst.sngfifo36e2_n_57\,
      CASDOUT(45) => \gf36e2_inst.sngfifo36e2_n_58\,
      CASDOUT(44) => \gf36e2_inst.sngfifo36e2_n_59\,
      CASDOUT(43) => \gf36e2_inst.sngfifo36e2_n_60\,
      CASDOUT(42) => \gf36e2_inst.sngfifo36e2_n_61\,
      CASDOUT(41) => \gf36e2_inst.sngfifo36e2_n_62\,
      CASDOUT(40) => \gf36e2_inst.sngfifo36e2_n_63\,
      CASDOUT(39) => \gf36e2_inst.sngfifo36e2_n_64\,
      CASDOUT(38) => \gf36e2_inst.sngfifo36e2_n_65\,
      CASDOUT(37) => \gf36e2_inst.sngfifo36e2_n_66\,
      CASDOUT(36) => \gf36e2_inst.sngfifo36e2_n_67\,
      CASDOUT(35) => \gf36e2_inst.sngfifo36e2_n_68\,
      CASDOUT(34) => \gf36e2_inst.sngfifo36e2_n_69\,
      CASDOUT(33) => \gf36e2_inst.sngfifo36e2_n_70\,
      CASDOUT(32) => \gf36e2_inst.sngfifo36e2_n_71\,
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
      CASDOUTP(7) => \gf36e2_inst.sngfifo36e2_n_168\,
      CASDOUTP(6) => \gf36e2_inst.sngfifo36e2_n_169\,
      CASDOUTP(5) => \gf36e2_inst.sngfifo36e2_n_170\,
      CASDOUTP(4) => \gf36e2_inst.sngfifo36e2_n_171\,
      CASDOUTP(3) => \gf36e2_inst.sngfifo36e2_n_172\,
      CASDOUTP(2) => \gf36e2_inst.sngfifo36e2_n_173\,
      CASDOUTP(1) => \gf36e2_inst.sngfifo36e2_n_174\,
      CASDOUTP(0) => \gf36e2_inst.sngfifo36e2_n_175\,
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => dbiterr_col(6),
      DIN(63 downto 0) => din(63 downto 0),
      DINP(7 downto 0) => din(71 downto 64),
      DOUT(63 downto 0) => dout(63 downto 0),
      DOUTP(7 downto 0) => dout(71 downto 64),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => EMPTY,
      FULL => FULL,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => p_86_out,
      RDCLK => rd_clk,
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
      RDEN => RD_EN,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => RDRSTBUSY,
      REGCE => RD_EN,
      RST => srst,
      RSTREG => srst,
      SBITERR => sbiterr_col(6),
      SLEEP => '0',
      WRCLK => wr_clk,
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
      WREN => WR_EN,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => WRRSTBUSY
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_builtin_prim_17 is
  port (
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    \^full\ : out STD_LOGIC;
    rd_clk_0 : out STD_LOGIC;
    \^empty\ : out STD_LOGIC;
    rd_clk_1 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 );
    FULL : in STD_LOGIC;
    full_0 : in STD_LOGIC;
    full_1 : in STD_LOGIC;
    full_2 : in STD_LOGIC;
    full_3 : in STD_LOGIC;
    full_4 : in STD_LOGIC;
    full_5 : in STD_LOGIC;
    full_6 : in STD_LOGIC;
    EMPTY : in STD_LOGIC;
    empty_0 : in STD_LOGIC;
    empty_1 : in STD_LOGIC;
    empty_2 : in STD_LOGIC;
    empty_3 : in STD_LOGIC;
    empty_4 : in STD_LOGIC;
    empty_5 : in STD_LOGIC;
    empty_6 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_prim_17 : entity is "builtin_prim";
end trans_in_meta_fifo_builtin_prim_17;

architecture STRUCTURE of trans_in_meta_fifo_builtin_prim_17 is
  signal dbiterr_col : STD_LOGIC_VECTOR ( 5 to 5 );
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_168\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_169\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_170\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_171\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_172\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_173\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_174\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_175\ : STD_LOGIC;
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
  signal \gf36e2_inst.sngfifo36e2_n_40\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_41\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_42\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_43\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_44\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_45\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_46\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_47\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_48\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_49\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_50\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_51\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_52\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_53\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_54\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_55\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_56\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_57\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_58\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_59\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_60\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_61\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_62\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_63\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_64\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_65\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_66\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_67\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_68\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_69\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_70\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_71\ : STD_LOGIC;
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
  signal p_95_out : STD_LOGIC;
  signal p_96_out : STD_LOGIC;
  signal p_97_out : STD_LOGIC;
  signal \^rd_clk_0\ : STD_LOGIC;
  signal \^rd_clk_1\ : STD_LOGIC;
  signal sbiterr_col : STD_LOGIC_VECTOR ( 5 to 5 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
  rd_clk_0 <= \^rd_clk_0\;
  rd_clk_1 <= \^rd_clk_1\;
empty_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \^rd_clk_1\,
      I1 => EMPTY,
      I2 => empty_0,
      I3 => empty_1,
      I4 => empty_2,
      I5 => empty_3,
      O => \^empty\
    );
empty_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => p_96_out,
      I1 => empty_4,
      I2 => empty_5,
      I3 => empty_6,
      O => \^rd_clk_1\
    );
full_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \^rd_clk_0\,
      I1 => FULL,
      I2 => full_0,
      I3 => full_1,
      I4 => full_2,
      I5 => full_3,
      O => \^full\
    );
full_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => p_97_out,
      I1 => full_4,
      I2 => full_5,
      I3 => full_6,
      O => \^rd_clk_0\
    );
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
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
      PROG_EMPTY_THRESH => 5,
      PROG_FULL_THRESH => 511,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 72,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 72
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63) => \gf36e2_inst.sngfifo36e2_n_40\,
      CASDOUT(62) => \gf36e2_inst.sngfifo36e2_n_41\,
      CASDOUT(61) => \gf36e2_inst.sngfifo36e2_n_42\,
      CASDOUT(60) => \gf36e2_inst.sngfifo36e2_n_43\,
      CASDOUT(59) => \gf36e2_inst.sngfifo36e2_n_44\,
      CASDOUT(58) => \gf36e2_inst.sngfifo36e2_n_45\,
      CASDOUT(57) => \gf36e2_inst.sngfifo36e2_n_46\,
      CASDOUT(56) => \gf36e2_inst.sngfifo36e2_n_47\,
      CASDOUT(55) => \gf36e2_inst.sngfifo36e2_n_48\,
      CASDOUT(54) => \gf36e2_inst.sngfifo36e2_n_49\,
      CASDOUT(53) => \gf36e2_inst.sngfifo36e2_n_50\,
      CASDOUT(52) => \gf36e2_inst.sngfifo36e2_n_51\,
      CASDOUT(51) => \gf36e2_inst.sngfifo36e2_n_52\,
      CASDOUT(50) => \gf36e2_inst.sngfifo36e2_n_53\,
      CASDOUT(49) => \gf36e2_inst.sngfifo36e2_n_54\,
      CASDOUT(48) => \gf36e2_inst.sngfifo36e2_n_55\,
      CASDOUT(47) => \gf36e2_inst.sngfifo36e2_n_56\,
      CASDOUT(46) => \gf36e2_inst.sngfifo36e2_n_57\,
      CASDOUT(45) => \gf36e2_inst.sngfifo36e2_n_58\,
      CASDOUT(44) => \gf36e2_inst.sngfifo36e2_n_59\,
      CASDOUT(43) => \gf36e2_inst.sngfifo36e2_n_60\,
      CASDOUT(42) => \gf36e2_inst.sngfifo36e2_n_61\,
      CASDOUT(41) => \gf36e2_inst.sngfifo36e2_n_62\,
      CASDOUT(40) => \gf36e2_inst.sngfifo36e2_n_63\,
      CASDOUT(39) => \gf36e2_inst.sngfifo36e2_n_64\,
      CASDOUT(38) => \gf36e2_inst.sngfifo36e2_n_65\,
      CASDOUT(37) => \gf36e2_inst.sngfifo36e2_n_66\,
      CASDOUT(36) => \gf36e2_inst.sngfifo36e2_n_67\,
      CASDOUT(35) => \gf36e2_inst.sngfifo36e2_n_68\,
      CASDOUT(34) => \gf36e2_inst.sngfifo36e2_n_69\,
      CASDOUT(33) => \gf36e2_inst.sngfifo36e2_n_70\,
      CASDOUT(32) => \gf36e2_inst.sngfifo36e2_n_71\,
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
      CASDOUTP(7) => \gf36e2_inst.sngfifo36e2_n_168\,
      CASDOUTP(6) => \gf36e2_inst.sngfifo36e2_n_169\,
      CASDOUTP(5) => \gf36e2_inst.sngfifo36e2_n_170\,
      CASDOUTP(4) => \gf36e2_inst.sngfifo36e2_n_171\,
      CASDOUTP(3) => \gf36e2_inst.sngfifo36e2_n_172\,
      CASDOUTP(2) => \gf36e2_inst.sngfifo36e2_n_173\,
      CASDOUTP(1) => \gf36e2_inst.sngfifo36e2_n_174\,
      CASDOUTP(0) => \gf36e2_inst.sngfifo36e2_n_175\,
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => dbiterr_col(5),
      DIN(63 downto 0) => din(63 downto 0),
      DINP(7 downto 0) => din(71 downto 64),
      DOUT(63 downto 0) => dout(63 downto 0),
      DOUTP(7 downto 0) => dout(71 downto 64),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => p_96_out,
      FULL => p_97_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => p_95_out,
      RDCLK => rd_clk,
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
      RDEN => RD_EN,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => RDRSTBUSY,
      REGCE => RD_EN,
      RST => srst,
      RSTREG => srst,
      SBITERR => sbiterr_col(5),
      SLEEP => '0',
      WRCLK => wr_clk,
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
      WREN => WR_EN,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => WRRSTBUSY
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_builtin_prim_18 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_prim_18 : entity is "builtin_prim";
end trans_in_meta_fifo_builtin_prim_18;

architecture STRUCTURE of trans_in_meta_fifo_builtin_prim_18 is
  signal dbiterr_col : STD_LOGIC_VECTOR ( 4 to 4 );
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_168\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_169\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_170\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_171\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_172\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_173\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_174\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_175\ : STD_LOGIC;
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
  signal \gf36e2_inst.sngfifo36e2_n_40\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_41\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_42\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_43\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_44\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_45\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_46\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_47\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_48\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_49\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_50\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_51\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_52\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_53\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_54\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_55\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_56\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_57\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_58\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_59\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_60\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_61\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_62\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_63\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_64\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_65\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_66\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_67\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_68\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_69\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_70\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_71\ : STD_LOGIC;
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
  signal p_104_out : STD_LOGIC;
  signal sbiterr_col : STD_LOGIC_VECTOR ( 4 to 4 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
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
      PROG_EMPTY_THRESH => 5,
      PROG_FULL_THRESH => 511,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 72,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 72
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63) => \gf36e2_inst.sngfifo36e2_n_40\,
      CASDOUT(62) => \gf36e2_inst.sngfifo36e2_n_41\,
      CASDOUT(61) => \gf36e2_inst.sngfifo36e2_n_42\,
      CASDOUT(60) => \gf36e2_inst.sngfifo36e2_n_43\,
      CASDOUT(59) => \gf36e2_inst.sngfifo36e2_n_44\,
      CASDOUT(58) => \gf36e2_inst.sngfifo36e2_n_45\,
      CASDOUT(57) => \gf36e2_inst.sngfifo36e2_n_46\,
      CASDOUT(56) => \gf36e2_inst.sngfifo36e2_n_47\,
      CASDOUT(55) => \gf36e2_inst.sngfifo36e2_n_48\,
      CASDOUT(54) => \gf36e2_inst.sngfifo36e2_n_49\,
      CASDOUT(53) => \gf36e2_inst.sngfifo36e2_n_50\,
      CASDOUT(52) => \gf36e2_inst.sngfifo36e2_n_51\,
      CASDOUT(51) => \gf36e2_inst.sngfifo36e2_n_52\,
      CASDOUT(50) => \gf36e2_inst.sngfifo36e2_n_53\,
      CASDOUT(49) => \gf36e2_inst.sngfifo36e2_n_54\,
      CASDOUT(48) => \gf36e2_inst.sngfifo36e2_n_55\,
      CASDOUT(47) => \gf36e2_inst.sngfifo36e2_n_56\,
      CASDOUT(46) => \gf36e2_inst.sngfifo36e2_n_57\,
      CASDOUT(45) => \gf36e2_inst.sngfifo36e2_n_58\,
      CASDOUT(44) => \gf36e2_inst.sngfifo36e2_n_59\,
      CASDOUT(43) => \gf36e2_inst.sngfifo36e2_n_60\,
      CASDOUT(42) => \gf36e2_inst.sngfifo36e2_n_61\,
      CASDOUT(41) => \gf36e2_inst.sngfifo36e2_n_62\,
      CASDOUT(40) => \gf36e2_inst.sngfifo36e2_n_63\,
      CASDOUT(39) => \gf36e2_inst.sngfifo36e2_n_64\,
      CASDOUT(38) => \gf36e2_inst.sngfifo36e2_n_65\,
      CASDOUT(37) => \gf36e2_inst.sngfifo36e2_n_66\,
      CASDOUT(36) => \gf36e2_inst.sngfifo36e2_n_67\,
      CASDOUT(35) => \gf36e2_inst.sngfifo36e2_n_68\,
      CASDOUT(34) => \gf36e2_inst.sngfifo36e2_n_69\,
      CASDOUT(33) => \gf36e2_inst.sngfifo36e2_n_70\,
      CASDOUT(32) => \gf36e2_inst.sngfifo36e2_n_71\,
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
      CASDOUTP(7) => \gf36e2_inst.sngfifo36e2_n_168\,
      CASDOUTP(6) => \gf36e2_inst.sngfifo36e2_n_169\,
      CASDOUTP(5) => \gf36e2_inst.sngfifo36e2_n_170\,
      CASDOUTP(4) => \gf36e2_inst.sngfifo36e2_n_171\,
      CASDOUTP(3) => \gf36e2_inst.sngfifo36e2_n_172\,
      CASDOUTP(2) => \gf36e2_inst.sngfifo36e2_n_173\,
      CASDOUTP(1) => \gf36e2_inst.sngfifo36e2_n_174\,
      CASDOUTP(0) => \gf36e2_inst.sngfifo36e2_n_175\,
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => dbiterr_col(4),
      DIN(63 downto 0) => din(63 downto 0),
      DINP(7 downto 0) => din(71 downto 64),
      DOUT(63 downto 0) => dout(63 downto 0),
      DOUTP(7 downto 0) => dout(71 downto 64),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => EMPTY,
      FULL => FULL,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => p_104_out,
      RDCLK => rd_clk,
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
      RDEN => RD_EN,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => RDRSTBUSY,
      REGCE => RD_EN,
      RST => srst,
      RSTREG => srst,
      SBITERR => sbiterr_col(4),
      SLEEP => '0',
      WRCLK => wr_clk,
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
      WREN => WR_EN,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => WRRSTBUSY
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_builtin_prim_19 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_prim_19 : entity is "builtin_prim";
end trans_in_meta_fifo_builtin_prim_19;

architecture STRUCTURE of trans_in_meta_fifo_builtin_prim_19 is
  signal dbiterr_col : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_168\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_169\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_170\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_171\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_172\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_173\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_174\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_175\ : STD_LOGIC;
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
  signal \gf36e2_inst.sngfifo36e2_n_40\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_41\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_42\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_43\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_44\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_45\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_46\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_47\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_48\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_49\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_50\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_51\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_52\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_53\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_54\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_55\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_56\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_57\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_58\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_59\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_60\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_61\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_62\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_63\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_64\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_65\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_66\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_67\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_68\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_69\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_70\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_71\ : STD_LOGIC;
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
  signal p_113_out : STD_LOGIC;
  signal sbiterr_col : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
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
      PROG_EMPTY_THRESH => 5,
      PROG_FULL_THRESH => 511,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 72,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 72
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63) => \gf36e2_inst.sngfifo36e2_n_40\,
      CASDOUT(62) => \gf36e2_inst.sngfifo36e2_n_41\,
      CASDOUT(61) => \gf36e2_inst.sngfifo36e2_n_42\,
      CASDOUT(60) => \gf36e2_inst.sngfifo36e2_n_43\,
      CASDOUT(59) => \gf36e2_inst.sngfifo36e2_n_44\,
      CASDOUT(58) => \gf36e2_inst.sngfifo36e2_n_45\,
      CASDOUT(57) => \gf36e2_inst.sngfifo36e2_n_46\,
      CASDOUT(56) => \gf36e2_inst.sngfifo36e2_n_47\,
      CASDOUT(55) => \gf36e2_inst.sngfifo36e2_n_48\,
      CASDOUT(54) => \gf36e2_inst.sngfifo36e2_n_49\,
      CASDOUT(53) => \gf36e2_inst.sngfifo36e2_n_50\,
      CASDOUT(52) => \gf36e2_inst.sngfifo36e2_n_51\,
      CASDOUT(51) => \gf36e2_inst.sngfifo36e2_n_52\,
      CASDOUT(50) => \gf36e2_inst.sngfifo36e2_n_53\,
      CASDOUT(49) => \gf36e2_inst.sngfifo36e2_n_54\,
      CASDOUT(48) => \gf36e2_inst.sngfifo36e2_n_55\,
      CASDOUT(47) => \gf36e2_inst.sngfifo36e2_n_56\,
      CASDOUT(46) => \gf36e2_inst.sngfifo36e2_n_57\,
      CASDOUT(45) => \gf36e2_inst.sngfifo36e2_n_58\,
      CASDOUT(44) => \gf36e2_inst.sngfifo36e2_n_59\,
      CASDOUT(43) => \gf36e2_inst.sngfifo36e2_n_60\,
      CASDOUT(42) => \gf36e2_inst.sngfifo36e2_n_61\,
      CASDOUT(41) => \gf36e2_inst.sngfifo36e2_n_62\,
      CASDOUT(40) => \gf36e2_inst.sngfifo36e2_n_63\,
      CASDOUT(39) => \gf36e2_inst.sngfifo36e2_n_64\,
      CASDOUT(38) => \gf36e2_inst.sngfifo36e2_n_65\,
      CASDOUT(37) => \gf36e2_inst.sngfifo36e2_n_66\,
      CASDOUT(36) => \gf36e2_inst.sngfifo36e2_n_67\,
      CASDOUT(35) => \gf36e2_inst.sngfifo36e2_n_68\,
      CASDOUT(34) => \gf36e2_inst.sngfifo36e2_n_69\,
      CASDOUT(33) => \gf36e2_inst.sngfifo36e2_n_70\,
      CASDOUT(32) => \gf36e2_inst.sngfifo36e2_n_71\,
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
      CASDOUTP(7) => \gf36e2_inst.sngfifo36e2_n_168\,
      CASDOUTP(6) => \gf36e2_inst.sngfifo36e2_n_169\,
      CASDOUTP(5) => \gf36e2_inst.sngfifo36e2_n_170\,
      CASDOUTP(4) => \gf36e2_inst.sngfifo36e2_n_171\,
      CASDOUTP(3) => \gf36e2_inst.sngfifo36e2_n_172\,
      CASDOUTP(2) => \gf36e2_inst.sngfifo36e2_n_173\,
      CASDOUTP(1) => \gf36e2_inst.sngfifo36e2_n_174\,
      CASDOUTP(0) => \gf36e2_inst.sngfifo36e2_n_175\,
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => dbiterr_col(3),
      DIN(63 downto 0) => din(63 downto 0),
      DINP(7 downto 0) => din(71 downto 64),
      DOUT(63 downto 0) => dout(63 downto 0),
      DOUTP(7 downto 0) => dout(71 downto 64),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => EMPTY,
      FULL => FULL,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => p_113_out,
      RDCLK => rd_clk,
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
      RDEN => RD_EN,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => RDRSTBUSY,
      REGCE => RD_EN,
      RST => srst,
      RSTREG => srst,
      SBITERR => sbiterr_col(3),
      SLEEP => '0',
      WRCLK => wr_clk,
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
      WREN => WR_EN,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => WRRSTBUSY
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_builtin_prim_20 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_prim_20 : entity is "builtin_prim";
end trans_in_meta_fifo_builtin_prim_20;

architecture STRUCTURE of trans_in_meta_fifo_builtin_prim_20 is
  signal dbiterr_col : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_168\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_169\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_170\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_171\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_172\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_173\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_174\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_175\ : STD_LOGIC;
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
  signal \gf36e2_inst.sngfifo36e2_n_40\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_41\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_42\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_43\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_44\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_45\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_46\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_47\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_48\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_49\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_50\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_51\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_52\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_53\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_54\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_55\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_56\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_57\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_58\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_59\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_60\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_61\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_62\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_63\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_64\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_65\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_66\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_67\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_68\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_69\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_70\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_71\ : STD_LOGIC;
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
  signal p_122_out : STD_LOGIC;
  signal sbiterr_col : STD_LOGIC_VECTOR ( 2 to 2 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
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
      PROG_EMPTY_THRESH => 5,
      PROG_FULL_THRESH => 511,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 72,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 72
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63) => \gf36e2_inst.sngfifo36e2_n_40\,
      CASDOUT(62) => \gf36e2_inst.sngfifo36e2_n_41\,
      CASDOUT(61) => \gf36e2_inst.sngfifo36e2_n_42\,
      CASDOUT(60) => \gf36e2_inst.sngfifo36e2_n_43\,
      CASDOUT(59) => \gf36e2_inst.sngfifo36e2_n_44\,
      CASDOUT(58) => \gf36e2_inst.sngfifo36e2_n_45\,
      CASDOUT(57) => \gf36e2_inst.sngfifo36e2_n_46\,
      CASDOUT(56) => \gf36e2_inst.sngfifo36e2_n_47\,
      CASDOUT(55) => \gf36e2_inst.sngfifo36e2_n_48\,
      CASDOUT(54) => \gf36e2_inst.sngfifo36e2_n_49\,
      CASDOUT(53) => \gf36e2_inst.sngfifo36e2_n_50\,
      CASDOUT(52) => \gf36e2_inst.sngfifo36e2_n_51\,
      CASDOUT(51) => \gf36e2_inst.sngfifo36e2_n_52\,
      CASDOUT(50) => \gf36e2_inst.sngfifo36e2_n_53\,
      CASDOUT(49) => \gf36e2_inst.sngfifo36e2_n_54\,
      CASDOUT(48) => \gf36e2_inst.sngfifo36e2_n_55\,
      CASDOUT(47) => \gf36e2_inst.sngfifo36e2_n_56\,
      CASDOUT(46) => \gf36e2_inst.sngfifo36e2_n_57\,
      CASDOUT(45) => \gf36e2_inst.sngfifo36e2_n_58\,
      CASDOUT(44) => \gf36e2_inst.sngfifo36e2_n_59\,
      CASDOUT(43) => \gf36e2_inst.sngfifo36e2_n_60\,
      CASDOUT(42) => \gf36e2_inst.sngfifo36e2_n_61\,
      CASDOUT(41) => \gf36e2_inst.sngfifo36e2_n_62\,
      CASDOUT(40) => \gf36e2_inst.sngfifo36e2_n_63\,
      CASDOUT(39) => \gf36e2_inst.sngfifo36e2_n_64\,
      CASDOUT(38) => \gf36e2_inst.sngfifo36e2_n_65\,
      CASDOUT(37) => \gf36e2_inst.sngfifo36e2_n_66\,
      CASDOUT(36) => \gf36e2_inst.sngfifo36e2_n_67\,
      CASDOUT(35) => \gf36e2_inst.sngfifo36e2_n_68\,
      CASDOUT(34) => \gf36e2_inst.sngfifo36e2_n_69\,
      CASDOUT(33) => \gf36e2_inst.sngfifo36e2_n_70\,
      CASDOUT(32) => \gf36e2_inst.sngfifo36e2_n_71\,
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
      CASDOUTP(7) => \gf36e2_inst.sngfifo36e2_n_168\,
      CASDOUTP(6) => \gf36e2_inst.sngfifo36e2_n_169\,
      CASDOUTP(5) => \gf36e2_inst.sngfifo36e2_n_170\,
      CASDOUTP(4) => \gf36e2_inst.sngfifo36e2_n_171\,
      CASDOUTP(3) => \gf36e2_inst.sngfifo36e2_n_172\,
      CASDOUTP(2) => \gf36e2_inst.sngfifo36e2_n_173\,
      CASDOUTP(1) => \gf36e2_inst.sngfifo36e2_n_174\,
      CASDOUTP(0) => \gf36e2_inst.sngfifo36e2_n_175\,
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => dbiterr_col(2),
      DIN(63 downto 0) => din(63 downto 0),
      DINP(7 downto 0) => din(71 downto 64),
      DOUT(63 downto 0) => dout(63 downto 0),
      DOUTP(7 downto 0) => dout(71 downto 64),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => EMPTY,
      FULL => FULL,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => p_122_out,
      RDCLK => rd_clk,
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
      RDEN => RD_EN,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => RDRSTBUSY,
      REGCE => RD_EN,
      RST => srst,
      RSTREG => srst,
      SBITERR => sbiterr_col(2),
      SLEEP => '0',
      WRCLK => wr_clk,
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
      WREN => WR_EN,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => WRRSTBUSY
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_builtin_prim_21 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk_0 : out STD_LOGIC;
    rd_clk_1 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 );
    \gf36e2_inst.sngfifo36e2_i_2\ : in STD_LOGIC;
    \gf36e2_inst.sngfifo36e2_i_2_0\ : in STD_LOGIC;
    \gv.gv3.VALID_reg\ : in STD_LOGIC;
    \gv.gv3.VALID_reg_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_prim_21 : entity is "builtin_prim";
end trans_in_meta_fifo_builtin_prim_21;

architecture STRUCTURE of trans_in_meta_fifo_builtin_prim_21 is
  signal \^empty\ : STD_LOGIC;
  signal \^full\ : STD_LOGIC;
  signal dbiterr_col : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_168\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_169\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_170\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_171\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_172\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_173\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_174\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_175\ : STD_LOGIC;
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
  signal \gf36e2_inst.sngfifo36e2_n_40\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_41\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_42\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_43\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_44\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_45\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_46\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_47\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_48\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_49\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_5\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_50\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_51\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_52\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_53\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_54\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_55\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_56\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_57\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_58\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_59\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_60\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_61\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_62\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_63\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_64\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_65\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_66\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_67\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_68\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_69\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_70\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_71\ : STD_LOGIC;
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
  signal p_131_out : STD_LOGIC;
  signal sbiterr_col : STD_LOGIC_VECTOR ( 1 to 1 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
  EMPTY <= \^empty\;
  FULL <= \^full\;
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
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
      PROG_EMPTY_THRESH => 5,
      PROG_FULL_THRESH => 511,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 72,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 72
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63) => \gf36e2_inst.sngfifo36e2_n_40\,
      CASDOUT(62) => \gf36e2_inst.sngfifo36e2_n_41\,
      CASDOUT(61) => \gf36e2_inst.sngfifo36e2_n_42\,
      CASDOUT(60) => \gf36e2_inst.sngfifo36e2_n_43\,
      CASDOUT(59) => \gf36e2_inst.sngfifo36e2_n_44\,
      CASDOUT(58) => \gf36e2_inst.sngfifo36e2_n_45\,
      CASDOUT(57) => \gf36e2_inst.sngfifo36e2_n_46\,
      CASDOUT(56) => \gf36e2_inst.sngfifo36e2_n_47\,
      CASDOUT(55) => \gf36e2_inst.sngfifo36e2_n_48\,
      CASDOUT(54) => \gf36e2_inst.sngfifo36e2_n_49\,
      CASDOUT(53) => \gf36e2_inst.sngfifo36e2_n_50\,
      CASDOUT(52) => \gf36e2_inst.sngfifo36e2_n_51\,
      CASDOUT(51) => \gf36e2_inst.sngfifo36e2_n_52\,
      CASDOUT(50) => \gf36e2_inst.sngfifo36e2_n_53\,
      CASDOUT(49) => \gf36e2_inst.sngfifo36e2_n_54\,
      CASDOUT(48) => \gf36e2_inst.sngfifo36e2_n_55\,
      CASDOUT(47) => \gf36e2_inst.sngfifo36e2_n_56\,
      CASDOUT(46) => \gf36e2_inst.sngfifo36e2_n_57\,
      CASDOUT(45) => \gf36e2_inst.sngfifo36e2_n_58\,
      CASDOUT(44) => \gf36e2_inst.sngfifo36e2_n_59\,
      CASDOUT(43) => \gf36e2_inst.sngfifo36e2_n_60\,
      CASDOUT(42) => \gf36e2_inst.sngfifo36e2_n_61\,
      CASDOUT(41) => \gf36e2_inst.sngfifo36e2_n_62\,
      CASDOUT(40) => \gf36e2_inst.sngfifo36e2_n_63\,
      CASDOUT(39) => \gf36e2_inst.sngfifo36e2_n_64\,
      CASDOUT(38) => \gf36e2_inst.sngfifo36e2_n_65\,
      CASDOUT(37) => \gf36e2_inst.sngfifo36e2_n_66\,
      CASDOUT(36) => \gf36e2_inst.sngfifo36e2_n_67\,
      CASDOUT(35) => \gf36e2_inst.sngfifo36e2_n_68\,
      CASDOUT(34) => \gf36e2_inst.sngfifo36e2_n_69\,
      CASDOUT(33) => \gf36e2_inst.sngfifo36e2_n_70\,
      CASDOUT(32) => \gf36e2_inst.sngfifo36e2_n_71\,
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
      CASDOUTP(7) => \gf36e2_inst.sngfifo36e2_n_168\,
      CASDOUTP(6) => \gf36e2_inst.sngfifo36e2_n_169\,
      CASDOUTP(5) => \gf36e2_inst.sngfifo36e2_n_170\,
      CASDOUTP(4) => \gf36e2_inst.sngfifo36e2_n_171\,
      CASDOUTP(3) => \gf36e2_inst.sngfifo36e2_n_172\,
      CASDOUTP(2) => \gf36e2_inst.sngfifo36e2_n_173\,
      CASDOUTP(1) => \gf36e2_inst.sngfifo36e2_n_174\,
      CASDOUTP(0) => \gf36e2_inst.sngfifo36e2_n_175\,
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => dbiterr_col(1),
      DIN(63 downto 0) => din(63 downto 0),
      DINP(7 downto 0) => din(71 downto 64),
      DOUT(63 downto 0) => dout(63 downto 0),
      DOUTP(7 downto 0) => dout(71 downto 64),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => \^empty\,
      FULL => \^full\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => \gf36e2_inst.sngfifo36e2_n_5\,
      PROGFULL => p_131_out,
      RDCLK => rd_clk,
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
      RDEN => RD_EN,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => RDRSTBUSY,
      REGCE => RD_EN,
      RST => srst,
      RSTREG => srst,
      SBITERR => sbiterr_col(1),
      SLEEP => '0',
      WRCLK => wr_clk,
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
      WREN => WR_EN,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => WRRSTBUSY
    );
\gf36e2_inst.sngfifo36e2_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^empty\,
      I1 => \gv.gv3.VALID_reg\,
      I2 => \gv.gv3.VALID_reg_0\,
      O => rd_clk_1
    );
\gf36e2_inst.sngfifo36e2_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^full\,
      I1 => \gf36e2_inst.sngfifo36e2_i_2\,
      I2 => \gf36e2_inst.sngfifo36e2_i_2_0\,
      O => rd_clk_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_builtin_prim_22 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_prim_22 : entity is "builtin_prim";
end trans_in_meta_fifo_builtin_prim_22;

architecture STRUCTURE of trans_in_meta_fifo_builtin_prim_22 is
  signal dbiterr_col : STD_LOGIC_VECTOR ( 15 to 15 );
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_104\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_105\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_106\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_107\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_108\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_109\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_110\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_111\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_112\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_113\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_114\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_115\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_116\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_117\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_118\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_119\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_120\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_121\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_122\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_123\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_124\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_125\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_126\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_127\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_128\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_129\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_130\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_131\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_132\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_133\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_134\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_135\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_136\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_137\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_138\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_139\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_140\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_141\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_142\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_143\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_144\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_145\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_146\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_147\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_148\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_149\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_150\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_151\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_168\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_169\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_170\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_171\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_172\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_173\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_174\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_175\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_176\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_177\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_178\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_179\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_18\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_180\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_181\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_182\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_183\ : STD_LOGIC;
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
  signal \gf36e2_inst.sngfifo36e2_n_40\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_41\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_42\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_43\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_44\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_45\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_46\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_47\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_48\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_49\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_50\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_51\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_52\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_53\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_54\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_55\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_56\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_57\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_58\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_59\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_60\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_61\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_62\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_63\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_64\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_65\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_66\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_67\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_68\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_69\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_70\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_71\ : STD_LOGIC;
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
  signal sbiterr_col : STD_LOGIC_VECTOR ( 15 to 15 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
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
      PROG_EMPTY_THRESH => 5,
      PROG_FULL_THRESH => 511,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 72,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 72
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63) => \gf36e2_inst.sngfifo36e2_n_40\,
      CASDOUT(62) => \gf36e2_inst.sngfifo36e2_n_41\,
      CASDOUT(61) => \gf36e2_inst.sngfifo36e2_n_42\,
      CASDOUT(60) => \gf36e2_inst.sngfifo36e2_n_43\,
      CASDOUT(59) => \gf36e2_inst.sngfifo36e2_n_44\,
      CASDOUT(58) => \gf36e2_inst.sngfifo36e2_n_45\,
      CASDOUT(57) => \gf36e2_inst.sngfifo36e2_n_46\,
      CASDOUT(56) => \gf36e2_inst.sngfifo36e2_n_47\,
      CASDOUT(55) => \gf36e2_inst.sngfifo36e2_n_48\,
      CASDOUT(54) => \gf36e2_inst.sngfifo36e2_n_49\,
      CASDOUT(53) => \gf36e2_inst.sngfifo36e2_n_50\,
      CASDOUT(52) => \gf36e2_inst.sngfifo36e2_n_51\,
      CASDOUT(51) => \gf36e2_inst.sngfifo36e2_n_52\,
      CASDOUT(50) => \gf36e2_inst.sngfifo36e2_n_53\,
      CASDOUT(49) => \gf36e2_inst.sngfifo36e2_n_54\,
      CASDOUT(48) => \gf36e2_inst.sngfifo36e2_n_55\,
      CASDOUT(47) => \gf36e2_inst.sngfifo36e2_n_56\,
      CASDOUT(46) => \gf36e2_inst.sngfifo36e2_n_57\,
      CASDOUT(45) => \gf36e2_inst.sngfifo36e2_n_58\,
      CASDOUT(44) => \gf36e2_inst.sngfifo36e2_n_59\,
      CASDOUT(43) => \gf36e2_inst.sngfifo36e2_n_60\,
      CASDOUT(42) => \gf36e2_inst.sngfifo36e2_n_61\,
      CASDOUT(41) => \gf36e2_inst.sngfifo36e2_n_62\,
      CASDOUT(40) => \gf36e2_inst.sngfifo36e2_n_63\,
      CASDOUT(39) => \gf36e2_inst.sngfifo36e2_n_64\,
      CASDOUT(38) => \gf36e2_inst.sngfifo36e2_n_65\,
      CASDOUT(37) => \gf36e2_inst.sngfifo36e2_n_66\,
      CASDOUT(36) => \gf36e2_inst.sngfifo36e2_n_67\,
      CASDOUT(35) => \gf36e2_inst.sngfifo36e2_n_68\,
      CASDOUT(34) => \gf36e2_inst.sngfifo36e2_n_69\,
      CASDOUT(33) => \gf36e2_inst.sngfifo36e2_n_70\,
      CASDOUT(32) => \gf36e2_inst.sngfifo36e2_n_71\,
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
      CASDOUTP(7) => \gf36e2_inst.sngfifo36e2_n_168\,
      CASDOUTP(6) => \gf36e2_inst.sngfifo36e2_n_169\,
      CASDOUTP(5) => \gf36e2_inst.sngfifo36e2_n_170\,
      CASDOUTP(4) => \gf36e2_inst.sngfifo36e2_n_171\,
      CASDOUTP(3) => \gf36e2_inst.sngfifo36e2_n_172\,
      CASDOUTP(2) => \gf36e2_inst.sngfifo36e2_n_173\,
      CASDOUTP(1) => \gf36e2_inst.sngfifo36e2_n_174\,
      CASDOUTP(0) => \gf36e2_inst.sngfifo36e2_n_175\,
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => dbiterr_col(15),
      DIN(63 downto 16) => B"000000000000000000000000000000000000000000000000",
      DIN(15 downto 0) => din(15 downto 0),
      DINP(7 downto 0) => B"00000000",
      DOUT(63) => \gf36e2_inst.sngfifo36e2_n_104\,
      DOUT(62) => \gf36e2_inst.sngfifo36e2_n_105\,
      DOUT(61) => \gf36e2_inst.sngfifo36e2_n_106\,
      DOUT(60) => \gf36e2_inst.sngfifo36e2_n_107\,
      DOUT(59) => \gf36e2_inst.sngfifo36e2_n_108\,
      DOUT(58) => \gf36e2_inst.sngfifo36e2_n_109\,
      DOUT(57) => \gf36e2_inst.sngfifo36e2_n_110\,
      DOUT(56) => \gf36e2_inst.sngfifo36e2_n_111\,
      DOUT(55) => \gf36e2_inst.sngfifo36e2_n_112\,
      DOUT(54) => \gf36e2_inst.sngfifo36e2_n_113\,
      DOUT(53) => \gf36e2_inst.sngfifo36e2_n_114\,
      DOUT(52) => \gf36e2_inst.sngfifo36e2_n_115\,
      DOUT(51) => \gf36e2_inst.sngfifo36e2_n_116\,
      DOUT(50) => \gf36e2_inst.sngfifo36e2_n_117\,
      DOUT(49) => \gf36e2_inst.sngfifo36e2_n_118\,
      DOUT(48) => \gf36e2_inst.sngfifo36e2_n_119\,
      DOUT(47) => \gf36e2_inst.sngfifo36e2_n_120\,
      DOUT(46) => \gf36e2_inst.sngfifo36e2_n_121\,
      DOUT(45) => \gf36e2_inst.sngfifo36e2_n_122\,
      DOUT(44) => \gf36e2_inst.sngfifo36e2_n_123\,
      DOUT(43) => \gf36e2_inst.sngfifo36e2_n_124\,
      DOUT(42) => \gf36e2_inst.sngfifo36e2_n_125\,
      DOUT(41) => \gf36e2_inst.sngfifo36e2_n_126\,
      DOUT(40) => \gf36e2_inst.sngfifo36e2_n_127\,
      DOUT(39) => \gf36e2_inst.sngfifo36e2_n_128\,
      DOUT(38) => \gf36e2_inst.sngfifo36e2_n_129\,
      DOUT(37) => \gf36e2_inst.sngfifo36e2_n_130\,
      DOUT(36) => \gf36e2_inst.sngfifo36e2_n_131\,
      DOUT(35) => \gf36e2_inst.sngfifo36e2_n_132\,
      DOUT(34) => \gf36e2_inst.sngfifo36e2_n_133\,
      DOUT(33) => \gf36e2_inst.sngfifo36e2_n_134\,
      DOUT(32) => \gf36e2_inst.sngfifo36e2_n_135\,
      DOUT(31) => \gf36e2_inst.sngfifo36e2_n_136\,
      DOUT(30) => \gf36e2_inst.sngfifo36e2_n_137\,
      DOUT(29) => \gf36e2_inst.sngfifo36e2_n_138\,
      DOUT(28) => \gf36e2_inst.sngfifo36e2_n_139\,
      DOUT(27) => \gf36e2_inst.sngfifo36e2_n_140\,
      DOUT(26) => \gf36e2_inst.sngfifo36e2_n_141\,
      DOUT(25) => \gf36e2_inst.sngfifo36e2_n_142\,
      DOUT(24) => \gf36e2_inst.sngfifo36e2_n_143\,
      DOUT(23) => \gf36e2_inst.sngfifo36e2_n_144\,
      DOUT(22) => \gf36e2_inst.sngfifo36e2_n_145\,
      DOUT(21) => \gf36e2_inst.sngfifo36e2_n_146\,
      DOUT(20) => \gf36e2_inst.sngfifo36e2_n_147\,
      DOUT(19) => \gf36e2_inst.sngfifo36e2_n_148\,
      DOUT(18) => \gf36e2_inst.sngfifo36e2_n_149\,
      DOUT(17) => \gf36e2_inst.sngfifo36e2_n_150\,
      DOUT(16) => \gf36e2_inst.sngfifo36e2_n_151\,
      DOUT(15 downto 0) => dout(15 downto 0),
      DOUTP(7) => \gf36e2_inst.sngfifo36e2_n_176\,
      DOUTP(6) => \gf36e2_inst.sngfifo36e2_n_177\,
      DOUTP(5) => \gf36e2_inst.sngfifo36e2_n_178\,
      DOUTP(4) => \gf36e2_inst.sngfifo36e2_n_179\,
      DOUTP(3) => \gf36e2_inst.sngfifo36e2_n_180\,
      DOUTP(2) => \gf36e2_inst.sngfifo36e2_n_181\,
      DOUTP(1) => \gf36e2_inst.sngfifo36e2_n_182\,
      DOUTP(0) => \gf36e2_inst.sngfifo36e2_n_183\,
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => EMPTY,
      FULL => FULL,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => p_4_out,
      PROGFULL => p_5_out,
      RDCLK => rd_clk,
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
      RDEN => RD_EN,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => RDRSTBUSY,
      REGCE => RD_EN,
      RST => srst,
      RSTREG => srst,
      SBITERR => sbiterr_col(15),
      SLEEP => '0',
      WRCLK => wr_clk,
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
      WREN => WR_EN,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => WRRSTBUSY
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_builtin_prim_23 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_prim_23 : entity is "builtin_prim";
end trans_in_meta_fifo_builtin_prim_23;

architecture STRUCTURE of trans_in_meta_fifo_builtin_prim_23 is
  signal dbiterr_col : STD_LOGIC_VECTOR ( 14 to 14 );
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_168\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_169\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_170\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_171\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_172\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_173\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_174\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_175\ : STD_LOGIC;
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
  signal \gf36e2_inst.sngfifo36e2_n_40\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_41\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_42\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_43\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_44\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_45\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_46\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_47\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_48\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_49\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_50\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_51\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_52\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_53\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_54\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_55\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_56\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_57\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_58\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_59\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_60\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_61\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_62\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_63\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_64\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_65\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_66\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_67\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_68\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_69\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_70\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_71\ : STD_LOGIC;
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
  signal p_13_out : STD_LOGIC;
  signal p_14_out : STD_LOGIC;
  signal sbiterr_col : STD_LOGIC_VECTOR ( 14 to 14 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
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
      PROG_EMPTY_THRESH => 5,
      PROG_FULL_THRESH => 511,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 72,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 72
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63) => \gf36e2_inst.sngfifo36e2_n_40\,
      CASDOUT(62) => \gf36e2_inst.sngfifo36e2_n_41\,
      CASDOUT(61) => \gf36e2_inst.sngfifo36e2_n_42\,
      CASDOUT(60) => \gf36e2_inst.sngfifo36e2_n_43\,
      CASDOUT(59) => \gf36e2_inst.sngfifo36e2_n_44\,
      CASDOUT(58) => \gf36e2_inst.sngfifo36e2_n_45\,
      CASDOUT(57) => \gf36e2_inst.sngfifo36e2_n_46\,
      CASDOUT(56) => \gf36e2_inst.sngfifo36e2_n_47\,
      CASDOUT(55) => \gf36e2_inst.sngfifo36e2_n_48\,
      CASDOUT(54) => \gf36e2_inst.sngfifo36e2_n_49\,
      CASDOUT(53) => \gf36e2_inst.sngfifo36e2_n_50\,
      CASDOUT(52) => \gf36e2_inst.sngfifo36e2_n_51\,
      CASDOUT(51) => \gf36e2_inst.sngfifo36e2_n_52\,
      CASDOUT(50) => \gf36e2_inst.sngfifo36e2_n_53\,
      CASDOUT(49) => \gf36e2_inst.sngfifo36e2_n_54\,
      CASDOUT(48) => \gf36e2_inst.sngfifo36e2_n_55\,
      CASDOUT(47) => \gf36e2_inst.sngfifo36e2_n_56\,
      CASDOUT(46) => \gf36e2_inst.sngfifo36e2_n_57\,
      CASDOUT(45) => \gf36e2_inst.sngfifo36e2_n_58\,
      CASDOUT(44) => \gf36e2_inst.sngfifo36e2_n_59\,
      CASDOUT(43) => \gf36e2_inst.sngfifo36e2_n_60\,
      CASDOUT(42) => \gf36e2_inst.sngfifo36e2_n_61\,
      CASDOUT(41) => \gf36e2_inst.sngfifo36e2_n_62\,
      CASDOUT(40) => \gf36e2_inst.sngfifo36e2_n_63\,
      CASDOUT(39) => \gf36e2_inst.sngfifo36e2_n_64\,
      CASDOUT(38) => \gf36e2_inst.sngfifo36e2_n_65\,
      CASDOUT(37) => \gf36e2_inst.sngfifo36e2_n_66\,
      CASDOUT(36) => \gf36e2_inst.sngfifo36e2_n_67\,
      CASDOUT(35) => \gf36e2_inst.sngfifo36e2_n_68\,
      CASDOUT(34) => \gf36e2_inst.sngfifo36e2_n_69\,
      CASDOUT(33) => \gf36e2_inst.sngfifo36e2_n_70\,
      CASDOUT(32) => \gf36e2_inst.sngfifo36e2_n_71\,
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
      CASDOUTP(7) => \gf36e2_inst.sngfifo36e2_n_168\,
      CASDOUTP(6) => \gf36e2_inst.sngfifo36e2_n_169\,
      CASDOUTP(5) => \gf36e2_inst.sngfifo36e2_n_170\,
      CASDOUTP(4) => \gf36e2_inst.sngfifo36e2_n_171\,
      CASDOUTP(3) => \gf36e2_inst.sngfifo36e2_n_172\,
      CASDOUTP(2) => \gf36e2_inst.sngfifo36e2_n_173\,
      CASDOUTP(1) => \gf36e2_inst.sngfifo36e2_n_174\,
      CASDOUTP(0) => \gf36e2_inst.sngfifo36e2_n_175\,
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => dbiterr_col(14),
      DIN(63 downto 0) => din(63 downto 0),
      DINP(7 downto 0) => din(71 downto 64),
      DOUT(63 downto 0) => dout(63 downto 0),
      DOUTP(7 downto 0) => dout(71 downto 64),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => EMPTY,
      FULL => FULL,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => p_13_out,
      PROGFULL => p_14_out,
      RDCLK => rd_clk,
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
      RDEN => RD_EN,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => RDRSTBUSY,
      REGCE => RD_EN,
      RST => srst,
      RSTREG => srst,
      SBITERR => sbiterr_col(14),
      SLEEP => '0',
      WRCLK => wr_clk,
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
      WREN => WR_EN,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => WRRSTBUSY
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_builtin_prim_24 is
  port (
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk_0 : out STD_LOGIC;
    rd_clk_1 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 );
    FULL : in STD_LOGIC;
    \^full\ : in STD_LOGIC;
    full_0 : in STD_LOGIC;
    EMPTY : in STD_LOGIC;
    \gv.gv3.VALID_reg\ : in STD_LOGIC;
    \gv.gv3.VALID_reg_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_prim_24 : entity is "builtin_prim";
end trans_in_meta_fifo_builtin_prim_24;

architecture STRUCTURE of trans_in_meta_fifo_builtin_prim_24 is
  signal dbiterr_col : STD_LOGIC_VECTOR ( 13 to 13 );
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_168\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_169\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_170\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_171\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_172\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_173\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_174\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_175\ : STD_LOGIC;
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
  signal \gf36e2_inst.sngfifo36e2_n_40\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_41\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_42\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_43\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_44\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_45\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_46\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_47\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_48\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_49\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_50\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_51\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_52\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_53\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_54\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_55\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_56\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_57\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_58\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_59\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_60\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_61\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_62\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_63\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_64\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_65\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_66\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_67\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_68\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_69\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_70\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_71\ : STD_LOGIC;
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
  signal p_22_out : STD_LOGIC;
  signal p_23_out : STD_LOGIC;
  signal p_24_out : STD_LOGIC;
  signal p_25_out : STD_LOGIC;
  signal sbiterr_col : STD_LOGIC_VECTOR ( 13 to 13 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
empty_INST_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => p_24_out,
      I1 => EMPTY,
      I2 => \gv.gv3.VALID_reg\,
      I3 => \gv.gv3.VALID_reg_0\,
      O => rd_clk_1
    );
full_INST_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => p_25_out,
      I1 => FULL,
      I2 => \^full\,
      I3 => full_0,
      O => rd_clk_0
    );
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
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
      PROG_EMPTY_THRESH => 5,
      PROG_FULL_THRESH => 511,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 72,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 72
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63) => \gf36e2_inst.sngfifo36e2_n_40\,
      CASDOUT(62) => \gf36e2_inst.sngfifo36e2_n_41\,
      CASDOUT(61) => \gf36e2_inst.sngfifo36e2_n_42\,
      CASDOUT(60) => \gf36e2_inst.sngfifo36e2_n_43\,
      CASDOUT(59) => \gf36e2_inst.sngfifo36e2_n_44\,
      CASDOUT(58) => \gf36e2_inst.sngfifo36e2_n_45\,
      CASDOUT(57) => \gf36e2_inst.sngfifo36e2_n_46\,
      CASDOUT(56) => \gf36e2_inst.sngfifo36e2_n_47\,
      CASDOUT(55) => \gf36e2_inst.sngfifo36e2_n_48\,
      CASDOUT(54) => \gf36e2_inst.sngfifo36e2_n_49\,
      CASDOUT(53) => \gf36e2_inst.sngfifo36e2_n_50\,
      CASDOUT(52) => \gf36e2_inst.sngfifo36e2_n_51\,
      CASDOUT(51) => \gf36e2_inst.sngfifo36e2_n_52\,
      CASDOUT(50) => \gf36e2_inst.sngfifo36e2_n_53\,
      CASDOUT(49) => \gf36e2_inst.sngfifo36e2_n_54\,
      CASDOUT(48) => \gf36e2_inst.sngfifo36e2_n_55\,
      CASDOUT(47) => \gf36e2_inst.sngfifo36e2_n_56\,
      CASDOUT(46) => \gf36e2_inst.sngfifo36e2_n_57\,
      CASDOUT(45) => \gf36e2_inst.sngfifo36e2_n_58\,
      CASDOUT(44) => \gf36e2_inst.sngfifo36e2_n_59\,
      CASDOUT(43) => \gf36e2_inst.sngfifo36e2_n_60\,
      CASDOUT(42) => \gf36e2_inst.sngfifo36e2_n_61\,
      CASDOUT(41) => \gf36e2_inst.sngfifo36e2_n_62\,
      CASDOUT(40) => \gf36e2_inst.sngfifo36e2_n_63\,
      CASDOUT(39) => \gf36e2_inst.sngfifo36e2_n_64\,
      CASDOUT(38) => \gf36e2_inst.sngfifo36e2_n_65\,
      CASDOUT(37) => \gf36e2_inst.sngfifo36e2_n_66\,
      CASDOUT(36) => \gf36e2_inst.sngfifo36e2_n_67\,
      CASDOUT(35) => \gf36e2_inst.sngfifo36e2_n_68\,
      CASDOUT(34) => \gf36e2_inst.sngfifo36e2_n_69\,
      CASDOUT(33) => \gf36e2_inst.sngfifo36e2_n_70\,
      CASDOUT(32) => \gf36e2_inst.sngfifo36e2_n_71\,
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
      CASDOUTP(7) => \gf36e2_inst.sngfifo36e2_n_168\,
      CASDOUTP(6) => \gf36e2_inst.sngfifo36e2_n_169\,
      CASDOUTP(5) => \gf36e2_inst.sngfifo36e2_n_170\,
      CASDOUTP(4) => \gf36e2_inst.sngfifo36e2_n_171\,
      CASDOUTP(3) => \gf36e2_inst.sngfifo36e2_n_172\,
      CASDOUTP(2) => \gf36e2_inst.sngfifo36e2_n_173\,
      CASDOUTP(1) => \gf36e2_inst.sngfifo36e2_n_174\,
      CASDOUTP(0) => \gf36e2_inst.sngfifo36e2_n_175\,
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => dbiterr_col(13),
      DIN(63 downto 0) => din(63 downto 0),
      DINP(7 downto 0) => din(71 downto 64),
      DOUT(63 downto 0) => dout(63 downto 0),
      DOUTP(7 downto 0) => dout(71 downto 64),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => p_24_out,
      FULL => p_25_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => p_22_out,
      PROGFULL => p_23_out,
      RDCLK => rd_clk,
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
      RDEN => RD_EN,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => RDRSTBUSY,
      REGCE => RD_EN,
      RST => srst,
      RSTREG => srst,
      SBITERR => sbiterr_col(13),
      SLEEP => '0',
      WRCLK => wr_clk,
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
      WREN => WR_EN,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => WRRSTBUSY
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_builtin_prim_25 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_prim_25 : entity is "builtin_prim";
end trans_in_meta_fifo_builtin_prim_25;

architecture STRUCTURE of trans_in_meta_fifo_builtin_prim_25 is
  signal dbiterr_col : STD_LOGIC_VECTOR ( 12 to 12 );
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_168\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_169\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_170\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_171\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_172\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_173\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_174\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_175\ : STD_LOGIC;
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
  signal \gf36e2_inst.sngfifo36e2_n_40\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_41\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_42\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_43\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_44\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_45\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_46\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_47\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_48\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_49\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_50\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_51\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_52\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_53\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_54\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_55\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_56\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_57\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_58\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_59\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_60\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_61\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_62\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_63\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_64\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_65\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_66\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_67\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_68\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_69\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_70\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_71\ : STD_LOGIC;
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
  signal p_31_out : STD_LOGIC;
  signal p_32_out : STD_LOGIC;
  signal sbiterr_col : STD_LOGIC_VECTOR ( 12 to 12 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
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
      PROG_EMPTY_THRESH => 5,
      PROG_FULL_THRESH => 511,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 72,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 72
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63) => \gf36e2_inst.sngfifo36e2_n_40\,
      CASDOUT(62) => \gf36e2_inst.sngfifo36e2_n_41\,
      CASDOUT(61) => \gf36e2_inst.sngfifo36e2_n_42\,
      CASDOUT(60) => \gf36e2_inst.sngfifo36e2_n_43\,
      CASDOUT(59) => \gf36e2_inst.sngfifo36e2_n_44\,
      CASDOUT(58) => \gf36e2_inst.sngfifo36e2_n_45\,
      CASDOUT(57) => \gf36e2_inst.sngfifo36e2_n_46\,
      CASDOUT(56) => \gf36e2_inst.sngfifo36e2_n_47\,
      CASDOUT(55) => \gf36e2_inst.sngfifo36e2_n_48\,
      CASDOUT(54) => \gf36e2_inst.sngfifo36e2_n_49\,
      CASDOUT(53) => \gf36e2_inst.sngfifo36e2_n_50\,
      CASDOUT(52) => \gf36e2_inst.sngfifo36e2_n_51\,
      CASDOUT(51) => \gf36e2_inst.sngfifo36e2_n_52\,
      CASDOUT(50) => \gf36e2_inst.sngfifo36e2_n_53\,
      CASDOUT(49) => \gf36e2_inst.sngfifo36e2_n_54\,
      CASDOUT(48) => \gf36e2_inst.sngfifo36e2_n_55\,
      CASDOUT(47) => \gf36e2_inst.sngfifo36e2_n_56\,
      CASDOUT(46) => \gf36e2_inst.sngfifo36e2_n_57\,
      CASDOUT(45) => \gf36e2_inst.sngfifo36e2_n_58\,
      CASDOUT(44) => \gf36e2_inst.sngfifo36e2_n_59\,
      CASDOUT(43) => \gf36e2_inst.sngfifo36e2_n_60\,
      CASDOUT(42) => \gf36e2_inst.sngfifo36e2_n_61\,
      CASDOUT(41) => \gf36e2_inst.sngfifo36e2_n_62\,
      CASDOUT(40) => \gf36e2_inst.sngfifo36e2_n_63\,
      CASDOUT(39) => \gf36e2_inst.sngfifo36e2_n_64\,
      CASDOUT(38) => \gf36e2_inst.sngfifo36e2_n_65\,
      CASDOUT(37) => \gf36e2_inst.sngfifo36e2_n_66\,
      CASDOUT(36) => \gf36e2_inst.sngfifo36e2_n_67\,
      CASDOUT(35) => \gf36e2_inst.sngfifo36e2_n_68\,
      CASDOUT(34) => \gf36e2_inst.sngfifo36e2_n_69\,
      CASDOUT(33) => \gf36e2_inst.sngfifo36e2_n_70\,
      CASDOUT(32) => \gf36e2_inst.sngfifo36e2_n_71\,
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
      CASDOUTP(7) => \gf36e2_inst.sngfifo36e2_n_168\,
      CASDOUTP(6) => \gf36e2_inst.sngfifo36e2_n_169\,
      CASDOUTP(5) => \gf36e2_inst.sngfifo36e2_n_170\,
      CASDOUTP(4) => \gf36e2_inst.sngfifo36e2_n_171\,
      CASDOUTP(3) => \gf36e2_inst.sngfifo36e2_n_172\,
      CASDOUTP(2) => \gf36e2_inst.sngfifo36e2_n_173\,
      CASDOUTP(1) => \gf36e2_inst.sngfifo36e2_n_174\,
      CASDOUTP(0) => \gf36e2_inst.sngfifo36e2_n_175\,
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => dbiterr_col(12),
      DIN(63 downto 0) => din(63 downto 0),
      DINP(7 downto 0) => din(71 downto 64),
      DOUT(63 downto 0) => dout(63 downto 0),
      DOUTP(7 downto 0) => dout(71 downto 64),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => EMPTY,
      FULL => FULL,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => p_31_out,
      PROGFULL => p_32_out,
      RDCLK => rd_clk,
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
      RDEN => RD_EN,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => RDRSTBUSY,
      REGCE => RD_EN,
      RST => srst,
      RSTREG => srst,
      SBITERR => sbiterr_col(12),
      SLEEP => '0',
      WRCLK => wr_clk,
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
      WREN => WR_EN,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => WRRSTBUSY
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_builtin_prim_26 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_prim_26 : entity is "builtin_prim";
end trans_in_meta_fifo_builtin_prim_26;

architecture STRUCTURE of trans_in_meta_fifo_builtin_prim_26 is
  signal dbiterr_col : STD_LOGIC_VECTOR ( 11 to 11 );
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_168\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_169\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_170\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_171\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_172\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_173\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_174\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_175\ : STD_LOGIC;
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
  signal \gf36e2_inst.sngfifo36e2_n_40\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_41\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_42\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_43\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_44\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_45\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_46\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_47\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_48\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_49\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_50\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_51\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_52\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_53\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_54\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_55\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_56\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_57\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_58\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_59\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_60\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_61\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_62\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_63\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_64\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_65\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_66\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_67\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_68\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_69\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_70\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_71\ : STD_LOGIC;
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
  signal p_40_out : STD_LOGIC;
  signal p_41_out : STD_LOGIC;
  signal sbiterr_col : STD_LOGIC_VECTOR ( 11 to 11 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
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
      PROG_EMPTY_THRESH => 5,
      PROG_FULL_THRESH => 511,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 72,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 72
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63) => \gf36e2_inst.sngfifo36e2_n_40\,
      CASDOUT(62) => \gf36e2_inst.sngfifo36e2_n_41\,
      CASDOUT(61) => \gf36e2_inst.sngfifo36e2_n_42\,
      CASDOUT(60) => \gf36e2_inst.sngfifo36e2_n_43\,
      CASDOUT(59) => \gf36e2_inst.sngfifo36e2_n_44\,
      CASDOUT(58) => \gf36e2_inst.sngfifo36e2_n_45\,
      CASDOUT(57) => \gf36e2_inst.sngfifo36e2_n_46\,
      CASDOUT(56) => \gf36e2_inst.sngfifo36e2_n_47\,
      CASDOUT(55) => \gf36e2_inst.sngfifo36e2_n_48\,
      CASDOUT(54) => \gf36e2_inst.sngfifo36e2_n_49\,
      CASDOUT(53) => \gf36e2_inst.sngfifo36e2_n_50\,
      CASDOUT(52) => \gf36e2_inst.sngfifo36e2_n_51\,
      CASDOUT(51) => \gf36e2_inst.sngfifo36e2_n_52\,
      CASDOUT(50) => \gf36e2_inst.sngfifo36e2_n_53\,
      CASDOUT(49) => \gf36e2_inst.sngfifo36e2_n_54\,
      CASDOUT(48) => \gf36e2_inst.sngfifo36e2_n_55\,
      CASDOUT(47) => \gf36e2_inst.sngfifo36e2_n_56\,
      CASDOUT(46) => \gf36e2_inst.sngfifo36e2_n_57\,
      CASDOUT(45) => \gf36e2_inst.sngfifo36e2_n_58\,
      CASDOUT(44) => \gf36e2_inst.sngfifo36e2_n_59\,
      CASDOUT(43) => \gf36e2_inst.sngfifo36e2_n_60\,
      CASDOUT(42) => \gf36e2_inst.sngfifo36e2_n_61\,
      CASDOUT(41) => \gf36e2_inst.sngfifo36e2_n_62\,
      CASDOUT(40) => \gf36e2_inst.sngfifo36e2_n_63\,
      CASDOUT(39) => \gf36e2_inst.sngfifo36e2_n_64\,
      CASDOUT(38) => \gf36e2_inst.sngfifo36e2_n_65\,
      CASDOUT(37) => \gf36e2_inst.sngfifo36e2_n_66\,
      CASDOUT(36) => \gf36e2_inst.sngfifo36e2_n_67\,
      CASDOUT(35) => \gf36e2_inst.sngfifo36e2_n_68\,
      CASDOUT(34) => \gf36e2_inst.sngfifo36e2_n_69\,
      CASDOUT(33) => \gf36e2_inst.sngfifo36e2_n_70\,
      CASDOUT(32) => \gf36e2_inst.sngfifo36e2_n_71\,
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
      CASDOUTP(7) => \gf36e2_inst.sngfifo36e2_n_168\,
      CASDOUTP(6) => \gf36e2_inst.sngfifo36e2_n_169\,
      CASDOUTP(5) => \gf36e2_inst.sngfifo36e2_n_170\,
      CASDOUTP(4) => \gf36e2_inst.sngfifo36e2_n_171\,
      CASDOUTP(3) => \gf36e2_inst.sngfifo36e2_n_172\,
      CASDOUTP(2) => \gf36e2_inst.sngfifo36e2_n_173\,
      CASDOUTP(1) => \gf36e2_inst.sngfifo36e2_n_174\,
      CASDOUTP(0) => \gf36e2_inst.sngfifo36e2_n_175\,
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => dbiterr_col(11),
      DIN(63 downto 0) => din(63 downto 0),
      DINP(7 downto 0) => din(71 downto 64),
      DOUT(63 downto 0) => dout(63 downto 0),
      DOUTP(7 downto 0) => dout(71 downto 64),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => EMPTY,
      FULL => FULL,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => p_40_out,
      PROGFULL => p_41_out,
      RDCLK => rd_clk,
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
      RDEN => RD_EN,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => RDRSTBUSY,
      REGCE => RD_EN,
      RST => srst,
      RSTREG => srst,
      SBITERR => sbiterr_col(11),
      SLEEP => '0',
      WRCLK => wr_clk,
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
      WREN => WR_EN,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => WRRSTBUSY
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_builtin_prim_27 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_prim_27 : entity is "builtin_prim";
end trans_in_meta_fifo_builtin_prim_27;

architecture STRUCTURE of trans_in_meta_fifo_builtin_prim_27 is
  signal dbiterr_col : STD_LOGIC_VECTOR ( 10 to 10 );
  signal \gf36e2_inst.sngfifo36e2_n_0\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_1\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_10\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_100\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_101\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_102\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_103\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_12\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_13\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_14\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_15\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_16\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_168\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_169\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_17\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_170\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_171\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_172\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_173\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_174\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_175\ : STD_LOGIC;
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
  signal \gf36e2_inst.sngfifo36e2_n_40\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_41\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_42\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_43\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_44\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_45\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_46\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_47\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_48\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_49\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_50\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_51\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_52\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_53\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_54\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_55\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_56\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_57\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_58\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_59\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_60\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_61\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_62\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_63\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_64\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_65\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_66\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_67\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_68\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_69\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_7\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_70\ : STD_LOGIC;
  signal \gf36e2_inst.sngfifo36e2_n_71\ : STD_LOGIC;
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
  signal p_49_out : STD_LOGIC;
  signal p_50_out : STD_LOGIC;
  signal sbiterr_col : STD_LOGIC_VECTOR ( 10 to 10 );
  attribute box_type : string;
  attribute box_type of \gf36e2_inst.sngfifo36e2\ : label is "PRIMITIVE";
begin
\gf36e2_inst.sngfifo36e2\: unisim.vcomponents.FIFO36E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
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
      PROG_EMPTY_THRESH => 5,
      PROG_FULL_THRESH => 511,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 72,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 72
    )
        port map (
      CASDIN(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      CASDINP(7 downto 0) => B"00000000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(63) => \gf36e2_inst.sngfifo36e2_n_40\,
      CASDOUT(62) => \gf36e2_inst.sngfifo36e2_n_41\,
      CASDOUT(61) => \gf36e2_inst.sngfifo36e2_n_42\,
      CASDOUT(60) => \gf36e2_inst.sngfifo36e2_n_43\,
      CASDOUT(59) => \gf36e2_inst.sngfifo36e2_n_44\,
      CASDOUT(58) => \gf36e2_inst.sngfifo36e2_n_45\,
      CASDOUT(57) => \gf36e2_inst.sngfifo36e2_n_46\,
      CASDOUT(56) => \gf36e2_inst.sngfifo36e2_n_47\,
      CASDOUT(55) => \gf36e2_inst.sngfifo36e2_n_48\,
      CASDOUT(54) => \gf36e2_inst.sngfifo36e2_n_49\,
      CASDOUT(53) => \gf36e2_inst.sngfifo36e2_n_50\,
      CASDOUT(52) => \gf36e2_inst.sngfifo36e2_n_51\,
      CASDOUT(51) => \gf36e2_inst.sngfifo36e2_n_52\,
      CASDOUT(50) => \gf36e2_inst.sngfifo36e2_n_53\,
      CASDOUT(49) => \gf36e2_inst.sngfifo36e2_n_54\,
      CASDOUT(48) => \gf36e2_inst.sngfifo36e2_n_55\,
      CASDOUT(47) => \gf36e2_inst.sngfifo36e2_n_56\,
      CASDOUT(46) => \gf36e2_inst.sngfifo36e2_n_57\,
      CASDOUT(45) => \gf36e2_inst.sngfifo36e2_n_58\,
      CASDOUT(44) => \gf36e2_inst.sngfifo36e2_n_59\,
      CASDOUT(43) => \gf36e2_inst.sngfifo36e2_n_60\,
      CASDOUT(42) => \gf36e2_inst.sngfifo36e2_n_61\,
      CASDOUT(41) => \gf36e2_inst.sngfifo36e2_n_62\,
      CASDOUT(40) => \gf36e2_inst.sngfifo36e2_n_63\,
      CASDOUT(39) => \gf36e2_inst.sngfifo36e2_n_64\,
      CASDOUT(38) => \gf36e2_inst.sngfifo36e2_n_65\,
      CASDOUT(37) => \gf36e2_inst.sngfifo36e2_n_66\,
      CASDOUT(36) => \gf36e2_inst.sngfifo36e2_n_67\,
      CASDOUT(35) => \gf36e2_inst.sngfifo36e2_n_68\,
      CASDOUT(34) => \gf36e2_inst.sngfifo36e2_n_69\,
      CASDOUT(33) => \gf36e2_inst.sngfifo36e2_n_70\,
      CASDOUT(32) => \gf36e2_inst.sngfifo36e2_n_71\,
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
      CASDOUTP(7) => \gf36e2_inst.sngfifo36e2_n_168\,
      CASDOUTP(6) => \gf36e2_inst.sngfifo36e2_n_169\,
      CASDOUTP(5) => \gf36e2_inst.sngfifo36e2_n_170\,
      CASDOUTP(4) => \gf36e2_inst.sngfifo36e2_n_171\,
      CASDOUTP(3) => \gf36e2_inst.sngfifo36e2_n_172\,
      CASDOUTP(2) => \gf36e2_inst.sngfifo36e2_n_173\,
      CASDOUTP(1) => \gf36e2_inst.sngfifo36e2_n_174\,
      CASDOUTP(0) => \gf36e2_inst.sngfifo36e2_n_175\,
      CASNXTEMPTY => \gf36e2_inst.sngfifo36e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf36e2_inst.sngfifo36e2_n_1\,
      DBITERR => dbiterr_col(10),
      DIN(63 downto 0) => din(63 downto 0),
      DINP(7 downto 0) => din(71 downto 64),
      DOUT(63 downto 0) => dout(63 downto 0),
      DOUTP(7 downto 0) => dout(71 downto 64),
      ECCPARITY(7) => \gf36e2_inst.sngfifo36e2_n_184\,
      ECCPARITY(6) => \gf36e2_inst.sngfifo36e2_n_185\,
      ECCPARITY(5) => \gf36e2_inst.sngfifo36e2_n_186\,
      ECCPARITY(4) => \gf36e2_inst.sngfifo36e2_n_187\,
      ECCPARITY(3) => \gf36e2_inst.sngfifo36e2_n_188\,
      ECCPARITY(2) => \gf36e2_inst.sngfifo36e2_n_189\,
      ECCPARITY(1) => \gf36e2_inst.sngfifo36e2_n_190\,
      ECCPARITY(0) => \gf36e2_inst.sngfifo36e2_n_191\,
      EMPTY => EMPTY,
      FULL => FULL,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      PROGEMPTY => p_49_out,
      PROGFULL => p_50_out,
      RDCLK => rd_clk,
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
      RDEN => RD_EN,
      RDERR => \gf36e2_inst.sngfifo36e2_n_7\,
      RDRSTBUSY => RDRSTBUSY,
      REGCE => RD_EN,
      RST => srst,
      RSTREG => srst,
      SBITERR => sbiterr_col(10),
      SLEEP => '0',
      WRCLK => wr_clk,
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
      WREN => WR_EN,
      WRERR => \gf36e2_inst.sngfifo36e2_n_10\,
      WRRSTBUSY => WRRSTBUSY
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_builtin_extdepth is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
end trans_in_meta_fifo_builtin_extdepth;

architecture STRUCTURE of trans_in_meta_fifo_builtin_extdepth is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.trans_in_meta_fifo_builtin_prim_27
     port map (
      EMPTY => EMPTY,
      FULL => FULL,
      RDRSTBUSY => RDRSTBUSY,
      RD_EN => RD_EN,
      WRRSTBUSY => WRRSTBUSY,
      WR_EN => WR_EN,
      din(71 downto 0) => din(71 downto 0),
      dout(71 downto 0) => dout(71 downto 0),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[10].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_sym.gextw_sym[10].inst_extdi_1\: unisim.vcomponents.LUT1
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
entity trans_in_meta_fifo_builtin_extdepth_0 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_extdepth_0 : entity is "builtin_extdepth";
end trans_in_meta_fifo_builtin_extdepth_0;

architecture STRUCTURE of trans_in_meta_fifo_builtin_extdepth_0 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.trans_in_meta_fifo_builtin_prim_26
     port map (
      EMPTY => EMPTY,
      FULL => FULL,
      RDRSTBUSY => RDRSTBUSY,
      RD_EN => RD_EN,
      WRRSTBUSY => WRRSTBUSY,
      WR_EN => WR_EN,
      din(71 downto 0) => din(71 downto 0),
      dout(71 downto 0) => dout(71 downto 0),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[11].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_sym.gextw_sym[11].inst_extdi_1\: unisim.vcomponents.LUT1
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
entity trans_in_meta_fifo_builtin_extdepth_1 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_extdepth_1 : entity is "builtin_extdepth";
end trans_in_meta_fifo_builtin_extdepth_1;

architecture STRUCTURE of trans_in_meta_fifo_builtin_extdepth_1 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.trans_in_meta_fifo_builtin_prim_25
     port map (
      EMPTY => EMPTY,
      FULL => FULL,
      RDRSTBUSY => RDRSTBUSY,
      RD_EN => RD_EN,
      WRRSTBUSY => WRRSTBUSY,
      WR_EN => WR_EN,
      din(71 downto 0) => din(71 downto 0),
      dout(71 downto 0) => dout(71 downto 0),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[12].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_sym.gextw_sym[12].inst_extdi_1\: unisim.vcomponents.LUT1
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
entity trans_in_meta_fifo_builtin_extdepth_10 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_extdepth_10 : entity is "builtin_extdepth";
end trans_in_meta_fifo_builtin_extdepth_10;

architecture STRUCTURE of trans_in_meta_fifo_builtin_extdepth_10 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.trans_in_meta_fifo_builtin_prim_16
     port map (
      EMPTY => EMPTY,
      FULL => FULL,
      RDRSTBUSY => RDRSTBUSY,
      RD_EN => RD_EN,
      WRRSTBUSY => WRRSTBUSY,
      WR_EN => WR_EN,
      din(71 downto 0) => din(71 downto 0),
      dout(71 downto 0) => dout(71 downto 0),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[6].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_sym.gextw_sym[6].inst_extdi_1\: unisim.vcomponents.LUT1
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
entity trans_in_meta_fifo_builtin_extdepth_11 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_extdepth_11 : entity is "builtin_extdepth";
end trans_in_meta_fifo_builtin_extdepth_11;

architecture STRUCTURE of trans_in_meta_fifo_builtin_extdepth_11 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.trans_in_meta_fifo_builtin_prim_15
     port map (
      EMPTY => EMPTY,
      FULL => FULL,
      RDRSTBUSY => RDRSTBUSY,
      RD_EN => RD_EN,
      WRRSTBUSY => WRRSTBUSY,
      WR_EN => WR_EN,
      din(71 downto 0) => din(71 downto 0),
      dout(71 downto 0) => dout(71 downto 0),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[7].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_sym.gextw_sym[7].inst_extdi_1\: unisim.vcomponents.LUT1
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
entity trans_in_meta_fifo_builtin_extdepth_12 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_extdepth_12 : entity is "builtin_extdepth";
end trans_in_meta_fifo_builtin_extdepth_12;

architecture STRUCTURE of trans_in_meta_fifo_builtin_extdepth_12 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.trans_in_meta_fifo_builtin_prim_14
     port map (
      EMPTY => EMPTY,
      FULL => FULL,
      RDRSTBUSY => RDRSTBUSY,
      RD_EN => RD_EN,
      WRRSTBUSY => WRRSTBUSY,
      WR_EN => WR_EN,
      din(71 downto 0) => din(71 downto 0),
      dout(71 downto 0) => dout(71 downto 0),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[8].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_sym.gextw_sym[8].inst_extdi_1\: unisim.vcomponents.LUT1
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
entity trans_in_meta_fifo_builtin_extdepth_13 is
  port (
    WR_EN : out STD_LOGIC;
    rd_clk_0 : out STD_LOGIC;
    RD_EN : out STD_LOGIC;
    rd_clk_1 : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    \^wr_en\ : in STD_LOGIC;
    \dout[639]\ : in STD_LOGIC;
    \dout[639]_0\ : in STD_LOGIC;
    \dout[639]_1\ : in STD_LOGIC;
    FULL : in STD_LOGIC;
    \^full\ : in STD_LOGIC;
    full_0 : in STD_LOGIC;
    \^rd_en\ : in STD_LOGIC;
    \gv.gv3.VALID_reg\ : in STD_LOGIC;
    \gv.gv3.VALID_reg_0\ : in STD_LOGIC;
    \gv.gv3.VALID_reg_1\ : in STD_LOGIC;
    EMPTY : in STD_LOGIC;
    \gv.gv3.VALID_reg_2\ : in STD_LOGIC;
    \gv.gv3.VALID_reg_3\ : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_extdepth_13 : entity is "builtin_extdepth";
end trans_in_meta_fifo_builtin_extdepth_13;

architecture STRUCTURE of trans_in_meta_fifo_builtin_extdepth_13 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.trans_in_meta_fifo_builtin_prim
     port map (
      EMPTY => EMPTY,
      FULL => FULL,
      RDRSTBUSY => RDRSTBUSY,
      RD_EN => RD_EN,
      WRRSTBUSY => WRRSTBUSY,
      WR_EN => WR_EN,
      din(71 downto 0) => din(71 downto 0),
      dout(71 downto 0) => dout(71 downto 0),
      \dout[639]\ => \dout[639]\,
      \dout[639]_0\ => \dout[639]_0\,
      \dout[639]_1\ => \dout[639]_1\,
      \^full\ => \^full\,
      full_0 => full_0,
      \gv.gv3.VALID_reg\ => \gv.gv3.VALID_reg\,
      \gv.gv3.VALID_reg_0\ => \gv.gv3.VALID_reg_0\,
      \gv.gv3.VALID_reg_1\ => \gv.gv3.VALID_reg_1\,
      \gv.gv3.VALID_reg_2\ => \gv.gv3.VALID_reg_2\,
      \gv.gv3.VALID_reg_3\ => \gv.gv3.VALID_reg_3\,
      rd_clk => rd_clk,
      rd_clk_0 => rd_clk_0,
      rd_clk_1 => rd_clk_1,
      \^rd_en\ => \^rd_en\,
      srst => srst,
      wr_clk => wr_clk,
      \^wr_en\ => \^wr_en\
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
i_1: unisim.vcomponents.LUT1
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
entity trans_in_meta_fifo_builtin_extdepth_2 is
  port (
    rd_clk_0 : out STD_LOGIC;
    rd_clk_1 : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    FULL : in STD_LOGIC;
    \^full\ : in STD_LOGIC;
    full_0 : in STD_LOGIC;
    EMPTY : in STD_LOGIC;
    \gv.gv3.VALID_reg\ : in STD_LOGIC;
    \gv.gv3.VALID_reg_0\ : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_extdepth_2 : entity is "builtin_extdepth";
end trans_in_meta_fifo_builtin_extdepth_2;

architecture STRUCTURE of trans_in_meta_fifo_builtin_extdepth_2 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.trans_in_meta_fifo_builtin_prim_24
     port map (
      EMPTY => EMPTY,
      FULL => FULL,
      RDRSTBUSY => RDRSTBUSY,
      RD_EN => RD_EN,
      WRRSTBUSY => WRRSTBUSY,
      WR_EN => WR_EN,
      din(71 downto 0) => din(71 downto 0),
      dout(71 downto 0) => dout(71 downto 0),
      \^full\ => \^full\,
      full_0 => full_0,
      \gv.gv3.VALID_reg\ => \gv.gv3.VALID_reg\,
      \gv.gv3.VALID_reg_0\ => \gv.gv3.VALID_reg_0\,
      rd_clk => rd_clk,
      rd_clk_0 => rd_clk_0,
      rd_clk_1 => rd_clk_1,
      srst => srst,
      wr_clk => wr_clk
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
i_1: unisim.vcomponents.LUT1
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
entity trans_in_meta_fifo_builtin_extdepth_3 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_extdepth_3 : entity is "builtin_extdepth";
end trans_in_meta_fifo_builtin_extdepth_3;

architecture STRUCTURE of trans_in_meta_fifo_builtin_extdepth_3 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.trans_in_meta_fifo_builtin_prim_23
     port map (
      EMPTY => EMPTY,
      FULL => FULL,
      RDRSTBUSY => RDRSTBUSY,
      RD_EN => RD_EN,
      WRRSTBUSY => WRRSTBUSY,
      WR_EN => WR_EN,
      din(71 downto 0) => din(71 downto 0),
      dout(71 downto 0) => dout(71 downto 0),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[14].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_sym.gextw_sym[14].inst_extdi_1\: unisim.vcomponents.LUT1
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
entity trans_in_meta_fifo_builtin_extdepth_4 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_extdepth_4 : entity is "builtin_extdepth";
end trans_in_meta_fifo_builtin_extdepth_4;

architecture STRUCTURE of trans_in_meta_fifo_builtin_extdepth_4 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.trans_in_meta_fifo_builtin_prim_22
     port map (
      EMPTY => EMPTY,
      FULL => FULL,
      RDRSTBUSY => RDRSTBUSY,
      RD_EN => RD_EN,
      WRRSTBUSY => WRRSTBUSY,
      WR_EN => WR_EN,
      din(15 downto 0) => din(15 downto 0),
      dout(15 downto 0) => dout(15 downto 0),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[15].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_sym.gextw_sym[15].inst_extdi_1\: unisim.vcomponents.LUT1
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
entity trans_in_meta_fifo_builtin_extdepth_5 is
  port (
    rd_clk_0 : out STD_LOGIC;
    FULL : out STD_LOGIC;
    rd_clk_1 : out STD_LOGIC;
    EMPTY : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    \gf36e2_inst.sngfifo36e2_i_2\ : in STD_LOGIC;
    \gf36e2_inst.sngfifo36e2_i_2_0\ : in STD_LOGIC;
    \gv.gv3.VALID_reg\ : in STD_LOGIC;
    \gv.gv3.VALID_reg_0\ : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_extdepth_5 : entity is "builtin_extdepth";
end trans_in_meta_fifo_builtin_extdepth_5;

architecture STRUCTURE of trans_in_meta_fifo_builtin_extdepth_5 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.trans_in_meta_fifo_builtin_prim_21
     port map (
      EMPTY => EMPTY,
      FULL => FULL,
      RDRSTBUSY => RDRSTBUSY,
      RD_EN => RD_EN,
      WRRSTBUSY => WRRSTBUSY,
      WR_EN => WR_EN,
      din(71 downto 0) => din(71 downto 0),
      dout(71 downto 0) => dout(71 downto 0),
      \gf36e2_inst.sngfifo36e2_i_2\ => \gf36e2_inst.sngfifo36e2_i_2\,
      \gf36e2_inst.sngfifo36e2_i_2_0\ => \gf36e2_inst.sngfifo36e2_i_2_0\,
      \gv.gv3.VALID_reg\ => \gv.gv3.VALID_reg\,
      \gv.gv3.VALID_reg_0\ => \gv.gv3.VALID_reg_0\,
      rd_clk => rd_clk,
      rd_clk_0 => rd_clk_0,
      rd_clk_1 => rd_clk_1,
      srst => srst,
      wr_clk => wr_clk
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
i_1: unisim.vcomponents.LUT1
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
entity trans_in_meta_fifo_builtin_extdepth_6 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_extdepth_6 : entity is "builtin_extdepth";
end trans_in_meta_fifo_builtin_extdepth_6;

architecture STRUCTURE of trans_in_meta_fifo_builtin_extdepth_6 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.trans_in_meta_fifo_builtin_prim_20
     port map (
      EMPTY => EMPTY,
      FULL => FULL,
      RDRSTBUSY => RDRSTBUSY,
      RD_EN => RD_EN,
      WRRSTBUSY => WRRSTBUSY,
      WR_EN => WR_EN,
      din(71 downto 0) => din(71 downto 0),
      dout(71 downto 0) => dout(71 downto 0),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[2].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_sym.gextw_sym[2].inst_extdi_1\: unisim.vcomponents.LUT1
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
entity trans_in_meta_fifo_builtin_extdepth_7 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_extdepth_7 : entity is "builtin_extdepth";
end trans_in_meta_fifo_builtin_extdepth_7;

architecture STRUCTURE of trans_in_meta_fifo_builtin_extdepth_7 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.trans_in_meta_fifo_builtin_prim_19
     port map (
      EMPTY => EMPTY,
      FULL => FULL,
      RDRSTBUSY => RDRSTBUSY,
      RD_EN => RD_EN,
      WRRSTBUSY => WRRSTBUSY,
      WR_EN => WR_EN,
      din(71 downto 0) => din(71 downto 0),
      dout(71 downto 0) => dout(71 downto 0),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[3].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_sym.gextw_sym[3].inst_extdi_1\: unisim.vcomponents.LUT1
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
entity trans_in_meta_fifo_builtin_extdepth_8 is
  port (
    EMPTY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_extdepth_8 : entity is "builtin_extdepth";
end trans_in_meta_fifo_builtin_extdepth_8;

architecture STRUCTURE of trans_in_meta_fifo_builtin_extdepth_8 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.trans_in_meta_fifo_builtin_prim_18
     port map (
      EMPTY => EMPTY,
      FULL => FULL,
      RDRSTBUSY => RDRSTBUSY,
      RD_EN => RD_EN,
      WRRSTBUSY => WRRSTBUSY,
      WR_EN => WR_EN,
      din(71 downto 0) => din(71 downto 0),
      dout(71 downto 0) => dout(71 downto 0),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[4].inst_extdi_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
\rst_val_sym.gextw_sym[4].inst_extdi_1\: unisim.vcomponents.LUT1
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
entity trans_in_meta_fifo_builtin_extdepth_9 is
  port (
    \^full\ : out STD_LOGIC;
    rd_clk_0 : out STD_LOGIC;
    \^empty\ : out STD_LOGIC;
    rd_clk_1 : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 71 downto 0 );
    FULL : in STD_LOGIC;
    full_0 : in STD_LOGIC;
    full_1 : in STD_LOGIC;
    full_2 : in STD_LOGIC;
    full_3 : in STD_LOGIC;
    full_4 : in STD_LOGIC;
    full_5 : in STD_LOGIC;
    full_6 : in STD_LOGIC;
    EMPTY : in STD_LOGIC;
    empty_0 : in STD_LOGIC;
    empty_1 : in STD_LOGIC;
    empty_2 : in STD_LOGIC;
    empty_3 : in STD_LOGIC;
    empty_4 : in STD_LOGIC;
    empty_5 : in STD_LOGIC;
    empty_6 : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    WR_EN : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of trans_in_meta_fifo_builtin_extdepth_9 : entity is "builtin_extdepth";
end trans_in_meta_fifo_builtin_extdepth_9;

architecture STRUCTURE of trans_in_meta_fifo_builtin_extdepth_9 is
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
begin
\gonep.inst_prim\: entity work.trans_in_meta_fifo_builtin_prim_17
     port map (
      EMPTY => EMPTY,
      FULL => FULL,
      RDRSTBUSY => RDRSTBUSY,
      RD_EN => RD_EN,
      WRRSTBUSY => WRRSTBUSY,
      WR_EN => WR_EN,
      din(71 downto 0) => din(71 downto 0),
      dout(71 downto 0) => dout(71 downto 0),
      \^empty\ => \^empty\,
      empty_0 => empty_0,
      empty_1 => empty_1,
      empty_2 => empty_2,
      empty_3 => empty_3,
      empty_4 => empty_4,
      empty_5 => empty_5,
      empty_6 => empty_6,
      \^full\ => \^full\,
      full_0 => full_0,
      full_1 => full_1,
      full_2 => full_2,
      full_3 => full_3,
      full_4 => full_4,
      full_5 => full_5,
      full_6 => full_6,
      rd_clk => rd_clk,
      rd_clk_0 => rd_clk_0,
      rd_clk_1 => rd_clk_1,
      srst => srst,
      wr_clk => wr_clk
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
i_1: unisim.vcomponents.LUT1
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
entity trans_in_meta_fifo_builtin_top is
  port (
    dout : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    valid : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 1023 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC
  );
end trans_in_meta_fifo_builtin_top;

architecture STRUCTURE of trans_in_meta_fifo_builtin_top is
  signal p_105_out : STD_LOGIC;
  signal p_106_out : STD_LOGIC;
  signal p_114_out : STD_LOGIC;
  signal p_115_out : STD_LOGIC;
  signal p_123_out : STD_LOGIC;
  signal p_124_out : STD_LOGIC;
  signal p_132_out : STD_LOGIC;
  signal p_133_out : STD_LOGIC;
  signal p_15_out : STD_LOGIC;
  signal p_16_out : STD_LOGIC;
  signal p_33_out : STD_LOGIC;
  signal p_34_out : STD_LOGIC;
  signal p_42_out : STD_LOGIC;
  signal p_43_out : STD_LOGIC;
  signal p_51_out : STD_LOGIC;
  signal p_52_out : STD_LOGIC;
  signal p_69_out : STD_LOGIC;
  signal p_6_out : STD_LOGIC;
  signal p_70_out : STD_LOGIC;
  signal p_78_out : STD_LOGIC;
  signal p_79_out : STD_LOGIC;
  signal p_7_out : STD_LOGIC;
  signal p_87_out : STD_LOGIC;
  signal p_88_out : STD_LOGIC;
  signal rd_rst_busy_INST_0_i_1_n_0 : STD_LOGIC;
  signal rd_rst_busy_INST_0_i_2_n_0 : STD_LOGIC;
  signal rd_tmp : STD_LOGIC;
  signal rrst_busy_i : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal \rst_val_sym.gextw_sym[13].inst_extd_n_0\ : STD_LOGIC;
  signal \rst_val_sym.gextw_sym[13].inst_extd_n_1\ : STD_LOGIC;
  signal \rst_val_sym.gextw_sym[1].inst_extd_n_0\ : STD_LOGIC;
  signal \rst_val_sym.gextw_sym[1].inst_extd_n_2\ : STD_LOGIC;
  signal \rst_val_sym.gextw_sym[5].inst_extd_n_1\ : STD_LOGIC;
  signal \rst_val_sym.gextw_sym[5].inst_extd_n_3\ : STD_LOGIC;
  signal \rst_val_sym.gextw_sym[9].inst_extd_n_1\ : STD_LOGIC;
  signal \rst_val_sym.gextw_sym[9].inst_extd_n_3\ : STD_LOGIC;
  signal wr_rst_busy_INST_0_i_1_n_0 : STD_LOGIC;
  signal wr_rst_busy_INST_0_i_2_n_0 : STD_LOGIC;
  signal wr_tmp : STD_LOGIC;
  signal wrst_busy_i : STD_LOGIC_VECTOR ( 15 downto 1 );
begin
\gv.gv3.VALID_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => rd_tmp,
      Q => valid,
      R => '0'
    );
rd_rst_busy_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => rd_rst_busy_INST_0_i_1_n_0,
      I1 => rd_rst_busy_INST_0_i_2_n_0,
      I2 => rrst_busy_i(1),
      I3 => rrst_busy_i(2),
      I4 => rrst_busy_i(3),
      O => rd_rst_busy
    );
rd_rst_busy_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => rrst_busy_i(14),
      I1 => rrst_busy_i(15),
      I2 => rrst_busy_i(12),
      I3 => rrst_busy_i(13),
      I4 => rrst_busy_i(11),
      I5 => rrst_busy_i(10),
      O => rd_rst_busy_INST_0_i_1_n_0
    );
rd_rst_busy_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => rrst_busy_i(8),
      I1 => rrst_busy_i(9),
      I2 => rrst_busy_i(6),
      I3 => rrst_busy_i(7),
      I4 => rrst_busy_i(5),
      I5 => rrst_busy_i(4),
      O => rd_rst_busy_INST_0_i_2_n_0
    );
\rst_val_sym.gextw_sym[10].inst_extd\: entity work.trans_in_meta_fifo_builtin_extdepth
     port map (
      EMPTY => p_51_out,
      FULL => p_52_out,
      RDRSTBUSY => rrst_busy_i(10),
      RD_EN => rd_tmp,
      WRRSTBUSY => wrst_busy_i(10),
      WR_EN => wr_tmp,
      din(71 downto 0) => din(719 downto 648),
      dout(71 downto 0) => dout(719 downto 648),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[11].inst_extd\: entity work.trans_in_meta_fifo_builtin_extdepth_0
     port map (
      EMPTY => p_42_out,
      FULL => p_43_out,
      RDRSTBUSY => rrst_busy_i(11),
      RD_EN => rd_tmp,
      WRRSTBUSY => wrst_busy_i(11),
      WR_EN => wr_tmp,
      din(71 downto 0) => din(791 downto 720),
      dout(71 downto 0) => dout(791 downto 720),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[12].inst_extd\: entity work.trans_in_meta_fifo_builtin_extdepth_1
     port map (
      EMPTY => p_33_out,
      FULL => p_34_out,
      RDRSTBUSY => rrst_busy_i(12),
      RD_EN => rd_tmp,
      WRRSTBUSY => wrst_busy_i(12),
      WR_EN => wr_tmp,
      din(71 downto 0) => din(863 downto 792),
      dout(71 downto 0) => dout(863 downto 792),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[13].inst_extd\: entity work.trans_in_meta_fifo_builtin_extdepth_2
     port map (
      EMPTY => p_33_out,
      FULL => p_34_out,
      RDRSTBUSY => rrst_busy_i(13),
      RD_EN => rd_tmp,
      WRRSTBUSY => wrst_busy_i(13),
      WR_EN => wr_tmp,
      din(71 downto 0) => din(935 downto 864),
      dout(71 downto 0) => dout(935 downto 864),
      \^full\ => p_7_out,
      full_0 => p_16_out,
      \gv.gv3.VALID_reg\ => p_6_out,
      \gv.gv3.VALID_reg_0\ => p_15_out,
      rd_clk => rd_clk,
      rd_clk_0 => \rst_val_sym.gextw_sym[13].inst_extd_n_0\,
      rd_clk_1 => \rst_val_sym.gextw_sym[13].inst_extd_n_1\,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[14].inst_extd\: entity work.trans_in_meta_fifo_builtin_extdepth_3
     port map (
      EMPTY => p_15_out,
      FULL => p_16_out,
      RDRSTBUSY => rrst_busy_i(14),
      RD_EN => rd_tmp,
      WRRSTBUSY => wrst_busy_i(14),
      WR_EN => wr_tmp,
      din(71 downto 0) => din(1007 downto 936),
      dout(71 downto 0) => dout(1007 downto 936),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[15].inst_extd\: entity work.trans_in_meta_fifo_builtin_extdepth_4
     port map (
      EMPTY => p_6_out,
      FULL => p_7_out,
      RDRSTBUSY => rrst_busy_i(15),
      RD_EN => rd_tmp,
      WRRSTBUSY => wrst_busy_i(15),
      WR_EN => wr_tmp,
      din(15 downto 0) => din(1023 downto 1008),
      dout(15 downto 0) => dout(1023 downto 1008),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[1].inst_extd\: entity work.trans_in_meta_fifo_builtin_extdepth_5
     port map (
      EMPTY => p_132_out,
      FULL => p_133_out,
      RDRSTBUSY => rrst_busy_i(1),
      RD_EN => rd_tmp,
      WRRSTBUSY => wrst_busy_i(1),
      WR_EN => wr_tmp,
      din(71 downto 0) => din(71 downto 0),
      dout(71 downto 0) => dout(71 downto 0),
      \gf36e2_inst.sngfifo36e2_i_2\ => p_115_out,
      \gf36e2_inst.sngfifo36e2_i_2_0\ => p_124_out,
      \gv.gv3.VALID_reg\ => p_114_out,
      \gv.gv3.VALID_reg_0\ => p_123_out,
      rd_clk => rd_clk,
      rd_clk_0 => \rst_val_sym.gextw_sym[1].inst_extd_n_0\,
      rd_clk_1 => \rst_val_sym.gextw_sym[1].inst_extd_n_2\,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[2].inst_extd\: entity work.trans_in_meta_fifo_builtin_extdepth_6
     port map (
      EMPTY => p_123_out,
      FULL => p_124_out,
      RDRSTBUSY => rrst_busy_i(2),
      RD_EN => rd_tmp,
      WRRSTBUSY => wrst_busy_i(2),
      WR_EN => wr_tmp,
      din(71 downto 0) => din(143 downto 72),
      dout(71 downto 0) => dout(143 downto 72),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[3].inst_extd\: entity work.trans_in_meta_fifo_builtin_extdepth_7
     port map (
      EMPTY => p_114_out,
      FULL => p_115_out,
      RDRSTBUSY => rrst_busy_i(3),
      RD_EN => rd_tmp,
      WRRSTBUSY => wrst_busy_i(3),
      WR_EN => wr_tmp,
      din(71 downto 0) => din(215 downto 144),
      dout(71 downto 0) => dout(215 downto 144),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[4].inst_extd\: entity work.trans_in_meta_fifo_builtin_extdepth_8
     port map (
      EMPTY => p_105_out,
      FULL => p_106_out,
      RDRSTBUSY => rrst_busy_i(4),
      RD_EN => rd_tmp,
      WRRSTBUSY => wrst_busy_i(4),
      WR_EN => wr_tmp,
      din(71 downto 0) => din(287 downto 216),
      dout(71 downto 0) => dout(287 downto 216),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[5].inst_extd\: entity work.trans_in_meta_fifo_builtin_extdepth_9
     port map (
      EMPTY => p_132_out,
      FULL => p_133_out,
      RDRSTBUSY => rrst_busy_i(5),
      RD_EN => rd_tmp,
      WRRSTBUSY => wrst_busy_i(5),
      WR_EN => wr_tmp,
      din(71 downto 0) => din(359 downto 288),
      dout(71 downto 0) => dout(359 downto 288),
      \^empty\ => empty,
      empty_0 => p_114_out,
      empty_1 => p_123_out,
      empty_2 => \rst_val_sym.gextw_sym[13].inst_extd_n_1\,
      empty_3 => \rst_val_sym.gextw_sym[9].inst_extd_n_3\,
      empty_4 => p_105_out,
      empty_5 => p_78_out,
      empty_6 => p_87_out,
      \^full\ => full,
      full_0 => p_115_out,
      full_1 => p_124_out,
      full_2 => \rst_val_sym.gextw_sym[13].inst_extd_n_0\,
      full_3 => \rst_val_sym.gextw_sym[9].inst_extd_n_1\,
      full_4 => p_106_out,
      full_5 => p_79_out,
      full_6 => p_88_out,
      rd_clk => rd_clk,
      rd_clk_0 => \rst_val_sym.gextw_sym[5].inst_extd_n_1\,
      rd_clk_1 => \rst_val_sym.gextw_sym[5].inst_extd_n_3\,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[6].inst_extd\: entity work.trans_in_meta_fifo_builtin_extdepth_10
     port map (
      EMPTY => p_87_out,
      FULL => p_88_out,
      RDRSTBUSY => rrst_busy_i(6),
      RD_EN => rd_tmp,
      WRRSTBUSY => wrst_busy_i(6),
      WR_EN => wr_tmp,
      din(71 downto 0) => din(431 downto 360),
      dout(71 downto 0) => dout(431 downto 360),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[7].inst_extd\: entity work.trans_in_meta_fifo_builtin_extdepth_11
     port map (
      EMPTY => p_78_out,
      FULL => p_79_out,
      RDRSTBUSY => rrst_busy_i(7),
      RD_EN => rd_tmp,
      WRRSTBUSY => wrst_busy_i(7),
      WR_EN => wr_tmp,
      din(71 downto 0) => din(503 downto 432),
      dout(71 downto 0) => dout(503 downto 432),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[8].inst_extd\: entity work.trans_in_meta_fifo_builtin_extdepth_12
     port map (
      EMPTY => p_69_out,
      FULL => p_70_out,
      RDRSTBUSY => rrst_busy_i(8),
      RD_EN => rd_tmp,
      WRRSTBUSY => wrst_busy_i(8),
      WR_EN => wr_tmp,
      din(71 downto 0) => din(575 downto 504),
      dout(71 downto 0) => dout(575 downto 504),
      rd_clk => rd_clk,
      srst => srst,
      wr_clk => wr_clk
    );
\rst_val_sym.gextw_sym[9].inst_extd\: entity work.trans_in_meta_fifo_builtin_extdepth_13
     port map (
      EMPTY => p_69_out,
      FULL => p_70_out,
      RDRSTBUSY => rrst_busy_i(9),
      RD_EN => rd_tmp,
      WRRSTBUSY => wrst_busy_i(9),
      WR_EN => wr_tmp,
      din(71 downto 0) => din(647 downto 576),
      dout(71 downto 0) => dout(647 downto 576),
      \dout[639]\ => \rst_val_sym.gextw_sym[13].inst_extd_n_0\,
      \dout[639]_0\ => \rst_val_sym.gextw_sym[1].inst_extd_n_0\,
      \dout[639]_1\ => \rst_val_sym.gextw_sym[5].inst_extd_n_1\,
      \^full\ => p_43_out,
      full_0 => p_52_out,
      \gv.gv3.VALID_reg\ => \rst_val_sym.gextw_sym[13].inst_extd_n_1\,
      \gv.gv3.VALID_reg_0\ => \rst_val_sym.gextw_sym[1].inst_extd_n_2\,
      \gv.gv3.VALID_reg_1\ => \rst_val_sym.gextw_sym[5].inst_extd_n_3\,
      \gv.gv3.VALID_reg_2\ => p_42_out,
      \gv.gv3.VALID_reg_3\ => p_51_out,
      rd_clk => rd_clk,
      rd_clk_0 => \rst_val_sym.gextw_sym[9].inst_extd_n_1\,
      rd_clk_1 => \rst_val_sym.gextw_sym[9].inst_extd_n_3\,
      \^rd_en\ => rd_en,
      srst => srst,
      wr_clk => wr_clk,
      \^wr_en\ => wr_en
    );
wr_rst_busy_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => wr_rst_busy_INST_0_i_1_n_0,
      I1 => wr_rst_busy_INST_0_i_2_n_0,
      I2 => wrst_busy_i(1),
      I3 => wrst_busy_i(2),
      I4 => wrst_busy_i(3),
      O => wr_rst_busy
    );
wr_rst_busy_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => wrst_busy_i(14),
      I1 => wrst_busy_i(15),
      I2 => wrst_busy_i(12),
      I3 => wrst_busy_i(13),
      I4 => wrst_busy_i(11),
      I5 => wrst_busy_i(10),
      O => wr_rst_busy_INST_0_i_1_n_0
    );
wr_rst_busy_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => wrst_busy_i(8),
      I1 => wrst_busy_i(9),
      I2 => wrst_busy_i(6),
      I3 => wrst_busy_i(7),
      I4 => wrst_busy_i(5),
      I5 => wrst_busy_i(4),
      O => wr_rst_busy_INST_0_i_2_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_fifo_generator_v13_2_3_builtin is
  port (
    dout : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    valid : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 1023 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC
  );
end trans_in_meta_fifo_fifo_generator_v13_2_3_builtin;

architecture STRUCTURE of trans_in_meta_fifo_fifo_generator_v13_2_3_builtin is
begin
\v8_fifo.fblk\: entity work.trans_in_meta_fifo_builtin_top
     port map (
      din(1023 downto 0) => din(1023 downto 0),
      dout(1023 downto 0) => dout(1023 downto 0),
      empty => empty,
      full => full,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rd_rst_busy => rd_rst_busy,
      srst => srst,
      valid => valid,
      wr_clk => wr_clk,
      wr_en => wr_en,
      wr_rst_busy => wr_rst_busy
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_fifo_generator_top is
  port (
    dout : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    valid : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 1023 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC
  );
end trans_in_meta_fifo_fifo_generator_top;

architecture STRUCTURE of trans_in_meta_fifo_fifo_generator_top is
begin
\gbi.bi\: entity work.trans_in_meta_fifo_fifo_generator_v13_2_3_builtin
     port map (
      din(1023 downto 0) => din(1023 downto 0),
      dout(1023 downto 0) => dout(1023 downto 0),
      empty => empty,
      full => full,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rd_rst_busy => rd_rst_busy,
      srst => srst,
      valid => valid,
      wr_clk => wr_clk,
      wr_en => wr_en,
      wr_rst_busy => wr_rst_busy
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_fifo_generator_v13_2_3_synth is
  port (
    dout : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    valid : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 1023 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC
  );
end trans_in_meta_fifo_fifo_generator_v13_2_3_synth;

architecture STRUCTURE of trans_in_meta_fifo_fifo_generator_v13_2_3_synth is
begin
\gconvfifo.rf\: entity work.trans_in_meta_fifo_fifo_generator_top
     port map (
      din(1023 downto 0) => din(1023 downto 0),
      dout(1023 downto 0) => dout(1023 downto 0),
      empty => empty,
      full => full,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rd_rst_busy => rd_rst_busy,
      srst => srst,
      valid => valid,
      wr_clk => wr_clk,
      wr_en => wr_en,
      wr_rst_busy => wr_rst_busy
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo_fifo_generator_v13_2_3 is
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
    din : in STD_LOGIC_VECTOR ( 1023 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    prog_empty_thresh : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_empty_thresh_assert : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_empty_thresh_negate : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_full_thresh : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_full_thresh_assert : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_full_thresh_negate : in STD_LOGIC_VECTOR ( 8 downto 0 );
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
    data_count : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rd_data_count : out STD_LOGIC_VECTOR ( 8 downto 0 );
    wr_data_count : out STD_LOGIC_VECTOR ( 8 downto 0 );
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
  attribute C_ADD_NGC_CONSTRAINT of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 8;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 4;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 9;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1024;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1024;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is "virtexuplusHBM";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 6;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 4;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 2;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is "512x72";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is "1kx18";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is "512x72";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is "512x72";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 5;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 6;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 511;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 510;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 9;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 512;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 400;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 9;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_SELECT_XPM : integer;
  attribute C_SELECT_XPM of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 2;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 9;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 512;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1024;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 100;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 9;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of trans_in_meta_fifo_fifo_generator_v13_2_3 : entity is 1;
end trans_in_meta_fifo_fifo_generator_v13_2_3;

architecture STRUCTURE of trans_in_meta_fifo_fifo_generator_v13_2_3 is
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
  wr_ack <= \<const0>\;
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
inst_fifo_gen: entity work.trans_in_meta_fifo_fifo_generator_v13_2_3_synth
     port map (
      din(1023 downto 0) => din(1023 downto 0),
      dout(1023 downto 0) => dout(1023 downto 0),
      empty => empty,
      full => full,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rd_rst_busy => rd_rst_busy,
      srst => srst,
      valid => valid,
      wr_clk => wr_clk,
      wr_en => wr_en,
      wr_rst_busy => wr_rst_busy
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trans_in_meta_fifo is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 1023 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    valid : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of trans_in_meta_fifo : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of trans_in_meta_fifo : entity is "trans_in_fifo,fifo_generator_v13_2_3,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of trans_in_meta_fifo : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of trans_in_meta_fifo : entity is "fifo_generator_v13_2_3,Vivado 2018.3";
end trans_in_meta_fifo;

architecture STRUCTURE of trans_in_meta_fifo is
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
  signal NLW_U0_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
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
  signal NLW_U0_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
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
  attribute C_COMMON_CLOCK of U0 : label is 0;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of U0 : label is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of U0 : label is 9;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of U0 : label is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of U0 : label is 1024;
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
  attribute C_HAS_VALID of U0 : label is 1;
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
  attribute C_IMPLEMENTATION_TYPE_RACH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of U0 : label is 1;
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
  attribute C_PRIM_FIFO_TYPE of U0 : label is "512x72";
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
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of U0 : label is 5;
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
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of U0 : label is 6;
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
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of U0 : label is 511;
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
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of U0 : label is 510;
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
  attribute C_RD_DATA_COUNT_WIDTH of U0 : label is 9;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of U0 : label is 512;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of U0 : label is 400;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of U0 : label is 9;
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
  attribute C_WR_DATA_COUNT_WIDTH of U0 : label is 9;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of U0 : label is 512;
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
  attribute C_WR_FREQ of U0 : label is 100;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of U0 : label is 9;
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
  attribute x_interface_info of empty : signal is "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY";
  attribute x_interface_info of full : signal is "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL";
  attribute x_interface_info of rd_clk : signal is "xilinx.com:signal:clock:1.0 read_clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of rd_clk : signal is "XIL_INTERFACENAME read_clk, FREQ_HZ 500000000, PHASE 0.000, INSERT_VIP 0";
  attribute x_interface_info of rd_en : signal is "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN";
  attribute x_interface_info of wr_clk : signal is "xilinx.com:signal:clock:1.0 write_clk CLK";
  attribute x_interface_parameter of wr_clk : signal is "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  attribute x_interface_info of wr_en : signal is "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN";
  attribute x_interface_info of din : signal is "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA";
  attribute x_interface_info of dout : signal is "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA";
begin
U0: entity work.trans_in_meta_fifo_fifo_generator_v13_2_3
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
      clk => '0',
      data_count(8 downto 0) => NLW_U0_data_count_UNCONNECTED(8 downto 0),
      dbiterr => NLW_U0_dbiterr_UNCONNECTED,
      din(1023 downto 0) => din(1023 downto 0),
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
      prog_empty_thresh(8 downto 0) => B"000000000",
      prog_empty_thresh_assert(8 downto 0) => B"000000000",
      prog_empty_thresh_negate(8 downto 0) => B"000000000",
      prog_full => NLW_U0_prog_full_UNCONNECTED,
      prog_full_thresh(8 downto 0) => B"000000000",
      prog_full_thresh_assert(8 downto 0) => B"000000000",
      prog_full_thresh_negate(8 downto 0) => B"000000000",
      rd_clk => rd_clk,
      rd_data_count(8 downto 0) => NLW_U0_rd_data_count_UNCONNECTED(8 downto 0),
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
      valid => valid,
      wr_ack => NLW_U0_wr_ack_UNCONNECTED,
      wr_clk => wr_clk,
      wr_data_count(8 downto 0) => NLW_U0_wr_data_count_UNCONNECTED(8 downto 0),
      wr_en => wr_en,
      wr_rst => '0',
      wr_rst_busy => wr_rst_busy
    );
end STRUCTURE;
