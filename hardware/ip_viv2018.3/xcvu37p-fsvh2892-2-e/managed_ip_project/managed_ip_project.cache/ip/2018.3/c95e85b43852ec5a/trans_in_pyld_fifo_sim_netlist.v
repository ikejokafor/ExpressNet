// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Thu Jun 17 18:32:26 2021
// Host        : e5-cse-322-17 running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ trans_in_pyld_fifo_sim_netlist.v
// Design      : trans_in_pyld_fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu37p-fsvh2892-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "trans_in_pyld_fifo,fifo_generator_v13_2_3,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_3,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (srst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  input srst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 400000000, PHASE 0.000, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [1023:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [1023:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [1023:0]din;
  wire [1023:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [8:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [8:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [8:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "9" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "1024" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "1024" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "virtexuplusHBM" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "1" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "4" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "2" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "9" *) 
  (* C_RD_DEPTH = "512" *) 
  (* C_RD_FREQ = "400" *) 
  (* C_RD_PNTR_WIDTH = "9" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "1" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "9" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "100" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_3 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[8:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[8:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(srst),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[8:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [71:0]din;
  wire [71:0]dout;
  wire rd_clk;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_27 \gonep.inst_prim 
       (.EMPTY(EMPTY),
        .FULL(FULL),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_EN(RD_EN),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_EN(WR_EN),
        .din(din),
        .dout(dout),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[10].inst_extdi_0 
       (.I0(1'b1),
        .O(srst_qr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[10].inst_extdi_1 
       (.I0(1'b1),
        .O(srst_qr[0]));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_0
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [71:0]din;
  wire [71:0]dout;
  wire rd_clk;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_26 \gonep.inst_prim 
       (.EMPTY(EMPTY),
        .FULL(FULL),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_EN(RD_EN),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_EN(WR_EN),
        .din(din),
        .dout(dout),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[11].inst_extdi_0 
       (.I0(1'b1),
        .O(srst_qr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[11].inst_extdi_1 
       (.I0(1'b1),
        .O(srst_qr[0]));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_1
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [71:0]din;
  wire [71:0]dout;
  wire rd_clk;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_25 \gonep.inst_prim 
       (.EMPTY(EMPTY),
        .FULL(FULL),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_EN(RD_EN),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_EN(WR_EN),
        .din(din),
        .dout(dout),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[12].inst_extdi_0 
       (.I0(1'b1),
        .O(srst_qr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[12].inst_extdi_1 
       (.I0(1'b1),
        .O(srst_qr[0]));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_10
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [71:0]din;
  wire [71:0]dout;
  wire rd_clk;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_16 \gonep.inst_prim 
       (.EMPTY(EMPTY),
        .FULL(FULL),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_EN(RD_EN),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_EN(WR_EN),
        .din(din),
        .dout(dout),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[6].inst_extdi_0 
       (.I0(1'b1),
        .O(srst_qr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[6].inst_extdi_1 
       (.I0(1'b1),
        .O(srst_qr[0]));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_11
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [71:0]din;
  wire [71:0]dout;
  wire rd_clk;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_15 \gonep.inst_prim 
       (.EMPTY(EMPTY),
        .FULL(FULL),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_EN(RD_EN),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_EN(WR_EN),
        .din(din),
        .dout(dout),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[7].inst_extdi_0 
       (.I0(1'b1),
        .O(srst_qr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[7].inst_extdi_1 
       (.I0(1'b1),
        .O(srst_qr[0]));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_12
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [71:0]din;
  wire [71:0]dout;
  wire rd_clk;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_14 \gonep.inst_prim 
       (.EMPTY(EMPTY),
        .FULL(FULL),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_EN(RD_EN),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_EN(WR_EN),
        .din(din),
        .dout(dout),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[8].inst_extdi_0 
       (.I0(1'b1),
        .O(srst_qr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[8].inst_extdi_1 
       (.I0(1'b1),
        .O(srst_qr[0]));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_13
   (WR_EN,
    rd_clk_0,
    RD_EN,
    rd_clk_1,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    wr_en,
    \dout[639] ,
    \dout[639]_0 ,
    \dout[639]_1 ,
    FULL,
    full,
    full_0,
    rd_en,
    \dout[639]_2 ,
    \dout[639]_3 ,
    \dout[639]_4 ,
    EMPTY,
    empty,
    empty_0,
    rd_clk,
    srst,
    wr_clk,
    din);
  output WR_EN;
  output rd_clk_0;
  output RD_EN;
  output rd_clk_1;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input wr_en;
  input \dout[639] ;
  input \dout[639]_0 ;
  input \dout[639]_1 ;
  input FULL;
  input full;
  input full_0;
  input rd_en;
  input \dout[639]_2 ;
  input \dout[639]_3 ;
  input \dout[639]_4 ;
  input EMPTY;
  input empty;
  input empty_0;
  input rd_clk;
  input srst;
  input wr_clk;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [71:0]din;
  wire [71:0]dout;
  wire \dout[639] ;
  wire \dout[639]_0 ;
  wire \dout[639]_1 ;
  wire \dout[639]_2 ;
  wire \dout[639]_3 ;
  wire \dout[639]_4 ;
  wire empty;
  wire empty_0;
  wire full;
  wire full_0;
  wire rd_clk;
  wire rd_clk_0;
  wire rd_clk_1;
  wire rd_en;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;
  wire wr_en;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim \gonep.inst_prim 
       (.EMPTY(EMPTY),
        .FULL(FULL),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_EN(RD_EN),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_EN(WR_EN),
        .din(din),
        .dout(dout),
        .\dout[639] (\dout[639] ),
        .\dout[639]_0 (\dout[639]_0 ),
        .\dout[639]_1 (\dout[639]_1 ),
        .\dout[639]_2 (\dout[639]_2 ),
        .\dout[639]_3 (\dout[639]_3 ),
        .\dout[639]_4 (\dout[639]_4 ),
        .empty(empty),
        .empty_0(empty_0),
        .full(full),
        .full_0(full_0),
        .rd_clk(rd_clk),
        .rd_clk_0(rd_clk_0),
        .rd_clk_1(rd_clk_1),
        .rd_en(rd_en),
        .srst(srst),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b1),
        .O(srst_qr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b1),
        .O(srst_qr[0]));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_2
   (rd_clk_0,
    rd_clk_1,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    FULL,
    full,
    full_0,
    EMPTY,
    empty,
    empty_0,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output rd_clk_0;
  output rd_clk_1;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input FULL;
  input full;
  input full_0;
  input EMPTY;
  input empty;
  input empty_0;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [71:0]din;
  wire [71:0]dout;
  wire empty;
  wire empty_0;
  wire full;
  wire full_0;
  wire rd_clk;
  wire rd_clk_0;
  wire rd_clk_1;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_24 \gonep.inst_prim 
       (.EMPTY(EMPTY),
        .FULL(FULL),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_EN(RD_EN),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_EN(WR_EN),
        .din(din),
        .dout(dout),
        .empty(empty),
        .empty_0(empty_0),
        .full(full),
        .full_0(full_0),
        .rd_clk(rd_clk),
        .rd_clk_0(rd_clk_0),
        .rd_clk_1(rd_clk_1),
        .srst(srst),
        .wr_clk(wr_clk));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b1),
        .O(srst_qr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b1),
        .O(srst_qr[0]));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_3
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [71:0]din;
  wire [71:0]dout;
  wire rd_clk;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_23 \gonep.inst_prim 
       (.EMPTY(EMPTY),
        .FULL(FULL),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_EN(RD_EN),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_EN(WR_EN),
        .din(din),
        .dout(dout),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[14].inst_extdi_0 
       (.I0(1'b1),
        .O(srst_qr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[14].inst_extdi_1 
       (.I0(1'b1),
        .O(srst_qr[0]));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_4
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [15:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [15:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [15:0]din;
  wire [15:0]dout;
  wire rd_clk;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_22 \gonep.inst_prim 
       (.EMPTY(EMPTY),
        .FULL(FULL),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_EN(RD_EN),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_EN(WR_EN),
        .din(din),
        .dout(dout),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[15].inst_extdi_0 
       (.I0(1'b1),
        .O(srst_qr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[15].inst_extdi_1 
       (.I0(1'b1),
        .O(srst_qr[0]));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_5
   (rd_clk_0,
    FULL,
    rd_clk_1,
    EMPTY,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    \gf36e2_inst.sngfifo36e2_i_2 ,
    \gf36e2_inst.sngfifo36e2_i_2_0 ,
    \gf36e2_inst.sngfifo36e2_i_1 ,
    \gf36e2_inst.sngfifo36e2_i_1_0 ,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output rd_clk_0;
  output FULL;
  output rd_clk_1;
  output EMPTY;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input \gf36e2_inst.sngfifo36e2_i_2 ;
  input \gf36e2_inst.sngfifo36e2_i_2_0 ;
  input \gf36e2_inst.sngfifo36e2_i_1 ;
  input \gf36e2_inst.sngfifo36e2_i_1_0 ;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [71:0]din;
  wire [71:0]dout;
  wire \gf36e2_inst.sngfifo36e2_i_1 ;
  wire \gf36e2_inst.sngfifo36e2_i_1_0 ;
  wire \gf36e2_inst.sngfifo36e2_i_2 ;
  wire \gf36e2_inst.sngfifo36e2_i_2_0 ;
  wire rd_clk;
  wire rd_clk_0;
  wire rd_clk_1;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_21 \gonep.inst_prim 
       (.EMPTY(EMPTY),
        .FULL(FULL),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_EN(RD_EN),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_EN(WR_EN),
        .din(din),
        .dout(dout),
        .\gf36e2_inst.sngfifo36e2_i_1 (\gf36e2_inst.sngfifo36e2_i_1 ),
        .\gf36e2_inst.sngfifo36e2_i_1_0 (\gf36e2_inst.sngfifo36e2_i_1_0 ),
        .\gf36e2_inst.sngfifo36e2_i_2 (\gf36e2_inst.sngfifo36e2_i_2 ),
        .\gf36e2_inst.sngfifo36e2_i_2_0 (\gf36e2_inst.sngfifo36e2_i_2_0 ),
        .rd_clk(rd_clk),
        .rd_clk_0(rd_clk_0),
        .rd_clk_1(rd_clk_1),
        .srst(srst),
        .wr_clk(wr_clk));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b1),
        .O(srst_qr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b1),
        .O(srst_qr[0]));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_6
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [71:0]din;
  wire [71:0]dout;
  wire rd_clk;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_20 \gonep.inst_prim 
       (.EMPTY(EMPTY),
        .FULL(FULL),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_EN(RD_EN),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_EN(WR_EN),
        .din(din),
        .dout(dout),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[2].inst_extdi_0 
       (.I0(1'b1),
        .O(srst_qr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[2].inst_extdi_1 
       (.I0(1'b1),
        .O(srst_qr[0]));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_7
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [71:0]din;
  wire [71:0]dout;
  wire rd_clk;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_19 \gonep.inst_prim 
       (.EMPTY(EMPTY),
        .FULL(FULL),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_EN(RD_EN),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_EN(WR_EN),
        .din(din),
        .dout(dout),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[3].inst_extdi_0 
       (.I0(1'b1),
        .O(srst_qr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[3].inst_extdi_1 
       (.I0(1'b1),
        .O(srst_qr[0]));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_8
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [71:0]din;
  wire [71:0]dout;
  wire rd_clk;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_18 \gonep.inst_prim 
       (.EMPTY(EMPTY),
        .FULL(FULL),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_EN(RD_EN),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_EN(WR_EN),
        .din(din),
        .dout(dout),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[4].inst_extdi_0 
       (.I0(1'b1),
        .O(srst_qr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    \rst_val_sym.gextw_sym[4].inst_extdi_1 
       (.I0(1'b1),
        .O(srst_qr[0]));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_9
   (full,
    rd_clk_0,
    empty,
    rd_clk_1,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    FULL,
    full_0,
    full_1,
    full_2,
    full_3,
    full_4,
    full_5,
    full_6,
    EMPTY,
    empty_0,
    empty_1,
    empty_2,
    empty_3,
    empty_4,
    empty_5,
    empty_6,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output full;
  output rd_clk_0;
  output empty;
  output rd_clk_1;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input FULL;
  input full_0;
  input full_1;
  input full_2;
  input full_3;
  input full_4;
  input full_5;
  input full_6;
  input EMPTY;
  input empty_0;
  input empty_1;
  input empty_2;
  input empty_3;
  input empty_4;
  input empty_5;
  input empty_6;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [71:0]din;
  wire [71:0]dout;
  wire empty;
  wire empty_0;
  wire empty_1;
  wire empty_2;
  wire empty_3;
  wire empty_4;
  wire empty_5;
  wire empty_6;
  wire full;
  wire full_0;
  wire full_1;
  wire full_2;
  wire full_3;
  wire full_4;
  wire full_5;
  wire full_6;
  wire rd_clk;
  wire rd_clk_0;
  wire rd_clk_1;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_17 \gonep.inst_prim 
       (.EMPTY(EMPTY),
        .FULL(FULL),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_EN(RD_EN),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_EN(WR_EN),
        .din(din),
        .dout(dout),
        .empty(empty),
        .empty_0(empty_0),
        .empty_1(empty_1),
        .empty_2(empty_2),
        .empty_3(empty_3),
        .empty_4(empty_4),
        .empty_5(empty_5),
        .empty_6(empty_6),
        .full(full),
        .full_0(full_0),
        .full_1(full_1),
        .full_2(full_2),
        .full_3(full_3),
        .full_4(full_4),
        .full_5(full_5),
        .full_6(full_6),
        .rd_clk(rd_clk),
        .rd_clk_0(rd_clk_0),
        .rd_clk_1(rd_clk_1),
        .srst(srst),
        .wr_clk(wr_clk));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b1),
        .O(srst_qr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b1),
        .O(srst_qr[0]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim
   (RDRSTBUSY,
    WRRSTBUSY,
    dout,
    RD_EN,
    WR_EN,
    rd_clk_0,
    rd_clk_1,
    rd_clk,
    srst,
    wr_clk,
    din,
    wr_en,
    \dout[639] ,
    \dout[639]_0 ,
    \dout[639]_1 ,
    FULL,
    full,
    full_0,
    rd_en,
    \dout[639]_2 ,
    \dout[639]_3 ,
    \dout[639]_4 ,
    EMPTY,
    empty,
    empty_0);
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  output RD_EN;
  output WR_EN;
  output rd_clk_0;
  output rd_clk_1;
  input rd_clk;
  input srst;
  input wr_clk;
  input [71:0]din;
  input wr_en;
  input \dout[639] ;
  input \dout[639]_0 ;
  input \dout[639]_1 ;
  input FULL;
  input full;
  input full_0;
  input rd_en;
  input \dout[639]_2 ;
  input \dout[639]_3 ;
  input \dout[639]_4 ;
  input EMPTY;
  input empty;
  input empty_0;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [9:9]dbiterr_col;
  wire [71:0]din;
  wire [71:0]dout;
  wire \dout[639] ;
  wire \dout[639]_0 ;
  wire \dout[639]_1 ;
  wire \dout[639]_2 ;
  wire \dout[639]_3 ;
  wire \dout[639]_4 ;
  wire empty;
  wire empty_0;
  wire full;
  wire full_0;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_168 ;
  wire \gf36e2_inst.sngfifo36e2_n_169 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_170 ;
  wire \gf36e2_inst.sngfifo36e2_n_171 ;
  wire \gf36e2_inst.sngfifo36e2_n_172 ;
  wire \gf36e2_inst.sngfifo36e2_n_173 ;
  wire \gf36e2_inst.sngfifo36e2_n_174 ;
  wire \gf36e2_inst.sngfifo36e2_n_175 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_40 ;
  wire \gf36e2_inst.sngfifo36e2_n_41 ;
  wire \gf36e2_inst.sngfifo36e2_n_42 ;
  wire \gf36e2_inst.sngfifo36e2_n_43 ;
  wire \gf36e2_inst.sngfifo36e2_n_44 ;
  wire \gf36e2_inst.sngfifo36e2_n_45 ;
  wire \gf36e2_inst.sngfifo36e2_n_46 ;
  wire \gf36e2_inst.sngfifo36e2_n_47 ;
  wire \gf36e2_inst.sngfifo36e2_n_48 ;
  wire \gf36e2_inst.sngfifo36e2_n_49 ;
  wire \gf36e2_inst.sngfifo36e2_n_50 ;
  wire \gf36e2_inst.sngfifo36e2_n_51 ;
  wire \gf36e2_inst.sngfifo36e2_n_52 ;
  wire \gf36e2_inst.sngfifo36e2_n_53 ;
  wire \gf36e2_inst.sngfifo36e2_n_54 ;
  wire \gf36e2_inst.sngfifo36e2_n_55 ;
  wire \gf36e2_inst.sngfifo36e2_n_56 ;
  wire \gf36e2_inst.sngfifo36e2_n_57 ;
  wire \gf36e2_inst.sngfifo36e2_n_58 ;
  wire \gf36e2_inst.sngfifo36e2_n_59 ;
  wire \gf36e2_inst.sngfifo36e2_n_60 ;
  wire \gf36e2_inst.sngfifo36e2_n_61 ;
  wire \gf36e2_inst.sngfifo36e2_n_62 ;
  wire \gf36e2_inst.sngfifo36e2_n_63 ;
  wire \gf36e2_inst.sngfifo36e2_n_64 ;
  wire \gf36e2_inst.sngfifo36e2_n_65 ;
  wire \gf36e2_inst.sngfifo36e2_n_66 ;
  wire \gf36e2_inst.sngfifo36e2_n_67 ;
  wire \gf36e2_inst.sngfifo36e2_n_68 ;
  wire \gf36e2_inst.sngfifo36e2_n_69 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_70 ;
  wire \gf36e2_inst.sngfifo36e2_n_71 ;
  wire \gf36e2_inst.sngfifo36e2_n_72 ;
  wire \gf36e2_inst.sngfifo36e2_n_73 ;
  wire \gf36e2_inst.sngfifo36e2_n_74 ;
  wire \gf36e2_inst.sngfifo36e2_n_75 ;
  wire \gf36e2_inst.sngfifo36e2_n_76 ;
  wire \gf36e2_inst.sngfifo36e2_n_77 ;
  wire \gf36e2_inst.sngfifo36e2_n_78 ;
  wire \gf36e2_inst.sngfifo36e2_n_79 ;
  wire \gf36e2_inst.sngfifo36e2_n_80 ;
  wire \gf36e2_inst.sngfifo36e2_n_81 ;
  wire \gf36e2_inst.sngfifo36e2_n_82 ;
  wire \gf36e2_inst.sngfifo36e2_n_83 ;
  wire \gf36e2_inst.sngfifo36e2_n_84 ;
  wire \gf36e2_inst.sngfifo36e2_n_85 ;
  wire \gf36e2_inst.sngfifo36e2_n_86 ;
  wire \gf36e2_inst.sngfifo36e2_n_87 ;
  wire \gf36e2_inst.sngfifo36e2_n_88 ;
  wire \gf36e2_inst.sngfifo36e2_n_89 ;
  wire \gf36e2_inst.sngfifo36e2_n_90 ;
  wire \gf36e2_inst.sngfifo36e2_n_91 ;
  wire \gf36e2_inst.sngfifo36e2_n_92 ;
  wire \gf36e2_inst.sngfifo36e2_n_93 ;
  wire \gf36e2_inst.sngfifo36e2_n_94 ;
  wire \gf36e2_inst.sngfifo36e2_n_95 ;
  wire \gf36e2_inst.sngfifo36e2_n_96 ;
  wire \gf36e2_inst.sngfifo36e2_n_97 ;
  wire \gf36e2_inst.sngfifo36e2_n_98 ;
  wire \gf36e2_inst.sngfifo36e2_n_99 ;
  wire p_58_out;
  wire p_59_out;
  wire p_60_out;
  wire p_61_out;
  wire rd_clk;
  wire rd_clk_0;
  wire rd_clk_1;
  wire rd_en;
  wire [9:9]sbiterr_col;
  wire srst;
  wire wr_clk;
  wire wr_en;

  LUT4 #(
    .INIT(16'hFFFE)) 
    empty_INST_0_i_3
       (.I0(p_60_out),
        .I1(EMPTY),
        .I2(empty),
        .I3(empty_0),
        .O(rd_clk_1));
  LUT4 #(
    .INIT(16'hFFFE)) 
    full_INST_0_i_3
       (.I0(p_61_out),
        .I1(FULL),
        .I2(full),
        .I3(full_0),
        .O(rd_clk_0));
  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("FALSE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(511),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(72),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(72)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\gf36e2_inst.sngfifo36e2_n_40 ,\gf36e2_inst.sngfifo36e2_n_41 ,\gf36e2_inst.sngfifo36e2_n_42 ,\gf36e2_inst.sngfifo36e2_n_43 ,\gf36e2_inst.sngfifo36e2_n_44 ,\gf36e2_inst.sngfifo36e2_n_45 ,\gf36e2_inst.sngfifo36e2_n_46 ,\gf36e2_inst.sngfifo36e2_n_47 ,\gf36e2_inst.sngfifo36e2_n_48 ,\gf36e2_inst.sngfifo36e2_n_49 ,\gf36e2_inst.sngfifo36e2_n_50 ,\gf36e2_inst.sngfifo36e2_n_51 ,\gf36e2_inst.sngfifo36e2_n_52 ,\gf36e2_inst.sngfifo36e2_n_53 ,\gf36e2_inst.sngfifo36e2_n_54 ,\gf36e2_inst.sngfifo36e2_n_55 ,\gf36e2_inst.sngfifo36e2_n_56 ,\gf36e2_inst.sngfifo36e2_n_57 ,\gf36e2_inst.sngfifo36e2_n_58 ,\gf36e2_inst.sngfifo36e2_n_59 ,\gf36e2_inst.sngfifo36e2_n_60 ,\gf36e2_inst.sngfifo36e2_n_61 ,\gf36e2_inst.sngfifo36e2_n_62 ,\gf36e2_inst.sngfifo36e2_n_63 ,\gf36e2_inst.sngfifo36e2_n_64 ,\gf36e2_inst.sngfifo36e2_n_65 ,\gf36e2_inst.sngfifo36e2_n_66 ,\gf36e2_inst.sngfifo36e2_n_67 ,\gf36e2_inst.sngfifo36e2_n_68 ,\gf36e2_inst.sngfifo36e2_n_69 ,\gf36e2_inst.sngfifo36e2_n_70 ,\gf36e2_inst.sngfifo36e2_n_71 ,\gf36e2_inst.sngfifo36e2_n_72 ,\gf36e2_inst.sngfifo36e2_n_73 ,\gf36e2_inst.sngfifo36e2_n_74 ,\gf36e2_inst.sngfifo36e2_n_75 ,\gf36e2_inst.sngfifo36e2_n_76 ,\gf36e2_inst.sngfifo36e2_n_77 ,\gf36e2_inst.sngfifo36e2_n_78 ,\gf36e2_inst.sngfifo36e2_n_79 ,\gf36e2_inst.sngfifo36e2_n_80 ,\gf36e2_inst.sngfifo36e2_n_81 ,\gf36e2_inst.sngfifo36e2_n_82 ,\gf36e2_inst.sngfifo36e2_n_83 ,\gf36e2_inst.sngfifo36e2_n_84 ,\gf36e2_inst.sngfifo36e2_n_85 ,\gf36e2_inst.sngfifo36e2_n_86 ,\gf36e2_inst.sngfifo36e2_n_87 ,\gf36e2_inst.sngfifo36e2_n_88 ,\gf36e2_inst.sngfifo36e2_n_89 ,\gf36e2_inst.sngfifo36e2_n_90 ,\gf36e2_inst.sngfifo36e2_n_91 ,\gf36e2_inst.sngfifo36e2_n_92 ,\gf36e2_inst.sngfifo36e2_n_93 ,\gf36e2_inst.sngfifo36e2_n_94 ,\gf36e2_inst.sngfifo36e2_n_95 ,\gf36e2_inst.sngfifo36e2_n_96 ,\gf36e2_inst.sngfifo36e2_n_97 ,\gf36e2_inst.sngfifo36e2_n_98 ,\gf36e2_inst.sngfifo36e2_n_99 ,\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP({\gf36e2_inst.sngfifo36e2_n_168 ,\gf36e2_inst.sngfifo36e2_n_169 ,\gf36e2_inst.sngfifo36e2_n_170 ,\gf36e2_inst.sngfifo36e2_n_171 ,\gf36e2_inst.sngfifo36e2_n_172 ,\gf36e2_inst.sngfifo36e2_n_173 ,\gf36e2_inst.sngfifo36e2_n_174 ,\gf36e2_inst.sngfifo36e2_n_175 }),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(dbiterr_col),
        .DIN(din[63:0]),
        .DINP(din[71:64]),
        .DOUT(dout[63:0]),
        .DOUTP(dout[71:64]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_60_out),
        .FULL(p_61_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(p_58_out),
        .PROGFULL(p_59_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(RD_EN),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(RDRSTBUSY),
        .REGCE(RD_EN),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(WR_EN),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(WRRSTBUSY));
  LUT5 #(
    .INIT(32'h00000002)) 
    \gf36e2_inst.sngfifo36e2_i_1 
       (.I0(rd_en),
        .I1(rd_clk_1),
        .I2(\dout[639]_2 ),
        .I3(\dout[639]_3 ),
        .I4(\dout[639]_4 ),
        .O(RD_EN));
  LUT5 #(
    .INIT(32'h00000002)) 
    \gf36e2_inst.sngfifo36e2_i_2 
       (.I0(wr_en),
        .I1(rd_clk_0),
        .I2(\dout[639] ),
        .I3(\dout[639]_0 ),
        .I4(\dout[639]_1 ),
        .O(WR_EN));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_14
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [8:8]dbiterr_col;
  wire [71:0]din;
  wire [71:0]dout;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_168 ;
  wire \gf36e2_inst.sngfifo36e2_n_169 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_170 ;
  wire \gf36e2_inst.sngfifo36e2_n_171 ;
  wire \gf36e2_inst.sngfifo36e2_n_172 ;
  wire \gf36e2_inst.sngfifo36e2_n_173 ;
  wire \gf36e2_inst.sngfifo36e2_n_174 ;
  wire \gf36e2_inst.sngfifo36e2_n_175 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_40 ;
  wire \gf36e2_inst.sngfifo36e2_n_41 ;
  wire \gf36e2_inst.sngfifo36e2_n_42 ;
  wire \gf36e2_inst.sngfifo36e2_n_43 ;
  wire \gf36e2_inst.sngfifo36e2_n_44 ;
  wire \gf36e2_inst.sngfifo36e2_n_45 ;
  wire \gf36e2_inst.sngfifo36e2_n_46 ;
  wire \gf36e2_inst.sngfifo36e2_n_47 ;
  wire \gf36e2_inst.sngfifo36e2_n_48 ;
  wire \gf36e2_inst.sngfifo36e2_n_49 ;
  wire \gf36e2_inst.sngfifo36e2_n_50 ;
  wire \gf36e2_inst.sngfifo36e2_n_51 ;
  wire \gf36e2_inst.sngfifo36e2_n_52 ;
  wire \gf36e2_inst.sngfifo36e2_n_53 ;
  wire \gf36e2_inst.sngfifo36e2_n_54 ;
  wire \gf36e2_inst.sngfifo36e2_n_55 ;
  wire \gf36e2_inst.sngfifo36e2_n_56 ;
  wire \gf36e2_inst.sngfifo36e2_n_57 ;
  wire \gf36e2_inst.sngfifo36e2_n_58 ;
  wire \gf36e2_inst.sngfifo36e2_n_59 ;
  wire \gf36e2_inst.sngfifo36e2_n_60 ;
  wire \gf36e2_inst.sngfifo36e2_n_61 ;
  wire \gf36e2_inst.sngfifo36e2_n_62 ;
  wire \gf36e2_inst.sngfifo36e2_n_63 ;
  wire \gf36e2_inst.sngfifo36e2_n_64 ;
  wire \gf36e2_inst.sngfifo36e2_n_65 ;
  wire \gf36e2_inst.sngfifo36e2_n_66 ;
  wire \gf36e2_inst.sngfifo36e2_n_67 ;
  wire \gf36e2_inst.sngfifo36e2_n_68 ;
  wire \gf36e2_inst.sngfifo36e2_n_69 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_70 ;
  wire \gf36e2_inst.sngfifo36e2_n_71 ;
  wire \gf36e2_inst.sngfifo36e2_n_72 ;
  wire \gf36e2_inst.sngfifo36e2_n_73 ;
  wire \gf36e2_inst.sngfifo36e2_n_74 ;
  wire \gf36e2_inst.sngfifo36e2_n_75 ;
  wire \gf36e2_inst.sngfifo36e2_n_76 ;
  wire \gf36e2_inst.sngfifo36e2_n_77 ;
  wire \gf36e2_inst.sngfifo36e2_n_78 ;
  wire \gf36e2_inst.sngfifo36e2_n_79 ;
  wire \gf36e2_inst.sngfifo36e2_n_80 ;
  wire \gf36e2_inst.sngfifo36e2_n_81 ;
  wire \gf36e2_inst.sngfifo36e2_n_82 ;
  wire \gf36e2_inst.sngfifo36e2_n_83 ;
  wire \gf36e2_inst.sngfifo36e2_n_84 ;
  wire \gf36e2_inst.sngfifo36e2_n_85 ;
  wire \gf36e2_inst.sngfifo36e2_n_86 ;
  wire \gf36e2_inst.sngfifo36e2_n_87 ;
  wire \gf36e2_inst.sngfifo36e2_n_88 ;
  wire \gf36e2_inst.sngfifo36e2_n_89 ;
  wire \gf36e2_inst.sngfifo36e2_n_90 ;
  wire \gf36e2_inst.sngfifo36e2_n_91 ;
  wire \gf36e2_inst.sngfifo36e2_n_92 ;
  wire \gf36e2_inst.sngfifo36e2_n_93 ;
  wire \gf36e2_inst.sngfifo36e2_n_94 ;
  wire \gf36e2_inst.sngfifo36e2_n_95 ;
  wire \gf36e2_inst.sngfifo36e2_n_96 ;
  wire \gf36e2_inst.sngfifo36e2_n_97 ;
  wire \gf36e2_inst.sngfifo36e2_n_98 ;
  wire \gf36e2_inst.sngfifo36e2_n_99 ;
  wire p_67_out;
  wire p_68_out;
  wire rd_clk;
  wire [8:8]sbiterr_col;
  wire srst;
  wire wr_clk;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("FALSE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(511),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(72),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(72)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\gf36e2_inst.sngfifo36e2_n_40 ,\gf36e2_inst.sngfifo36e2_n_41 ,\gf36e2_inst.sngfifo36e2_n_42 ,\gf36e2_inst.sngfifo36e2_n_43 ,\gf36e2_inst.sngfifo36e2_n_44 ,\gf36e2_inst.sngfifo36e2_n_45 ,\gf36e2_inst.sngfifo36e2_n_46 ,\gf36e2_inst.sngfifo36e2_n_47 ,\gf36e2_inst.sngfifo36e2_n_48 ,\gf36e2_inst.sngfifo36e2_n_49 ,\gf36e2_inst.sngfifo36e2_n_50 ,\gf36e2_inst.sngfifo36e2_n_51 ,\gf36e2_inst.sngfifo36e2_n_52 ,\gf36e2_inst.sngfifo36e2_n_53 ,\gf36e2_inst.sngfifo36e2_n_54 ,\gf36e2_inst.sngfifo36e2_n_55 ,\gf36e2_inst.sngfifo36e2_n_56 ,\gf36e2_inst.sngfifo36e2_n_57 ,\gf36e2_inst.sngfifo36e2_n_58 ,\gf36e2_inst.sngfifo36e2_n_59 ,\gf36e2_inst.sngfifo36e2_n_60 ,\gf36e2_inst.sngfifo36e2_n_61 ,\gf36e2_inst.sngfifo36e2_n_62 ,\gf36e2_inst.sngfifo36e2_n_63 ,\gf36e2_inst.sngfifo36e2_n_64 ,\gf36e2_inst.sngfifo36e2_n_65 ,\gf36e2_inst.sngfifo36e2_n_66 ,\gf36e2_inst.sngfifo36e2_n_67 ,\gf36e2_inst.sngfifo36e2_n_68 ,\gf36e2_inst.sngfifo36e2_n_69 ,\gf36e2_inst.sngfifo36e2_n_70 ,\gf36e2_inst.sngfifo36e2_n_71 ,\gf36e2_inst.sngfifo36e2_n_72 ,\gf36e2_inst.sngfifo36e2_n_73 ,\gf36e2_inst.sngfifo36e2_n_74 ,\gf36e2_inst.sngfifo36e2_n_75 ,\gf36e2_inst.sngfifo36e2_n_76 ,\gf36e2_inst.sngfifo36e2_n_77 ,\gf36e2_inst.sngfifo36e2_n_78 ,\gf36e2_inst.sngfifo36e2_n_79 ,\gf36e2_inst.sngfifo36e2_n_80 ,\gf36e2_inst.sngfifo36e2_n_81 ,\gf36e2_inst.sngfifo36e2_n_82 ,\gf36e2_inst.sngfifo36e2_n_83 ,\gf36e2_inst.sngfifo36e2_n_84 ,\gf36e2_inst.sngfifo36e2_n_85 ,\gf36e2_inst.sngfifo36e2_n_86 ,\gf36e2_inst.sngfifo36e2_n_87 ,\gf36e2_inst.sngfifo36e2_n_88 ,\gf36e2_inst.sngfifo36e2_n_89 ,\gf36e2_inst.sngfifo36e2_n_90 ,\gf36e2_inst.sngfifo36e2_n_91 ,\gf36e2_inst.sngfifo36e2_n_92 ,\gf36e2_inst.sngfifo36e2_n_93 ,\gf36e2_inst.sngfifo36e2_n_94 ,\gf36e2_inst.sngfifo36e2_n_95 ,\gf36e2_inst.sngfifo36e2_n_96 ,\gf36e2_inst.sngfifo36e2_n_97 ,\gf36e2_inst.sngfifo36e2_n_98 ,\gf36e2_inst.sngfifo36e2_n_99 ,\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP({\gf36e2_inst.sngfifo36e2_n_168 ,\gf36e2_inst.sngfifo36e2_n_169 ,\gf36e2_inst.sngfifo36e2_n_170 ,\gf36e2_inst.sngfifo36e2_n_171 ,\gf36e2_inst.sngfifo36e2_n_172 ,\gf36e2_inst.sngfifo36e2_n_173 ,\gf36e2_inst.sngfifo36e2_n_174 ,\gf36e2_inst.sngfifo36e2_n_175 }),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(dbiterr_col),
        .DIN(din[63:0]),
        .DINP(din[71:64]),
        .DOUT(dout[63:0]),
        .DOUTP(dout[71:64]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(p_67_out),
        .PROGFULL(p_68_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(RD_EN),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(RDRSTBUSY),
        .REGCE(RD_EN),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(WR_EN),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(WRRSTBUSY));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_15
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [7:7]dbiterr_col;
  wire [71:0]din;
  wire [71:0]dout;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_168 ;
  wire \gf36e2_inst.sngfifo36e2_n_169 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_170 ;
  wire \gf36e2_inst.sngfifo36e2_n_171 ;
  wire \gf36e2_inst.sngfifo36e2_n_172 ;
  wire \gf36e2_inst.sngfifo36e2_n_173 ;
  wire \gf36e2_inst.sngfifo36e2_n_174 ;
  wire \gf36e2_inst.sngfifo36e2_n_175 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_40 ;
  wire \gf36e2_inst.sngfifo36e2_n_41 ;
  wire \gf36e2_inst.sngfifo36e2_n_42 ;
  wire \gf36e2_inst.sngfifo36e2_n_43 ;
  wire \gf36e2_inst.sngfifo36e2_n_44 ;
  wire \gf36e2_inst.sngfifo36e2_n_45 ;
  wire \gf36e2_inst.sngfifo36e2_n_46 ;
  wire \gf36e2_inst.sngfifo36e2_n_47 ;
  wire \gf36e2_inst.sngfifo36e2_n_48 ;
  wire \gf36e2_inst.sngfifo36e2_n_49 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_50 ;
  wire \gf36e2_inst.sngfifo36e2_n_51 ;
  wire \gf36e2_inst.sngfifo36e2_n_52 ;
  wire \gf36e2_inst.sngfifo36e2_n_53 ;
  wire \gf36e2_inst.sngfifo36e2_n_54 ;
  wire \gf36e2_inst.sngfifo36e2_n_55 ;
  wire \gf36e2_inst.sngfifo36e2_n_56 ;
  wire \gf36e2_inst.sngfifo36e2_n_57 ;
  wire \gf36e2_inst.sngfifo36e2_n_58 ;
  wire \gf36e2_inst.sngfifo36e2_n_59 ;
  wire \gf36e2_inst.sngfifo36e2_n_60 ;
  wire \gf36e2_inst.sngfifo36e2_n_61 ;
  wire \gf36e2_inst.sngfifo36e2_n_62 ;
  wire \gf36e2_inst.sngfifo36e2_n_63 ;
  wire \gf36e2_inst.sngfifo36e2_n_64 ;
  wire \gf36e2_inst.sngfifo36e2_n_65 ;
  wire \gf36e2_inst.sngfifo36e2_n_66 ;
  wire \gf36e2_inst.sngfifo36e2_n_67 ;
  wire \gf36e2_inst.sngfifo36e2_n_68 ;
  wire \gf36e2_inst.sngfifo36e2_n_69 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_70 ;
  wire \gf36e2_inst.sngfifo36e2_n_71 ;
  wire \gf36e2_inst.sngfifo36e2_n_72 ;
  wire \gf36e2_inst.sngfifo36e2_n_73 ;
  wire \gf36e2_inst.sngfifo36e2_n_74 ;
  wire \gf36e2_inst.sngfifo36e2_n_75 ;
  wire \gf36e2_inst.sngfifo36e2_n_76 ;
  wire \gf36e2_inst.sngfifo36e2_n_77 ;
  wire \gf36e2_inst.sngfifo36e2_n_78 ;
  wire \gf36e2_inst.sngfifo36e2_n_79 ;
  wire \gf36e2_inst.sngfifo36e2_n_80 ;
  wire \gf36e2_inst.sngfifo36e2_n_81 ;
  wire \gf36e2_inst.sngfifo36e2_n_82 ;
  wire \gf36e2_inst.sngfifo36e2_n_83 ;
  wire \gf36e2_inst.sngfifo36e2_n_84 ;
  wire \gf36e2_inst.sngfifo36e2_n_85 ;
  wire \gf36e2_inst.sngfifo36e2_n_86 ;
  wire \gf36e2_inst.sngfifo36e2_n_87 ;
  wire \gf36e2_inst.sngfifo36e2_n_88 ;
  wire \gf36e2_inst.sngfifo36e2_n_89 ;
  wire \gf36e2_inst.sngfifo36e2_n_90 ;
  wire \gf36e2_inst.sngfifo36e2_n_91 ;
  wire \gf36e2_inst.sngfifo36e2_n_92 ;
  wire \gf36e2_inst.sngfifo36e2_n_93 ;
  wire \gf36e2_inst.sngfifo36e2_n_94 ;
  wire \gf36e2_inst.sngfifo36e2_n_95 ;
  wire \gf36e2_inst.sngfifo36e2_n_96 ;
  wire \gf36e2_inst.sngfifo36e2_n_97 ;
  wire \gf36e2_inst.sngfifo36e2_n_98 ;
  wire \gf36e2_inst.sngfifo36e2_n_99 ;
  wire p_77_out;
  wire rd_clk;
  wire [7:7]sbiterr_col;
  wire srst;
  wire wr_clk;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("FALSE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(511),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(72),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(72)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\gf36e2_inst.sngfifo36e2_n_40 ,\gf36e2_inst.sngfifo36e2_n_41 ,\gf36e2_inst.sngfifo36e2_n_42 ,\gf36e2_inst.sngfifo36e2_n_43 ,\gf36e2_inst.sngfifo36e2_n_44 ,\gf36e2_inst.sngfifo36e2_n_45 ,\gf36e2_inst.sngfifo36e2_n_46 ,\gf36e2_inst.sngfifo36e2_n_47 ,\gf36e2_inst.sngfifo36e2_n_48 ,\gf36e2_inst.sngfifo36e2_n_49 ,\gf36e2_inst.sngfifo36e2_n_50 ,\gf36e2_inst.sngfifo36e2_n_51 ,\gf36e2_inst.sngfifo36e2_n_52 ,\gf36e2_inst.sngfifo36e2_n_53 ,\gf36e2_inst.sngfifo36e2_n_54 ,\gf36e2_inst.sngfifo36e2_n_55 ,\gf36e2_inst.sngfifo36e2_n_56 ,\gf36e2_inst.sngfifo36e2_n_57 ,\gf36e2_inst.sngfifo36e2_n_58 ,\gf36e2_inst.sngfifo36e2_n_59 ,\gf36e2_inst.sngfifo36e2_n_60 ,\gf36e2_inst.sngfifo36e2_n_61 ,\gf36e2_inst.sngfifo36e2_n_62 ,\gf36e2_inst.sngfifo36e2_n_63 ,\gf36e2_inst.sngfifo36e2_n_64 ,\gf36e2_inst.sngfifo36e2_n_65 ,\gf36e2_inst.sngfifo36e2_n_66 ,\gf36e2_inst.sngfifo36e2_n_67 ,\gf36e2_inst.sngfifo36e2_n_68 ,\gf36e2_inst.sngfifo36e2_n_69 ,\gf36e2_inst.sngfifo36e2_n_70 ,\gf36e2_inst.sngfifo36e2_n_71 ,\gf36e2_inst.sngfifo36e2_n_72 ,\gf36e2_inst.sngfifo36e2_n_73 ,\gf36e2_inst.sngfifo36e2_n_74 ,\gf36e2_inst.sngfifo36e2_n_75 ,\gf36e2_inst.sngfifo36e2_n_76 ,\gf36e2_inst.sngfifo36e2_n_77 ,\gf36e2_inst.sngfifo36e2_n_78 ,\gf36e2_inst.sngfifo36e2_n_79 ,\gf36e2_inst.sngfifo36e2_n_80 ,\gf36e2_inst.sngfifo36e2_n_81 ,\gf36e2_inst.sngfifo36e2_n_82 ,\gf36e2_inst.sngfifo36e2_n_83 ,\gf36e2_inst.sngfifo36e2_n_84 ,\gf36e2_inst.sngfifo36e2_n_85 ,\gf36e2_inst.sngfifo36e2_n_86 ,\gf36e2_inst.sngfifo36e2_n_87 ,\gf36e2_inst.sngfifo36e2_n_88 ,\gf36e2_inst.sngfifo36e2_n_89 ,\gf36e2_inst.sngfifo36e2_n_90 ,\gf36e2_inst.sngfifo36e2_n_91 ,\gf36e2_inst.sngfifo36e2_n_92 ,\gf36e2_inst.sngfifo36e2_n_93 ,\gf36e2_inst.sngfifo36e2_n_94 ,\gf36e2_inst.sngfifo36e2_n_95 ,\gf36e2_inst.sngfifo36e2_n_96 ,\gf36e2_inst.sngfifo36e2_n_97 ,\gf36e2_inst.sngfifo36e2_n_98 ,\gf36e2_inst.sngfifo36e2_n_99 ,\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP({\gf36e2_inst.sngfifo36e2_n_168 ,\gf36e2_inst.sngfifo36e2_n_169 ,\gf36e2_inst.sngfifo36e2_n_170 ,\gf36e2_inst.sngfifo36e2_n_171 ,\gf36e2_inst.sngfifo36e2_n_172 ,\gf36e2_inst.sngfifo36e2_n_173 ,\gf36e2_inst.sngfifo36e2_n_174 ,\gf36e2_inst.sngfifo36e2_n_175 }),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(dbiterr_col),
        .DIN(din[63:0]),
        .DINP(din[71:64]),
        .DOUT(dout[63:0]),
        .DOUTP(dout[71:64]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_77_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(RD_EN),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(RDRSTBUSY),
        .REGCE(RD_EN),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(WR_EN),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(WRRSTBUSY));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_16
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [6:6]dbiterr_col;
  wire [71:0]din;
  wire [71:0]dout;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_168 ;
  wire \gf36e2_inst.sngfifo36e2_n_169 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_170 ;
  wire \gf36e2_inst.sngfifo36e2_n_171 ;
  wire \gf36e2_inst.sngfifo36e2_n_172 ;
  wire \gf36e2_inst.sngfifo36e2_n_173 ;
  wire \gf36e2_inst.sngfifo36e2_n_174 ;
  wire \gf36e2_inst.sngfifo36e2_n_175 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_40 ;
  wire \gf36e2_inst.sngfifo36e2_n_41 ;
  wire \gf36e2_inst.sngfifo36e2_n_42 ;
  wire \gf36e2_inst.sngfifo36e2_n_43 ;
  wire \gf36e2_inst.sngfifo36e2_n_44 ;
  wire \gf36e2_inst.sngfifo36e2_n_45 ;
  wire \gf36e2_inst.sngfifo36e2_n_46 ;
  wire \gf36e2_inst.sngfifo36e2_n_47 ;
  wire \gf36e2_inst.sngfifo36e2_n_48 ;
  wire \gf36e2_inst.sngfifo36e2_n_49 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_50 ;
  wire \gf36e2_inst.sngfifo36e2_n_51 ;
  wire \gf36e2_inst.sngfifo36e2_n_52 ;
  wire \gf36e2_inst.sngfifo36e2_n_53 ;
  wire \gf36e2_inst.sngfifo36e2_n_54 ;
  wire \gf36e2_inst.sngfifo36e2_n_55 ;
  wire \gf36e2_inst.sngfifo36e2_n_56 ;
  wire \gf36e2_inst.sngfifo36e2_n_57 ;
  wire \gf36e2_inst.sngfifo36e2_n_58 ;
  wire \gf36e2_inst.sngfifo36e2_n_59 ;
  wire \gf36e2_inst.sngfifo36e2_n_60 ;
  wire \gf36e2_inst.sngfifo36e2_n_61 ;
  wire \gf36e2_inst.sngfifo36e2_n_62 ;
  wire \gf36e2_inst.sngfifo36e2_n_63 ;
  wire \gf36e2_inst.sngfifo36e2_n_64 ;
  wire \gf36e2_inst.sngfifo36e2_n_65 ;
  wire \gf36e2_inst.sngfifo36e2_n_66 ;
  wire \gf36e2_inst.sngfifo36e2_n_67 ;
  wire \gf36e2_inst.sngfifo36e2_n_68 ;
  wire \gf36e2_inst.sngfifo36e2_n_69 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_70 ;
  wire \gf36e2_inst.sngfifo36e2_n_71 ;
  wire \gf36e2_inst.sngfifo36e2_n_72 ;
  wire \gf36e2_inst.sngfifo36e2_n_73 ;
  wire \gf36e2_inst.sngfifo36e2_n_74 ;
  wire \gf36e2_inst.sngfifo36e2_n_75 ;
  wire \gf36e2_inst.sngfifo36e2_n_76 ;
  wire \gf36e2_inst.sngfifo36e2_n_77 ;
  wire \gf36e2_inst.sngfifo36e2_n_78 ;
  wire \gf36e2_inst.sngfifo36e2_n_79 ;
  wire \gf36e2_inst.sngfifo36e2_n_80 ;
  wire \gf36e2_inst.sngfifo36e2_n_81 ;
  wire \gf36e2_inst.sngfifo36e2_n_82 ;
  wire \gf36e2_inst.sngfifo36e2_n_83 ;
  wire \gf36e2_inst.sngfifo36e2_n_84 ;
  wire \gf36e2_inst.sngfifo36e2_n_85 ;
  wire \gf36e2_inst.sngfifo36e2_n_86 ;
  wire \gf36e2_inst.sngfifo36e2_n_87 ;
  wire \gf36e2_inst.sngfifo36e2_n_88 ;
  wire \gf36e2_inst.sngfifo36e2_n_89 ;
  wire \gf36e2_inst.sngfifo36e2_n_90 ;
  wire \gf36e2_inst.sngfifo36e2_n_91 ;
  wire \gf36e2_inst.sngfifo36e2_n_92 ;
  wire \gf36e2_inst.sngfifo36e2_n_93 ;
  wire \gf36e2_inst.sngfifo36e2_n_94 ;
  wire \gf36e2_inst.sngfifo36e2_n_95 ;
  wire \gf36e2_inst.sngfifo36e2_n_96 ;
  wire \gf36e2_inst.sngfifo36e2_n_97 ;
  wire \gf36e2_inst.sngfifo36e2_n_98 ;
  wire \gf36e2_inst.sngfifo36e2_n_99 ;
  wire p_86_out;
  wire rd_clk;
  wire [6:6]sbiterr_col;
  wire srst;
  wire wr_clk;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("FALSE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(511),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(72),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(72)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\gf36e2_inst.sngfifo36e2_n_40 ,\gf36e2_inst.sngfifo36e2_n_41 ,\gf36e2_inst.sngfifo36e2_n_42 ,\gf36e2_inst.sngfifo36e2_n_43 ,\gf36e2_inst.sngfifo36e2_n_44 ,\gf36e2_inst.sngfifo36e2_n_45 ,\gf36e2_inst.sngfifo36e2_n_46 ,\gf36e2_inst.sngfifo36e2_n_47 ,\gf36e2_inst.sngfifo36e2_n_48 ,\gf36e2_inst.sngfifo36e2_n_49 ,\gf36e2_inst.sngfifo36e2_n_50 ,\gf36e2_inst.sngfifo36e2_n_51 ,\gf36e2_inst.sngfifo36e2_n_52 ,\gf36e2_inst.sngfifo36e2_n_53 ,\gf36e2_inst.sngfifo36e2_n_54 ,\gf36e2_inst.sngfifo36e2_n_55 ,\gf36e2_inst.sngfifo36e2_n_56 ,\gf36e2_inst.sngfifo36e2_n_57 ,\gf36e2_inst.sngfifo36e2_n_58 ,\gf36e2_inst.sngfifo36e2_n_59 ,\gf36e2_inst.sngfifo36e2_n_60 ,\gf36e2_inst.sngfifo36e2_n_61 ,\gf36e2_inst.sngfifo36e2_n_62 ,\gf36e2_inst.sngfifo36e2_n_63 ,\gf36e2_inst.sngfifo36e2_n_64 ,\gf36e2_inst.sngfifo36e2_n_65 ,\gf36e2_inst.sngfifo36e2_n_66 ,\gf36e2_inst.sngfifo36e2_n_67 ,\gf36e2_inst.sngfifo36e2_n_68 ,\gf36e2_inst.sngfifo36e2_n_69 ,\gf36e2_inst.sngfifo36e2_n_70 ,\gf36e2_inst.sngfifo36e2_n_71 ,\gf36e2_inst.sngfifo36e2_n_72 ,\gf36e2_inst.sngfifo36e2_n_73 ,\gf36e2_inst.sngfifo36e2_n_74 ,\gf36e2_inst.sngfifo36e2_n_75 ,\gf36e2_inst.sngfifo36e2_n_76 ,\gf36e2_inst.sngfifo36e2_n_77 ,\gf36e2_inst.sngfifo36e2_n_78 ,\gf36e2_inst.sngfifo36e2_n_79 ,\gf36e2_inst.sngfifo36e2_n_80 ,\gf36e2_inst.sngfifo36e2_n_81 ,\gf36e2_inst.sngfifo36e2_n_82 ,\gf36e2_inst.sngfifo36e2_n_83 ,\gf36e2_inst.sngfifo36e2_n_84 ,\gf36e2_inst.sngfifo36e2_n_85 ,\gf36e2_inst.sngfifo36e2_n_86 ,\gf36e2_inst.sngfifo36e2_n_87 ,\gf36e2_inst.sngfifo36e2_n_88 ,\gf36e2_inst.sngfifo36e2_n_89 ,\gf36e2_inst.sngfifo36e2_n_90 ,\gf36e2_inst.sngfifo36e2_n_91 ,\gf36e2_inst.sngfifo36e2_n_92 ,\gf36e2_inst.sngfifo36e2_n_93 ,\gf36e2_inst.sngfifo36e2_n_94 ,\gf36e2_inst.sngfifo36e2_n_95 ,\gf36e2_inst.sngfifo36e2_n_96 ,\gf36e2_inst.sngfifo36e2_n_97 ,\gf36e2_inst.sngfifo36e2_n_98 ,\gf36e2_inst.sngfifo36e2_n_99 ,\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP({\gf36e2_inst.sngfifo36e2_n_168 ,\gf36e2_inst.sngfifo36e2_n_169 ,\gf36e2_inst.sngfifo36e2_n_170 ,\gf36e2_inst.sngfifo36e2_n_171 ,\gf36e2_inst.sngfifo36e2_n_172 ,\gf36e2_inst.sngfifo36e2_n_173 ,\gf36e2_inst.sngfifo36e2_n_174 ,\gf36e2_inst.sngfifo36e2_n_175 }),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(dbiterr_col),
        .DIN(din[63:0]),
        .DINP(din[71:64]),
        .DOUT(dout[63:0]),
        .DOUTP(dout[71:64]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_86_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(RD_EN),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(RDRSTBUSY),
        .REGCE(RD_EN),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(WR_EN),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(WRRSTBUSY));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_17
   (RDRSTBUSY,
    WRRSTBUSY,
    dout,
    full,
    rd_clk_0,
    empty,
    rd_clk_1,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din,
    FULL,
    full_0,
    full_1,
    full_2,
    full_3,
    full_4,
    full_5,
    full_6,
    EMPTY,
    empty_0,
    empty_1,
    empty_2,
    empty_3,
    empty_4,
    empty_5,
    empty_6);
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  output full;
  output rd_clk_0;
  output empty;
  output rd_clk_1;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;
  input FULL;
  input full_0;
  input full_1;
  input full_2;
  input full_3;
  input full_4;
  input full_5;
  input full_6;
  input EMPTY;
  input empty_0;
  input empty_1;
  input empty_2;
  input empty_3;
  input empty_4;
  input empty_5;
  input empty_6;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [5:5]dbiterr_col;
  wire [71:0]din;
  wire [71:0]dout;
  wire empty;
  wire empty_0;
  wire empty_1;
  wire empty_2;
  wire empty_3;
  wire empty_4;
  wire empty_5;
  wire empty_6;
  wire full;
  wire full_0;
  wire full_1;
  wire full_2;
  wire full_3;
  wire full_4;
  wire full_5;
  wire full_6;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_168 ;
  wire \gf36e2_inst.sngfifo36e2_n_169 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_170 ;
  wire \gf36e2_inst.sngfifo36e2_n_171 ;
  wire \gf36e2_inst.sngfifo36e2_n_172 ;
  wire \gf36e2_inst.sngfifo36e2_n_173 ;
  wire \gf36e2_inst.sngfifo36e2_n_174 ;
  wire \gf36e2_inst.sngfifo36e2_n_175 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_40 ;
  wire \gf36e2_inst.sngfifo36e2_n_41 ;
  wire \gf36e2_inst.sngfifo36e2_n_42 ;
  wire \gf36e2_inst.sngfifo36e2_n_43 ;
  wire \gf36e2_inst.sngfifo36e2_n_44 ;
  wire \gf36e2_inst.sngfifo36e2_n_45 ;
  wire \gf36e2_inst.sngfifo36e2_n_46 ;
  wire \gf36e2_inst.sngfifo36e2_n_47 ;
  wire \gf36e2_inst.sngfifo36e2_n_48 ;
  wire \gf36e2_inst.sngfifo36e2_n_49 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_50 ;
  wire \gf36e2_inst.sngfifo36e2_n_51 ;
  wire \gf36e2_inst.sngfifo36e2_n_52 ;
  wire \gf36e2_inst.sngfifo36e2_n_53 ;
  wire \gf36e2_inst.sngfifo36e2_n_54 ;
  wire \gf36e2_inst.sngfifo36e2_n_55 ;
  wire \gf36e2_inst.sngfifo36e2_n_56 ;
  wire \gf36e2_inst.sngfifo36e2_n_57 ;
  wire \gf36e2_inst.sngfifo36e2_n_58 ;
  wire \gf36e2_inst.sngfifo36e2_n_59 ;
  wire \gf36e2_inst.sngfifo36e2_n_60 ;
  wire \gf36e2_inst.sngfifo36e2_n_61 ;
  wire \gf36e2_inst.sngfifo36e2_n_62 ;
  wire \gf36e2_inst.sngfifo36e2_n_63 ;
  wire \gf36e2_inst.sngfifo36e2_n_64 ;
  wire \gf36e2_inst.sngfifo36e2_n_65 ;
  wire \gf36e2_inst.sngfifo36e2_n_66 ;
  wire \gf36e2_inst.sngfifo36e2_n_67 ;
  wire \gf36e2_inst.sngfifo36e2_n_68 ;
  wire \gf36e2_inst.sngfifo36e2_n_69 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_70 ;
  wire \gf36e2_inst.sngfifo36e2_n_71 ;
  wire \gf36e2_inst.sngfifo36e2_n_72 ;
  wire \gf36e2_inst.sngfifo36e2_n_73 ;
  wire \gf36e2_inst.sngfifo36e2_n_74 ;
  wire \gf36e2_inst.sngfifo36e2_n_75 ;
  wire \gf36e2_inst.sngfifo36e2_n_76 ;
  wire \gf36e2_inst.sngfifo36e2_n_77 ;
  wire \gf36e2_inst.sngfifo36e2_n_78 ;
  wire \gf36e2_inst.sngfifo36e2_n_79 ;
  wire \gf36e2_inst.sngfifo36e2_n_80 ;
  wire \gf36e2_inst.sngfifo36e2_n_81 ;
  wire \gf36e2_inst.sngfifo36e2_n_82 ;
  wire \gf36e2_inst.sngfifo36e2_n_83 ;
  wire \gf36e2_inst.sngfifo36e2_n_84 ;
  wire \gf36e2_inst.sngfifo36e2_n_85 ;
  wire \gf36e2_inst.sngfifo36e2_n_86 ;
  wire \gf36e2_inst.sngfifo36e2_n_87 ;
  wire \gf36e2_inst.sngfifo36e2_n_88 ;
  wire \gf36e2_inst.sngfifo36e2_n_89 ;
  wire \gf36e2_inst.sngfifo36e2_n_90 ;
  wire \gf36e2_inst.sngfifo36e2_n_91 ;
  wire \gf36e2_inst.sngfifo36e2_n_92 ;
  wire \gf36e2_inst.sngfifo36e2_n_93 ;
  wire \gf36e2_inst.sngfifo36e2_n_94 ;
  wire \gf36e2_inst.sngfifo36e2_n_95 ;
  wire \gf36e2_inst.sngfifo36e2_n_96 ;
  wire \gf36e2_inst.sngfifo36e2_n_97 ;
  wire \gf36e2_inst.sngfifo36e2_n_98 ;
  wire \gf36e2_inst.sngfifo36e2_n_99 ;
  wire p_95_out;
  wire p_96_out;
  wire p_97_out;
  wire rd_clk;
  wire rd_clk_0;
  wire rd_clk_1;
  wire [5:5]sbiterr_col;
  wire srst;
  wire wr_clk;

  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    empty_INST_0
       (.I0(rd_clk_1),
        .I1(EMPTY),
        .I2(empty_0),
        .I3(empty_1),
        .I4(empty_2),
        .I5(empty_3),
        .O(empty));
  LUT4 #(
    .INIT(16'hFFFE)) 
    empty_INST_0_i_1
       (.I0(p_96_out),
        .I1(empty_4),
        .I2(empty_5),
        .I3(empty_6),
        .O(rd_clk_1));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    full_INST_0
       (.I0(rd_clk_0),
        .I1(FULL),
        .I2(full_0),
        .I3(full_1),
        .I4(full_2),
        .I5(full_3),
        .O(full));
  LUT4 #(
    .INIT(16'hFFFE)) 
    full_INST_0_i_1
       (.I0(p_97_out),
        .I1(full_4),
        .I2(full_5),
        .I3(full_6),
        .O(rd_clk_0));
  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("FALSE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(511),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(72),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(72)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\gf36e2_inst.sngfifo36e2_n_40 ,\gf36e2_inst.sngfifo36e2_n_41 ,\gf36e2_inst.sngfifo36e2_n_42 ,\gf36e2_inst.sngfifo36e2_n_43 ,\gf36e2_inst.sngfifo36e2_n_44 ,\gf36e2_inst.sngfifo36e2_n_45 ,\gf36e2_inst.sngfifo36e2_n_46 ,\gf36e2_inst.sngfifo36e2_n_47 ,\gf36e2_inst.sngfifo36e2_n_48 ,\gf36e2_inst.sngfifo36e2_n_49 ,\gf36e2_inst.sngfifo36e2_n_50 ,\gf36e2_inst.sngfifo36e2_n_51 ,\gf36e2_inst.sngfifo36e2_n_52 ,\gf36e2_inst.sngfifo36e2_n_53 ,\gf36e2_inst.sngfifo36e2_n_54 ,\gf36e2_inst.sngfifo36e2_n_55 ,\gf36e2_inst.sngfifo36e2_n_56 ,\gf36e2_inst.sngfifo36e2_n_57 ,\gf36e2_inst.sngfifo36e2_n_58 ,\gf36e2_inst.sngfifo36e2_n_59 ,\gf36e2_inst.sngfifo36e2_n_60 ,\gf36e2_inst.sngfifo36e2_n_61 ,\gf36e2_inst.sngfifo36e2_n_62 ,\gf36e2_inst.sngfifo36e2_n_63 ,\gf36e2_inst.sngfifo36e2_n_64 ,\gf36e2_inst.sngfifo36e2_n_65 ,\gf36e2_inst.sngfifo36e2_n_66 ,\gf36e2_inst.sngfifo36e2_n_67 ,\gf36e2_inst.sngfifo36e2_n_68 ,\gf36e2_inst.sngfifo36e2_n_69 ,\gf36e2_inst.sngfifo36e2_n_70 ,\gf36e2_inst.sngfifo36e2_n_71 ,\gf36e2_inst.sngfifo36e2_n_72 ,\gf36e2_inst.sngfifo36e2_n_73 ,\gf36e2_inst.sngfifo36e2_n_74 ,\gf36e2_inst.sngfifo36e2_n_75 ,\gf36e2_inst.sngfifo36e2_n_76 ,\gf36e2_inst.sngfifo36e2_n_77 ,\gf36e2_inst.sngfifo36e2_n_78 ,\gf36e2_inst.sngfifo36e2_n_79 ,\gf36e2_inst.sngfifo36e2_n_80 ,\gf36e2_inst.sngfifo36e2_n_81 ,\gf36e2_inst.sngfifo36e2_n_82 ,\gf36e2_inst.sngfifo36e2_n_83 ,\gf36e2_inst.sngfifo36e2_n_84 ,\gf36e2_inst.sngfifo36e2_n_85 ,\gf36e2_inst.sngfifo36e2_n_86 ,\gf36e2_inst.sngfifo36e2_n_87 ,\gf36e2_inst.sngfifo36e2_n_88 ,\gf36e2_inst.sngfifo36e2_n_89 ,\gf36e2_inst.sngfifo36e2_n_90 ,\gf36e2_inst.sngfifo36e2_n_91 ,\gf36e2_inst.sngfifo36e2_n_92 ,\gf36e2_inst.sngfifo36e2_n_93 ,\gf36e2_inst.sngfifo36e2_n_94 ,\gf36e2_inst.sngfifo36e2_n_95 ,\gf36e2_inst.sngfifo36e2_n_96 ,\gf36e2_inst.sngfifo36e2_n_97 ,\gf36e2_inst.sngfifo36e2_n_98 ,\gf36e2_inst.sngfifo36e2_n_99 ,\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP({\gf36e2_inst.sngfifo36e2_n_168 ,\gf36e2_inst.sngfifo36e2_n_169 ,\gf36e2_inst.sngfifo36e2_n_170 ,\gf36e2_inst.sngfifo36e2_n_171 ,\gf36e2_inst.sngfifo36e2_n_172 ,\gf36e2_inst.sngfifo36e2_n_173 ,\gf36e2_inst.sngfifo36e2_n_174 ,\gf36e2_inst.sngfifo36e2_n_175 }),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(dbiterr_col),
        .DIN(din[63:0]),
        .DINP(din[71:64]),
        .DOUT(dout[63:0]),
        .DOUTP(dout[71:64]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_96_out),
        .FULL(p_97_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_95_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(RD_EN),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(RDRSTBUSY),
        .REGCE(RD_EN),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(WR_EN),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(WRRSTBUSY));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_18
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [4:4]dbiterr_col;
  wire [71:0]din;
  wire [71:0]dout;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_168 ;
  wire \gf36e2_inst.sngfifo36e2_n_169 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_170 ;
  wire \gf36e2_inst.sngfifo36e2_n_171 ;
  wire \gf36e2_inst.sngfifo36e2_n_172 ;
  wire \gf36e2_inst.sngfifo36e2_n_173 ;
  wire \gf36e2_inst.sngfifo36e2_n_174 ;
  wire \gf36e2_inst.sngfifo36e2_n_175 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_40 ;
  wire \gf36e2_inst.sngfifo36e2_n_41 ;
  wire \gf36e2_inst.sngfifo36e2_n_42 ;
  wire \gf36e2_inst.sngfifo36e2_n_43 ;
  wire \gf36e2_inst.sngfifo36e2_n_44 ;
  wire \gf36e2_inst.sngfifo36e2_n_45 ;
  wire \gf36e2_inst.sngfifo36e2_n_46 ;
  wire \gf36e2_inst.sngfifo36e2_n_47 ;
  wire \gf36e2_inst.sngfifo36e2_n_48 ;
  wire \gf36e2_inst.sngfifo36e2_n_49 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_50 ;
  wire \gf36e2_inst.sngfifo36e2_n_51 ;
  wire \gf36e2_inst.sngfifo36e2_n_52 ;
  wire \gf36e2_inst.sngfifo36e2_n_53 ;
  wire \gf36e2_inst.sngfifo36e2_n_54 ;
  wire \gf36e2_inst.sngfifo36e2_n_55 ;
  wire \gf36e2_inst.sngfifo36e2_n_56 ;
  wire \gf36e2_inst.sngfifo36e2_n_57 ;
  wire \gf36e2_inst.sngfifo36e2_n_58 ;
  wire \gf36e2_inst.sngfifo36e2_n_59 ;
  wire \gf36e2_inst.sngfifo36e2_n_60 ;
  wire \gf36e2_inst.sngfifo36e2_n_61 ;
  wire \gf36e2_inst.sngfifo36e2_n_62 ;
  wire \gf36e2_inst.sngfifo36e2_n_63 ;
  wire \gf36e2_inst.sngfifo36e2_n_64 ;
  wire \gf36e2_inst.sngfifo36e2_n_65 ;
  wire \gf36e2_inst.sngfifo36e2_n_66 ;
  wire \gf36e2_inst.sngfifo36e2_n_67 ;
  wire \gf36e2_inst.sngfifo36e2_n_68 ;
  wire \gf36e2_inst.sngfifo36e2_n_69 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_70 ;
  wire \gf36e2_inst.sngfifo36e2_n_71 ;
  wire \gf36e2_inst.sngfifo36e2_n_72 ;
  wire \gf36e2_inst.sngfifo36e2_n_73 ;
  wire \gf36e2_inst.sngfifo36e2_n_74 ;
  wire \gf36e2_inst.sngfifo36e2_n_75 ;
  wire \gf36e2_inst.sngfifo36e2_n_76 ;
  wire \gf36e2_inst.sngfifo36e2_n_77 ;
  wire \gf36e2_inst.sngfifo36e2_n_78 ;
  wire \gf36e2_inst.sngfifo36e2_n_79 ;
  wire \gf36e2_inst.sngfifo36e2_n_80 ;
  wire \gf36e2_inst.sngfifo36e2_n_81 ;
  wire \gf36e2_inst.sngfifo36e2_n_82 ;
  wire \gf36e2_inst.sngfifo36e2_n_83 ;
  wire \gf36e2_inst.sngfifo36e2_n_84 ;
  wire \gf36e2_inst.sngfifo36e2_n_85 ;
  wire \gf36e2_inst.sngfifo36e2_n_86 ;
  wire \gf36e2_inst.sngfifo36e2_n_87 ;
  wire \gf36e2_inst.sngfifo36e2_n_88 ;
  wire \gf36e2_inst.sngfifo36e2_n_89 ;
  wire \gf36e2_inst.sngfifo36e2_n_90 ;
  wire \gf36e2_inst.sngfifo36e2_n_91 ;
  wire \gf36e2_inst.sngfifo36e2_n_92 ;
  wire \gf36e2_inst.sngfifo36e2_n_93 ;
  wire \gf36e2_inst.sngfifo36e2_n_94 ;
  wire \gf36e2_inst.sngfifo36e2_n_95 ;
  wire \gf36e2_inst.sngfifo36e2_n_96 ;
  wire \gf36e2_inst.sngfifo36e2_n_97 ;
  wire \gf36e2_inst.sngfifo36e2_n_98 ;
  wire \gf36e2_inst.sngfifo36e2_n_99 ;
  wire p_104_out;
  wire rd_clk;
  wire [4:4]sbiterr_col;
  wire srst;
  wire wr_clk;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("FALSE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(511),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(72),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(72)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\gf36e2_inst.sngfifo36e2_n_40 ,\gf36e2_inst.sngfifo36e2_n_41 ,\gf36e2_inst.sngfifo36e2_n_42 ,\gf36e2_inst.sngfifo36e2_n_43 ,\gf36e2_inst.sngfifo36e2_n_44 ,\gf36e2_inst.sngfifo36e2_n_45 ,\gf36e2_inst.sngfifo36e2_n_46 ,\gf36e2_inst.sngfifo36e2_n_47 ,\gf36e2_inst.sngfifo36e2_n_48 ,\gf36e2_inst.sngfifo36e2_n_49 ,\gf36e2_inst.sngfifo36e2_n_50 ,\gf36e2_inst.sngfifo36e2_n_51 ,\gf36e2_inst.sngfifo36e2_n_52 ,\gf36e2_inst.sngfifo36e2_n_53 ,\gf36e2_inst.sngfifo36e2_n_54 ,\gf36e2_inst.sngfifo36e2_n_55 ,\gf36e2_inst.sngfifo36e2_n_56 ,\gf36e2_inst.sngfifo36e2_n_57 ,\gf36e2_inst.sngfifo36e2_n_58 ,\gf36e2_inst.sngfifo36e2_n_59 ,\gf36e2_inst.sngfifo36e2_n_60 ,\gf36e2_inst.sngfifo36e2_n_61 ,\gf36e2_inst.sngfifo36e2_n_62 ,\gf36e2_inst.sngfifo36e2_n_63 ,\gf36e2_inst.sngfifo36e2_n_64 ,\gf36e2_inst.sngfifo36e2_n_65 ,\gf36e2_inst.sngfifo36e2_n_66 ,\gf36e2_inst.sngfifo36e2_n_67 ,\gf36e2_inst.sngfifo36e2_n_68 ,\gf36e2_inst.sngfifo36e2_n_69 ,\gf36e2_inst.sngfifo36e2_n_70 ,\gf36e2_inst.sngfifo36e2_n_71 ,\gf36e2_inst.sngfifo36e2_n_72 ,\gf36e2_inst.sngfifo36e2_n_73 ,\gf36e2_inst.sngfifo36e2_n_74 ,\gf36e2_inst.sngfifo36e2_n_75 ,\gf36e2_inst.sngfifo36e2_n_76 ,\gf36e2_inst.sngfifo36e2_n_77 ,\gf36e2_inst.sngfifo36e2_n_78 ,\gf36e2_inst.sngfifo36e2_n_79 ,\gf36e2_inst.sngfifo36e2_n_80 ,\gf36e2_inst.sngfifo36e2_n_81 ,\gf36e2_inst.sngfifo36e2_n_82 ,\gf36e2_inst.sngfifo36e2_n_83 ,\gf36e2_inst.sngfifo36e2_n_84 ,\gf36e2_inst.sngfifo36e2_n_85 ,\gf36e2_inst.sngfifo36e2_n_86 ,\gf36e2_inst.sngfifo36e2_n_87 ,\gf36e2_inst.sngfifo36e2_n_88 ,\gf36e2_inst.sngfifo36e2_n_89 ,\gf36e2_inst.sngfifo36e2_n_90 ,\gf36e2_inst.sngfifo36e2_n_91 ,\gf36e2_inst.sngfifo36e2_n_92 ,\gf36e2_inst.sngfifo36e2_n_93 ,\gf36e2_inst.sngfifo36e2_n_94 ,\gf36e2_inst.sngfifo36e2_n_95 ,\gf36e2_inst.sngfifo36e2_n_96 ,\gf36e2_inst.sngfifo36e2_n_97 ,\gf36e2_inst.sngfifo36e2_n_98 ,\gf36e2_inst.sngfifo36e2_n_99 ,\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP({\gf36e2_inst.sngfifo36e2_n_168 ,\gf36e2_inst.sngfifo36e2_n_169 ,\gf36e2_inst.sngfifo36e2_n_170 ,\gf36e2_inst.sngfifo36e2_n_171 ,\gf36e2_inst.sngfifo36e2_n_172 ,\gf36e2_inst.sngfifo36e2_n_173 ,\gf36e2_inst.sngfifo36e2_n_174 ,\gf36e2_inst.sngfifo36e2_n_175 }),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(dbiterr_col),
        .DIN(din[63:0]),
        .DINP(din[71:64]),
        .DOUT(dout[63:0]),
        .DOUTP(dout[71:64]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_104_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(RD_EN),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(RDRSTBUSY),
        .REGCE(RD_EN),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(WR_EN),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(WRRSTBUSY));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_19
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [3:3]dbiterr_col;
  wire [71:0]din;
  wire [71:0]dout;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_168 ;
  wire \gf36e2_inst.sngfifo36e2_n_169 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_170 ;
  wire \gf36e2_inst.sngfifo36e2_n_171 ;
  wire \gf36e2_inst.sngfifo36e2_n_172 ;
  wire \gf36e2_inst.sngfifo36e2_n_173 ;
  wire \gf36e2_inst.sngfifo36e2_n_174 ;
  wire \gf36e2_inst.sngfifo36e2_n_175 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_40 ;
  wire \gf36e2_inst.sngfifo36e2_n_41 ;
  wire \gf36e2_inst.sngfifo36e2_n_42 ;
  wire \gf36e2_inst.sngfifo36e2_n_43 ;
  wire \gf36e2_inst.sngfifo36e2_n_44 ;
  wire \gf36e2_inst.sngfifo36e2_n_45 ;
  wire \gf36e2_inst.sngfifo36e2_n_46 ;
  wire \gf36e2_inst.sngfifo36e2_n_47 ;
  wire \gf36e2_inst.sngfifo36e2_n_48 ;
  wire \gf36e2_inst.sngfifo36e2_n_49 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_50 ;
  wire \gf36e2_inst.sngfifo36e2_n_51 ;
  wire \gf36e2_inst.sngfifo36e2_n_52 ;
  wire \gf36e2_inst.sngfifo36e2_n_53 ;
  wire \gf36e2_inst.sngfifo36e2_n_54 ;
  wire \gf36e2_inst.sngfifo36e2_n_55 ;
  wire \gf36e2_inst.sngfifo36e2_n_56 ;
  wire \gf36e2_inst.sngfifo36e2_n_57 ;
  wire \gf36e2_inst.sngfifo36e2_n_58 ;
  wire \gf36e2_inst.sngfifo36e2_n_59 ;
  wire \gf36e2_inst.sngfifo36e2_n_60 ;
  wire \gf36e2_inst.sngfifo36e2_n_61 ;
  wire \gf36e2_inst.sngfifo36e2_n_62 ;
  wire \gf36e2_inst.sngfifo36e2_n_63 ;
  wire \gf36e2_inst.sngfifo36e2_n_64 ;
  wire \gf36e2_inst.sngfifo36e2_n_65 ;
  wire \gf36e2_inst.sngfifo36e2_n_66 ;
  wire \gf36e2_inst.sngfifo36e2_n_67 ;
  wire \gf36e2_inst.sngfifo36e2_n_68 ;
  wire \gf36e2_inst.sngfifo36e2_n_69 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_70 ;
  wire \gf36e2_inst.sngfifo36e2_n_71 ;
  wire \gf36e2_inst.sngfifo36e2_n_72 ;
  wire \gf36e2_inst.sngfifo36e2_n_73 ;
  wire \gf36e2_inst.sngfifo36e2_n_74 ;
  wire \gf36e2_inst.sngfifo36e2_n_75 ;
  wire \gf36e2_inst.sngfifo36e2_n_76 ;
  wire \gf36e2_inst.sngfifo36e2_n_77 ;
  wire \gf36e2_inst.sngfifo36e2_n_78 ;
  wire \gf36e2_inst.sngfifo36e2_n_79 ;
  wire \gf36e2_inst.sngfifo36e2_n_80 ;
  wire \gf36e2_inst.sngfifo36e2_n_81 ;
  wire \gf36e2_inst.sngfifo36e2_n_82 ;
  wire \gf36e2_inst.sngfifo36e2_n_83 ;
  wire \gf36e2_inst.sngfifo36e2_n_84 ;
  wire \gf36e2_inst.sngfifo36e2_n_85 ;
  wire \gf36e2_inst.sngfifo36e2_n_86 ;
  wire \gf36e2_inst.sngfifo36e2_n_87 ;
  wire \gf36e2_inst.sngfifo36e2_n_88 ;
  wire \gf36e2_inst.sngfifo36e2_n_89 ;
  wire \gf36e2_inst.sngfifo36e2_n_90 ;
  wire \gf36e2_inst.sngfifo36e2_n_91 ;
  wire \gf36e2_inst.sngfifo36e2_n_92 ;
  wire \gf36e2_inst.sngfifo36e2_n_93 ;
  wire \gf36e2_inst.sngfifo36e2_n_94 ;
  wire \gf36e2_inst.sngfifo36e2_n_95 ;
  wire \gf36e2_inst.sngfifo36e2_n_96 ;
  wire \gf36e2_inst.sngfifo36e2_n_97 ;
  wire \gf36e2_inst.sngfifo36e2_n_98 ;
  wire \gf36e2_inst.sngfifo36e2_n_99 ;
  wire p_113_out;
  wire rd_clk;
  wire [3:3]sbiterr_col;
  wire srst;
  wire wr_clk;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("FALSE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(511),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(72),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(72)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\gf36e2_inst.sngfifo36e2_n_40 ,\gf36e2_inst.sngfifo36e2_n_41 ,\gf36e2_inst.sngfifo36e2_n_42 ,\gf36e2_inst.sngfifo36e2_n_43 ,\gf36e2_inst.sngfifo36e2_n_44 ,\gf36e2_inst.sngfifo36e2_n_45 ,\gf36e2_inst.sngfifo36e2_n_46 ,\gf36e2_inst.sngfifo36e2_n_47 ,\gf36e2_inst.sngfifo36e2_n_48 ,\gf36e2_inst.sngfifo36e2_n_49 ,\gf36e2_inst.sngfifo36e2_n_50 ,\gf36e2_inst.sngfifo36e2_n_51 ,\gf36e2_inst.sngfifo36e2_n_52 ,\gf36e2_inst.sngfifo36e2_n_53 ,\gf36e2_inst.sngfifo36e2_n_54 ,\gf36e2_inst.sngfifo36e2_n_55 ,\gf36e2_inst.sngfifo36e2_n_56 ,\gf36e2_inst.sngfifo36e2_n_57 ,\gf36e2_inst.sngfifo36e2_n_58 ,\gf36e2_inst.sngfifo36e2_n_59 ,\gf36e2_inst.sngfifo36e2_n_60 ,\gf36e2_inst.sngfifo36e2_n_61 ,\gf36e2_inst.sngfifo36e2_n_62 ,\gf36e2_inst.sngfifo36e2_n_63 ,\gf36e2_inst.sngfifo36e2_n_64 ,\gf36e2_inst.sngfifo36e2_n_65 ,\gf36e2_inst.sngfifo36e2_n_66 ,\gf36e2_inst.sngfifo36e2_n_67 ,\gf36e2_inst.sngfifo36e2_n_68 ,\gf36e2_inst.sngfifo36e2_n_69 ,\gf36e2_inst.sngfifo36e2_n_70 ,\gf36e2_inst.sngfifo36e2_n_71 ,\gf36e2_inst.sngfifo36e2_n_72 ,\gf36e2_inst.sngfifo36e2_n_73 ,\gf36e2_inst.sngfifo36e2_n_74 ,\gf36e2_inst.sngfifo36e2_n_75 ,\gf36e2_inst.sngfifo36e2_n_76 ,\gf36e2_inst.sngfifo36e2_n_77 ,\gf36e2_inst.sngfifo36e2_n_78 ,\gf36e2_inst.sngfifo36e2_n_79 ,\gf36e2_inst.sngfifo36e2_n_80 ,\gf36e2_inst.sngfifo36e2_n_81 ,\gf36e2_inst.sngfifo36e2_n_82 ,\gf36e2_inst.sngfifo36e2_n_83 ,\gf36e2_inst.sngfifo36e2_n_84 ,\gf36e2_inst.sngfifo36e2_n_85 ,\gf36e2_inst.sngfifo36e2_n_86 ,\gf36e2_inst.sngfifo36e2_n_87 ,\gf36e2_inst.sngfifo36e2_n_88 ,\gf36e2_inst.sngfifo36e2_n_89 ,\gf36e2_inst.sngfifo36e2_n_90 ,\gf36e2_inst.sngfifo36e2_n_91 ,\gf36e2_inst.sngfifo36e2_n_92 ,\gf36e2_inst.sngfifo36e2_n_93 ,\gf36e2_inst.sngfifo36e2_n_94 ,\gf36e2_inst.sngfifo36e2_n_95 ,\gf36e2_inst.sngfifo36e2_n_96 ,\gf36e2_inst.sngfifo36e2_n_97 ,\gf36e2_inst.sngfifo36e2_n_98 ,\gf36e2_inst.sngfifo36e2_n_99 ,\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP({\gf36e2_inst.sngfifo36e2_n_168 ,\gf36e2_inst.sngfifo36e2_n_169 ,\gf36e2_inst.sngfifo36e2_n_170 ,\gf36e2_inst.sngfifo36e2_n_171 ,\gf36e2_inst.sngfifo36e2_n_172 ,\gf36e2_inst.sngfifo36e2_n_173 ,\gf36e2_inst.sngfifo36e2_n_174 ,\gf36e2_inst.sngfifo36e2_n_175 }),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(dbiterr_col),
        .DIN(din[63:0]),
        .DINP(din[71:64]),
        .DOUT(dout[63:0]),
        .DOUTP(dout[71:64]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_113_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(RD_EN),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(RDRSTBUSY),
        .REGCE(RD_EN),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(WR_EN),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(WRRSTBUSY));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_20
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [2:2]dbiterr_col;
  wire [71:0]din;
  wire [71:0]dout;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_168 ;
  wire \gf36e2_inst.sngfifo36e2_n_169 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_170 ;
  wire \gf36e2_inst.sngfifo36e2_n_171 ;
  wire \gf36e2_inst.sngfifo36e2_n_172 ;
  wire \gf36e2_inst.sngfifo36e2_n_173 ;
  wire \gf36e2_inst.sngfifo36e2_n_174 ;
  wire \gf36e2_inst.sngfifo36e2_n_175 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_40 ;
  wire \gf36e2_inst.sngfifo36e2_n_41 ;
  wire \gf36e2_inst.sngfifo36e2_n_42 ;
  wire \gf36e2_inst.sngfifo36e2_n_43 ;
  wire \gf36e2_inst.sngfifo36e2_n_44 ;
  wire \gf36e2_inst.sngfifo36e2_n_45 ;
  wire \gf36e2_inst.sngfifo36e2_n_46 ;
  wire \gf36e2_inst.sngfifo36e2_n_47 ;
  wire \gf36e2_inst.sngfifo36e2_n_48 ;
  wire \gf36e2_inst.sngfifo36e2_n_49 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_50 ;
  wire \gf36e2_inst.sngfifo36e2_n_51 ;
  wire \gf36e2_inst.sngfifo36e2_n_52 ;
  wire \gf36e2_inst.sngfifo36e2_n_53 ;
  wire \gf36e2_inst.sngfifo36e2_n_54 ;
  wire \gf36e2_inst.sngfifo36e2_n_55 ;
  wire \gf36e2_inst.sngfifo36e2_n_56 ;
  wire \gf36e2_inst.sngfifo36e2_n_57 ;
  wire \gf36e2_inst.sngfifo36e2_n_58 ;
  wire \gf36e2_inst.sngfifo36e2_n_59 ;
  wire \gf36e2_inst.sngfifo36e2_n_60 ;
  wire \gf36e2_inst.sngfifo36e2_n_61 ;
  wire \gf36e2_inst.sngfifo36e2_n_62 ;
  wire \gf36e2_inst.sngfifo36e2_n_63 ;
  wire \gf36e2_inst.sngfifo36e2_n_64 ;
  wire \gf36e2_inst.sngfifo36e2_n_65 ;
  wire \gf36e2_inst.sngfifo36e2_n_66 ;
  wire \gf36e2_inst.sngfifo36e2_n_67 ;
  wire \gf36e2_inst.sngfifo36e2_n_68 ;
  wire \gf36e2_inst.sngfifo36e2_n_69 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_70 ;
  wire \gf36e2_inst.sngfifo36e2_n_71 ;
  wire \gf36e2_inst.sngfifo36e2_n_72 ;
  wire \gf36e2_inst.sngfifo36e2_n_73 ;
  wire \gf36e2_inst.sngfifo36e2_n_74 ;
  wire \gf36e2_inst.sngfifo36e2_n_75 ;
  wire \gf36e2_inst.sngfifo36e2_n_76 ;
  wire \gf36e2_inst.sngfifo36e2_n_77 ;
  wire \gf36e2_inst.sngfifo36e2_n_78 ;
  wire \gf36e2_inst.sngfifo36e2_n_79 ;
  wire \gf36e2_inst.sngfifo36e2_n_80 ;
  wire \gf36e2_inst.sngfifo36e2_n_81 ;
  wire \gf36e2_inst.sngfifo36e2_n_82 ;
  wire \gf36e2_inst.sngfifo36e2_n_83 ;
  wire \gf36e2_inst.sngfifo36e2_n_84 ;
  wire \gf36e2_inst.sngfifo36e2_n_85 ;
  wire \gf36e2_inst.sngfifo36e2_n_86 ;
  wire \gf36e2_inst.sngfifo36e2_n_87 ;
  wire \gf36e2_inst.sngfifo36e2_n_88 ;
  wire \gf36e2_inst.sngfifo36e2_n_89 ;
  wire \gf36e2_inst.sngfifo36e2_n_90 ;
  wire \gf36e2_inst.sngfifo36e2_n_91 ;
  wire \gf36e2_inst.sngfifo36e2_n_92 ;
  wire \gf36e2_inst.sngfifo36e2_n_93 ;
  wire \gf36e2_inst.sngfifo36e2_n_94 ;
  wire \gf36e2_inst.sngfifo36e2_n_95 ;
  wire \gf36e2_inst.sngfifo36e2_n_96 ;
  wire \gf36e2_inst.sngfifo36e2_n_97 ;
  wire \gf36e2_inst.sngfifo36e2_n_98 ;
  wire \gf36e2_inst.sngfifo36e2_n_99 ;
  wire p_122_out;
  wire rd_clk;
  wire [2:2]sbiterr_col;
  wire srst;
  wire wr_clk;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("FALSE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(511),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(72),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(72)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\gf36e2_inst.sngfifo36e2_n_40 ,\gf36e2_inst.sngfifo36e2_n_41 ,\gf36e2_inst.sngfifo36e2_n_42 ,\gf36e2_inst.sngfifo36e2_n_43 ,\gf36e2_inst.sngfifo36e2_n_44 ,\gf36e2_inst.sngfifo36e2_n_45 ,\gf36e2_inst.sngfifo36e2_n_46 ,\gf36e2_inst.sngfifo36e2_n_47 ,\gf36e2_inst.sngfifo36e2_n_48 ,\gf36e2_inst.sngfifo36e2_n_49 ,\gf36e2_inst.sngfifo36e2_n_50 ,\gf36e2_inst.sngfifo36e2_n_51 ,\gf36e2_inst.sngfifo36e2_n_52 ,\gf36e2_inst.sngfifo36e2_n_53 ,\gf36e2_inst.sngfifo36e2_n_54 ,\gf36e2_inst.sngfifo36e2_n_55 ,\gf36e2_inst.sngfifo36e2_n_56 ,\gf36e2_inst.sngfifo36e2_n_57 ,\gf36e2_inst.sngfifo36e2_n_58 ,\gf36e2_inst.sngfifo36e2_n_59 ,\gf36e2_inst.sngfifo36e2_n_60 ,\gf36e2_inst.sngfifo36e2_n_61 ,\gf36e2_inst.sngfifo36e2_n_62 ,\gf36e2_inst.sngfifo36e2_n_63 ,\gf36e2_inst.sngfifo36e2_n_64 ,\gf36e2_inst.sngfifo36e2_n_65 ,\gf36e2_inst.sngfifo36e2_n_66 ,\gf36e2_inst.sngfifo36e2_n_67 ,\gf36e2_inst.sngfifo36e2_n_68 ,\gf36e2_inst.sngfifo36e2_n_69 ,\gf36e2_inst.sngfifo36e2_n_70 ,\gf36e2_inst.sngfifo36e2_n_71 ,\gf36e2_inst.sngfifo36e2_n_72 ,\gf36e2_inst.sngfifo36e2_n_73 ,\gf36e2_inst.sngfifo36e2_n_74 ,\gf36e2_inst.sngfifo36e2_n_75 ,\gf36e2_inst.sngfifo36e2_n_76 ,\gf36e2_inst.sngfifo36e2_n_77 ,\gf36e2_inst.sngfifo36e2_n_78 ,\gf36e2_inst.sngfifo36e2_n_79 ,\gf36e2_inst.sngfifo36e2_n_80 ,\gf36e2_inst.sngfifo36e2_n_81 ,\gf36e2_inst.sngfifo36e2_n_82 ,\gf36e2_inst.sngfifo36e2_n_83 ,\gf36e2_inst.sngfifo36e2_n_84 ,\gf36e2_inst.sngfifo36e2_n_85 ,\gf36e2_inst.sngfifo36e2_n_86 ,\gf36e2_inst.sngfifo36e2_n_87 ,\gf36e2_inst.sngfifo36e2_n_88 ,\gf36e2_inst.sngfifo36e2_n_89 ,\gf36e2_inst.sngfifo36e2_n_90 ,\gf36e2_inst.sngfifo36e2_n_91 ,\gf36e2_inst.sngfifo36e2_n_92 ,\gf36e2_inst.sngfifo36e2_n_93 ,\gf36e2_inst.sngfifo36e2_n_94 ,\gf36e2_inst.sngfifo36e2_n_95 ,\gf36e2_inst.sngfifo36e2_n_96 ,\gf36e2_inst.sngfifo36e2_n_97 ,\gf36e2_inst.sngfifo36e2_n_98 ,\gf36e2_inst.sngfifo36e2_n_99 ,\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP({\gf36e2_inst.sngfifo36e2_n_168 ,\gf36e2_inst.sngfifo36e2_n_169 ,\gf36e2_inst.sngfifo36e2_n_170 ,\gf36e2_inst.sngfifo36e2_n_171 ,\gf36e2_inst.sngfifo36e2_n_172 ,\gf36e2_inst.sngfifo36e2_n_173 ,\gf36e2_inst.sngfifo36e2_n_174 ,\gf36e2_inst.sngfifo36e2_n_175 }),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(dbiterr_col),
        .DIN(din[63:0]),
        .DINP(din[71:64]),
        .DOUT(dout[63:0]),
        .DOUTP(dout[71:64]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_122_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(RD_EN),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(RDRSTBUSY),
        .REGCE(RD_EN),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(WR_EN),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(WRRSTBUSY));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_21
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk_0,
    rd_clk_1,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din,
    \gf36e2_inst.sngfifo36e2_i_2 ,
    \gf36e2_inst.sngfifo36e2_i_2_0 ,
    \gf36e2_inst.sngfifo36e2_i_1 ,
    \gf36e2_inst.sngfifo36e2_i_1_0 );
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  output rd_clk_0;
  output rd_clk_1;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;
  input \gf36e2_inst.sngfifo36e2_i_2 ;
  input \gf36e2_inst.sngfifo36e2_i_2_0 ;
  input \gf36e2_inst.sngfifo36e2_i_1 ;
  input \gf36e2_inst.sngfifo36e2_i_1_0 ;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [1:1]dbiterr_col;
  wire [71:0]din;
  wire [71:0]dout;
  wire \gf36e2_inst.sngfifo36e2_i_1 ;
  wire \gf36e2_inst.sngfifo36e2_i_1_0 ;
  wire \gf36e2_inst.sngfifo36e2_i_2 ;
  wire \gf36e2_inst.sngfifo36e2_i_2_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_168 ;
  wire \gf36e2_inst.sngfifo36e2_n_169 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_170 ;
  wire \gf36e2_inst.sngfifo36e2_n_171 ;
  wire \gf36e2_inst.sngfifo36e2_n_172 ;
  wire \gf36e2_inst.sngfifo36e2_n_173 ;
  wire \gf36e2_inst.sngfifo36e2_n_174 ;
  wire \gf36e2_inst.sngfifo36e2_n_175 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_40 ;
  wire \gf36e2_inst.sngfifo36e2_n_41 ;
  wire \gf36e2_inst.sngfifo36e2_n_42 ;
  wire \gf36e2_inst.sngfifo36e2_n_43 ;
  wire \gf36e2_inst.sngfifo36e2_n_44 ;
  wire \gf36e2_inst.sngfifo36e2_n_45 ;
  wire \gf36e2_inst.sngfifo36e2_n_46 ;
  wire \gf36e2_inst.sngfifo36e2_n_47 ;
  wire \gf36e2_inst.sngfifo36e2_n_48 ;
  wire \gf36e2_inst.sngfifo36e2_n_49 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_50 ;
  wire \gf36e2_inst.sngfifo36e2_n_51 ;
  wire \gf36e2_inst.sngfifo36e2_n_52 ;
  wire \gf36e2_inst.sngfifo36e2_n_53 ;
  wire \gf36e2_inst.sngfifo36e2_n_54 ;
  wire \gf36e2_inst.sngfifo36e2_n_55 ;
  wire \gf36e2_inst.sngfifo36e2_n_56 ;
  wire \gf36e2_inst.sngfifo36e2_n_57 ;
  wire \gf36e2_inst.sngfifo36e2_n_58 ;
  wire \gf36e2_inst.sngfifo36e2_n_59 ;
  wire \gf36e2_inst.sngfifo36e2_n_60 ;
  wire \gf36e2_inst.sngfifo36e2_n_61 ;
  wire \gf36e2_inst.sngfifo36e2_n_62 ;
  wire \gf36e2_inst.sngfifo36e2_n_63 ;
  wire \gf36e2_inst.sngfifo36e2_n_64 ;
  wire \gf36e2_inst.sngfifo36e2_n_65 ;
  wire \gf36e2_inst.sngfifo36e2_n_66 ;
  wire \gf36e2_inst.sngfifo36e2_n_67 ;
  wire \gf36e2_inst.sngfifo36e2_n_68 ;
  wire \gf36e2_inst.sngfifo36e2_n_69 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_70 ;
  wire \gf36e2_inst.sngfifo36e2_n_71 ;
  wire \gf36e2_inst.sngfifo36e2_n_72 ;
  wire \gf36e2_inst.sngfifo36e2_n_73 ;
  wire \gf36e2_inst.sngfifo36e2_n_74 ;
  wire \gf36e2_inst.sngfifo36e2_n_75 ;
  wire \gf36e2_inst.sngfifo36e2_n_76 ;
  wire \gf36e2_inst.sngfifo36e2_n_77 ;
  wire \gf36e2_inst.sngfifo36e2_n_78 ;
  wire \gf36e2_inst.sngfifo36e2_n_79 ;
  wire \gf36e2_inst.sngfifo36e2_n_80 ;
  wire \gf36e2_inst.sngfifo36e2_n_81 ;
  wire \gf36e2_inst.sngfifo36e2_n_82 ;
  wire \gf36e2_inst.sngfifo36e2_n_83 ;
  wire \gf36e2_inst.sngfifo36e2_n_84 ;
  wire \gf36e2_inst.sngfifo36e2_n_85 ;
  wire \gf36e2_inst.sngfifo36e2_n_86 ;
  wire \gf36e2_inst.sngfifo36e2_n_87 ;
  wire \gf36e2_inst.sngfifo36e2_n_88 ;
  wire \gf36e2_inst.sngfifo36e2_n_89 ;
  wire \gf36e2_inst.sngfifo36e2_n_90 ;
  wire \gf36e2_inst.sngfifo36e2_n_91 ;
  wire \gf36e2_inst.sngfifo36e2_n_92 ;
  wire \gf36e2_inst.sngfifo36e2_n_93 ;
  wire \gf36e2_inst.sngfifo36e2_n_94 ;
  wire \gf36e2_inst.sngfifo36e2_n_95 ;
  wire \gf36e2_inst.sngfifo36e2_n_96 ;
  wire \gf36e2_inst.sngfifo36e2_n_97 ;
  wire \gf36e2_inst.sngfifo36e2_n_98 ;
  wire \gf36e2_inst.sngfifo36e2_n_99 ;
  wire p_131_out;
  wire rd_clk;
  wire rd_clk_0;
  wire rd_clk_1;
  wire [1:1]sbiterr_col;
  wire srst;
  wire wr_clk;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("FALSE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(511),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(72),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(72)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\gf36e2_inst.sngfifo36e2_n_40 ,\gf36e2_inst.sngfifo36e2_n_41 ,\gf36e2_inst.sngfifo36e2_n_42 ,\gf36e2_inst.sngfifo36e2_n_43 ,\gf36e2_inst.sngfifo36e2_n_44 ,\gf36e2_inst.sngfifo36e2_n_45 ,\gf36e2_inst.sngfifo36e2_n_46 ,\gf36e2_inst.sngfifo36e2_n_47 ,\gf36e2_inst.sngfifo36e2_n_48 ,\gf36e2_inst.sngfifo36e2_n_49 ,\gf36e2_inst.sngfifo36e2_n_50 ,\gf36e2_inst.sngfifo36e2_n_51 ,\gf36e2_inst.sngfifo36e2_n_52 ,\gf36e2_inst.sngfifo36e2_n_53 ,\gf36e2_inst.sngfifo36e2_n_54 ,\gf36e2_inst.sngfifo36e2_n_55 ,\gf36e2_inst.sngfifo36e2_n_56 ,\gf36e2_inst.sngfifo36e2_n_57 ,\gf36e2_inst.sngfifo36e2_n_58 ,\gf36e2_inst.sngfifo36e2_n_59 ,\gf36e2_inst.sngfifo36e2_n_60 ,\gf36e2_inst.sngfifo36e2_n_61 ,\gf36e2_inst.sngfifo36e2_n_62 ,\gf36e2_inst.sngfifo36e2_n_63 ,\gf36e2_inst.sngfifo36e2_n_64 ,\gf36e2_inst.sngfifo36e2_n_65 ,\gf36e2_inst.sngfifo36e2_n_66 ,\gf36e2_inst.sngfifo36e2_n_67 ,\gf36e2_inst.sngfifo36e2_n_68 ,\gf36e2_inst.sngfifo36e2_n_69 ,\gf36e2_inst.sngfifo36e2_n_70 ,\gf36e2_inst.sngfifo36e2_n_71 ,\gf36e2_inst.sngfifo36e2_n_72 ,\gf36e2_inst.sngfifo36e2_n_73 ,\gf36e2_inst.sngfifo36e2_n_74 ,\gf36e2_inst.sngfifo36e2_n_75 ,\gf36e2_inst.sngfifo36e2_n_76 ,\gf36e2_inst.sngfifo36e2_n_77 ,\gf36e2_inst.sngfifo36e2_n_78 ,\gf36e2_inst.sngfifo36e2_n_79 ,\gf36e2_inst.sngfifo36e2_n_80 ,\gf36e2_inst.sngfifo36e2_n_81 ,\gf36e2_inst.sngfifo36e2_n_82 ,\gf36e2_inst.sngfifo36e2_n_83 ,\gf36e2_inst.sngfifo36e2_n_84 ,\gf36e2_inst.sngfifo36e2_n_85 ,\gf36e2_inst.sngfifo36e2_n_86 ,\gf36e2_inst.sngfifo36e2_n_87 ,\gf36e2_inst.sngfifo36e2_n_88 ,\gf36e2_inst.sngfifo36e2_n_89 ,\gf36e2_inst.sngfifo36e2_n_90 ,\gf36e2_inst.sngfifo36e2_n_91 ,\gf36e2_inst.sngfifo36e2_n_92 ,\gf36e2_inst.sngfifo36e2_n_93 ,\gf36e2_inst.sngfifo36e2_n_94 ,\gf36e2_inst.sngfifo36e2_n_95 ,\gf36e2_inst.sngfifo36e2_n_96 ,\gf36e2_inst.sngfifo36e2_n_97 ,\gf36e2_inst.sngfifo36e2_n_98 ,\gf36e2_inst.sngfifo36e2_n_99 ,\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP({\gf36e2_inst.sngfifo36e2_n_168 ,\gf36e2_inst.sngfifo36e2_n_169 ,\gf36e2_inst.sngfifo36e2_n_170 ,\gf36e2_inst.sngfifo36e2_n_171 ,\gf36e2_inst.sngfifo36e2_n_172 ,\gf36e2_inst.sngfifo36e2_n_173 ,\gf36e2_inst.sngfifo36e2_n_174 ,\gf36e2_inst.sngfifo36e2_n_175 }),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(dbiterr_col),
        .DIN(din[63:0]),
        .DINP(din[71:64]),
        .DOUT(dout[63:0]),
        .DOUTP(dout[71:64]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_131_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(RD_EN),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(RDRSTBUSY),
        .REGCE(RD_EN),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(WR_EN),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(WRRSTBUSY));
  LUT3 #(
    .INIT(8'hFE)) 
    \gf36e2_inst.sngfifo36e2_i_3 
       (.I0(EMPTY),
        .I1(\gf36e2_inst.sngfifo36e2_i_1 ),
        .I2(\gf36e2_inst.sngfifo36e2_i_1_0 ),
        .O(rd_clk_1));
  LUT3 #(
    .INIT(8'hFE)) 
    \gf36e2_inst.sngfifo36e2_i_4 
       (.I0(FULL),
        .I1(\gf36e2_inst.sngfifo36e2_i_2 ),
        .I2(\gf36e2_inst.sngfifo36e2_i_2_0 ),
        .O(rd_clk_0));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_22
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [15:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [15:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [15:15]dbiterr_col;
  wire [15:0]din;
  wire [15:0]dout;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_104 ;
  wire \gf36e2_inst.sngfifo36e2_n_105 ;
  wire \gf36e2_inst.sngfifo36e2_n_106 ;
  wire \gf36e2_inst.sngfifo36e2_n_107 ;
  wire \gf36e2_inst.sngfifo36e2_n_108 ;
  wire \gf36e2_inst.sngfifo36e2_n_109 ;
  wire \gf36e2_inst.sngfifo36e2_n_110 ;
  wire \gf36e2_inst.sngfifo36e2_n_111 ;
  wire \gf36e2_inst.sngfifo36e2_n_112 ;
  wire \gf36e2_inst.sngfifo36e2_n_113 ;
  wire \gf36e2_inst.sngfifo36e2_n_114 ;
  wire \gf36e2_inst.sngfifo36e2_n_115 ;
  wire \gf36e2_inst.sngfifo36e2_n_116 ;
  wire \gf36e2_inst.sngfifo36e2_n_117 ;
  wire \gf36e2_inst.sngfifo36e2_n_118 ;
  wire \gf36e2_inst.sngfifo36e2_n_119 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_120 ;
  wire \gf36e2_inst.sngfifo36e2_n_121 ;
  wire \gf36e2_inst.sngfifo36e2_n_122 ;
  wire \gf36e2_inst.sngfifo36e2_n_123 ;
  wire \gf36e2_inst.sngfifo36e2_n_124 ;
  wire \gf36e2_inst.sngfifo36e2_n_125 ;
  wire \gf36e2_inst.sngfifo36e2_n_126 ;
  wire \gf36e2_inst.sngfifo36e2_n_127 ;
  wire \gf36e2_inst.sngfifo36e2_n_128 ;
  wire \gf36e2_inst.sngfifo36e2_n_129 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_130 ;
  wire \gf36e2_inst.sngfifo36e2_n_131 ;
  wire \gf36e2_inst.sngfifo36e2_n_132 ;
  wire \gf36e2_inst.sngfifo36e2_n_133 ;
  wire \gf36e2_inst.sngfifo36e2_n_134 ;
  wire \gf36e2_inst.sngfifo36e2_n_135 ;
  wire \gf36e2_inst.sngfifo36e2_n_136 ;
  wire \gf36e2_inst.sngfifo36e2_n_137 ;
  wire \gf36e2_inst.sngfifo36e2_n_138 ;
  wire \gf36e2_inst.sngfifo36e2_n_139 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_140 ;
  wire \gf36e2_inst.sngfifo36e2_n_141 ;
  wire \gf36e2_inst.sngfifo36e2_n_142 ;
  wire \gf36e2_inst.sngfifo36e2_n_143 ;
  wire \gf36e2_inst.sngfifo36e2_n_144 ;
  wire \gf36e2_inst.sngfifo36e2_n_145 ;
  wire \gf36e2_inst.sngfifo36e2_n_146 ;
  wire \gf36e2_inst.sngfifo36e2_n_147 ;
  wire \gf36e2_inst.sngfifo36e2_n_148 ;
  wire \gf36e2_inst.sngfifo36e2_n_149 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_150 ;
  wire \gf36e2_inst.sngfifo36e2_n_151 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_168 ;
  wire \gf36e2_inst.sngfifo36e2_n_169 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_170 ;
  wire \gf36e2_inst.sngfifo36e2_n_171 ;
  wire \gf36e2_inst.sngfifo36e2_n_172 ;
  wire \gf36e2_inst.sngfifo36e2_n_173 ;
  wire \gf36e2_inst.sngfifo36e2_n_174 ;
  wire \gf36e2_inst.sngfifo36e2_n_175 ;
  wire \gf36e2_inst.sngfifo36e2_n_176 ;
  wire \gf36e2_inst.sngfifo36e2_n_177 ;
  wire \gf36e2_inst.sngfifo36e2_n_178 ;
  wire \gf36e2_inst.sngfifo36e2_n_179 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_180 ;
  wire \gf36e2_inst.sngfifo36e2_n_181 ;
  wire \gf36e2_inst.sngfifo36e2_n_182 ;
  wire \gf36e2_inst.sngfifo36e2_n_183 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_40 ;
  wire \gf36e2_inst.sngfifo36e2_n_41 ;
  wire \gf36e2_inst.sngfifo36e2_n_42 ;
  wire \gf36e2_inst.sngfifo36e2_n_43 ;
  wire \gf36e2_inst.sngfifo36e2_n_44 ;
  wire \gf36e2_inst.sngfifo36e2_n_45 ;
  wire \gf36e2_inst.sngfifo36e2_n_46 ;
  wire \gf36e2_inst.sngfifo36e2_n_47 ;
  wire \gf36e2_inst.sngfifo36e2_n_48 ;
  wire \gf36e2_inst.sngfifo36e2_n_49 ;
  wire \gf36e2_inst.sngfifo36e2_n_50 ;
  wire \gf36e2_inst.sngfifo36e2_n_51 ;
  wire \gf36e2_inst.sngfifo36e2_n_52 ;
  wire \gf36e2_inst.sngfifo36e2_n_53 ;
  wire \gf36e2_inst.sngfifo36e2_n_54 ;
  wire \gf36e2_inst.sngfifo36e2_n_55 ;
  wire \gf36e2_inst.sngfifo36e2_n_56 ;
  wire \gf36e2_inst.sngfifo36e2_n_57 ;
  wire \gf36e2_inst.sngfifo36e2_n_58 ;
  wire \gf36e2_inst.sngfifo36e2_n_59 ;
  wire \gf36e2_inst.sngfifo36e2_n_60 ;
  wire \gf36e2_inst.sngfifo36e2_n_61 ;
  wire \gf36e2_inst.sngfifo36e2_n_62 ;
  wire \gf36e2_inst.sngfifo36e2_n_63 ;
  wire \gf36e2_inst.sngfifo36e2_n_64 ;
  wire \gf36e2_inst.sngfifo36e2_n_65 ;
  wire \gf36e2_inst.sngfifo36e2_n_66 ;
  wire \gf36e2_inst.sngfifo36e2_n_67 ;
  wire \gf36e2_inst.sngfifo36e2_n_68 ;
  wire \gf36e2_inst.sngfifo36e2_n_69 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_70 ;
  wire \gf36e2_inst.sngfifo36e2_n_71 ;
  wire \gf36e2_inst.sngfifo36e2_n_72 ;
  wire \gf36e2_inst.sngfifo36e2_n_73 ;
  wire \gf36e2_inst.sngfifo36e2_n_74 ;
  wire \gf36e2_inst.sngfifo36e2_n_75 ;
  wire \gf36e2_inst.sngfifo36e2_n_76 ;
  wire \gf36e2_inst.sngfifo36e2_n_77 ;
  wire \gf36e2_inst.sngfifo36e2_n_78 ;
  wire \gf36e2_inst.sngfifo36e2_n_79 ;
  wire \gf36e2_inst.sngfifo36e2_n_80 ;
  wire \gf36e2_inst.sngfifo36e2_n_81 ;
  wire \gf36e2_inst.sngfifo36e2_n_82 ;
  wire \gf36e2_inst.sngfifo36e2_n_83 ;
  wire \gf36e2_inst.sngfifo36e2_n_84 ;
  wire \gf36e2_inst.sngfifo36e2_n_85 ;
  wire \gf36e2_inst.sngfifo36e2_n_86 ;
  wire \gf36e2_inst.sngfifo36e2_n_87 ;
  wire \gf36e2_inst.sngfifo36e2_n_88 ;
  wire \gf36e2_inst.sngfifo36e2_n_89 ;
  wire \gf36e2_inst.sngfifo36e2_n_90 ;
  wire \gf36e2_inst.sngfifo36e2_n_91 ;
  wire \gf36e2_inst.sngfifo36e2_n_92 ;
  wire \gf36e2_inst.sngfifo36e2_n_93 ;
  wire \gf36e2_inst.sngfifo36e2_n_94 ;
  wire \gf36e2_inst.sngfifo36e2_n_95 ;
  wire \gf36e2_inst.sngfifo36e2_n_96 ;
  wire \gf36e2_inst.sngfifo36e2_n_97 ;
  wire \gf36e2_inst.sngfifo36e2_n_98 ;
  wire \gf36e2_inst.sngfifo36e2_n_99 ;
  wire p_4_out;
  wire p_5_out;
  wire rd_clk;
  wire [15:15]sbiterr_col;
  wire srst;
  wire wr_clk;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("FALSE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(511),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(72),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(72)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\gf36e2_inst.sngfifo36e2_n_40 ,\gf36e2_inst.sngfifo36e2_n_41 ,\gf36e2_inst.sngfifo36e2_n_42 ,\gf36e2_inst.sngfifo36e2_n_43 ,\gf36e2_inst.sngfifo36e2_n_44 ,\gf36e2_inst.sngfifo36e2_n_45 ,\gf36e2_inst.sngfifo36e2_n_46 ,\gf36e2_inst.sngfifo36e2_n_47 ,\gf36e2_inst.sngfifo36e2_n_48 ,\gf36e2_inst.sngfifo36e2_n_49 ,\gf36e2_inst.sngfifo36e2_n_50 ,\gf36e2_inst.sngfifo36e2_n_51 ,\gf36e2_inst.sngfifo36e2_n_52 ,\gf36e2_inst.sngfifo36e2_n_53 ,\gf36e2_inst.sngfifo36e2_n_54 ,\gf36e2_inst.sngfifo36e2_n_55 ,\gf36e2_inst.sngfifo36e2_n_56 ,\gf36e2_inst.sngfifo36e2_n_57 ,\gf36e2_inst.sngfifo36e2_n_58 ,\gf36e2_inst.sngfifo36e2_n_59 ,\gf36e2_inst.sngfifo36e2_n_60 ,\gf36e2_inst.sngfifo36e2_n_61 ,\gf36e2_inst.sngfifo36e2_n_62 ,\gf36e2_inst.sngfifo36e2_n_63 ,\gf36e2_inst.sngfifo36e2_n_64 ,\gf36e2_inst.sngfifo36e2_n_65 ,\gf36e2_inst.sngfifo36e2_n_66 ,\gf36e2_inst.sngfifo36e2_n_67 ,\gf36e2_inst.sngfifo36e2_n_68 ,\gf36e2_inst.sngfifo36e2_n_69 ,\gf36e2_inst.sngfifo36e2_n_70 ,\gf36e2_inst.sngfifo36e2_n_71 ,\gf36e2_inst.sngfifo36e2_n_72 ,\gf36e2_inst.sngfifo36e2_n_73 ,\gf36e2_inst.sngfifo36e2_n_74 ,\gf36e2_inst.sngfifo36e2_n_75 ,\gf36e2_inst.sngfifo36e2_n_76 ,\gf36e2_inst.sngfifo36e2_n_77 ,\gf36e2_inst.sngfifo36e2_n_78 ,\gf36e2_inst.sngfifo36e2_n_79 ,\gf36e2_inst.sngfifo36e2_n_80 ,\gf36e2_inst.sngfifo36e2_n_81 ,\gf36e2_inst.sngfifo36e2_n_82 ,\gf36e2_inst.sngfifo36e2_n_83 ,\gf36e2_inst.sngfifo36e2_n_84 ,\gf36e2_inst.sngfifo36e2_n_85 ,\gf36e2_inst.sngfifo36e2_n_86 ,\gf36e2_inst.sngfifo36e2_n_87 ,\gf36e2_inst.sngfifo36e2_n_88 ,\gf36e2_inst.sngfifo36e2_n_89 ,\gf36e2_inst.sngfifo36e2_n_90 ,\gf36e2_inst.sngfifo36e2_n_91 ,\gf36e2_inst.sngfifo36e2_n_92 ,\gf36e2_inst.sngfifo36e2_n_93 ,\gf36e2_inst.sngfifo36e2_n_94 ,\gf36e2_inst.sngfifo36e2_n_95 ,\gf36e2_inst.sngfifo36e2_n_96 ,\gf36e2_inst.sngfifo36e2_n_97 ,\gf36e2_inst.sngfifo36e2_n_98 ,\gf36e2_inst.sngfifo36e2_n_99 ,\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP({\gf36e2_inst.sngfifo36e2_n_168 ,\gf36e2_inst.sngfifo36e2_n_169 ,\gf36e2_inst.sngfifo36e2_n_170 ,\gf36e2_inst.sngfifo36e2_n_171 ,\gf36e2_inst.sngfifo36e2_n_172 ,\gf36e2_inst.sngfifo36e2_n_173 ,\gf36e2_inst.sngfifo36e2_n_174 ,\gf36e2_inst.sngfifo36e2_n_175 }),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(dbiterr_col),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\gf36e2_inst.sngfifo36e2_n_104 ,\gf36e2_inst.sngfifo36e2_n_105 ,\gf36e2_inst.sngfifo36e2_n_106 ,\gf36e2_inst.sngfifo36e2_n_107 ,\gf36e2_inst.sngfifo36e2_n_108 ,\gf36e2_inst.sngfifo36e2_n_109 ,\gf36e2_inst.sngfifo36e2_n_110 ,\gf36e2_inst.sngfifo36e2_n_111 ,\gf36e2_inst.sngfifo36e2_n_112 ,\gf36e2_inst.sngfifo36e2_n_113 ,\gf36e2_inst.sngfifo36e2_n_114 ,\gf36e2_inst.sngfifo36e2_n_115 ,\gf36e2_inst.sngfifo36e2_n_116 ,\gf36e2_inst.sngfifo36e2_n_117 ,\gf36e2_inst.sngfifo36e2_n_118 ,\gf36e2_inst.sngfifo36e2_n_119 ,\gf36e2_inst.sngfifo36e2_n_120 ,\gf36e2_inst.sngfifo36e2_n_121 ,\gf36e2_inst.sngfifo36e2_n_122 ,\gf36e2_inst.sngfifo36e2_n_123 ,\gf36e2_inst.sngfifo36e2_n_124 ,\gf36e2_inst.sngfifo36e2_n_125 ,\gf36e2_inst.sngfifo36e2_n_126 ,\gf36e2_inst.sngfifo36e2_n_127 ,\gf36e2_inst.sngfifo36e2_n_128 ,\gf36e2_inst.sngfifo36e2_n_129 ,\gf36e2_inst.sngfifo36e2_n_130 ,\gf36e2_inst.sngfifo36e2_n_131 ,\gf36e2_inst.sngfifo36e2_n_132 ,\gf36e2_inst.sngfifo36e2_n_133 ,\gf36e2_inst.sngfifo36e2_n_134 ,\gf36e2_inst.sngfifo36e2_n_135 ,\gf36e2_inst.sngfifo36e2_n_136 ,\gf36e2_inst.sngfifo36e2_n_137 ,\gf36e2_inst.sngfifo36e2_n_138 ,\gf36e2_inst.sngfifo36e2_n_139 ,\gf36e2_inst.sngfifo36e2_n_140 ,\gf36e2_inst.sngfifo36e2_n_141 ,\gf36e2_inst.sngfifo36e2_n_142 ,\gf36e2_inst.sngfifo36e2_n_143 ,\gf36e2_inst.sngfifo36e2_n_144 ,\gf36e2_inst.sngfifo36e2_n_145 ,\gf36e2_inst.sngfifo36e2_n_146 ,\gf36e2_inst.sngfifo36e2_n_147 ,\gf36e2_inst.sngfifo36e2_n_148 ,\gf36e2_inst.sngfifo36e2_n_149 ,\gf36e2_inst.sngfifo36e2_n_150 ,\gf36e2_inst.sngfifo36e2_n_151 ,dout}),
        .DOUTP({\gf36e2_inst.sngfifo36e2_n_176 ,\gf36e2_inst.sngfifo36e2_n_177 ,\gf36e2_inst.sngfifo36e2_n_178 ,\gf36e2_inst.sngfifo36e2_n_179 ,\gf36e2_inst.sngfifo36e2_n_180 ,\gf36e2_inst.sngfifo36e2_n_181 ,\gf36e2_inst.sngfifo36e2_n_182 ,\gf36e2_inst.sngfifo36e2_n_183 }),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(p_4_out),
        .PROGFULL(p_5_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(RD_EN),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(RDRSTBUSY),
        .REGCE(RD_EN),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(WR_EN),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(WRRSTBUSY));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_23
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [14:14]dbiterr_col;
  wire [71:0]din;
  wire [71:0]dout;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_168 ;
  wire \gf36e2_inst.sngfifo36e2_n_169 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_170 ;
  wire \gf36e2_inst.sngfifo36e2_n_171 ;
  wire \gf36e2_inst.sngfifo36e2_n_172 ;
  wire \gf36e2_inst.sngfifo36e2_n_173 ;
  wire \gf36e2_inst.sngfifo36e2_n_174 ;
  wire \gf36e2_inst.sngfifo36e2_n_175 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_40 ;
  wire \gf36e2_inst.sngfifo36e2_n_41 ;
  wire \gf36e2_inst.sngfifo36e2_n_42 ;
  wire \gf36e2_inst.sngfifo36e2_n_43 ;
  wire \gf36e2_inst.sngfifo36e2_n_44 ;
  wire \gf36e2_inst.sngfifo36e2_n_45 ;
  wire \gf36e2_inst.sngfifo36e2_n_46 ;
  wire \gf36e2_inst.sngfifo36e2_n_47 ;
  wire \gf36e2_inst.sngfifo36e2_n_48 ;
  wire \gf36e2_inst.sngfifo36e2_n_49 ;
  wire \gf36e2_inst.sngfifo36e2_n_50 ;
  wire \gf36e2_inst.sngfifo36e2_n_51 ;
  wire \gf36e2_inst.sngfifo36e2_n_52 ;
  wire \gf36e2_inst.sngfifo36e2_n_53 ;
  wire \gf36e2_inst.sngfifo36e2_n_54 ;
  wire \gf36e2_inst.sngfifo36e2_n_55 ;
  wire \gf36e2_inst.sngfifo36e2_n_56 ;
  wire \gf36e2_inst.sngfifo36e2_n_57 ;
  wire \gf36e2_inst.sngfifo36e2_n_58 ;
  wire \gf36e2_inst.sngfifo36e2_n_59 ;
  wire \gf36e2_inst.sngfifo36e2_n_60 ;
  wire \gf36e2_inst.sngfifo36e2_n_61 ;
  wire \gf36e2_inst.sngfifo36e2_n_62 ;
  wire \gf36e2_inst.sngfifo36e2_n_63 ;
  wire \gf36e2_inst.sngfifo36e2_n_64 ;
  wire \gf36e2_inst.sngfifo36e2_n_65 ;
  wire \gf36e2_inst.sngfifo36e2_n_66 ;
  wire \gf36e2_inst.sngfifo36e2_n_67 ;
  wire \gf36e2_inst.sngfifo36e2_n_68 ;
  wire \gf36e2_inst.sngfifo36e2_n_69 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_70 ;
  wire \gf36e2_inst.sngfifo36e2_n_71 ;
  wire \gf36e2_inst.sngfifo36e2_n_72 ;
  wire \gf36e2_inst.sngfifo36e2_n_73 ;
  wire \gf36e2_inst.sngfifo36e2_n_74 ;
  wire \gf36e2_inst.sngfifo36e2_n_75 ;
  wire \gf36e2_inst.sngfifo36e2_n_76 ;
  wire \gf36e2_inst.sngfifo36e2_n_77 ;
  wire \gf36e2_inst.sngfifo36e2_n_78 ;
  wire \gf36e2_inst.sngfifo36e2_n_79 ;
  wire \gf36e2_inst.sngfifo36e2_n_80 ;
  wire \gf36e2_inst.sngfifo36e2_n_81 ;
  wire \gf36e2_inst.sngfifo36e2_n_82 ;
  wire \gf36e2_inst.sngfifo36e2_n_83 ;
  wire \gf36e2_inst.sngfifo36e2_n_84 ;
  wire \gf36e2_inst.sngfifo36e2_n_85 ;
  wire \gf36e2_inst.sngfifo36e2_n_86 ;
  wire \gf36e2_inst.sngfifo36e2_n_87 ;
  wire \gf36e2_inst.sngfifo36e2_n_88 ;
  wire \gf36e2_inst.sngfifo36e2_n_89 ;
  wire \gf36e2_inst.sngfifo36e2_n_90 ;
  wire \gf36e2_inst.sngfifo36e2_n_91 ;
  wire \gf36e2_inst.sngfifo36e2_n_92 ;
  wire \gf36e2_inst.sngfifo36e2_n_93 ;
  wire \gf36e2_inst.sngfifo36e2_n_94 ;
  wire \gf36e2_inst.sngfifo36e2_n_95 ;
  wire \gf36e2_inst.sngfifo36e2_n_96 ;
  wire \gf36e2_inst.sngfifo36e2_n_97 ;
  wire \gf36e2_inst.sngfifo36e2_n_98 ;
  wire \gf36e2_inst.sngfifo36e2_n_99 ;
  wire p_13_out;
  wire p_14_out;
  wire rd_clk;
  wire [14:14]sbiterr_col;
  wire srst;
  wire wr_clk;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("FALSE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(511),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(72),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(72)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\gf36e2_inst.sngfifo36e2_n_40 ,\gf36e2_inst.sngfifo36e2_n_41 ,\gf36e2_inst.sngfifo36e2_n_42 ,\gf36e2_inst.sngfifo36e2_n_43 ,\gf36e2_inst.sngfifo36e2_n_44 ,\gf36e2_inst.sngfifo36e2_n_45 ,\gf36e2_inst.sngfifo36e2_n_46 ,\gf36e2_inst.sngfifo36e2_n_47 ,\gf36e2_inst.sngfifo36e2_n_48 ,\gf36e2_inst.sngfifo36e2_n_49 ,\gf36e2_inst.sngfifo36e2_n_50 ,\gf36e2_inst.sngfifo36e2_n_51 ,\gf36e2_inst.sngfifo36e2_n_52 ,\gf36e2_inst.sngfifo36e2_n_53 ,\gf36e2_inst.sngfifo36e2_n_54 ,\gf36e2_inst.sngfifo36e2_n_55 ,\gf36e2_inst.sngfifo36e2_n_56 ,\gf36e2_inst.sngfifo36e2_n_57 ,\gf36e2_inst.sngfifo36e2_n_58 ,\gf36e2_inst.sngfifo36e2_n_59 ,\gf36e2_inst.sngfifo36e2_n_60 ,\gf36e2_inst.sngfifo36e2_n_61 ,\gf36e2_inst.sngfifo36e2_n_62 ,\gf36e2_inst.sngfifo36e2_n_63 ,\gf36e2_inst.sngfifo36e2_n_64 ,\gf36e2_inst.sngfifo36e2_n_65 ,\gf36e2_inst.sngfifo36e2_n_66 ,\gf36e2_inst.sngfifo36e2_n_67 ,\gf36e2_inst.sngfifo36e2_n_68 ,\gf36e2_inst.sngfifo36e2_n_69 ,\gf36e2_inst.sngfifo36e2_n_70 ,\gf36e2_inst.sngfifo36e2_n_71 ,\gf36e2_inst.sngfifo36e2_n_72 ,\gf36e2_inst.sngfifo36e2_n_73 ,\gf36e2_inst.sngfifo36e2_n_74 ,\gf36e2_inst.sngfifo36e2_n_75 ,\gf36e2_inst.sngfifo36e2_n_76 ,\gf36e2_inst.sngfifo36e2_n_77 ,\gf36e2_inst.sngfifo36e2_n_78 ,\gf36e2_inst.sngfifo36e2_n_79 ,\gf36e2_inst.sngfifo36e2_n_80 ,\gf36e2_inst.sngfifo36e2_n_81 ,\gf36e2_inst.sngfifo36e2_n_82 ,\gf36e2_inst.sngfifo36e2_n_83 ,\gf36e2_inst.sngfifo36e2_n_84 ,\gf36e2_inst.sngfifo36e2_n_85 ,\gf36e2_inst.sngfifo36e2_n_86 ,\gf36e2_inst.sngfifo36e2_n_87 ,\gf36e2_inst.sngfifo36e2_n_88 ,\gf36e2_inst.sngfifo36e2_n_89 ,\gf36e2_inst.sngfifo36e2_n_90 ,\gf36e2_inst.sngfifo36e2_n_91 ,\gf36e2_inst.sngfifo36e2_n_92 ,\gf36e2_inst.sngfifo36e2_n_93 ,\gf36e2_inst.sngfifo36e2_n_94 ,\gf36e2_inst.sngfifo36e2_n_95 ,\gf36e2_inst.sngfifo36e2_n_96 ,\gf36e2_inst.sngfifo36e2_n_97 ,\gf36e2_inst.sngfifo36e2_n_98 ,\gf36e2_inst.sngfifo36e2_n_99 ,\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP({\gf36e2_inst.sngfifo36e2_n_168 ,\gf36e2_inst.sngfifo36e2_n_169 ,\gf36e2_inst.sngfifo36e2_n_170 ,\gf36e2_inst.sngfifo36e2_n_171 ,\gf36e2_inst.sngfifo36e2_n_172 ,\gf36e2_inst.sngfifo36e2_n_173 ,\gf36e2_inst.sngfifo36e2_n_174 ,\gf36e2_inst.sngfifo36e2_n_175 }),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(dbiterr_col),
        .DIN(din[63:0]),
        .DINP(din[71:64]),
        .DOUT(dout[63:0]),
        .DOUTP(dout[71:64]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(p_13_out),
        .PROGFULL(p_14_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(RD_EN),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(RDRSTBUSY),
        .REGCE(RD_EN),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(WR_EN),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(WRRSTBUSY));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_24
   (RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk_0,
    rd_clk_1,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din,
    FULL,
    full,
    full_0,
    EMPTY,
    empty,
    empty_0);
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  output rd_clk_0;
  output rd_clk_1;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;
  input FULL;
  input full;
  input full_0;
  input EMPTY;
  input empty;
  input empty_0;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [13:13]dbiterr_col;
  wire [71:0]din;
  wire [71:0]dout;
  wire empty;
  wire empty_0;
  wire full;
  wire full_0;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_168 ;
  wire \gf36e2_inst.sngfifo36e2_n_169 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_170 ;
  wire \gf36e2_inst.sngfifo36e2_n_171 ;
  wire \gf36e2_inst.sngfifo36e2_n_172 ;
  wire \gf36e2_inst.sngfifo36e2_n_173 ;
  wire \gf36e2_inst.sngfifo36e2_n_174 ;
  wire \gf36e2_inst.sngfifo36e2_n_175 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_40 ;
  wire \gf36e2_inst.sngfifo36e2_n_41 ;
  wire \gf36e2_inst.sngfifo36e2_n_42 ;
  wire \gf36e2_inst.sngfifo36e2_n_43 ;
  wire \gf36e2_inst.sngfifo36e2_n_44 ;
  wire \gf36e2_inst.sngfifo36e2_n_45 ;
  wire \gf36e2_inst.sngfifo36e2_n_46 ;
  wire \gf36e2_inst.sngfifo36e2_n_47 ;
  wire \gf36e2_inst.sngfifo36e2_n_48 ;
  wire \gf36e2_inst.sngfifo36e2_n_49 ;
  wire \gf36e2_inst.sngfifo36e2_n_50 ;
  wire \gf36e2_inst.sngfifo36e2_n_51 ;
  wire \gf36e2_inst.sngfifo36e2_n_52 ;
  wire \gf36e2_inst.sngfifo36e2_n_53 ;
  wire \gf36e2_inst.sngfifo36e2_n_54 ;
  wire \gf36e2_inst.sngfifo36e2_n_55 ;
  wire \gf36e2_inst.sngfifo36e2_n_56 ;
  wire \gf36e2_inst.sngfifo36e2_n_57 ;
  wire \gf36e2_inst.sngfifo36e2_n_58 ;
  wire \gf36e2_inst.sngfifo36e2_n_59 ;
  wire \gf36e2_inst.sngfifo36e2_n_60 ;
  wire \gf36e2_inst.sngfifo36e2_n_61 ;
  wire \gf36e2_inst.sngfifo36e2_n_62 ;
  wire \gf36e2_inst.sngfifo36e2_n_63 ;
  wire \gf36e2_inst.sngfifo36e2_n_64 ;
  wire \gf36e2_inst.sngfifo36e2_n_65 ;
  wire \gf36e2_inst.sngfifo36e2_n_66 ;
  wire \gf36e2_inst.sngfifo36e2_n_67 ;
  wire \gf36e2_inst.sngfifo36e2_n_68 ;
  wire \gf36e2_inst.sngfifo36e2_n_69 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_70 ;
  wire \gf36e2_inst.sngfifo36e2_n_71 ;
  wire \gf36e2_inst.sngfifo36e2_n_72 ;
  wire \gf36e2_inst.sngfifo36e2_n_73 ;
  wire \gf36e2_inst.sngfifo36e2_n_74 ;
  wire \gf36e2_inst.sngfifo36e2_n_75 ;
  wire \gf36e2_inst.sngfifo36e2_n_76 ;
  wire \gf36e2_inst.sngfifo36e2_n_77 ;
  wire \gf36e2_inst.sngfifo36e2_n_78 ;
  wire \gf36e2_inst.sngfifo36e2_n_79 ;
  wire \gf36e2_inst.sngfifo36e2_n_80 ;
  wire \gf36e2_inst.sngfifo36e2_n_81 ;
  wire \gf36e2_inst.sngfifo36e2_n_82 ;
  wire \gf36e2_inst.sngfifo36e2_n_83 ;
  wire \gf36e2_inst.sngfifo36e2_n_84 ;
  wire \gf36e2_inst.sngfifo36e2_n_85 ;
  wire \gf36e2_inst.sngfifo36e2_n_86 ;
  wire \gf36e2_inst.sngfifo36e2_n_87 ;
  wire \gf36e2_inst.sngfifo36e2_n_88 ;
  wire \gf36e2_inst.sngfifo36e2_n_89 ;
  wire \gf36e2_inst.sngfifo36e2_n_90 ;
  wire \gf36e2_inst.sngfifo36e2_n_91 ;
  wire \gf36e2_inst.sngfifo36e2_n_92 ;
  wire \gf36e2_inst.sngfifo36e2_n_93 ;
  wire \gf36e2_inst.sngfifo36e2_n_94 ;
  wire \gf36e2_inst.sngfifo36e2_n_95 ;
  wire \gf36e2_inst.sngfifo36e2_n_96 ;
  wire \gf36e2_inst.sngfifo36e2_n_97 ;
  wire \gf36e2_inst.sngfifo36e2_n_98 ;
  wire \gf36e2_inst.sngfifo36e2_n_99 ;
  wire p_22_out;
  wire p_23_out;
  wire p_24_out;
  wire p_25_out;
  wire rd_clk;
  wire rd_clk_0;
  wire rd_clk_1;
  wire [13:13]sbiterr_col;
  wire srst;
  wire wr_clk;

  LUT4 #(
    .INIT(16'hFFFE)) 
    empty_INST_0_i_2
       (.I0(p_24_out),
        .I1(EMPTY),
        .I2(empty),
        .I3(empty_0),
        .O(rd_clk_1));
  LUT4 #(
    .INIT(16'hFFFE)) 
    full_INST_0_i_2
       (.I0(p_25_out),
        .I1(FULL),
        .I2(full),
        .I3(full_0),
        .O(rd_clk_0));
  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("FALSE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(511),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(72),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(72)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\gf36e2_inst.sngfifo36e2_n_40 ,\gf36e2_inst.sngfifo36e2_n_41 ,\gf36e2_inst.sngfifo36e2_n_42 ,\gf36e2_inst.sngfifo36e2_n_43 ,\gf36e2_inst.sngfifo36e2_n_44 ,\gf36e2_inst.sngfifo36e2_n_45 ,\gf36e2_inst.sngfifo36e2_n_46 ,\gf36e2_inst.sngfifo36e2_n_47 ,\gf36e2_inst.sngfifo36e2_n_48 ,\gf36e2_inst.sngfifo36e2_n_49 ,\gf36e2_inst.sngfifo36e2_n_50 ,\gf36e2_inst.sngfifo36e2_n_51 ,\gf36e2_inst.sngfifo36e2_n_52 ,\gf36e2_inst.sngfifo36e2_n_53 ,\gf36e2_inst.sngfifo36e2_n_54 ,\gf36e2_inst.sngfifo36e2_n_55 ,\gf36e2_inst.sngfifo36e2_n_56 ,\gf36e2_inst.sngfifo36e2_n_57 ,\gf36e2_inst.sngfifo36e2_n_58 ,\gf36e2_inst.sngfifo36e2_n_59 ,\gf36e2_inst.sngfifo36e2_n_60 ,\gf36e2_inst.sngfifo36e2_n_61 ,\gf36e2_inst.sngfifo36e2_n_62 ,\gf36e2_inst.sngfifo36e2_n_63 ,\gf36e2_inst.sngfifo36e2_n_64 ,\gf36e2_inst.sngfifo36e2_n_65 ,\gf36e2_inst.sngfifo36e2_n_66 ,\gf36e2_inst.sngfifo36e2_n_67 ,\gf36e2_inst.sngfifo36e2_n_68 ,\gf36e2_inst.sngfifo36e2_n_69 ,\gf36e2_inst.sngfifo36e2_n_70 ,\gf36e2_inst.sngfifo36e2_n_71 ,\gf36e2_inst.sngfifo36e2_n_72 ,\gf36e2_inst.sngfifo36e2_n_73 ,\gf36e2_inst.sngfifo36e2_n_74 ,\gf36e2_inst.sngfifo36e2_n_75 ,\gf36e2_inst.sngfifo36e2_n_76 ,\gf36e2_inst.sngfifo36e2_n_77 ,\gf36e2_inst.sngfifo36e2_n_78 ,\gf36e2_inst.sngfifo36e2_n_79 ,\gf36e2_inst.sngfifo36e2_n_80 ,\gf36e2_inst.sngfifo36e2_n_81 ,\gf36e2_inst.sngfifo36e2_n_82 ,\gf36e2_inst.sngfifo36e2_n_83 ,\gf36e2_inst.sngfifo36e2_n_84 ,\gf36e2_inst.sngfifo36e2_n_85 ,\gf36e2_inst.sngfifo36e2_n_86 ,\gf36e2_inst.sngfifo36e2_n_87 ,\gf36e2_inst.sngfifo36e2_n_88 ,\gf36e2_inst.sngfifo36e2_n_89 ,\gf36e2_inst.sngfifo36e2_n_90 ,\gf36e2_inst.sngfifo36e2_n_91 ,\gf36e2_inst.sngfifo36e2_n_92 ,\gf36e2_inst.sngfifo36e2_n_93 ,\gf36e2_inst.sngfifo36e2_n_94 ,\gf36e2_inst.sngfifo36e2_n_95 ,\gf36e2_inst.sngfifo36e2_n_96 ,\gf36e2_inst.sngfifo36e2_n_97 ,\gf36e2_inst.sngfifo36e2_n_98 ,\gf36e2_inst.sngfifo36e2_n_99 ,\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP({\gf36e2_inst.sngfifo36e2_n_168 ,\gf36e2_inst.sngfifo36e2_n_169 ,\gf36e2_inst.sngfifo36e2_n_170 ,\gf36e2_inst.sngfifo36e2_n_171 ,\gf36e2_inst.sngfifo36e2_n_172 ,\gf36e2_inst.sngfifo36e2_n_173 ,\gf36e2_inst.sngfifo36e2_n_174 ,\gf36e2_inst.sngfifo36e2_n_175 }),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(dbiterr_col),
        .DIN(din[63:0]),
        .DINP(din[71:64]),
        .DOUT(dout[63:0]),
        .DOUTP(dout[71:64]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_24_out),
        .FULL(p_25_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(p_22_out),
        .PROGFULL(p_23_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(RD_EN),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(RDRSTBUSY),
        .REGCE(RD_EN),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(WR_EN),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(WRRSTBUSY));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_25
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [12:12]dbiterr_col;
  wire [71:0]din;
  wire [71:0]dout;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_168 ;
  wire \gf36e2_inst.sngfifo36e2_n_169 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_170 ;
  wire \gf36e2_inst.sngfifo36e2_n_171 ;
  wire \gf36e2_inst.sngfifo36e2_n_172 ;
  wire \gf36e2_inst.sngfifo36e2_n_173 ;
  wire \gf36e2_inst.sngfifo36e2_n_174 ;
  wire \gf36e2_inst.sngfifo36e2_n_175 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_40 ;
  wire \gf36e2_inst.sngfifo36e2_n_41 ;
  wire \gf36e2_inst.sngfifo36e2_n_42 ;
  wire \gf36e2_inst.sngfifo36e2_n_43 ;
  wire \gf36e2_inst.sngfifo36e2_n_44 ;
  wire \gf36e2_inst.sngfifo36e2_n_45 ;
  wire \gf36e2_inst.sngfifo36e2_n_46 ;
  wire \gf36e2_inst.sngfifo36e2_n_47 ;
  wire \gf36e2_inst.sngfifo36e2_n_48 ;
  wire \gf36e2_inst.sngfifo36e2_n_49 ;
  wire \gf36e2_inst.sngfifo36e2_n_50 ;
  wire \gf36e2_inst.sngfifo36e2_n_51 ;
  wire \gf36e2_inst.sngfifo36e2_n_52 ;
  wire \gf36e2_inst.sngfifo36e2_n_53 ;
  wire \gf36e2_inst.sngfifo36e2_n_54 ;
  wire \gf36e2_inst.sngfifo36e2_n_55 ;
  wire \gf36e2_inst.sngfifo36e2_n_56 ;
  wire \gf36e2_inst.sngfifo36e2_n_57 ;
  wire \gf36e2_inst.sngfifo36e2_n_58 ;
  wire \gf36e2_inst.sngfifo36e2_n_59 ;
  wire \gf36e2_inst.sngfifo36e2_n_60 ;
  wire \gf36e2_inst.sngfifo36e2_n_61 ;
  wire \gf36e2_inst.sngfifo36e2_n_62 ;
  wire \gf36e2_inst.sngfifo36e2_n_63 ;
  wire \gf36e2_inst.sngfifo36e2_n_64 ;
  wire \gf36e2_inst.sngfifo36e2_n_65 ;
  wire \gf36e2_inst.sngfifo36e2_n_66 ;
  wire \gf36e2_inst.sngfifo36e2_n_67 ;
  wire \gf36e2_inst.sngfifo36e2_n_68 ;
  wire \gf36e2_inst.sngfifo36e2_n_69 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_70 ;
  wire \gf36e2_inst.sngfifo36e2_n_71 ;
  wire \gf36e2_inst.sngfifo36e2_n_72 ;
  wire \gf36e2_inst.sngfifo36e2_n_73 ;
  wire \gf36e2_inst.sngfifo36e2_n_74 ;
  wire \gf36e2_inst.sngfifo36e2_n_75 ;
  wire \gf36e2_inst.sngfifo36e2_n_76 ;
  wire \gf36e2_inst.sngfifo36e2_n_77 ;
  wire \gf36e2_inst.sngfifo36e2_n_78 ;
  wire \gf36e2_inst.sngfifo36e2_n_79 ;
  wire \gf36e2_inst.sngfifo36e2_n_80 ;
  wire \gf36e2_inst.sngfifo36e2_n_81 ;
  wire \gf36e2_inst.sngfifo36e2_n_82 ;
  wire \gf36e2_inst.sngfifo36e2_n_83 ;
  wire \gf36e2_inst.sngfifo36e2_n_84 ;
  wire \gf36e2_inst.sngfifo36e2_n_85 ;
  wire \gf36e2_inst.sngfifo36e2_n_86 ;
  wire \gf36e2_inst.sngfifo36e2_n_87 ;
  wire \gf36e2_inst.sngfifo36e2_n_88 ;
  wire \gf36e2_inst.sngfifo36e2_n_89 ;
  wire \gf36e2_inst.sngfifo36e2_n_90 ;
  wire \gf36e2_inst.sngfifo36e2_n_91 ;
  wire \gf36e2_inst.sngfifo36e2_n_92 ;
  wire \gf36e2_inst.sngfifo36e2_n_93 ;
  wire \gf36e2_inst.sngfifo36e2_n_94 ;
  wire \gf36e2_inst.sngfifo36e2_n_95 ;
  wire \gf36e2_inst.sngfifo36e2_n_96 ;
  wire \gf36e2_inst.sngfifo36e2_n_97 ;
  wire \gf36e2_inst.sngfifo36e2_n_98 ;
  wire \gf36e2_inst.sngfifo36e2_n_99 ;
  wire p_31_out;
  wire p_32_out;
  wire rd_clk;
  wire [12:12]sbiterr_col;
  wire srst;
  wire wr_clk;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("FALSE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(511),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(72),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(72)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\gf36e2_inst.sngfifo36e2_n_40 ,\gf36e2_inst.sngfifo36e2_n_41 ,\gf36e2_inst.sngfifo36e2_n_42 ,\gf36e2_inst.sngfifo36e2_n_43 ,\gf36e2_inst.sngfifo36e2_n_44 ,\gf36e2_inst.sngfifo36e2_n_45 ,\gf36e2_inst.sngfifo36e2_n_46 ,\gf36e2_inst.sngfifo36e2_n_47 ,\gf36e2_inst.sngfifo36e2_n_48 ,\gf36e2_inst.sngfifo36e2_n_49 ,\gf36e2_inst.sngfifo36e2_n_50 ,\gf36e2_inst.sngfifo36e2_n_51 ,\gf36e2_inst.sngfifo36e2_n_52 ,\gf36e2_inst.sngfifo36e2_n_53 ,\gf36e2_inst.sngfifo36e2_n_54 ,\gf36e2_inst.sngfifo36e2_n_55 ,\gf36e2_inst.sngfifo36e2_n_56 ,\gf36e2_inst.sngfifo36e2_n_57 ,\gf36e2_inst.sngfifo36e2_n_58 ,\gf36e2_inst.sngfifo36e2_n_59 ,\gf36e2_inst.sngfifo36e2_n_60 ,\gf36e2_inst.sngfifo36e2_n_61 ,\gf36e2_inst.sngfifo36e2_n_62 ,\gf36e2_inst.sngfifo36e2_n_63 ,\gf36e2_inst.sngfifo36e2_n_64 ,\gf36e2_inst.sngfifo36e2_n_65 ,\gf36e2_inst.sngfifo36e2_n_66 ,\gf36e2_inst.sngfifo36e2_n_67 ,\gf36e2_inst.sngfifo36e2_n_68 ,\gf36e2_inst.sngfifo36e2_n_69 ,\gf36e2_inst.sngfifo36e2_n_70 ,\gf36e2_inst.sngfifo36e2_n_71 ,\gf36e2_inst.sngfifo36e2_n_72 ,\gf36e2_inst.sngfifo36e2_n_73 ,\gf36e2_inst.sngfifo36e2_n_74 ,\gf36e2_inst.sngfifo36e2_n_75 ,\gf36e2_inst.sngfifo36e2_n_76 ,\gf36e2_inst.sngfifo36e2_n_77 ,\gf36e2_inst.sngfifo36e2_n_78 ,\gf36e2_inst.sngfifo36e2_n_79 ,\gf36e2_inst.sngfifo36e2_n_80 ,\gf36e2_inst.sngfifo36e2_n_81 ,\gf36e2_inst.sngfifo36e2_n_82 ,\gf36e2_inst.sngfifo36e2_n_83 ,\gf36e2_inst.sngfifo36e2_n_84 ,\gf36e2_inst.sngfifo36e2_n_85 ,\gf36e2_inst.sngfifo36e2_n_86 ,\gf36e2_inst.sngfifo36e2_n_87 ,\gf36e2_inst.sngfifo36e2_n_88 ,\gf36e2_inst.sngfifo36e2_n_89 ,\gf36e2_inst.sngfifo36e2_n_90 ,\gf36e2_inst.sngfifo36e2_n_91 ,\gf36e2_inst.sngfifo36e2_n_92 ,\gf36e2_inst.sngfifo36e2_n_93 ,\gf36e2_inst.sngfifo36e2_n_94 ,\gf36e2_inst.sngfifo36e2_n_95 ,\gf36e2_inst.sngfifo36e2_n_96 ,\gf36e2_inst.sngfifo36e2_n_97 ,\gf36e2_inst.sngfifo36e2_n_98 ,\gf36e2_inst.sngfifo36e2_n_99 ,\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP({\gf36e2_inst.sngfifo36e2_n_168 ,\gf36e2_inst.sngfifo36e2_n_169 ,\gf36e2_inst.sngfifo36e2_n_170 ,\gf36e2_inst.sngfifo36e2_n_171 ,\gf36e2_inst.sngfifo36e2_n_172 ,\gf36e2_inst.sngfifo36e2_n_173 ,\gf36e2_inst.sngfifo36e2_n_174 ,\gf36e2_inst.sngfifo36e2_n_175 }),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(dbiterr_col),
        .DIN(din[63:0]),
        .DINP(din[71:64]),
        .DOUT(dout[63:0]),
        .DOUTP(dout[71:64]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(p_31_out),
        .PROGFULL(p_32_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(RD_EN),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(RDRSTBUSY),
        .REGCE(RD_EN),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(WR_EN),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(WRRSTBUSY));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_26
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [11:11]dbiterr_col;
  wire [71:0]din;
  wire [71:0]dout;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_168 ;
  wire \gf36e2_inst.sngfifo36e2_n_169 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_170 ;
  wire \gf36e2_inst.sngfifo36e2_n_171 ;
  wire \gf36e2_inst.sngfifo36e2_n_172 ;
  wire \gf36e2_inst.sngfifo36e2_n_173 ;
  wire \gf36e2_inst.sngfifo36e2_n_174 ;
  wire \gf36e2_inst.sngfifo36e2_n_175 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_40 ;
  wire \gf36e2_inst.sngfifo36e2_n_41 ;
  wire \gf36e2_inst.sngfifo36e2_n_42 ;
  wire \gf36e2_inst.sngfifo36e2_n_43 ;
  wire \gf36e2_inst.sngfifo36e2_n_44 ;
  wire \gf36e2_inst.sngfifo36e2_n_45 ;
  wire \gf36e2_inst.sngfifo36e2_n_46 ;
  wire \gf36e2_inst.sngfifo36e2_n_47 ;
  wire \gf36e2_inst.sngfifo36e2_n_48 ;
  wire \gf36e2_inst.sngfifo36e2_n_49 ;
  wire \gf36e2_inst.sngfifo36e2_n_50 ;
  wire \gf36e2_inst.sngfifo36e2_n_51 ;
  wire \gf36e2_inst.sngfifo36e2_n_52 ;
  wire \gf36e2_inst.sngfifo36e2_n_53 ;
  wire \gf36e2_inst.sngfifo36e2_n_54 ;
  wire \gf36e2_inst.sngfifo36e2_n_55 ;
  wire \gf36e2_inst.sngfifo36e2_n_56 ;
  wire \gf36e2_inst.sngfifo36e2_n_57 ;
  wire \gf36e2_inst.sngfifo36e2_n_58 ;
  wire \gf36e2_inst.sngfifo36e2_n_59 ;
  wire \gf36e2_inst.sngfifo36e2_n_60 ;
  wire \gf36e2_inst.sngfifo36e2_n_61 ;
  wire \gf36e2_inst.sngfifo36e2_n_62 ;
  wire \gf36e2_inst.sngfifo36e2_n_63 ;
  wire \gf36e2_inst.sngfifo36e2_n_64 ;
  wire \gf36e2_inst.sngfifo36e2_n_65 ;
  wire \gf36e2_inst.sngfifo36e2_n_66 ;
  wire \gf36e2_inst.sngfifo36e2_n_67 ;
  wire \gf36e2_inst.sngfifo36e2_n_68 ;
  wire \gf36e2_inst.sngfifo36e2_n_69 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_70 ;
  wire \gf36e2_inst.sngfifo36e2_n_71 ;
  wire \gf36e2_inst.sngfifo36e2_n_72 ;
  wire \gf36e2_inst.sngfifo36e2_n_73 ;
  wire \gf36e2_inst.sngfifo36e2_n_74 ;
  wire \gf36e2_inst.sngfifo36e2_n_75 ;
  wire \gf36e2_inst.sngfifo36e2_n_76 ;
  wire \gf36e2_inst.sngfifo36e2_n_77 ;
  wire \gf36e2_inst.sngfifo36e2_n_78 ;
  wire \gf36e2_inst.sngfifo36e2_n_79 ;
  wire \gf36e2_inst.sngfifo36e2_n_80 ;
  wire \gf36e2_inst.sngfifo36e2_n_81 ;
  wire \gf36e2_inst.sngfifo36e2_n_82 ;
  wire \gf36e2_inst.sngfifo36e2_n_83 ;
  wire \gf36e2_inst.sngfifo36e2_n_84 ;
  wire \gf36e2_inst.sngfifo36e2_n_85 ;
  wire \gf36e2_inst.sngfifo36e2_n_86 ;
  wire \gf36e2_inst.sngfifo36e2_n_87 ;
  wire \gf36e2_inst.sngfifo36e2_n_88 ;
  wire \gf36e2_inst.sngfifo36e2_n_89 ;
  wire \gf36e2_inst.sngfifo36e2_n_90 ;
  wire \gf36e2_inst.sngfifo36e2_n_91 ;
  wire \gf36e2_inst.sngfifo36e2_n_92 ;
  wire \gf36e2_inst.sngfifo36e2_n_93 ;
  wire \gf36e2_inst.sngfifo36e2_n_94 ;
  wire \gf36e2_inst.sngfifo36e2_n_95 ;
  wire \gf36e2_inst.sngfifo36e2_n_96 ;
  wire \gf36e2_inst.sngfifo36e2_n_97 ;
  wire \gf36e2_inst.sngfifo36e2_n_98 ;
  wire \gf36e2_inst.sngfifo36e2_n_99 ;
  wire p_40_out;
  wire p_41_out;
  wire rd_clk;
  wire [11:11]sbiterr_col;
  wire srst;
  wire wr_clk;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("FALSE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(511),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(72),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(72)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\gf36e2_inst.sngfifo36e2_n_40 ,\gf36e2_inst.sngfifo36e2_n_41 ,\gf36e2_inst.sngfifo36e2_n_42 ,\gf36e2_inst.sngfifo36e2_n_43 ,\gf36e2_inst.sngfifo36e2_n_44 ,\gf36e2_inst.sngfifo36e2_n_45 ,\gf36e2_inst.sngfifo36e2_n_46 ,\gf36e2_inst.sngfifo36e2_n_47 ,\gf36e2_inst.sngfifo36e2_n_48 ,\gf36e2_inst.sngfifo36e2_n_49 ,\gf36e2_inst.sngfifo36e2_n_50 ,\gf36e2_inst.sngfifo36e2_n_51 ,\gf36e2_inst.sngfifo36e2_n_52 ,\gf36e2_inst.sngfifo36e2_n_53 ,\gf36e2_inst.sngfifo36e2_n_54 ,\gf36e2_inst.sngfifo36e2_n_55 ,\gf36e2_inst.sngfifo36e2_n_56 ,\gf36e2_inst.sngfifo36e2_n_57 ,\gf36e2_inst.sngfifo36e2_n_58 ,\gf36e2_inst.sngfifo36e2_n_59 ,\gf36e2_inst.sngfifo36e2_n_60 ,\gf36e2_inst.sngfifo36e2_n_61 ,\gf36e2_inst.sngfifo36e2_n_62 ,\gf36e2_inst.sngfifo36e2_n_63 ,\gf36e2_inst.sngfifo36e2_n_64 ,\gf36e2_inst.sngfifo36e2_n_65 ,\gf36e2_inst.sngfifo36e2_n_66 ,\gf36e2_inst.sngfifo36e2_n_67 ,\gf36e2_inst.sngfifo36e2_n_68 ,\gf36e2_inst.sngfifo36e2_n_69 ,\gf36e2_inst.sngfifo36e2_n_70 ,\gf36e2_inst.sngfifo36e2_n_71 ,\gf36e2_inst.sngfifo36e2_n_72 ,\gf36e2_inst.sngfifo36e2_n_73 ,\gf36e2_inst.sngfifo36e2_n_74 ,\gf36e2_inst.sngfifo36e2_n_75 ,\gf36e2_inst.sngfifo36e2_n_76 ,\gf36e2_inst.sngfifo36e2_n_77 ,\gf36e2_inst.sngfifo36e2_n_78 ,\gf36e2_inst.sngfifo36e2_n_79 ,\gf36e2_inst.sngfifo36e2_n_80 ,\gf36e2_inst.sngfifo36e2_n_81 ,\gf36e2_inst.sngfifo36e2_n_82 ,\gf36e2_inst.sngfifo36e2_n_83 ,\gf36e2_inst.sngfifo36e2_n_84 ,\gf36e2_inst.sngfifo36e2_n_85 ,\gf36e2_inst.sngfifo36e2_n_86 ,\gf36e2_inst.sngfifo36e2_n_87 ,\gf36e2_inst.sngfifo36e2_n_88 ,\gf36e2_inst.sngfifo36e2_n_89 ,\gf36e2_inst.sngfifo36e2_n_90 ,\gf36e2_inst.sngfifo36e2_n_91 ,\gf36e2_inst.sngfifo36e2_n_92 ,\gf36e2_inst.sngfifo36e2_n_93 ,\gf36e2_inst.sngfifo36e2_n_94 ,\gf36e2_inst.sngfifo36e2_n_95 ,\gf36e2_inst.sngfifo36e2_n_96 ,\gf36e2_inst.sngfifo36e2_n_97 ,\gf36e2_inst.sngfifo36e2_n_98 ,\gf36e2_inst.sngfifo36e2_n_99 ,\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP({\gf36e2_inst.sngfifo36e2_n_168 ,\gf36e2_inst.sngfifo36e2_n_169 ,\gf36e2_inst.sngfifo36e2_n_170 ,\gf36e2_inst.sngfifo36e2_n_171 ,\gf36e2_inst.sngfifo36e2_n_172 ,\gf36e2_inst.sngfifo36e2_n_173 ,\gf36e2_inst.sngfifo36e2_n_174 ,\gf36e2_inst.sngfifo36e2_n_175 }),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(dbiterr_col),
        .DIN(din[63:0]),
        .DINP(din[71:64]),
        .DOUT(dout[63:0]),
        .DOUTP(dout[71:64]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(p_40_out),
        .PROGFULL(p_41_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(RD_EN),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(RDRSTBUSY),
        .REGCE(RD_EN),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(WR_EN),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(WRRSTBUSY));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_prim_27
   (EMPTY,
    FULL,
    RDRSTBUSY,
    WRRSTBUSY,
    dout,
    rd_clk,
    RD_EN,
    srst,
    wr_clk,
    WR_EN,
    din);
  output EMPTY;
  output FULL;
  output RDRSTBUSY;
  output WRRSTBUSY;
  output [71:0]dout;
  input rd_clk;
  input RD_EN;
  input srst;
  input wr_clk;
  input WR_EN;
  input [71:0]din;

  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_EN;
  wire WRRSTBUSY;
  wire WR_EN;
  wire [10:10]dbiterr_col;
  wire [71:0]din;
  wire [71:0]dout;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_168 ;
  wire \gf36e2_inst.sngfifo36e2_n_169 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_170 ;
  wire \gf36e2_inst.sngfifo36e2_n_171 ;
  wire \gf36e2_inst.sngfifo36e2_n_172 ;
  wire \gf36e2_inst.sngfifo36e2_n_173 ;
  wire \gf36e2_inst.sngfifo36e2_n_174 ;
  wire \gf36e2_inst.sngfifo36e2_n_175 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_40 ;
  wire \gf36e2_inst.sngfifo36e2_n_41 ;
  wire \gf36e2_inst.sngfifo36e2_n_42 ;
  wire \gf36e2_inst.sngfifo36e2_n_43 ;
  wire \gf36e2_inst.sngfifo36e2_n_44 ;
  wire \gf36e2_inst.sngfifo36e2_n_45 ;
  wire \gf36e2_inst.sngfifo36e2_n_46 ;
  wire \gf36e2_inst.sngfifo36e2_n_47 ;
  wire \gf36e2_inst.sngfifo36e2_n_48 ;
  wire \gf36e2_inst.sngfifo36e2_n_49 ;
  wire \gf36e2_inst.sngfifo36e2_n_50 ;
  wire \gf36e2_inst.sngfifo36e2_n_51 ;
  wire \gf36e2_inst.sngfifo36e2_n_52 ;
  wire \gf36e2_inst.sngfifo36e2_n_53 ;
  wire \gf36e2_inst.sngfifo36e2_n_54 ;
  wire \gf36e2_inst.sngfifo36e2_n_55 ;
  wire \gf36e2_inst.sngfifo36e2_n_56 ;
  wire \gf36e2_inst.sngfifo36e2_n_57 ;
  wire \gf36e2_inst.sngfifo36e2_n_58 ;
  wire \gf36e2_inst.sngfifo36e2_n_59 ;
  wire \gf36e2_inst.sngfifo36e2_n_60 ;
  wire \gf36e2_inst.sngfifo36e2_n_61 ;
  wire \gf36e2_inst.sngfifo36e2_n_62 ;
  wire \gf36e2_inst.sngfifo36e2_n_63 ;
  wire \gf36e2_inst.sngfifo36e2_n_64 ;
  wire \gf36e2_inst.sngfifo36e2_n_65 ;
  wire \gf36e2_inst.sngfifo36e2_n_66 ;
  wire \gf36e2_inst.sngfifo36e2_n_67 ;
  wire \gf36e2_inst.sngfifo36e2_n_68 ;
  wire \gf36e2_inst.sngfifo36e2_n_69 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_70 ;
  wire \gf36e2_inst.sngfifo36e2_n_71 ;
  wire \gf36e2_inst.sngfifo36e2_n_72 ;
  wire \gf36e2_inst.sngfifo36e2_n_73 ;
  wire \gf36e2_inst.sngfifo36e2_n_74 ;
  wire \gf36e2_inst.sngfifo36e2_n_75 ;
  wire \gf36e2_inst.sngfifo36e2_n_76 ;
  wire \gf36e2_inst.sngfifo36e2_n_77 ;
  wire \gf36e2_inst.sngfifo36e2_n_78 ;
  wire \gf36e2_inst.sngfifo36e2_n_79 ;
  wire \gf36e2_inst.sngfifo36e2_n_80 ;
  wire \gf36e2_inst.sngfifo36e2_n_81 ;
  wire \gf36e2_inst.sngfifo36e2_n_82 ;
  wire \gf36e2_inst.sngfifo36e2_n_83 ;
  wire \gf36e2_inst.sngfifo36e2_n_84 ;
  wire \gf36e2_inst.sngfifo36e2_n_85 ;
  wire \gf36e2_inst.sngfifo36e2_n_86 ;
  wire \gf36e2_inst.sngfifo36e2_n_87 ;
  wire \gf36e2_inst.sngfifo36e2_n_88 ;
  wire \gf36e2_inst.sngfifo36e2_n_89 ;
  wire \gf36e2_inst.sngfifo36e2_n_90 ;
  wire \gf36e2_inst.sngfifo36e2_n_91 ;
  wire \gf36e2_inst.sngfifo36e2_n_92 ;
  wire \gf36e2_inst.sngfifo36e2_n_93 ;
  wire \gf36e2_inst.sngfifo36e2_n_94 ;
  wire \gf36e2_inst.sngfifo36e2_n_95 ;
  wire \gf36e2_inst.sngfifo36e2_n_96 ;
  wire \gf36e2_inst.sngfifo36e2_n_97 ;
  wire \gf36e2_inst.sngfifo36e2_n_98 ;
  wire \gf36e2_inst.sngfifo36e2_n_99 ;
  wire p_49_out;
  wire p_50_out;
  wire rd_clk;
  wire [10:10]sbiterr_col;
  wire srst;
  wire wr_clk;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("FALSE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(511),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(72),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(72)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\gf36e2_inst.sngfifo36e2_n_40 ,\gf36e2_inst.sngfifo36e2_n_41 ,\gf36e2_inst.sngfifo36e2_n_42 ,\gf36e2_inst.sngfifo36e2_n_43 ,\gf36e2_inst.sngfifo36e2_n_44 ,\gf36e2_inst.sngfifo36e2_n_45 ,\gf36e2_inst.sngfifo36e2_n_46 ,\gf36e2_inst.sngfifo36e2_n_47 ,\gf36e2_inst.sngfifo36e2_n_48 ,\gf36e2_inst.sngfifo36e2_n_49 ,\gf36e2_inst.sngfifo36e2_n_50 ,\gf36e2_inst.sngfifo36e2_n_51 ,\gf36e2_inst.sngfifo36e2_n_52 ,\gf36e2_inst.sngfifo36e2_n_53 ,\gf36e2_inst.sngfifo36e2_n_54 ,\gf36e2_inst.sngfifo36e2_n_55 ,\gf36e2_inst.sngfifo36e2_n_56 ,\gf36e2_inst.sngfifo36e2_n_57 ,\gf36e2_inst.sngfifo36e2_n_58 ,\gf36e2_inst.sngfifo36e2_n_59 ,\gf36e2_inst.sngfifo36e2_n_60 ,\gf36e2_inst.sngfifo36e2_n_61 ,\gf36e2_inst.sngfifo36e2_n_62 ,\gf36e2_inst.sngfifo36e2_n_63 ,\gf36e2_inst.sngfifo36e2_n_64 ,\gf36e2_inst.sngfifo36e2_n_65 ,\gf36e2_inst.sngfifo36e2_n_66 ,\gf36e2_inst.sngfifo36e2_n_67 ,\gf36e2_inst.sngfifo36e2_n_68 ,\gf36e2_inst.sngfifo36e2_n_69 ,\gf36e2_inst.sngfifo36e2_n_70 ,\gf36e2_inst.sngfifo36e2_n_71 ,\gf36e2_inst.sngfifo36e2_n_72 ,\gf36e2_inst.sngfifo36e2_n_73 ,\gf36e2_inst.sngfifo36e2_n_74 ,\gf36e2_inst.sngfifo36e2_n_75 ,\gf36e2_inst.sngfifo36e2_n_76 ,\gf36e2_inst.sngfifo36e2_n_77 ,\gf36e2_inst.sngfifo36e2_n_78 ,\gf36e2_inst.sngfifo36e2_n_79 ,\gf36e2_inst.sngfifo36e2_n_80 ,\gf36e2_inst.sngfifo36e2_n_81 ,\gf36e2_inst.sngfifo36e2_n_82 ,\gf36e2_inst.sngfifo36e2_n_83 ,\gf36e2_inst.sngfifo36e2_n_84 ,\gf36e2_inst.sngfifo36e2_n_85 ,\gf36e2_inst.sngfifo36e2_n_86 ,\gf36e2_inst.sngfifo36e2_n_87 ,\gf36e2_inst.sngfifo36e2_n_88 ,\gf36e2_inst.sngfifo36e2_n_89 ,\gf36e2_inst.sngfifo36e2_n_90 ,\gf36e2_inst.sngfifo36e2_n_91 ,\gf36e2_inst.sngfifo36e2_n_92 ,\gf36e2_inst.sngfifo36e2_n_93 ,\gf36e2_inst.sngfifo36e2_n_94 ,\gf36e2_inst.sngfifo36e2_n_95 ,\gf36e2_inst.sngfifo36e2_n_96 ,\gf36e2_inst.sngfifo36e2_n_97 ,\gf36e2_inst.sngfifo36e2_n_98 ,\gf36e2_inst.sngfifo36e2_n_99 ,\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP({\gf36e2_inst.sngfifo36e2_n_168 ,\gf36e2_inst.sngfifo36e2_n_169 ,\gf36e2_inst.sngfifo36e2_n_170 ,\gf36e2_inst.sngfifo36e2_n_171 ,\gf36e2_inst.sngfifo36e2_n_172 ,\gf36e2_inst.sngfifo36e2_n_173 ,\gf36e2_inst.sngfifo36e2_n_174 ,\gf36e2_inst.sngfifo36e2_n_175 }),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(dbiterr_col),
        .DIN(din[63:0]),
        .DINP(din[71:64]),
        .DOUT(dout[63:0]),
        .DOUTP(dout[71:64]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(p_49_out),
        .PROGFULL(p_50_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(RD_EN),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(RDRSTBUSY),
        .REGCE(RD_EN),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(WR_EN),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(WRRSTBUSY));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_top
   (dout,
    wr_rst_busy,
    rd_rst_busy,
    full,
    empty,
    rd_clk,
    srst,
    wr_clk,
    din,
    wr_en,
    rd_en);
  output [1023:0]dout;
  output wr_rst_busy;
  output rd_rst_busy;
  output full;
  output empty;
  input rd_clk;
  input srst;
  input wr_clk;
  input [1023:0]din;
  input wr_en;
  input rd_en;

  wire [1023:0]din;
  wire [1023:0]dout;
  wire empty;
  wire full;
  wire p_105_out;
  wire p_106_out;
  wire p_114_out;
  wire p_115_out;
  wire p_123_out;
  wire p_124_out;
  wire p_132_out;
  wire p_133_out;
  wire p_15_out;
  wire p_16_out;
  wire p_33_out;
  wire p_34_out;
  wire p_42_out;
  wire p_43_out;
  wire p_51_out;
  wire p_52_out;
  wire p_69_out;
  wire p_6_out;
  wire p_70_out;
  wire p_78_out;
  wire p_79_out;
  wire p_7_out;
  wire p_87_out;
  wire p_88_out;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rd_rst_busy_INST_0_i_1_n_0;
  wire rd_rst_busy_INST_0_i_2_n_0;
  wire rd_tmp;
  wire [15:1]rrst_busy_i;
  wire \rst_val_sym.gextw_sym[13].inst_extd_n_0 ;
  wire \rst_val_sym.gextw_sym[13].inst_extd_n_1 ;
  wire \rst_val_sym.gextw_sym[1].inst_extd_n_0 ;
  wire \rst_val_sym.gextw_sym[1].inst_extd_n_2 ;
  wire \rst_val_sym.gextw_sym[5].inst_extd_n_1 ;
  wire \rst_val_sym.gextw_sym[5].inst_extd_n_3 ;
  wire \rst_val_sym.gextw_sym[9].inst_extd_n_1 ;
  wire \rst_val_sym.gextw_sym[9].inst_extd_n_3 ;
  wire srst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire wr_rst_busy_INST_0_i_1_n_0;
  wire wr_rst_busy_INST_0_i_2_n_0;
  wire wr_tmp;
  wire [15:1]wrst_busy_i;

  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    rd_rst_busy_INST_0
       (.I0(rd_rst_busy_INST_0_i_1_n_0),
        .I1(rd_rst_busy_INST_0_i_2_n_0),
        .I2(rrst_busy_i[1]),
        .I3(rrst_busy_i[2]),
        .I4(rrst_busy_i[3]),
        .O(rd_rst_busy));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    rd_rst_busy_INST_0_i_1
       (.I0(rrst_busy_i[14]),
        .I1(rrst_busy_i[15]),
        .I2(rrst_busy_i[12]),
        .I3(rrst_busy_i[13]),
        .I4(rrst_busy_i[11]),
        .I5(rrst_busy_i[10]),
        .O(rd_rst_busy_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    rd_rst_busy_INST_0_i_2
       (.I0(rrst_busy_i[8]),
        .I1(rrst_busy_i[9]),
        .I2(rrst_busy_i[6]),
        .I3(rrst_busy_i[7]),
        .I4(rrst_busy_i[5]),
        .I5(rrst_busy_i[4]),
        .O(rd_rst_busy_INST_0_i_2_n_0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth \rst_val_sym.gextw_sym[10].inst_extd 
       (.EMPTY(p_51_out),
        .FULL(p_52_out),
        .RDRSTBUSY(rrst_busy_i[10]),
        .RD_EN(rd_tmp),
        .WRRSTBUSY(wrst_busy_i[10]),
        .WR_EN(wr_tmp),
        .din(din[719:648]),
        .dout(dout[719:648]),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_0 \rst_val_sym.gextw_sym[11].inst_extd 
       (.EMPTY(p_42_out),
        .FULL(p_43_out),
        .RDRSTBUSY(rrst_busy_i[11]),
        .RD_EN(rd_tmp),
        .WRRSTBUSY(wrst_busy_i[11]),
        .WR_EN(wr_tmp),
        .din(din[791:720]),
        .dout(dout[791:720]),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_1 \rst_val_sym.gextw_sym[12].inst_extd 
       (.EMPTY(p_33_out),
        .FULL(p_34_out),
        .RDRSTBUSY(rrst_busy_i[12]),
        .RD_EN(rd_tmp),
        .WRRSTBUSY(wrst_busy_i[12]),
        .WR_EN(wr_tmp),
        .din(din[863:792]),
        .dout(dout[863:792]),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_2 \rst_val_sym.gextw_sym[13].inst_extd 
       (.EMPTY(p_33_out),
        .FULL(p_34_out),
        .RDRSTBUSY(rrst_busy_i[13]),
        .RD_EN(rd_tmp),
        .WRRSTBUSY(wrst_busy_i[13]),
        .WR_EN(wr_tmp),
        .din(din[935:864]),
        .dout(dout[935:864]),
        .empty(p_6_out),
        .empty_0(p_15_out),
        .full(p_7_out),
        .full_0(p_16_out),
        .rd_clk(rd_clk),
        .rd_clk_0(\rst_val_sym.gextw_sym[13].inst_extd_n_0 ),
        .rd_clk_1(\rst_val_sym.gextw_sym[13].inst_extd_n_1 ),
        .srst(srst),
        .wr_clk(wr_clk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_3 \rst_val_sym.gextw_sym[14].inst_extd 
       (.EMPTY(p_15_out),
        .FULL(p_16_out),
        .RDRSTBUSY(rrst_busy_i[14]),
        .RD_EN(rd_tmp),
        .WRRSTBUSY(wrst_busy_i[14]),
        .WR_EN(wr_tmp),
        .din(din[1007:936]),
        .dout(dout[1007:936]),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_4 \rst_val_sym.gextw_sym[15].inst_extd 
       (.EMPTY(p_6_out),
        .FULL(p_7_out),
        .RDRSTBUSY(rrst_busy_i[15]),
        .RD_EN(rd_tmp),
        .WRRSTBUSY(wrst_busy_i[15]),
        .WR_EN(wr_tmp),
        .din(din[1023:1008]),
        .dout(dout[1023:1008]),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_5 \rst_val_sym.gextw_sym[1].inst_extd 
       (.EMPTY(p_132_out),
        .FULL(p_133_out),
        .RDRSTBUSY(rrst_busy_i[1]),
        .RD_EN(rd_tmp),
        .WRRSTBUSY(wrst_busy_i[1]),
        .WR_EN(wr_tmp),
        .din(din[71:0]),
        .dout(dout[71:0]),
        .\gf36e2_inst.sngfifo36e2_i_1 (p_114_out),
        .\gf36e2_inst.sngfifo36e2_i_1_0 (p_123_out),
        .\gf36e2_inst.sngfifo36e2_i_2 (p_115_out),
        .\gf36e2_inst.sngfifo36e2_i_2_0 (p_124_out),
        .rd_clk(rd_clk),
        .rd_clk_0(\rst_val_sym.gextw_sym[1].inst_extd_n_0 ),
        .rd_clk_1(\rst_val_sym.gextw_sym[1].inst_extd_n_2 ),
        .srst(srst),
        .wr_clk(wr_clk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_6 \rst_val_sym.gextw_sym[2].inst_extd 
       (.EMPTY(p_123_out),
        .FULL(p_124_out),
        .RDRSTBUSY(rrst_busy_i[2]),
        .RD_EN(rd_tmp),
        .WRRSTBUSY(wrst_busy_i[2]),
        .WR_EN(wr_tmp),
        .din(din[143:72]),
        .dout(dout[143:72]),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_7 \rst_val_sym.gextw_sym[3].inst_extd 
       (.EMPTY(p_114_out),
        .FULL(p_115_out),
        .RDRSTBUSY(rrst_busy_i[3]),
        .RD_EN(rd_tmp),
        .WRRSTBUSY(wrst_busy_i[3]),
        .WR_EN(wr_tmp),
        .din(din[215:144]),
        .dout(dout[215:144]),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_8 \rst_val_sym.gextw_sym[4].inst_extd 
       (.EMPTY(p_105_out),
        .FULL(p_106_out),
        .RDRSTBUSY(rrst_busy_i[4]),
        .RD_EN(rd_tmp),
        .WRRSTBUSY(wrst_busy_i[4]),
        .WR_EN(wr_tmp),
        .din(din[287:216]),
        .dout(dout[287:216]),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_9 \rst_val_sym.gextw_sym[5].inst_extd 
       (.EMPTY(p_132_out),
        .FULL(p_133_out),
        .RDRSTBUSY(rrst_busy_i[5]),
        .RD_EN(rd_tmp),
        .WRRSTBUSY(wrst_busy_i[5]),
        .WR_EN(wr_tmp),
        .din(din[359:288]),
        .dout(dout[359:288]),
        .empty(empty),
        .empty_0(p_114_out),
        .empty_1(p_123_out),
        .empty_2(\rst_val_sym.gextw_sym[13].inst_extd_n_1 ),
        .empty_3(\rst_val_sym.gextw_sym[9].inst_extd_n_3 ),
        .empty_4(p_105_out),
        .empty_5(p_78_out),
        .empty_6(p_87_out),
        .full(full),
        .full_0(p_115_out),
        .full_1(p_124_out),
        .full_2(\rst_val_sym.gextw_sym[13].inst_extd_n_0 ),
        .full_3(\rst_val_sym.gextw_sym[9].inst_extd_n_1 ),
        .full_4(p_106_out),
        .full_5(p_79_out),
        .full_6(p_88_out),
        .rd_clk(rd_clk),
        .rd_clk_0(\rst_val_sym.gextw_sym[5].inst_extd_n_1 ),
        .rd_clk_1(\rst_val_sym.gextw_sym[5].inst_extd_n_3 ),
        .srst(srst),
        .wr_clk(wr_clk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_10 \rst_val_sym.gextw_sym[6].inst_extd 
       (.EMPTY(p_87_out),
        .FULL(p_88_out),
        .RDRSTBUSY(rrst_busy_i[6]),
        .RD_EN(rd_tmp),
        .WRRSTBUSY(wrst_busy_i[6]),
        .WR_EN(wr_tmp),
        .din(din[431:360]),
        .dout(dout[431:360]),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_11 \rst_val_sym.gextw_sym[7].inst_extd 
       (.EMPTY(p_78_out),
        .FULL(p_79_out),
        .RDRSTBUSY(rrst_busy_i[7]),
        .RD_EN(rd_tmp),
        .WRRSTBUSY(wrst_busy_i[7]),
        .WR_EN(wr_tmp),
        .din(din[503:432]),
        .dout(dout[503:432]),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_12 \rst_val_sym.gextw_sym[8].inst_extd 
       (.EMPTY(p_69_out),
        .FULL(p_70_out),
        .RDRSTBUSY(rrst_busy_i[8]),
        .RD_EN(rd_tmp),
        .WRRSTBUSY(wrst_busy_i[8]),
        .WR_EN(wr_tmp),
        .din(din[575:504]),
        .dout(dout[575:504]),
        .rd_clk(rd_clk),
        .srst(srst),
        .wr_clk(wr_clk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_extdepth_13 \rst_val_sym.gextw_sym[9].inst_extd 
       (.EMPTY(p_69_out),
        .FULL(p_70_out),
        .RDRSTBUSY(rrst_busy_i[9]),
        .RD_EN(rd_tmp),
        .WRRSTBUSY(wrst_busy_i[9]),
        .WR_EN(wr_tmp),
        .din(din[647:576]),
        .dout(dout[647:576]),
        .\dout[639] (\rst_val_sym.gextw_sym[13].inst_extd_n_0 ),
        .\dout[639]_0 (\rst_val_sym.gextw_sym[1].inst_extd_n_0 ),
        .\dout[639]_1 (\rst_val_sym.gextw_sym[5].inst_extd_n_1 ),
        .\dout[639]_2 (\rst_val_sym.gextw_sym[13].inst_extd_n_1 ),
        .\dout[639]_3 (\rst_val_sym.gextw_sym[1].inst_extd_n_2 ),
        .\dout[639]_4 (\rst_val_sym.gextw_sym[5].inst_extd_n_3 ),
        .empty(p_42_out),
        .empty_0(p_51_out),
        .full(p_43_out),
        .full_0(p_52_out),
        .rd_clk(rd_clk),
        .rd_clk_0(\rst_val_sym.gextw_sym[9].inst_extd_n_1 ),
        .rd_clk_1(\rst_val_sym.gextw_sym[9].inst_extd_n_3 ),
        .rd_en(rd_en),
        .srst(srst),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    wr_rst_busy_INST_0
       (.I0(wr_rst_busy_INST_0_i_1_n_0),
        .I1(wr_rst_busy_INST_0_i_2_n_0),
        .I2(wrst_busy_i[1]),
        .I3(wrst_busy_i[2]),
        .I4(wrst_busy_i[3]),
        .O(wr_rst_busy));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    wr_rst_busy_INST_0_i_1
       (.I0(wrst_busy_i[14]),
        .I1(wrst_busy_i[15]),
        .I2(wrst_busy_i[12]),
        .I3(wrst_busy_i[13]),
        .I4(wrst_busy_i[11]),
        .I5(wrst_busy_i[10]),
        .O(wr_rst_busy_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    wr_rst_busy_INST_0_i_2
       (.I0(wrst_busy_i[8]),
        .I1(wrst_busy_i[9]),
        .I2(wrst_busy_i[6]),
        .I3(wrst_busy_i[7]),
        .I4(wrst_busy_i[5]),
        .I5(wrst_busy_i[4]),
        .O(wr_rst_busy_INST_0_i_2_n_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_top
   (dout,
    wr_rst_busy,
    rd_rst_busy,
    full,
    empty,
    rd_clk,
    srst,
    wr_clk,
    din,
    wr_en,
    rd_en);
  output [1023:0]dout;
  output wr_rst_busy;
  output rd_rst_busy;
  output full;
  output empty;
  input rd_clk;
  input srst;
  input wr_clk;
  input [1023:0]din;
  input wr_en;
  input rd_en;

  wire [1023:0]din;
  wire [1023:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_3_builtin \gbi.bi 
       (.din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rd_rst_busy(rd_rst_busy),
        .srst(srst),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* C_ADD_NGC_CONSTRAINT = "0" *) (* C_APPLICATION_TYPE_AXIS = "0" *) (* C_APPLICATION_TYPE_RACH = "0" *) 
(* C_APPLICATION_TYPE_RDCH = "0" *) (* C_APPLICATION_TYPE_WACH = "0" *) (* C_APPLICATION_TYPE_WDCH = "0" *) 
(* C_APPLICATION_TYPE_WRCH = "0" *) (* C_AXIS_TDATA_WIDTH = "8" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TKEEP_WIDTH = "1" *) (* C_AXIS_TSTRB_WIDTH = "1" *) 
(* C_AXIS_TUSER_WIDTH = "4" *) (* C_AXIS_TYPE = "0" *) (* C_AXI_ADDR_WIDTH = "32" *) 
(* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) (* C_AXI_BUSER_WIDTH = "1" *) 
(* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "1" *) (* C_AXI_LEN_WIDTH = "8" *) 
(* C_AXI_LOCK_WIDTH = "1" *) (* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_TYPE = "1" *) 
(* C_AXI_WUSER_WIDTH = "1" *) (* C_COMMON_CLOCK = "0" *) (* C_COUNT_TYPE = "0" *) 
(* C_DATA_COUNT_WIDTH = "9" *) (* C_DEFAULT_VALUE = "BlankString" *) (* C_DIN_WIDTH = "1024" *) 
(* C_DIN_WIDTH_AXIS = "1" *) (* C_DIN_WIDTH_RACH = "32" *) (* C_DIN_WIDTH_RDCH = "64" *) 
(* C_DIN_WIDTH_WACH = "1" *) (* C_DIN_WIDTH_WDCH = "64" *) (* C_DIN_WIDTH_WRCH = "2" *) 
(* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "1024" *) (* C_ENABLE_RLOCS = "0" *) 
(* C_ENABLE_RST_SYNC = "1" *) (* C_EN_SAFETY_CKT = "0" *) (* C_ERROR_INJECTION_TYPE = "0" *) 
(* C_ERROR_INJECTION_TYPE_AXIS = "0" *) (* C_ERROR_INJECTION_TYPE_RACH = "0" *) (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
(* C_ERROR_INJECTION_TYPE_WACH = "0" *) (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
(* C_FAMILY = "virtexuplusHBM" *) (* C_FULL_FLAGS_RST_VAL = "0" *) (* C_HAS_ALMOST_EMPTY = "0" *) 
(* C_HAS_ALMOST_FULL = "0" *) (* C_HAS_AXIS_TDATA = "1" *) (* C_HAS_AXIS_TDEST = "0" *) 
(* C_HAS_AXIS_TID = "0" *) (* C_HAS_AXIS_TKEEP = "0" *) (* C_HAS_AXIS_TLAST = "0" *) 
(* C_HAS_AXIS_TREADY = "1" *) (* C_HAS_AXIS_TSTRB = "0" *) (* C_HAS_AXIS_TUSER = "1" *) 
(* C_HAS_AXI_ARUSER = "0" *) (* C_HAS_AXI_AWUSER = "0" *) (* C_HAS_AXI_BUSER = "0" *) 
(* C_HAS_AXI_ID = "0" *) (* C_HAS_AXI_RD_CHANNEL = "1" *) (* C_HAS_AXI_RUSER = "0" *) 
(* C_HAS_AXI_WR_CHANNEL = "1" *) (* C_HAS_AXI_WUSER = "0" *) (* C_HAS_BACKUP = "0" *) 
(* C_HAS_DATA_COUNT = "0" *) (* C_HAS_DATA_COUNTS_AXIS = "0" *) (* C_HAS_DATA_COUNTS_RACH = "0" *) 
(* C_HAS_DATA_COUNTS_RDCH = "0" *) (* C_HAS_DATA_COUNTS_WACH = "0" *) (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
(* C_HAS_DATA_COUNTS_WRCH = "0" *) (* C_HAS_INT_CLK = "0" *) (* C_HAS_MASTER_CE = "0" *) 
(* C_HAS_MEMINIT_FILE = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
(* C_HAS_PROG_FLAGS_RACH = "0" *) (* C_HAS_PROG_FLAGS_RDCH = "0" *) (* C_HAS_PROG_FLAGS_WACH = "0" *) 
(* C_HAS_PROG_FLAGS_WDCH = "0" *) (* C_HAS_PROG_FLAGS_WRCH = "0" *) (* C_HAS_RD_DATA_COUNT = "0" *) 
(* C_HAS_RD_RST = "0" *) (* C_HAS_RST = "0" *) (* C_HAS_SLAVE_CE = "0" *) 
(* C_HAS_SRST = "1" *) (* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "0" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) 
(* C_IMPLEMENTATION_TYPE = "6" *) (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
(* C_IMPLEMENTATION_TYPE_RDCH = "1" *) (* C_IMPLEMENTATION_TYPE_WACH = "1" *) (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
(* C_IMPLEMENTATION_TYPE_WRCH = "1" *) (* C_INIT_WR_PNTR_VAL = "0" *) (* C_INTERFACE_TYPE = "0" *) 
(* C_MEMORY_TYPE = "4" *) (* C_MIF_FILE_NAME = "BlankString" *) (* C_MSGON_VAL = "1" *) 
(* C_OPTIMIZATION_MODE = "0" *) (* C_OVERFLOW_LOW = "0" *) (* C_POWER_SAVING_MODE = "0" *) 
(* C_PRELOAD_LATENCY = "2" *) (* C_PRELOAD_REGS = "1" *) (* C_PRIM_FIFO_TYPE = "512x72" *) 
(* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
(* C_PRIM_FIFO_TYPE_WACH = "512x36" *) (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) (* C_PROG_EMPTY_TYPE = "0" *) 
(* C_PROG_EMPTY_TYPE_AXIS = "0" *) (* C_PROG_EMPTY_TYPE_RACH = "0" *) (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
(* C_PROG_EMPTY_TYPE_WACH = "0" *) (* C_PROG_EMPTY_TYPE_WDCH = "0" *) (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) (* C_PROG_FULL_TYPE = "0" *) 
(* C_PROG_FULL_TYPE_AXIS = "0" *) (* C_PROG_FULL_TYPE_RACH = "0" *) (* C_PROG_FULL_TYPE_RDCH = "0" *) 
(* C_PROG_FULL_TYPE_WACH = "0" *) (* C_PROG_FULL_TYPE_WDCH = "0" *) (* C_PROG_FULL_TYPE_WRCH = "0" *) 
(* C_RACH_TYPE = "0" *) (* C_RDCH_TYPE = "0" *) (* C_RD_DATA_COUNT_WIDTH = "9" *) 
(* C_RD_DEPTH = "512" *) (* C_RD_FREQ = "400" *) (* C_RD_PNTR_WIDTH = "9" *) 
(* C_REG_SLICE_MODE_AXIS = "0" *) (* C_REG_SLICE_MODE_RACH = "0" *) (* C_REG_SLICE_MODE_RDCH = "0" *) 
(* C_REG_SLICE_MODE_WACH = "0" *) (* C_REG_SLICE_MODE_WDCH = "0" *) (* C_REG_SLICE_MODE_WRCH = "0" *) 
(* C_SELECT_XPM = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_UNDERFLOW_LOW = "0" *) 
(* C_USE_COMMON_OVERFLOW = "0" *) (* C_USE_COMMON_UNDERFLOW = "0" *) (* C_USE_DEFAULT_SETTINGS = "0" *) 
(* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) (* C_USE_ECC_AXIS = "0" *) 
(* C_USE_ECC_RACH = "0" *) (* C_USE_ECC_RDCH = "0" *) (* C_USE_ECC_WACH = "0" *) 
(* C_USE_ECC_WDCH = "0" *) (* C_USE_ECC_WRCH = "0" *) (* C_USE_EMBEDDED_REG = "1" *) 
(* C_USE_FIFO16_FLAGS = "0" *) (* C_USE_FWFT_DATA_COUNT = "0" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WACH_TYPE = "0" *) (* C_WDCH_TYPE = "0" *) 
(* C_WRCH_TYPE = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "9" *) 
(* C_WR_DEPTH = "512" *) (* C_WR_DEPTH_AXIS = "1024" *) (* C_WR_DEPTH_RACH = "16" *) 
(* C_WR_DEPTH_RDCH = "1024" *) (* C_WR_DEPTH_WACH = "16" *) (* C_WR_DEPTH_WDCH = "1024" *) 
(* C_WR_DEPTH_WRCH = "16" *) (* C_WR_FREQ = "100" *) (* C_WR_PNTR_WIDTH = "9" *) 
(* C_WR_PNTR_WIDTH_AXIS = "10" *) (* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
(* C_WR_PNTR_WIDTH_WACH = "4" *) (* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
(* C_WR_RESPONSE_LATENCY = "1" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_3
   (backup,
    backup_marker,
    clk,
    rst,
    srst,
    wr_clk,
    wr_rst,
    rd_clk,
    rd_rst,
    din,
    wr_en,
    rd_en,
    prog_empty_thresh,
    prog_empty_thresh_assert,
    prog_empty_thresh_negate,
    prog_full_thresh,
    prog_full_thresh_assert,
    prog_full_thresh_negate,
    int_clk,
    injectdbiterr,
    injectsbiterr,
    sleep,
    dout,
    full,
    almost_full,
    wr_ack,
    overflow,
    empty,
    almost_empty,
    valid,
    underflow,
    data_count,
    rd_data_count,
    wr_data_count,
    prog_full,
    prog_empty,
    sbiterr,
    dbiterr,
    wr_rst_busy,
    rd_rst_busy,
    m_aclk,
    s_aclk,
    s_aresetn,
    m_aclk_en,
    s_aclk_en,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awregion,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awregion,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arregion,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arregion,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    axi_aw_injectsbiterr,
    axi_aw_injectdbiterr,
    axi_aw_prog_full_thresh,
    axi_aw_prog_empty_thresh,
    axi_aw_data_count,
    axi_aw_wr_data_count,
    axi_aw_rd_data_count,
    axi_aw_sbiterr,
    axi_aw_dbiterr,
    axi_aw_overflow,
    axi_aw_underflow,
    axi_aw_prog_full,
    axi_aw_prog_empty,
    axi_w_injectsbiterr,
    axi_w_injectdbiterr,
    axi_w_prog_full_thresh,
    axi_w_prog_empty_thresh,
    axi_w_data_count,
    axi_w_wr_data_count,
    axi_w_rd_data_count,
    axi_w_sbiterr,
    axi_w_dbiterr,
    axi_w_overflow,
    axi_w_underflow,
    axi_w_prog_full,
    axi_w_prog_empty,
    axi_b_injectsbiterr,
    axi_b_injectdbiterr,
    axi_b_prog_full_thresh,
    axi_b_prog_empty_thresh,
    axi_b_data_count,
    axi_b_wr_data_count,
    axi_b_rd_data_count,
    axi_b_sbiterr,
    axi_b_dbiterr,
    axi_b_overflow,
    axi_b_underflow,
    axi_b_prog_full,
    axi_b_prog_empty,
    axi_ar_injectsbiterr,
    axi_ar_injectdbiterr,
    axi_ar_prog_full_thresh,
    axi_ar_prog_empty_thresh,
    axi_ar_data_count,
    axi_ar_wr_data_count,
    axi_ar_rd_data_count,
    axi_ar_sbiterr,
    axi_ar_dbiterr,
    axi_ar_overflow,
    axi_ar_underflow,
    axi_ar_prog_full,
    axi_ar_prog_empty,
    axi_r_injectsbiterr,
    axi_r_injectdbiterr,
    axi_r_prog_full_thresh,
    axi_r_prog_empty_thresh,
    axi_r_data_count,
    axi_r_wr_data_count,
    axi_r_rd_data_count,
    axi_r_sbiterr,
    axi_r_dbiterr,
    axi_r_overflow,
    axi_r_underflow,
    axi_r_prog_full,
    axi_r_prog_empty,
    axis_injectsbiterr,
    axis_injectdbiterr,
    axis_prog_full_thresh,
    axis_prog_empty_thresh,
    axis_data_count,
    axis_wr_data_count,
    axis_rd_data_count,
    axis_sbiterr,
    axis_dbiterr,
    axis_overflow,
    axis_underflow,
    axis_prog_full,
    axis_prog_empty);
  input backup;
  input backup_marker;
  input clk;
  input rst;
  input srst;
  input wr_clk;
  input wr_rst;
  input rd_clk;
  input rd_rst;
  input [1023:0]din;
  input wr_en;
  input rd_en;
  input [8:0]prog_empty_thresh;
  input [8:0]prog_empty_thresh_assert;
  input [8:0]prog_empty_thresh_negate;
  input [8:0]prog_full_thresh;
  input [8:0]prog_full_thresh_assert;
  input [8:0]prog_full_thresh_negate;
  input int_clk;
  input injectdbiterr;
  input injectsbiterr;
  input sleep;
  output [1023:0]dout;
  output full;
  output almost_full;
  output wr_ack;
  output overflow;
  output empty;
  output almost_empty;
  output valid;
  output underflow;
  output [8:0]data_count;
  output [8:0]rd_data_count;
  output [8:0]wr_data_count;
  output prog_full;
  output prog_empty;
  output sbiterr;
  output dbiterr;
  output wr_rst_busy;
  output rd_rst_busy;
  input m_aclk;
  input s_aclk;
  input s_aresetn;
  input m_aclk_en;
  input s_aclk_en;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [3:0]s_axi_awregion;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output [3:0]m_axi_awregion;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [63:0]m_axi_wdata;
  output [7:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input [3:0]s_axi_arregion;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [0:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [3:0]m_axi_arregion;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [63:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;
  input s_axis_tvalid;
  output s_axis_tready;
  input [7:0]s_axis_tdata;
  input [0:0]s_axis_tstrb;
  input [0:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [3:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [7:0]m_axis_tdata;
  output [0:0]m_axis_tstrb;
  output [0:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [3:0]m_axis_tuser;
  input axi_aw_injectsbiterr;
  input axi_aw_injectdbiterr;
  input [3:0]axi_aw_prog_full_thresh;
  input [3:0]axi_aw_prog_empty_thresh;
  output [4:0]axi_aw_data_count;
  output [4:0]axi_aw_wr_data_count;
  output [4:0]axi_aw_rd_data_count;
  output axi_aw_sbiterr;
  output axi_aw_dbiterr;
  output axi_aw_overflow;
  output axi_aw_underflow;
  output axi_aw_prog_full;
  output axi_aw_prog_empty;
  input axi_w_injectsbiterr;
  input axi_w_injectdbiterr;
  input [9:0]axi_w_prog_full_thresh;
  input [9:0]axi_w_prog_empty_thresh;
  output [10:0]axi_w_data_count;
  output [10:0]axi_w_wr_data_count;
  output [10:0]axi_w_rd_data_count;
  output axi_w_sbiterr;
  output axi_w_dbiterr;
  output axi_w_overflow;
  output axi_w_underflow;
  output axi_w_prog_full;
  output axi_w_prog_empty;
  input axi_b_injectsbiterr;
  input axi_b_injectdbiterr;
  input [3:0]axi_b_prog_full_thresh;
  input [3:0]axi_b_prog_empty_thresh;
  output [4:0]axi_b_data_count;
  output [4:0]axi_b_wr_data_count;
  output [4:0]axi_b_rd_data_count;
  output axi_b_sbiterr;
  output axi_b_dbiterr;
  output axi_b_overflow;
  output axi_b_underflow;
  output axi_b_prog_full;
  output axi_b_prog_empty;
  input axi_ar_injectsbiterr;
  input axi_ar_injectdbiterr;
  input [3:0]axi_ar_prog_full_thresh;
  input [3:0]axi_ar_prog_empty_thresh;
  output [4:0]axi_ar_data_count;
  output [4:0]axi_ar_wr_data_count;
  output [4:0]axi_ar_rd_data_count;
  output axi_ar_sbiterr;
  output axi_ar_dbiterr;
  output axi_ar_overflow;
  output axi_ar_underflow;
  output axi_ar_prog_full;
  output axi_ar_prog_empty;
  input axi_r_injectsbiterr;
  input axi_r_injectdbiterr;
  input [9:0]axi_r_prog_full_thresh;
  input [9:0]axi_r_prog_empty_thresh;
  output [10:0]axi_r_data_count;
  output [10:0]axi_r_wr_data_count;
  output [10:0]axi_r_rd_data_count;
  output axi_r_sbiterr;
  output axi_r_dbiterr;
  output axi_r_overflow;
  output axi_r_underflow;
  output axi_r_prog_full;
  output axi_r_prog_empty;
  input axis_injectsbiterr;
  input axis_injectdbiterr;
  input [9:0]axis_prog_full_thresh;
  input [9:0]axis_prog_empty_thresh;
  output [10:0]axis_data_count;
  output [10:0]axis_wr_data_count;
  output [10:0]axis_rd_data_count;
  output axis_sbiterr;
  output axis_dbiterr;
  output axis_overflow;
  output axis_underflow;
  output axis_prog_full;
  output axis_prog_empty;

  wire \<const0> ;
  wire \<const1> ;
  wire [1023:0]din;
  wire [1023:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;

  assign almost_empty = \<const0> ;
  assign almost_full = \<const0> ;
  assign axi_ar_data_count[4] = \<const0> ;
  assign axi_ar_data_count[3] = \<const0> ;
  assign axi_ar_data_count[2] = \<const0> ;
  assign axi_ar_data_count[1] = \<const0> ;
  assign axi_ar_data_count[0] = \<const0> ;
  assign axi_ar_dbiterr = \<const0> ;
  assign axi_ar_overflow = \<const0> ;
  assign axi_ar_prog_empty = \<const1> ;
  assign axi_ar_prog_full = \<const0> ;
  assign axi_ar_rd_data_count[4] = \<const0> ;
  assign axi_ar_rd_data_count[3] = \<const0> ;
  assign axi_ar_rd_data_count[2] = \<const0> ;
  assign axi_ar_rd_data_count[1] = \<const0> ;
  assign axi_ar_rd_data_count[0] = \<const0> ;
  assign axi_ar_sbiterr = \<const0> ;
  assign axi_ar_underflow = \<const0> ;
  assign axi_ar_wr_data_count[4] = \<const0> ;
  assign axi_ar_wr_data_count[3] = \<const0> ;
  assign axi_ar_wr_data_count[2] = \<const0> ;
  assign axi_ar_wr_data_count[1] = \<const0> ;
  assign axi_ar_wr_data_count[0] = \<const0> ;
  assign axi_aw_data_count[4] = \<const0> ;
  assign axi_aw_data_count[3] = \<const0> ;
  assign axi_aw_data_count[2] = \<const0> ;
  assign axi_aw_data_count[1] = \<const0> ;
  assign axi_aw_data_count[0] = \<const0> ;
  assign axi_aw_dbiterr = \<const0> ;
  assign axi_aw_overflow = \<const0> ;
  assign axi_aw_prog_empty = \<const1> ;
  assign axi_aw_prog_full = \<const0> ;
  assign axi_aw_rd_data_count[4] = \<const0> ;
  assign axi_aw_rd_data_count[3] = \<const0> ;
  assign axi_aw_rd_data_count[2] = \<const0> ;
  assign axi_aw_rd_data_count[1] = \<const0> ;
  assign axi_aw_rd_data_count[0] = \<const0> ;
  assign axi_aw_sbiterr = \<const0> ;
  assign axi_aw_underflow = \<const0> ;
  assign axi_aw_wr_data_count[4] = \<const0> ;
  assign axi_aw_wr_data_count[3] = \<const0> ;
  assign axi_aw_wr_data_count[2] = \<const0> ;
  assign axi_aw_wr_data_count[1] = \<const0> ;
  assign axi_aw_wr_data_count[0] = \<const0> ;
  assign axi_b_data_count[4] = \<const0> ;
  assign axi_b_data_count[3] = \<const0> ;
  assign axi_b_data_count[2] = \<const0> ;
  assign axi_b_data_count[1] = \<const0> ;
  assign axi_b_data_count[0] = \<const0> ;
  assign axi_b_dbiterr = \<const0> ;
  assign axi_b_overflow = \<const0> ;
  assign axi_b_prog_empty = \<const1> ;
  assign axi_b_prog_full = \<const0> ;
  assign axi_b_rd_data_count[4] = \<const0> ;
  assign axi_b_rd_data_count[3] = \<const0> ;
  assign axi_b_rd_data_count[2] = \<const0> ;
  assign axi_b_rd_data_count[1] = \<const0> ;
  assign axi_b_rd_data_count[0] = \<const0> ;
  assign axi_b_sbiterr = \<const0> ;
  assign axi_b_underflow = \<const0> ;
  assign axi_b_wr_data_count[4] = \<const0> ;
  assign axi_b_wr_data_count[3] = \<const0> ;
  assign axi_b_wr_data_count[2] = \<const0> ;
  assign axi_b_wr_data_count[1] = \<const0> ;
  assign axi_b_wr_data_count[0] = \<const0> ;
  assign axi_r_data_count[10] = \<const0> ;
  assign axi_r_data_count[9] = \<const0> ;
  assign axi_r_data_count[8] = \<const0> ;
  assign axi_r_data_count[7] = \<const0> ;
  assign axi_r_data_count[6] = \<const0> ;
  assign axi_r_data_count[5] = \<const0> ;
  assign axi_r_data_count[4] = \<const0> ;
  assign axi_r_data_count[3] = \<const0> ;
  assign axi_r_data_count[2] = \<const0> ;
  assign axi_r_data_count[1] = \<const0> ;
  assign axi_r_data_count[0] = \<const0> ;
  assign axi_r_dbiterr = \<const0> ;
  assign axi_r_overflow = \<const0> ;
  assign axi_r_prog_empty = \<const1> ;
  assign axi_r_prog_full = \<const0> ;
  assign axi_r_rd_data_count[10] = \<const0> ;
  assign axi_r_rd_data_count[9] = \<const0> ;
  assign axi_r_rd_data_count[8] = \<const0> ;
  assign axi_r_rd_data_count[7] = \<const0> ;
  assign axi_r_rd_data_count[6] = \<const0> ;
  assign axi_r_rd_data_count[5] = \<const0> ;
  assign axi_r_rd_data_count[4] = \<const0> ;
  assign axi_r_rd_data_count[3] = \<const0> ;
  assign axi_r_rd_data_count[2] = \<const0> ;
  assign axi_r_rd_data_count[1] = \<const0> ;
  assign axi_r_rd_data_count[0] = \<const0> ;
  assign axi_r_sbiterr = \<const0> ;
  assign axi_r_underflow = \<const0> ;
  assign axi_r_wr_data_count[10] = \<const0> ;
  assign axi_r_wr_data_count[9] = \<const0> ;
  assign axi_r_wr_data_count[8] = \<const0> ;
  assign axi_r_wr_data_count[7] = \<const0> ;
  assign axi_r_wr_data_count[6] = \<const0> ;
  assign axi_r_wr_data_count[5] = \<const0> ;
  assign axi_r_wr_data_count[4] = \<const0> ;
  assign axi_r_wr_data_count[3] = \<const0> ;
  assign axi_r_wr_data_count[2] = \<const0> ;
  assign axi_r_wr_data_count[1] = \<const0> ;
  assign axi_r_wr_data_count[0] = \<const0> ;
  assign axi_w_data_count[10] = \<const0> ;
  assign axi_w_data_count[9] = \<const0> ;
  assign axi_w_data_count[8] = \<const0> ;
  assign axi_w_data_count[7] = \<const0> ;
  assign axi_w_data_count[6] = \<const0> ;
  assign axi_w_data_count[5] = \<const0> ;
  assign axi_w_data_count[4] = \<const0> ;
  assign axi_w_data_count[3] = \<const0> ;
  assign axi_w_data_count[2] = \<const0> ;
  assign axi_w_data_count[1] = \<const0> ;
  assign axi_w_data_count[0] = \<const0> ;
  assign axi_w_dbiterr = \<const0> ;
  assign axi_w_overflow = \<const0> ;
  assign axi_w_prog_empty = \<const1> ;
  assign axi_w_prog_full = \<const0> ;
  assign axi_w_rd_data_count[10] = \<const0> ;
  assign axi_w_rd_data_count[9] = \<const0> ;
  assign axi_w_rd_data_count[8] = \<const0> ;
  assign axi_w_rd_data_count[7] = \<const0> ;
  assign axi_w_rd_data_count[6] = \<const0> ;
  assign axi_w_rd_data_count[5] = \<const0> ;
  assign axi_w_rd_data_count[4] = \<const0> ;
  assign axi_w_rd_data_count[3] = \<const0> ;
  assign axi_w_rd_data_count[2] = \<const0> ;
  assign axi_w_rd_data_count[1] = \<const0> ;
  assign axi_w_rd_data_count[0] = \<const0> ;
  assign axi_w_sbiterr = \<const0> ;
  assign axi_w_underflow = \<const0> ;
  assign axi_w_wr_data_count[10] = \<const0> ;
  assign axi_w_wr_data_count[9] = \<const0> ;
  assign axi_w_wr_data_count[8] = \<const0> ;
  assign axi_w_wr_data_count[7] = \<const0> ;
  assign axi_w_wr_data_count[6] = \<const0> ;
  assign axi_w_wr_data_count[5] = \<const0> ;
  assign axi_w_wr_data_count[4] = \<const0> ;
  assign axi_w_wr_data_count[3] = \<const0> ;
  assign axi_w_wr_data_count[2] = \<const0> ;
  assign axi_w_wr_data_count[1] = \<const0> ;
  assign axi_w_wr_data_count[0] = \<const0> ;
  assign axis_data_count[10] = \<const0> ;
  assign axis_data_count[9] = \<const0> ;
  assign axis_data_count[8] = \<const0> ;
  assign axis_data_count[7] = \<const0> ;
  assign axis_data_count[6] = \<const0> ;
  assign axis_data_count[5] = \<const0> ;
  assign axis_data_count[4] = \<const0> ;
  assign axis_data_count[3] = \<const0> ;
  assign axis_data_count[2] = \<const0> ;
  assign axis_data_count[1] = \<const0> ;
  assign axis_data_count[0] = \<const0> ;
  assign axis_dbiterr = \<const0> ;
  assign axis_overflow = \<const0> ;
  assign axis_prog_empty = \<const1> ;
  assign axis_prog_full = \<const0> ;
  assign axis_rd_data_count[10] = \<const0> ;
  assign axis_rd_data_count[9] = \<const0> ;
  assign axis_rd_data_count[8] = \<const0> ;
  assign axis_rd_data_count[7] = \<const0> ;
  assign axis_rd_data_count[6] = \<const0> ;
  assign axis_rd_data_count[5] = \<const0> ;
  assign axis_rd_data_count[4] = \<const0> ;
  assign axis_rd_data_count[3] = \<const0> ;
  assign axis_rd_data_count[2] = \<const0> ;
  assign axis_rd_data_count[1] = \<const0> ;
  assign axis_rd_data_count[0] = \<const0> ;
  assign axis_sbiterr = \<const0> ;
  assign axis_underflow = \<const0> ;
  assign axis_wr_data_count[10] = \<const0> ;
  assign axis_wr_data_count[9] = \<const0> ;
  assign axis_wr_data_count[8] = \<const0> ;
  assign axis_wr_data_count[7] = \<const0> ;
  assign axis_wr_data_count[6] = \<const0> ;
  assign axis_wr_data_count[5] = \<const0> ;
  assign axis_wr_data_count[4] = \<const0> ;
  assign axis_wr_data_count[3] = \<const0> ;
  assign axis_wr_data_count[2] = \<const0> ;
  assign axis_wr_data_count[1] = \<const0> ;
  assign axis_wr_data_count[0] = \<const0> ;
  assign data_count[8] = \<const0> ;
  assign data_count[7] = \<const0> ;
  assign data_count[6] = \<const0> ;
  assign data_count[5] = \<const0> ;
  assign data_count[4] = \<const0> ;
  assign data_count[3] = \<const0> ;
  assign data_count[2] = \<const0> ;
  assign data_count[1] = \<const0> ;
  assign data_count[0] = \<const0> ;
  assign dbiterr = \<const0> ;
  assign m_axi_araddr[31] = \<const0> ;
  assign m_axi_araddr[30] = \<const0> ;
  assign m_axi_araddr[29] = \<const0> ;
  assign m_axi_araddr[28] = \<const0> ;
  assign m_axi_araddr[27] = \<const0> ;
  assign m_axi_araddr[26] = \<const0> ;
  assign m_axi_araddr[25] = \<const0> ;
  assign m_axi_araddr[24] = \<const0> ;
  assign m_axi_araddr[23] = \<const0> ;
  assign m_axi_araddr[22] = \<const0> ;
  assign m_axi_araddr[21] = \<const0> ;
  assign m_axi_araddr[20] = \<const0> ;
  assign m_axi_araddr[19] = \<const0> ;
  assign m_axi_araddr[18] = \<const0> ;
  assign m_axi_araddr[17] = \<const0> ;
  assign m_axi_araddr[16] = \<const0> ;
  assign m_axi_araddr[15] = \<const0> ;
  assign m_axi_araddr[14] = \<const0> ;
  assign m_axi_araddr[13] = \<const0> ;
  assign m_axi_araddr[12] = \<const0> ;
  assign m_axi_araddr[11] = \<const0> ;
  assign m_axi_araddr[10] = \<const0> ;
  assign m_axi_araddr[9] = \<const0> ;
  assign m_axi_araddr[8] = \<const0> ;
  assign m_axi_araddr[7] = \<const0> ;
  assign m_axi_araddr[6] = \<const0> ;
  assign m_axi_araddr[5] = \<const0> ;
  assign m_axi_araddr[4] = \<const0> ;
  assign m_axi_araddr[3] = \<const0> ;
  assign m_axi_araddr[2] = \<const0> ;
  assign m_axi_araddr[1] = \<const0> ;
  assign m_axi_araddr[0] = \<const0> ;
  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const0> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const0> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = \<const0> ;
  assign m_axi_awaddr[31] = \<const0> ;
  assign m_axi_awaddr[30] = \<const0> ;
  assign m_axi_awaddr[29] = \<const0> ;
  assign m_axi_awaddr[28] = \<const0> ;
  assign m_axi_awaddr[27] = \<const0> ;
  assign m_axi_awaddr[26] = \<const0> ;
  assign m_axi_awaddr[25] = \<const0> ;
  assign m_axi_awaddr[24] = \<const0> ;
  assign m_axi_awaddr[23] = \<const0> ;
  assign m_axi_awaddr[22] = \<const0> ;
  assign m_axi_awaddr[21] = \<const0> ;
  assign m_axi_awaddr[20] = \<const0> ;
  assign m_axi_awaddr[19] = \<const0> ;
  assign m_axi_awaddr[18] = \<const0> ;
  assign m_axi_awaddr[17] = \<const0> ;
  assign m_axi_awaddr[16] = \<const0> ;
  assign m_axi_awaddr[15] = \<const0> ;
  assign m_axi_awaddr[14] = \<const0> ;
  assign m_axi_awaddr[13] = \<const0> ;
  assign m_axi_awaddr[12] = \<const0> ;
  assign m_axi_awaddr[11] = \<const0> ;
  assign m_axi_awaddr[10] = \<const0> ;
  assign m_axi_awaddr[9] = \<const0> ;
  assign m_axi_awaddr[8] = \<const0> ;
  assign m_axi_awaddr[7] = \<const0> ;
  assign m_axi_awaddr[6] = \<const0> ;
  assign m_axi_awaddr[5] = \<const0> ;
  assign m_axi_awaddr[4] = \<const0> ;
  assign m_axi_awaddr[3] = \<const0> ;
  assign m_axi_awaddr[2] = \<const0> ;
  assign m_axi_awaddr[1] = \<const0> ;
  assign m_axi_awaddr[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const0> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_awvalid = \<const0> ;
  assign m_axi_bready = \<const0> ;
  assign m_axi_rready = \<const0> ;
  assign m_axi_wdata[63] = \<const0> ;
  assign m_axi_wdata[62] = \<const0> ;
  assign m_axi_wdata[61] = \<const0> ;
  assign m_axi_wdata[60] = \<const0> ;
  assign m_axi_wdata[59] = \<const0> ;
  assign m_axi_wdata[58] = \<const0> ;
  assign m_axi_wdata[57] = \<const0> ;
  assign m_axi_wdata[56] = \<const0> ;
  assign m_axi_wdata[55] = \<const0> ;
  assign m_axi_wdata[54] = \<const0> ;
  assign m_axi_wdata[53] = \<const0> ;
  assign m_axi_wdata[52] = \<const0> ;
  assign m_axi_wdata[51] = \<const0> ;
  assign m_axi_wdata[50] = \<const0> ;
  assign m_axi_wdata[49] = \<const0> ;
  assign m_axi_wdata[48] = \<const0> ;
  assign m_axi_wdata[47] = \<const0> ;
  assign m_axi_wdata[46] = \<const0> ;
  assign m_axi_wdata[45] = \<const0> ;
  assign m_axi_wdata[44] = \<const0> ;
  assign m_axi_wdata[43] = \<const0> ;
  assign m_axi_wdata[42] = \<const0> ;
  assign m_axi_wdata[41] = \<const0> ;
  assign m_axi_wdata[40] = \<const0> ;
  assign m_axi_wdata[39] = \<const0> ;
  assign m_axi_wdata[38] = \<const0> ;
  assign m_axi_wdata[37] = \<const0> ;
  assign m_axi_wdata[36] = \<const0> ;
  assign m_axi_wdata[35] = \<const0> ;
  assign m_axi_wdata[34] = \<const0> ;
  assign m_axi_wdata[33] = \<const0> ;
  assign m_axi_wdata[32] = \<const0> ;
  assign m_axi_wdata[31] = \<const0> ;
  assign m_axi_wdata[30] = \<const0> ;
  assign m_axi_wdata[29] = \<const0> ;
  assign m_axi_wdata[28] = \<const0> ;
  assign m_axi_wdata[27] = \<const0> ;
  assign m_axi_wdata[26] = \<const0> ;
  assign m_axi_wdata[25] = \<const0> ;
  assign m_axi_wdata[24] = \<const0> ;
  assign m_axi_wdata[23] = \<const0> ;
  assign m_axi_wdata[22] = \<const0> ;
  assign m_axi_wdata[21] = \<const0> ;
  assign m_axi_wdata[20] = \<const0> ;
  assign m_axi_wdata[19] = \<const0> ;
  assign m_axi_wdata[18] = \<const0> ;
  assign m_axi_wdata[17] = \<const0> ;
  assign m_axi_wdata[16] = \<const0> ;
  assign m_axi_wdata[15] = \<const0> ;
  assign m_axi_wdata[14] = \<const0> ;
  assign m_axi_wdata[13] = \<const0> ;
  assign m_axi_wdata[12] = \<const0> ;
  assign m_axi_wdata[11] = \<const0> ;
  assign m_axi_wdata[10] = \<const0> ;
  assign m_axi_wdata[9] = \<const0> ;
  assign m_axi_wdata[8] = \<const0> ;
  assign m_axi_wdata[7] = \<const0> ;
  assign m_axi_wdata[6] = \<const0> ;
  assign m_axi_wdata[5] = \<const0> ;
  assign m_axi_wdata[4] = \<const0> ;
  assign m_axi_wdata[3] = \<const0> ;
  assign m_axi_wdata[2] = \<const0> ;
  assign m_axi_wdata[1] = \<const0> ;
  assign m_axi_wdata[0] = \<const0> ;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const0> ;
  assign m_axi_wstrb[7] = \<const0> ;
  assign m_axi_wstrb[6] = \<const0> ;
  assign m_axi_wstrb[5] = \<const0> ;
  assign m_axi_wstrb[4] = \<const0> ;
  assign m_axi_wstrb[3] = \<const0> ;
  assign m_axi_wstrb[2] = \<const0> ;
  assign m_axi_wstrb[1] = \<const0> ;
  assign m_axi_wstrb[0] = \<const0> ;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = \<const0> ;
  assign m_axis_tdata[7] = \<const0> ;
  assign m_axis_tdata[6] = \<const0> ;
  assign m_axis_tdata[5] = \<const0> ;
  assign m_axis_tdata[4] = \<const0> ;
  assign m_axis_tdata[3] = \<const0> ;
  assign m_axis_tdata[2] = \<const0> ;
  assign m_axis_tdata[1] = \<const0> ;
  assign m_axis_tdata[0] = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[0] = \<const0> ;
  assign m_axis_tlast = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign m_axis_tuser[3] = \<const0> ;
  assign m_axis_tuser[2] = \<const0> ;
  assign m_axis_tuser[1] = \<const0> ;
  assign m_axis_tuser[0] = \<const0> ;
  assign m_axis_tvalid = \<const0> ;
  assign overflow = \<const0> ;
  assign prog_empty = \<const0> ;
  assign prog_full = \<const0> ;
  assign rd_data_count[8] = \<const0> ;
  assign rd_data_count[7] = \<const0> ;
  assign rd_data_count[6] = \<const0> ;
  assign rd_data_count[5] = \<const0> ;
  assign rd_data_count[4] = \<const0> ;
  assign rd_data_count[3] = \<const0> ;
  assign rd_data_count[2] = \<const0> ;
  assign rd_data_count[1] = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_rdata[63] = \<const0> ;
  assign s_axi_rdata[62] = \<const0> ;
  assign s_axi_rdata[61] = \<const0> ;
  assign s_axi_rdata[60] = \<const0> ;
  assign s_axi_rdata[59] = \<const0> ;
  assign s_axi_rdata[58] = \<const0> ;
  assign s_axi_rdata[57] = \<const0> ;
  assign s_axi_rdata[56] = \<const0> ;
  assign s_axi_rdata[55] = \<const0> ;
  assign s_axi_rdata[54] = \<const0> ;
  assign s_axi_rdata[53] = \<const0> ;
  assign s_axi_rdata[52] = \<const0> ;
  assign s_axi_rdata[51] = \<const0> ;
  assign s_axi_rdata[50] = \<const0> ;
  assign s_axi_rdata[49] = \<const0> ;
  assign s_axi_rdata[48] = \<const0> ;
  assign s_axi_rdata[47] = \<const0> ;
  assign s_axi_rdata[46] = \<const0> ;
  assign s_axi_rdata[45] = \<const0> ;
  assign s_axi_rdata[44] = \<const0> ;
  assign s_axi_rdata[43] = \<const0> ;
  assign s_axi_rdata[42] = \<const0> ;
  assign s_axi_rdata[41] = \<const0> ;
  assign s_axi_rdata[40] = \<const0> ;
  assign s_axi_rdata[39] = \<const0> ;
  assign s_axi_rdata[38] = \<const0> ;
  assign s_axi_rdata[37] = \<const0> ;
  assign s_axi_rdata[36] = \<const0> ;
  assign s_axi_rdata[35] = \<const0> ;
  assign s_axi_rdata[34] = \<const0> ;
  assign s_axi_rdata[33] = \<const0> ;
  assign s_axi_rdata[32] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign s_axis_tready = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign valid = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[8] = \<const0> ;
  assign wr_data_count[7] = \<const0> ;
  assign wr_data_count[6] = \<const0> ;
  assign wr_data_count[5] = \<const0> ;
  assign wr_data_count[4] = \<const0> ;
  assign wr_data_count[3] = \<const0> ;
  assign wr_data_count[2] = \<const0> ;
  assign wr_data_count[1] = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_3_synth inst_fifo_gen
       (.din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rd_rst_busy(rd_rst_busy),
        .srst(srst),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wr_rst_busy(wr_rst_busy));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_3_builtin
   (dout,
    wr_rst_busy,
    rd_rst_busy,
    full,
    empty,
    rd_clk,
    srst,
    wr_clk,
    din,
    wr_en,
    rd_en);
  output [1023:0]dout;
  output wr_rst_busy;
  output rd_rst_busy;
  output full;
  output empty;
  input rd_clk;
  input srst;
  input wr_clk;
  input [1023:0]din;
  input wr_en;
  input rd_en;

  wire [1023:0]din;
  wire [1023:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_builtin_top \v8_fifo.fblk 
       (.din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rd_rst_busy(rd_rst_busy),
        .srst(srst),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wr_rst_busy(wr_rst_busy));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_3_synth
   (dout,
    wr_rst_busy,
    rd_rst_busy,
    full,
    empty,
    rd_clk,
    srst,
    wr_clk,
    din,
    wr_en,
    rd_en);
  output [1023:0]dout;
  output wr_rst_busy;
  output rd_rst_busy;
  output full;
  output empty;
  input rd_clk;
  input srst;
  input wr_clk;
  input [1023:0]din;
  input wr_en;
  input rd_en;

  wire [1023:0]din;
  wire [1023:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_top \gconvfifo.rf 
       (.din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rd_rst_busy(rd_rst_busy),
        .srst(srst),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wr_rst_busy(wr_rst_busy));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
