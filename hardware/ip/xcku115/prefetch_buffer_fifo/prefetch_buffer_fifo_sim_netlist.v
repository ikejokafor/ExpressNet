// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.1 (lin64) Build 1538259 Fri Apr  8 15:45:23 MDT 2016
// Date        : Sat Mar 31 22:56:08 2018
// Host        : redrealm.cse.psu.edu running 64-bit unknown
// Command     : write_verilog -force -mode funcsim
//               /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/prefetch_buffer_fifo/prefetch_buffer_fifo_sim_netlist.v
// Design      : prefetch_buffer_fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku115-flva1517-3-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "prefetch_buffer_fifo,fifo_generator_v13_1_0,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_1_0,Vivado 2016.1" *) 
(* NotValidForBitStream *)
module prefetch_buffer_fifo
   (wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [15:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [15:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;

  wire [15:0]din;
  wire [15:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire wr_clk;
  wire wr_en;
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
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
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
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
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
  (* C_DIN_WIDTH = "16" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "16" *) 
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
  (* C_FAMILY = "kintexu" *) 
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
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "8kx4" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "8kx4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
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
  (* C_RD_FREQ = "1" *) 
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
  (* C_USE_DOUT_RST = "0" *) 
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
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* KEEP_HIERARCHY = "true" *) 
  prefetch_buffer_fifo_fifo_generator_v13_1_0 U0
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
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
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
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[8:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module prefetch_buffer_fifo_blk_mem_gen_generic_cstr
   (dout,
    rd_clk,
    wr_clk,
    \gpregsm1.curr_fwft_state_reg[1] ,
    E,
    p_5_out,
    Q,
    \gic0.gc0.count_d2_reg[8] ,
    din);
  output [15:0]dout;
  input rd_clk;
  input wr_clk;
  input \gpregsm1.curr_fwft_state_reg[1] ;
  input [0:0]E;
  input p_5_out;
  input [8:0]Q;
  input [8:0]\gic0.gc0.count_d2_reg[8] ;
  input [15:0]din;

  wire [0:0]E;
  wire [8:0]Q;
  wire [15:0]din;
  wire [15:0]dout;
  wire [8:0]\gic0.gc0.count_d2_reg[8] ;
  wire \gpregsm1.curr_fwft_state_reg[1] ;
  wire p_5_out;
  wire rd_clk;
  wire wr_clk;

  prefetch_buffer_fifo_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.E(E),
        .Q(Q),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[8] (\gic0.gc0.count_d2_reg[8] ),
        .\gpregsm1.curr_fwft_state_reg[1] (\gpregsm1.curr_fwft_state_reg[1] ),
        .p_5_out(p_5_out),
        .rd_clk(rd_clk),
        .wr_clk(wr_clk));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module prefetch_buffer_fifo_blk_mem_gen_prim_width
   (dout,
    rd_clk,
    wr_clk,
    \gpregsm1.curr_fwft_state_reg[1] ,
    E,
    p_5_out,
    Q,
    \gic0.gc0.count_d2_reg[8] ,
    din);
  output [15:0]dout;
  input rd_clk;
  input wr_clk;
  input \gpregsm1.curr_fwft_state_reg[1] ;
  input [0:0]E;
  input p_5_out;
  input [8:0]Q;
  input [8:0]\gic0.gc0.count_d2_reg[8] ;
  input [15:0]din;

  wire [0:0]E;
  wire [8:0]Q;
  wire [15:0]din;
  wire [15:0]dout;
  wire [8:0]\gic0.gc0.count_d2_reg[8] ;
  wire \gpregsm1.curr_fwft_state_reg[1] ;
  wire p_5_out;
  wire rd_clk;
  wire wr_clk;

  prefetch_buffer_fifo_blk_mem_gen_prim_wrapper \prim_noinit.ram 
       (.E(E),
        .Q(Q),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[8] (\gic0.gc0.count_d2_reg[8] ),
        .\gpregsm1.curr_fwft_state_reg[1] (\gpregsm1.curr_fwft_state_reg[1] ),
        .p_5_out(p_5_out),
        .rd_clk(rd_clk),
        .wr_clk(wr_clk));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module prefetch_buffer_fifo_blk_mem_gen_prim_wrapper
   (dout,
    rd_clk,
    wr_clk,
    \gpregsm1.curr_fwft_state_reg[1] ,
    E,
    p_5_out,
    Q,
    \gic0.gc0.count_d2_reg[8] ,
    din);
  output [15:0]dout;
  input rd_clk;
  input wr_clk;
  input \gpregsm1.curr_fwft_state_reg[1] ;
  input [0:0]E;
  input p_5_out;
  input [8:0]Q;
  input [8:0]\gic0.gc0.count_d2_reg[8] ;
  input [15:0]din;

  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_32 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_33 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_34 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_35 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_40 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_41 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_42 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_43 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_48 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_49 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_50 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_51 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_56 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_57 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_58 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_59 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_68 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_69 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_70 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_71 ;
  wire [0:0]E;
  wire [8:0]Q;
  wire [15:0]din;
  wire [15:0]dout;
  wire [8:0]\gic0.gc0.count_d2_reg[8] ;
  wire \gpregsm1.curr_fwft_state_reg[1] ;
  wire p_5_out;
  wire rd_clk;
  wire wr_clk;
  wire [15:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_CASDOUTA_UNCONNECTED ;
  wire [15:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_CASDOUTB_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_CASDOUTPA_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_CASDOUTPB_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(36)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram 
       (.ADDRARDADDR({Q,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({\gic0.gc0.count_d2_reg[8] ,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b0),
        .CASDOMUXEN_B(1'b0),
        .CASDOUTA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_CASDOUTA_UNCONNECTED [15:0]),
        .CASDOUTB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_CASDOUTB_UNCONNECTED [15:0]),
        .CASDOUTPA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_CASDOUTPA_UNCONNECTED [1:0]),
        .CASDOUTPB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_CASDOUTPB_UNCONNECTED [1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b0),
        .CASOREGIMUXEN_B(1'b0),
        .CLKARDCLK(rd_clk),
        .CLKBWRCLK(wr_clk),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,din[7:4],1'b0,1'b0,1'b0,1'b0,din[3:0]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,din[15:12],1'b0,1'b0,1'b0,1'b0,din[11:8]}),
        .DINPADINP({1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0}),
        .DOUTADOUT({\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_32 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_33 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_34 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_35 ,dout[7:4],\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_40 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_41 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_42 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_43 ,dout[3:0]}),
        .DOUTBDOUT({\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_48 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_49 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_50 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_51 ,dout[15:12],\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_56 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_57 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_58 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_59 ,dout[11:8]}),
        .DOUTPADOUTP({\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_68 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_69 }),
        .DOUTPBDOUTP({\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_70 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_71 }),
        .ENARDEN(\gpregsm1.curr_fwft_state_reg[1] ),
        .ENBWREN(E),
        .REGCEAREGCE(p_5_out),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({E,E,E,E}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module prefetch_buffer_fifo_blk_mem_gen_top
   (dout,
    rd_clk,
    wr_clk,
    \gpregsm1.curr_fwft_state_reg[1] ,
    E,
    p_5_out,
    Q,
    \gic0.gc0.count_d2_reg[8] ,
    din);
  output [15:0]dout;
  input rd_clk;
  input wr_clk;
  input \gpregsm1.curr_fwft_state_reg[1] ;
  input [0:0]E;
  input p_5_out;
  input [8:0]Q;
  input [8:0]\gic0.gc0.count_d2_reg[8] ;
  input [15:0]din;

  wire [0:0]E;
  wire [8:0]Q;
  wire [15:0]din;
  wire [15:0]dout;
  wire [8:0]\gic0.gc0.count_d2_reg[8] ;
  wire \gpregsm1.curr_fwft_state_reg[1] ;
  wire p_5_out;
  wire rd_clk;
  wire wr_clk;

  prefetch_buffer_fifo_blk_mem_gen_generic_cstr \valid.cstr 
       (.E(E),
        .Q(Q),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[8] (\gic0.gc0.count_d2_reg[8] ),
        .\gpregsm1.curr_fwft_state_reg[1] (\gpregsm1.curr_fwft_state_reg[1] ),
        .p_5_out(p_5_out),
        .rd_clk(rd_clk),
        .wr_clk(wr_clk));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_3_2" *) 
module prefetch_buffer_fifo_blk_mem_gen_v8_3_2
   (dout,
    rd_clk,
    wr_clk,
    \gpregsm1.curr_fwft_state_reg[1] ,
    E,
    p_5_out,
    Q,
    \gic0.gc0.count_d2_reg[8] ,
    din);
  output [15:0]dout;
  input rd_clk;
  input wr_clk;
  input \gpregsm1.curr_fwft_state_reg[1] ;
  input [0:0]E;
  input p_5_out;
  input [8:0]Q;
  input [8:0]\gic0.gc0.count_d2_reg[8] ;
  input [15:0]din;

  wire [0:0]E;
  wire [8:0]Q;
  wire [15:0]din;
  wire [15:0]dout;
  wire [8:0]\gic0.gc0.count_d2_reg[8] ;
  wire \gpregsm1.curr_fwft_state_reg[1] ;
  wire p_5_out;
  wire rd_clk;
  wire wr_clk;

  prefetch_buffer_fifo_blk_mem_gen_v8_3_2_synth inst_blk_mem_gen
       (.E(E),
        .Q(Q),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[8] (\gic0.gc0.count_d2_reg[8] ),
        .\gpregsm1.curr_fwft_state_reg[1] (\gpregsm1.curr_fwft_state_reg[1] ),
        .p_5_out(p_5_out),
        .rd_clk(rd_clk),
        .wr_clk(wr_clk));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_3_2_synth" *) 
module prefetch_buffer_fifo_blk_mem_gen_v8_3_2_synth
   (dout,
    rd_clk,
    wr_clk,
    \gpregsm1.curr_fwft_state_reg[1] ,
    E,
    p_5_out,
    Q,
    \gic0.gc0.count_d2_reg[8] ,
    din);
  output [15:0]dout;
  input rd_clk;
  input wr_clk;
  input \gpregsm1.curr_fwft_state_reg[1] ;
  input [0:0]E;
  input p_5_out;
  input [8:0]Q;
  input [8:0]\gic0.gc0.count_d2_reg[8] ;
  input [15:0]din;

  wire [0:0]E;
  wire [8:0]Q;
  wire [15:0]din;
  wire [15:0]dout;
  wire [8:0]\gic0.gc0.count_d2_reg[8] ;
  wire \gpregsm1.curr_fwft_state_reg[1] ;
  wire p_5_out;
  wire rd_clk;
  wire wr_clk;

  prefetch_buffer_fifo_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.E(E),
        .Q(Q),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[8] (\gic0.gc0.count_d2_reg[8] ),
        .\gpregsm1.curr_fwft_state_reg[1] (\gpregsm1.curr_fwft_state_reg[1] ),
        .p_5_out(p_5_out),
        .rd_clk(rd_clk),
        .wr_clk(wr_clk));
endmodule

(* ORIG_REF_NAME = "clk_x_pntrs" *) 
module prefetch_buffer_fifo_clk_x_pntrs
   (ram_full_i_reg,
    Q,
    ram_full_i_reg_0,
    v1_reg,
    ram_empty_fb_i_reg,
    v1_reg_0,
    \gic0.gc0.count_d1_reg[8] ,
    D,
    \gc0.count_d1_reg[8] ,
    \gc0.count_reg[7] ,
    \gic0.gc0.count_d2_reg[8] ,
    rd_clk,
    wr_clk,
    \gc0.count_d1_reg[7] );
  output ram_full_i_reg;
  output [7:0]Q;
  output ram_full_i_reg_0;
  output [3:0]v1_reg;
  output [0:0]ram_empty_fb_i_reg;
  output [3:0]v1_reg_0;
  input [0:0]\gic0.gc0.count_d1_reg[8] ;
  input [0:0]D;
  input [8:0]\gc0.count_d1_reg[8] ;
  input [7:0]\gc0.count_reg[7] ;
  input [8:0]\gic0.gc0.count_d2_reg[8] ;
  input rd_clk;
  input wr_clk;
  input [7:0]\gc0.count_d1_reg[7] ;

  wire [0:0]D;
  wire [7:0]Q;
  wire [7:0]\gc0.count_d1_reg[7] ;
  wire [8:0]\gc0.count_d1_reg[8] ;
  wire [7:0]\gc0.count_reg[7] ;
  wire [0:0]\gic0.gc0.count_d1_reg[8] ;
  wire [8:0]\gic0.gc0.count_d2_reg[8] ;
  wire \gsync_stage[2].wr_stg_inst_n_1 ;
  wire \gsync_stage[2].wr_stg_inst_n_2 ;
  wire \gsync_stage[2].wr_stg_inst_n_3 ;
  wire \gsync_stage[2].wr_stg_inst_n_4 ;
  wire \gsync_stage[2].wr_stg_inst_n_5 ;
  wire \gsync_stage[2].wr_stg_inst_n_6 ;
  wire \gsync_stage[2].wr_stg_inst_n_7 ;
  wire \gsync_stage[2].wr_stg_inst_n_8 ;
  wire [7:0]p_0_in;
  wire [7:0]p_0_in7_out;
  wire [8:8]p_0_out;
  wire [8:8]p_1_out;
  wire [7:0]p_22_out;
  wire [8:8]p_23_out;
  wire [8:0]p_2_out;
  wire [8:0]p_3_out;
  wire [0:0]ram_empty_fb_i_reg;
  wire ram_full_i_reg;
  wire ram_full_i_reg_0;
  wire rd_clk;
  wire [8:0]rd_pntr_gc;
  wire [3:0]v1_reg;
  wire [3:0]v1_reg_0;
  wire wr_clk;
  wire [8:0]wr_pntr_gc;

  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1 
       (.I0(p_22_out[0]),
        .I1(\gc0.count_d1_reg[8] [0]),
        .I2(p_22_out[1]),
        .I3(\gc0.count_d1_reg[8] [1]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__0 
       (.I0(p_22_out[0]),
        .I1(\gc0.count_reg[7] [0]),
        .I2(p_22_out[1]),
        .I3(\gc0.count_reg[7] [1]),
        .O(v1_reg_0[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1 
       (.I0(p_22_out[2]),
        .I1(\gc0.count_d1_reg[8] [2]),
        .I2(p_22_out[3]),
        .I3(\gc0.count_d1_reg[8] [3]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__0 
       (.I0(p_22_out[2]),
        .I1(\gc0.count_reg[7] [2]),
        .I2(p_22_out[3]),
        .I3(\gc0.count_reg[7] [3]),
        .O(v1_reg_0[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1 
       (.I0(p_22_out[4]),
        .I1(\gc0.count_d1_reg[8] [4]),
        .I2(p_22_out[5]),
        .I3(\gc0.count_d1_reg[8] [5]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__0 
       (.I0(p_22_out[4]),
        .I1(\gc0.count_reg[7] [4]),
        .I2(p_22_out[5]),
        .I3(\gc0.count_reg[7] [5]),
        .O(v1_reg_0[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1 
       (.I0(p_22_out[6]),
        .I1(\gc0.count_d1_reg[8] [6]),
        .I2(p_22_out[7]),
        .I3(\gc0.count_d1_reg[8] [7]),
        .O(v1_reg[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__0 
       (.I0(p_22_out[6]),
        .I1(\gc0.count_reg[7] [6]),
        .I2(p_22_out[7]),
        .I3(\gc0.count_reg[7] [7]),
        .O(v1_reg_0[3]));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__1 
       (.I0(p_23_out),
        .I1(\gic0.gc0.count_d1_reg[8] ),
        .O(ram_full_i_reg));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__2 
       (.I0(p_23_out),
        .I1(D),
        .O(ram_full_i_reg_0));
  prefetch_buffer_fifo_synchronizer_ff \gsync_stage[1].rd_stg_inst 
       (.Q(wr_pntr_gc),
        .out(p_3_out),
        .rd_clk(rd_clk));
  prefetch_buffer_fifo_synchronizer_ff_3 \gsync_stage[1].wr_stg_inst 
       (.Q(rd_pntr_gc),
        .out(p_2_out),
        .wr_clk(wr_clk));
  prefetch_buffer_fifo_synchronizer_ff_4 \gsync_stage[2].rd_stg_inst 
       (.D(p_0_in),
        .out(p_3_out),
        .rd_clk(rd_clk),
        .\wr_pntr_bin_reg[8] (p_1_out));
  prefetch_buffer_fifo_synchronizer_ff_5 \gsync_stage[2].wr_stg_inst 
       (.D({\gsync_stage[2].wr_stg_inst_n_1 ,\gsync_stage[2].wr_stg_inst_n_2 ,\gsync_stage[2].wr_stg_inst_n_3 ,\gsync_stage[2].wr_stg_inst_n_4 ,\gsync_stage[2].wr_stg_inst_n_5 ,\gsync_stage[2].wr_stg_inst_n_6 ,\gsync_stage[2].wr_stg_inst_n_7 ,\gsync_stage[2].wr_stg_inst_n_8 }),
        .out(p_2_out),
        .\rd_pntr_bin_reg[8] (p_0_out),
        .wr_clk(wr_clk));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gsync_stage[2].wr_stg_inst_n_8 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gsync_stage[2].wr_stg_inst_n_7 ),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gsync_stage[2].wr_stg_inst_n_6 ),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gsync_stage[2].wr_stg_inst_n_5 ),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gsync_stage[2].wr_stg_inst_n_4 ),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[5] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gsync_stage[2].wr_stg_inst_n_3 ),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[6] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gsync_stage[2].wr_stg_inst_n_2 ),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[7] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gsync_stage[2].wr_stg_inst_n_1 ),
        .Q(Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[8] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(p_0_out),
        .Q(p_23_out),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gc0.count_d1_reg[7] [0]),
        .Q(rd_pntr_gc[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gc0.count_d1_reg[7] [1]),
        .Q(rd_pntr_gc[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[2] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gc0.count_d1_reg[7] [2]),
        .Q(rd_pntr_gc[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[3] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gc0.count_d1_reg[7] [3]),
        .Q(rd_pntr_gc[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[4] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gc0.count_d1_reg[7] [4]),
        .Q(rd_pntr_gc[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[5] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gc0.count_d1_reg[7] [5]),
        .Q(rd_pntr_gc[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[6] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gc0.count_d1_reg[7] [6]),
        .Q(rd_pntr_gc[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[7] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gc0.count_d1_reg[7] [7]),
        .Q(rd_pntr_gc[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[8] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gc0.count_d1_reg[8] [8]),
        .Q(rd_pntr_gc[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(p_0_in[0]),
        .Q(p_22_out[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(p_22_out[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[2] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(p_0_in[2]),
        .Q(p_22_out[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[3] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(p_0_in[3]),
        .Q(p_22_out[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[4] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(p_0_in[4]),
        .Q(p_22_out[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[5] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(p_0_in[5]),
        .Q(p_22_out[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[6] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(p_0_in[6]),
        .Q(p_22_out[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[7] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(p_0_in[7]),
        .Q(p_22_out[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[8] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(p_1_out),
        .Q(ram_empty_fb_i_reg),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_gc[0]_i_1 
       (.I0(\gic0.gc0.count_d2_reg[8] [0]),
        .I1(\gic0.gc0.count_d2_reg[8] [1]),
        .O(p_0_in7_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_gc[1]_i_1 
       (.I0(\gic0.gc0.count_d2_reg[8] [1]),
        .I1(\gic0.gc0.count_d2_reg[8] [2]),
        .O(p_0_in7_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_gc[2]_i_1 
       (.I0(\gic0.gc0.count_d2_reg[8] [2]),
        .I1(\gic0.gc0.count_d2_reg[8] [3]),
        .O(p_0_in7_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_gc[3]_i_1 
       (.I0(\gic0.gc0.count_d2_reg[8] [3]),
        .I1(\gic0.gc0.count_d2_reg[8] [4]),
        .O(p_0_in7_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_gc[4]_i_1 
       (.I0(\gic0.gc0.count_d2_reg[8] [4]),
        .I1(\gic0.gc0.count_d2_reg[8] [5]),
        .O(p_0_in7_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_gc[5]_i_1 
       (.I0(\gic0.gc0.count_d2_reg[8] [5]),
        .I1(\gic0.gc0.count_d2_reg[8] [6]),
        .O(p_0_in7_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_gc[6]_i_1 
       (.I0(\gic0.gc0.count_d2_reg[8] [6]),
        .I1(\gic0.gc0.count_d2_reg[8] [7]),
        .O(p_0_in7_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_gc[7]_i_1 
       (.I0(\gic0.gc0.count_d2_reg[8] [7]),
        .I1(\gic0.gc0.count_d2_reg[8] [8]),
        .O(p_0_in7_out[7]));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(p_0_in7_out[0]),
        .Q(wr_pntr_gc[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(p_0_in7_out[1]),
        .Q(wr_pntr_gc[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(p_0_in7_out[2]),
        .Q(wr_pntr_gc[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(p_0_in7_out[3]),
        .Q(wr_pntr_gc[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(p_0_in7_out[4]),
        .Q(wr_pntr_gc[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[5] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(p_0_in7_out[5]),
        .Q(wr_pntr_gc[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[6] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(p_0_in7_out[6]),
        .Q(wr_pntr_gc[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[7] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(p_0_in7_out[7]),
        .Q(wr_pntr_gc[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[8] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gic0.gc0.count_d2_reg[8] [8]),
        .Q(wr_pntr_gc[8]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module prefetch_buffer_fifo_compare
   (ram_full_i_reg,
    v1_reg,
    \rd_pntr_bin_reg[8] ,
    wr_en,
    ram_full_fb,
    comp2);
  output ram_full_i_reg;
  input [3:0]v1_reg;
  input \rd_pntr_bin_reg[8] ;
  input wr_en;
  input ram_full_fb;
  input comp2;

  wire comp1;
  wire comp2;
  wire ram_full_fb;
  wire ram_full_i_reg;
  wire \rd_pntr_bin_reg[8] ;
  wire [3:0]v1_reg;
  wire wr_en;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED ;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "(CARRY4)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY8 \gmux.gm[0].gm1.m1_CARRY4_CARRY8 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [7:5],comp1,\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [3:0]}),
        .DI({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED [7:5],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED [7:0]),
        .S({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED [7:5],\rd_pntr_bin_reg[8] ,v1_reg}));
  LUT4 #(
    .INIT(16'hAEAA)) 
    ram_full_i_i_1
       (.I0(comp1),
        .I1(wr_en),
        .I2(ram_full_fb),
        .I3(comp2),
        .O(ram_full_i_reg));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module prefetch_buffer_fifo_compare_0
   (comp2,
    v1_reg_0,
    \rd_pntr_bin_reg[8] );
  output comp2;
  input [3:0]v1_reg_0;
  input \rd_pntr_bin_reg[8] ;

  wire comp2;
  wire \rd_pntr_bin_reg[8] ;
  wire [3:0]v1_reg_0;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED ;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "(CARRY4)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY8 \gmux.gm[0].gm1.m1_CARRY4_CARRY8 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [7:5],comp2,\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [3:0]}),
        .DI({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED [7:5],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED [7:0]),
        .S({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED [7:5],\rd_pntr_bin_reg[8] ,v1_reg_0}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module prefetch_buffer_fifo_compare_1
   (ram_empty_fb_i_reg,
    v1_reg,
    \gc0.count_d1_reg[8] ,
    rd_en,
    Q,
    p_2_out,
    comp1);
  output ram_empty_fb_i_reg;
  input [3:0]v1_reg;
  input \gc0.count_d1_reg[8] ;
  input rd_en;
  input [1:0]Q;
  input p_2_out;
  input comp1;

  wire [1:0]Q;
  wire comp0;
  wire comp1;
  wire \gc0.count_d1_reg[8] ;
  wire p_2_out;
  wire ram_empty_fb_i_reg;
  wire rd_en;
  wire [3:0]v1_reg;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED ;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "(CARRY4)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY8 \gmux.gm[0].gm1.m1_CARRY4_CARRY8 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [7:5],comp0,\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [3:0]}),
        .DI({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED [7:5],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED [7:0]),
        .S({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED [7:5],\gc0.count_d1_reg[8] ,v1_reg}));
  LUT6 #(
    .INIT(64'hAAAAEFFFAAAAAAAA)) 
    ram_empty_fb_i_i_1
       (.I0(comp0),
        .I1(rd_en),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(p_2_out),
        .I5(comp1),
        .O(ram_empty_fb_i_reg));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module prefetch_buffer_fifo_compare_2
   (comp1,
    v1_reg_0,
    \gc0.count_reg[8] );
  output comp1;
  input [3:0]v1_reg_0;
  input \gc0.count_reg[8] ;

  wire comp1;
  wire \gc0.count_reg[8] ;
  wire [3:0]v1_reg_0;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED ;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED ;
  wire [7:5]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "(CARRY4)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY8 \gmux.gm[0].gm1.m1_CARRY4_CARRY8 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [7:5],comp1,\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [3:0]}),
        .DI({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED [7:5],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED [7:0]),
        .S({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED [7:5],\gc0.count_reg[8] ,v1_reg_0}));
endmodule

(* ORIG_REF_NAME = "fifo_generator_ramfifo" *) 
module prefetch_buffer_fifo_fifo_generator_ramfifo
   (dout,
    empty,
    full,
    rd_en,
    wr_en,
    rd_clk,
    wr_clk,
    din);
  output [15:0]dout;
  output empty;
  output full;
  input rd_en;
  input wr_en;
  input rd_clk;
  input wr_clk;
  input [15:0]din;

  wire [15:0]din;
  wire [15:0]dout;
  wire empty;
  wire full;
  wire \gntv_or_sync_fifo.gcx.clkx_n_0 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_9 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_1 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_19 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_20 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_21 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_22 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_23 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_24 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_25 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_26 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_1 ;
  wire [3:0]\gras.rsts/c0/v1_reg ;
  wire [3:0]\gras.rsts/c1/v1_reg ;
  wire [8:0]p_0_out;
  wire [8:0]p_12_out;
  wire [8:8]p_13_out;
  wire [8:8]p_22_out;
  wire [7:0]p_23_out;
  wire p_5_out;
  wire rd_clk;
  wire rd_en;
  wire [7:0]rd_pntr_plus1;
  wire wr_clk;
  wire wr_en;
  wire [8:8]wr_pntr_plus2;

  prefetch_buffer_fifo_clk_x_pntrs \gntv_or_sync_fifo.gcx.clkx 
       (.D(wr_pntr_plus2),
        .Q(p_23_out),
        .\gc0.count_d1_reg[7] ({\gntv_or_sync_fifo.gl0.rd_n_19 ,\gntv_or_sync_fifo.gl0.rd_n_20 ,\gntv_or_sync_fifo.gl0.rd_n_21 ,\gntv_or_sync_fifo.gl0.rd_n_22 ,\gntv_or_sync_fifo.gl0.rd_n_23 ,\gntv_or_sync_fifo.gl0.rd_n_24 ,\gntv_or_sync_fifo.gl0.rd_n_25 ,\gntv_or_sync_fifo.gl0.rd_n_26 }),
        .\gc0.count_d1_reg[8] (p_0_out),
        .\gc0.count_reg[7] (rd_pntr_plus1),
        .\gic0.gc0.count_d1_reg[8] (p_13_out),
        .\gic0.gc0.count_d2_reg[8] (p_12_out),
        .ram_empty_fb_i_reg(p_22_out),
        .ram_full_i_reg(\gntv_or_sync_fifo.gcx.clkx_n_0 ),
        .ram_full_i_reg_0(\gntv_or_sync_fifo.gcx.clkx_n_9 ),
        .rd_clk(rd_clk),
        .v1_reg(\gras.rsts/c0/v1_reg ),
        .v1_reg_0(\gras.rsts/c1/v1_reg ),
        .wr_clk(wr_clk));
  prefetch_buffer_fifo_rd_logic \gntv_or_sync_fifo.gl0.rd 
       (.\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\gntv_or_sync_fifo.gl0.rd_n_1 ),
        .Q(p_0_out),
        .empty(empty),
        .\gc0.count_d1_reg[7] (rd_pntr_plus1),
        .p_5_out(p_5_out),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .\rd_pntr_gc_reg[7] ({\gntv_or_sync_fifo.gl0.rd_n_19 ,\gntv_or_sync_fifo.gl0.rd_n_20 ,\gntv_or_sync_fifo.gl0.rd_n_21 ,\gntv_or_sync_fifo.gl0.rd_n_22 ,\gntv_or_sync_fifo.gl0.rd_n_23 ,\gntv_or_sync_fifo.gl0.rd_n_24 ,\gntv_or_sync_fifo.gl0.rd_n_25 ,\gntv_or_sync_fifo.gl0.rd_n_26 }),
        .v1_reg(\gras.rsts/c0/v1_reg ),
        .v1_reg_0(\gras.rsts/c1/v1_reg ),
        .\wr_pntr_bin_reg[8] (p_22_out));
  prefetch_buffer_fifo_wr_logic \gntv_or_sync_fifo.gl0.wr 
       (.\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (p_12_out),
        .E(\gntv_or_sync_fifo.gl0.wr_n_1 ),
        .Q(p_13_out),
        .full(full),
        .\gic0.gc0.count_d1_reg[8] (wr_pntr_plus2),
        .\rd_pntr_bin_reg[7] (p_23_out),
        .\rd_pntr_bin_reg[8] (\gntv_or_sync_fifo.gcx.clkx_n_0 ),
        .\rd_pntr_bin_reg[8]_0 (\gntv_or_sync_fifo.gcx.clkx_n_9 ),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
  prefetch_buffer_fifo_memory \gntv_or_sync_fifo.mem 
       (.E(\gntv_or_sync_fifo.gl0.wr_n_1 ),
        .Q(p_0_out),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[8] (p_12_out),
        .\gpregsm1.curr_fwft_state_reg[1] (\gntv_or_sync_fifo.gl0.rd_n_1 ),
        .p_5_out(p_5_out),
        .rd_clk(rd_clk),
        .wr_clk(wr_clk));
endmodule

(* ORIG_REF_NAME = "fifo_generator_top" *) 
module prefetch_buffer_fifo_fifo_generator_top
   (dout,
    empty,
    full,
    rd_en,
    wr_en,
    rd_clk,
    wr_clk,
    din);
  output [15:0]dout;
  output empty;
  output full;
  input rd_en;
  input wr_en;
  input rd_clk;
  input wr_clk;
  input [15:0]din;

  wire [15:0]din;
  wire [15:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire wr_clk;
  wire wr_en;

  prefetch_buffer_fifo_fifo_generator_ramfifo \grf.rf 
       (.din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
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
(* C_DATA_COUNT_WIDTH = "9" *) (* C_DEFAULT_VALUE = "BlankString" *) (* C_DIN_WIDTH = "16" *) 
(* C_DIN_WIDTH_AXIS = "1" *) (* C_DIN_WIDTH_RACH = "32" *) (* C_DIN_WIDTH_RDCH = "64" *) 
(* C_DIN_WIDTH_WACH = "1" *) (* C_DIN_WIDTH_WDCH = "64" *) (* C_DIN_WIDTH_WRCH = "2" *) 
(* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "16" *) (* C_ENABLE_RLOCS = "0" *) 
(* C_ENABLE_RST_SYNC = "1" *) (* C_EN_SAFETY_CKT = "0" *) (* C_ERROR_INJECTION_TYPE = "0" *) 
(* C_ERROR_INJECTION_TYPE_AXIS = "0" *) (* C_ERROR_INJECTION_TYPE_RACH = "0" *) (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
(* C_ERROR_INJECTION_TYPE_WACH = "0" *) (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
(* C_FAMILY = "kintexu" *) (* C_FULL_FLAGS_RST_VAL = "0" *) (* C_HAS_ALMOST_EMPTY = "0" *) 
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
(* C_HAS_SRST = "0" *) (* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "0" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) 
(* C_IMPLEMENTATION_TYPE = "2" *) (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
(* C_IMPLEMENTATION_TYPE_RDCH = "1" *) (* C_IMPLEMENTATION_TYPE_WACH = "1" *) (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
(* C_IMPLEMENTATION_TYPE_WRCH = "1" *) (* C_INIT_WR_PNTR_VAL = "0" *) (* C_INTERFACE_TYPE = "0" *) 
(* C_MEMORY_TYPE = "1" *) (* C_MIF_FILE_NAME = "BlankString" *) (* C_MSGON_VAL = "1" *) 
(* C_OPTIMIZATION_MODE = "0" *) (* C_OVERFLOW_LOW = "0" *) (* C_POWER_SAVING_MODE = "0" *) 
(* C_PRELOAD_LATENCY = "0" *) (* C_PRELOAD_REGS = "1" *) (* C_PRIM_FIFO_TYPE = "512x36" *) 
(* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) (* C_PRIM_FIFO_TYPE_RACH = "1kx36" *) (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
(* C_PRIM_FIFO_TYPE_WACH = "8kx4" *) (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) (* C_PRIM_FIFO_TYPE_WRCH = "8kx4" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) (* C_PROG_EMPTY_TYPE = "0" *) 
(* C_PROG_EMPTY_TYPE_AXIS = "0" *) (* C_PROG_EMPTY_TYPE_RACH = "0" *) (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
(* C_PROG_EMPTY_TYPE_WACH = "0" *) (* C_PROG_EMPTY_TYPE_WDCH = "0" *) (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) (* C_PROG_FULL_TYPE = "0" *) 
(* C_PROG_FULL_TYPE_AXIS = "0" *) (* C_PROG_FULL_TYPE_RACH = "0" *) (* C_PROG_FULL_TYPE_RDCH = "0" *) 
(* C_PROG_FULL_TYPE_WACH = "0" *) (* C_PROG_FULL_TYPE_WDCH = "0" *) (* C_PROG_FULL_TYPE_WRCH = "0" *) 
(* C_RACH_TYPE = "0" *) (* C_RDCH_TYPE = "0" *) (* C_RD_DATA_COUNT_WIDTH = "9" *) 
(* C_RD_DEPTH = "512" *) (* C_RD_FREQ = "1" *) (* C_RD_PNTR_WIDTH = "9" *) 
(* C_REG_SLICE_MODE_AXIS = "0" *) (* C_REG_SLICE_MODE_RACH = "0" *) (* C_REG_SLICE_MODE_RDCH = "0" *) 
(* C_REG_SLICE_MODE_WACH = "0" *) (* C_REG_SLICE_MODE_WDCH = "0" *) (* C_REG_SLICE_MODE_WRCH = "0" *) 
(* C_SELECT_XPM = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_UNDERFLOW_LOW = "0" *) 
(* C_USE_COMMON_OVERFLOW = "0" *) (* C_USE_COMMON_UNDERFLOW = "0" *) (* C_USE_DEFAULT_SETTINGS = "0" *) 
(* C_USE_DOUT_RST = "0" *) (* C_USE_ECC = "0" *) (* C_USE_ECC_AXIS = "0" *) 
(* C_USE_ECC_RACH = "0" *) (* C_USE_ECC_RDCH = "0" *) (* C_USE_ECC_WACH = "0" *) 
(* C_USE_ECC_WDCH = "0" *) (* C_USE_ECC_WRCH = "0" *) (* C_USE_EMBEDDED_REG = "1" *) 
(* C_USE_FIFO16_FLAGS = "0" *) (* C_USE_FWFT_DATA_COUNT = "0" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WACH_TYPE = "0" *) (* C_WDCH_TYPE = "0" *) 
(* C_WRCH_TYPE = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "9" *) 
(* C_WR_DEPTH = "512" *) (* C_WR_DEPTH_AXIS = "1024" *) (* C_WR_DEPTH_RACH = "16" *) 
(* C_WR_DEPTH_RDCH = "1024" *) (* C_WR_DEPTH_WACH = "16" *) (* C_WR_DEPTH_WDCH = "1024" *) 
(* C_WR_DEPTH_WRCH = "16" *) (* C_WR_FREQ = "1" *) (* C_WR_PNTR_WIDTH = "9" *) 
(* C_WR_PNTR_WIDTH_AXIS = "10" *) (* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
(* C_WR_PNTR_WIDTH_WACH = "4" *) (* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
(* C_WR_RESPONSE_LATENCY = "1" *) (* ORIG_REF_NAME = "fifo_generator_v13_1_0" *) 
module prefetch_buffer_fifo_fifo_generator_v13_1_0
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
  input [15:0]din;
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
  output [15:0]dout;
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
  wire [15:0]din;
  wire [15:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire wr_clk;
  wire wr_en;

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
  assign rd_rst_busy = \<const0> ;
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
  assign wr_rst_busy = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  prefetch_buffer_fifo_fifo_generator_v13_1_0_synth inst_fifo_gen
       (.din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "fifo_generator_v13_1_0_synth" *) 
module prefetch_buffer_fifo_fifo_generator_v13_1_0_synth
   (dout,
    empty,
    full,
    rd_en,
    wr_en,
    rd_clk,
    wr_clk,
    din);
  output [15:0]dout;
  output empty;
  output full;
  input rd_en;
  input wr_en;
  input rd_clk;
  input wr_clk;
  input [15:0]din;

  wire [15:0]din;
  wire [15:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire wr_clk;
  wire wr_en;

  prefetch_buffer_fifo_fifo_generator_top \gconvfifo.rf 
       (.din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "memory" *) 
module prefetch_buffer_fifo_memory
   (dout,
    rd_clk,
    wr_clk,
    \gpregsm1.curr_fwft_state_reg[1] ,
    E,
    p_5_out,
    Q,
    \gic0.gc0.count_d2_reg[8] ,
    din);
  output [15:0]dout;
  input rd_clk;
  input wr_clk;
  input \gpregsm1.curr_fwft_state_reg[1] ;
  input [0:0]E;
  input p_5_out;
  input [8:0]Q;
  input [8:0]\gic0.gc0.count_d2_reg[8] ;
  input [15:0]din;

  wire [0:0]E;
  wire [8:0]Q;
  wire [15:0]din;
  wire [15:0]dout;
  wire [8:0]\gic0.gc0.count_d2_reg[8] ;
  wire \gpregsm1.curr_fwft_state_reg[1] ;
  wire p_5_out;
  wire rd_clk;
  wire wr_clk;

  prefetch_buffer_fifo_blk_mem_gen_v8_3_2 \gbm.gbmg.gbmgb.ngecc.bmg 
       (.E(E),
        .Q(Q),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[8] (\gic0.gc0.count_d2_reg[8] ),
        .\gpregsm1.curr_fwft_state_reg[1] (\gpregsm1.curr_fwft_state_reg[1] ),
        .p_5_out(p_5_out),
        .rd_clk(rd_clk),
        .wr_clk(wr_clk));
endmodule

(* ORIG_REF_NAME = "rd_bin_cntr" *) 
module prefetch_buffer_fifo_rd_bin_cntr
   (ram_empty_fb_i_reg,
    Q,
    ram_empty_fb_i_reg_0,
    \gc0.count_d1_reg[7]_0 ,
    \rd_pntr_gc_reg[7] ,
    \wr_pntr_bin_reg[8] ,
    E,
    rd_clk);
  output ram_empty_fb_i_reg;
  output [8:0]Q;
  output ram_empty_fb_i_reg_0;
  output [7:0]\gc0.count_d1_reg[7]_0 ;
  output [7:0]\rd_pntr_gc_reg[7] ;
  input [0:0]\wr_pntr_bin_reg[8] ;
  input [0:0]E;
  input rd_clk;

  wire [0:0]E;
  wire [8:0]Q;
  wire \gc0.count[8]_i_2_n_0 ;
  wire [7:0]\gc0.count_d1_reg[7]_0 ;
  wire [8:0]plusOp;
  wire ram_empty_fb_i_reg;
  wire ram_empty_fb_i_reg_0;
  wire rd_clk;
  wire [7:0]\rd_pntr_gc_reg[7] ;
  wire [8:8]rd_pntr_plus1;
  wire [0:0]\wr_pntr_bin_reg[8] ;

  LUT1 #(
    .INIT(2'h1)) 
    \gc0.count[0]_i_1 
       (.I0(\gc0.count_d1_reg[7]_0 [0]),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gc0.count[1]_i_1 
       (.I0(\gc0.count_d1_reg[7]_0 [0]),
        .I1(\gc0.count_d1_reg[7]_0 [1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gc0.count[2]_i_1 
       (.I0(\gc0.count_d1_reg[7]_0 [0]),
        .I1(\gc0.count_d1_reg[7]_0 [1]),
        .I2(\gc0.count_d1_reg[7]_0 [2]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gc0.count[3]_i_1 
       (.I0(\gc0.count_d1_reg[7]_0 [1]),
        .I1(\gc0.count_d1_reg[7]_0 [0]),
        .I2(\gc0.count_d1_reg[7]_0 [2]),
        .I3(\gc0.count_d1_reg[7]_0 [3]),
        .O(plusOp[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gc0.count[4]_i_1 
       (.I0(\gc0.count_d1_reg[7]_0 [2]),
        .I1(\gc0.count_d1_reg[7]_0 [0]),
        .I2(\gc0.count_d1_reg[7]_0 [1]),
        .I3(\gc0.count_d1_reg[7]_0 [3]),
        .I4(\gc0.count_d1_reg[7]_0 [4]),
        .O(plusOp[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \gc0.count[5]_i_1 
       (.I0(\gc0.count_d1_reg[7]_0 [3]),
        .I1(\gc0.count_d1_reg[7]_0 [1]),
        .I2(\gc0.count_d1_reg[7]_0 [0]),
        .I3(\gc0.count_d1_reg[7]_0 [2]),
        .I4(\gc0.count_d1_reg[7]_0 [4]),
        .I5(\gc0.count_d1_reg[7]_0 [5]),
        .O(plusOp[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \gc0.count[6]_i_1 
       (.I0(\gc0.count[8]_i_2_n_0 ),
        .I1(\gc0.count_d1_reg[7]_0 [6]),
        .O(plusOp[6]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gc0.count[7]_i_1 
       (.I0(\gc0.count[8]_i_2_n_0 ),
        .I1(\gc0.count_d1_reg[7]_0 [6]),
        .I2(\gc0.count_d1_reg[7]_0 [7]),
        .O(plusOp[7]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gc0.count[8]_i_1 
       (.I0(\gc0.count_d1_reg[7]_0 [6]),
        .I1(\gc0.count[8]_i_2_n_0 ),
        .I2(\gc0.count_d1_reg[7]_0 [7]),
        .I3(rd_pntr_plus1),
        .O(plusOp[8]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \gc0.count[8]_i_2 
       (.I0(\gc0.count_d1_reg[7]_0 [5]),
        .I1(\gc0.count_d1_reg[7]_0 [3]),
        .I2(\gc0.count_d1_reg[7]_0 [1]),
        .I3(\gc0.count_d1_reg[7]_0 [0]),
        .I4(\gc0.count_d1_reg[7]_0 [2]),
        .I5(\gc0.count_d1_reg[7]_0 [4]),
        .O(\gc0.count[8]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[0] 
       (.C(rd_clk),
        .CE(E),
        .D(\gc0.count_d1_reg[7]_0 [0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[1] 
       (.C(rd_clk),
        .CE(E),
        .D(\gc0.count_d1_reg[7]_0 [1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[2] 
       (.C(rd_clk),
        .CE(E),
        .D(\gc0.count_d1_reg[7]_0 [2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[3] 
       (.C(rd_clk),
        .CE(E),
        .D(\gc0.count_d1_reg[7]_0 [3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[4] 
       (.C(rd_clk),
        .CE(E),
        .D(\gc0.count_d1_reg[7]_0 [4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[5] 
       (.C(rd_clk),
        .CE(E),
        .D(\gc0.count_d1_reg[7]_0 [5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[6] 
       (.C(rd_clk),
        .CE(E),
        .D(\gc0.count_d1_reg[7]_0 [6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[7] 
       (.C(rd_clk),
        .CE(E),
        .D(\gc0.count_d1_reg[7]_0 [7]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[8] 
       (.C(rd_clk),
        .CE(E),
        .D(rd_pntr_plus1),
        .Q(Q[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \gc0.count_reg[0] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp[0]),
        .Q(\gc0.count_d1_reg[7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[1] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp[1]),
        .Q(\gc0.count_d1_reg[7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[2] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp[2]),
        .Q(\gc0.count_d1_reg[7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[3] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp[3]),
        .Q(\gc0.count_d1_reg[7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[4] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp[4]),
        .Q(\gc0.count_d1_reg[7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[5] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp[5]),
        .Q(\gc0.count_d1_reg[7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[6] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp[6]),
        .Q(\gc0.count_d1_reg[7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[7] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp[7]),
        .Q(\gc0.count_d1_reg[7]_0 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[8] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp[8]),
        .Q(rd_pntr_plus1),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1 
       (.I0(Q[8]),
        .I1(\wr_pntr_bin_reg[8] ),
        .O(ram_empty_fb_i_reg));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1),
        .I1(\wr_pntr_bin_reg[8] ),
        .O(ram_empty_fb_i_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_gc[0]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\rd_pntr_gc_reg[7] [0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_gc[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[2]),
        .O(\rd_pntr_gc_reg[7] [1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_gc[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[3]),
        .O(\rd_pntr_gc_reg[7] [2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_gc[3]_i_1 
       (.I0(Q[3]),
        .I1(Q[4]),
        .O(\rd_pntr_gc_reg[7] [3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_gc[4]_i_1 
       (.I0(Q[4]),
        .I1(Q[5]),
        .O(\rd_pntr_gc_reg[7] [4]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_gc[5]_i_1 
       (.I0(Q[5]),
        .I1(Q[6]),
        .O(\rd_pntr_gc_reg[7] [5]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_gc[6]_i_1 
       (.I0(Q[6]),
        .I1(Q[7]),
        .O(\rd_pntr_gc_reg[7] [6]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_gc[7]_i_1 
       (.I0(Q[7]),
        .I1(Q[8]),
        .O(\rd_pntr_gc_reg[7] [7]));
endmodule

(* ORIG_REF_NAME = "rd_fwft" *) 
module prefetch_buffer_fifo_rd_fwft
   (empty,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    Q,
    E,
    p_5_out,
    rd_clk,
    rd_en,
    p_2_out);
  output empty;
  output \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  output [1:0]Q;
  output [0:0]E;
  output p_5_out;
  input rd_clk;
  input rd_en;
  input p_2_out;

  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire [1:0]Q;
  wire empty;
  wire empty_fwft_fb;
  wire empty_fwft_i0;
  wire [1:0]next_fwft_state;
  wire p_2_out;
  wire p_5_out;
  wire rd_clk;
  wire rd_en;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h00F7)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(rd_en),
        .I3(p_2_out),
        .O(\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hA2)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_3 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(rd_en),
        .O(p_5_out));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    empty_fwft_fb_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(empty_fwft_i0),
        .Q(empty_fwft_fb),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hBA22)) 
    empty_fwft_i_i_1
       (.I0(empty_fwft_fb),
        .I1(Q[1]),
        .I2(rd_en),
        .I3(Q[0]),
        .O(empty_fwft_i0));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    empty_fwft_i_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(empty_fwft_i0),
        .Q(empty),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h00BF)) 
    \gc0.count_d1[8]_i_1 
       (.I0(rd_en),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(p_2_out),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \gpregsm1.curr_fwft_state[0]_i_1 
       (.I0(Q[1]),
        .I1(rd_en),
        .I2(Q[0]),
        .O(next_fwft_state[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h20FF)) 
    \gpregsm1.curr_fwft_state[1]_i_1 
       (.I0(Q[1]),
        .I1(rd_en),
        .I2(Q[0]),
        .I3(p_2_out),
        .O(next_fwft_state[1]));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(next_fwft_state[0]),
        .Q(Q[0]),
        .R(1'b0));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(next_fwft_state[1]),
        .Q(Q[1]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "rd_logic" *) 
module prefetch_buffer_fifo_rd_logic
   (empty,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    Q,
    \gc0.count_d1_reg[7] ,
    \rd_pntr_gc_reg[7] ,
    p_5_out,
    v1_reg,
    v1_reg_0,
    rd_clk,
    rd_en,
    \wr_pntr_bin_reg[8] );
  output empty;
  output \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  output [8:0]Q;
  output [7:0]\gc0.count_d1_reg[7] ;
  output [7:0]\rd_pntr_gc_reg[7] ;
  output p_5_out;
  input [3:0]v1_reg;
  input [3:0]v1_reg_0;
  input rd_clk;
  input rd_en;
  input [0:0]\wr_pntr_bin_reg[8] ;

  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [8:0]Q;
  wire [0:0]curr_fwft_state;
  wire empty;
  wire [7:0]\gc0.count_d1_reg[7] ;
  wire \gr1.gr1_int.rfwft_n_2 ;
  wire p_2_out;
  wire p_5_out;
  wire p_7_out;
  wire rd_clk;
  wire rd_en;
  wire [7:0]\rd_pntr_gc_reg[7] ;
  wire rpntr_n_0;
  wire rpntr_n_10;
  wire [3:0]v1_reg;
  wire [3:0]v1_reg_0;
  wire [0:0]\wr_pntr_bin_reg[8] ;

  prefetch_buffer_fifo_rd_fwft \gr1.gr1_int.rfwft 
       (.\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .E(p_7_out),
        .Q({\gr1.gr1_int.rfwft_n_2 ,curr_fwft_state}),
        .empty(empty),
        .p_2_out(p_2_out),
        .p_5_out(p_5_out),
        .rd_clk(rd_clk),
        .rd_en(rd_en));
  prefetch_buffer_fifo_rd_status_flags_as \gras.rsts 
       (.Q({\gr1.gr1_int.rfwft_n_2 ,curr_fwft_state}),
        .\gc0.count_d1_reg[8] (rpntr_n_0),
        .\gc0.count_reg[8] (rpntr_n_10),
        .p_2_out(p_2_out),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .v1_reg(v1_reg),
        .v1_reg_0(v1_reg_0));
  prefetch_buffer_fifo_rd_bin_cntr rpntr
       (.E(p_7_out),
        .Q(Q),
        .\gc0.count_d1_reg[7]_0 (\gc0.count_d1_reg[7] ),
        .ram_empty_fb_i_reg(rpntr_n_0),
        .ram_empty_fb_i_reg_0(rpntr_n_10),
        .rd_clk(rd_clk),
        .\rd_pntr_gc_reg[7] (\rd_pntr_gc_reg[7] ),
        .\wr_pntr_bin_reg[8] (\wr_pntr_bin_reg[8] ));
endmodule

(* ORIG_REF_NAME = "rd_status_flags_as" *) 
module prefetch_buffer_fifo_rd_status_flags_as
   (p_2_out,
    v1_reg,
    \gc0.count_d1_reg[8] ,
    v1_reg_0,
    \gc0.count_reg[8] ,
    rd_clk,
    rd_en,
    Q);
  output p_2_out;
  input [3:0]v1_reg;
  input \gc0.count_d1_reg[8] ;
  input [3:0]v1_reg_0;
  input \gc0.count_reg[8] ;
  input rd_clk;
  input rd_en;
  input [1:0]Q;

  wire [1:0]Q;
  wire c0_n_0;
  wire comp1;
  wire \gc0.count_d1_reg[8] ;
  wire \gc0.count_reg[8] ;
  wire p_2_out;
  wire rd_clk;
  wire rd_en;
  wire [3:0]v1_reg;
  wire [3:0]v1_reg_0;

  prefetch_buffer_fifo_compare_1 c0
       (.Q(Q),
        .comp1(comp1),
        .\gc0.count_d1_reg[8] (\gc0.count_d1_reg[8] ),
        .p_2_out(p_2_out),
        .ram_empty_fb_i_reg(c0_n_0),
        .rd_en(rd_en),
        .v1_reg(v1_reg));
  prefetch_buffer_fifo_compare_2 c1
       (.comp1(comp1),
        .\gc0.count_reg[8] (\gc0.count_reg[8] ),
        .v1_reg_0(v1_reg_0));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    ram_empty_fb_i_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(c0_n_0),
        .Q(p_2_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "synchronizer_ff" *) 
module prefetch_buffer_fifo_synchronizer_ff
   (out,
    Q,
    rd_clk);
  output [8:0]out;
  input [8:0]Q;
  input rd_clk;

  wire [8:0]Q;
  (* async_reg = "true" *) (* msgon = "true" *) wire [8:0]Q_reg;
  wire rd_clk;

  assign out[8:0] = Q_reg;
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(Q[0]),
        .Q(Q_reg[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(Q[1]),
        .Q(Q_reg[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[2] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(Q[2]),
        .Q(Q_reg[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[3] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(Q[3]),
        .Q(Q_reg[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[4] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(Q[4]),
        .Q(Q_reg[4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[5] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(Q[5]),
        .Q(Q_reg[5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[6] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(Q[6]),
        .Q(Q_reg[6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[7] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(Q[7]),
        .Q(Q_reg[7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[8] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(Q[8]),
        .Q(Q_reg[8]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "synchronizer_ff" *) 
module prefetch_buffer_fifo_synchronizer_ff_3
   (out,
    Q,
    wr_clk);
  output [8:0]out;
  input [8:0]Q;
  input wr_clk;

  wire [8:0]Q;
  (* async_reg = "true" *) (* msgon = "true" *) wire [8:0]Q_reg;
  wire wr_clk;

  assign out[8:0] = Q_reg;
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(Q[0]),
        .Q(Q_reg[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(Q[1]),
        .Q(Q_reg[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(Q[2]),
        .Q(Q_reg[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(Q[3]),
        .Q(Q_reg[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(Q[4]),
        .Q(Q_reg[4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[5] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(Q[5]),
        .Q(Q_reg[5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[6] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(Q[6]),
        .Q(Q_reg[6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[7] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(Q[7]),
        .Q(Q_reg[7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[8] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(Q[8]),
        .Q(Q_reg[8]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "synchronizer_ff" *) 
module prefetch_buffer_fifo_synchronizer_ff_4
   (\wr_pntr_bin_reg[8] ,
    D,
    out,
    rd_clk);
  output [0:0]\wr_pntr_bin_reg[8] ;
  output [7:0]D;
  input [8:0]out;
  input rd_clk;

  wire [7:0]D;
  (* async_reg = "true" *) (* msgon = "true" *) wire [8:0]Q_reg;
  wire [8:0]out;
  wire rd_clk;
  wire \wr_pntr_bin[1]_i_2_n_0 ;
  wire \wr_pntr_bin[2]_i_2_n_0 ;

  assign \wr_pntr_bin_reg[8] [0] = Q_reg[8];
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(out[0]),
        .Q(Q_reg[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(out[1]),
        .Q(Q_reg[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[2] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(out[2]),
        .Q(Q_reg[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[3] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(out[3]),
        .Q(Q_reg[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[4] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(out[4]),
        .Q(Q_reg[4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[5] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(out[5]),
        .Q(Q_reg[5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[6] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(out[6]),
        .Q(Q_reg[6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[7] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(out[7]),
        .Q(Q_reg[7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[8] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(out[8]),
        .Q(Q_reg[8]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \wr_pntr_bin[0]_i_1 
       (.I0(Q_reg[1]),
        .I1(Q_reg[0]),
        .I2(\wr_pntr_bin[1]_i_2_n_0 ),
        .I3(Q_reg[3]),
        .I4(Q_reg[2]),
        .I5(Q_reg[8]),
        .O(D[0]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \wr_pntr_bin[1]_i_1 
       (.I0(\wr_pntr_bin[1]_i_2_n_0 ),
        .I1(Q_reg[3]),
        .I2(Q_reg[2]),
        .I3(Q_reg[8]),
        .I4(Q_reg[1]),
        .O(D[1]));
  LUT4 #(
    .INIT(16'h6996)) 
    \wr_pntr_bin[1]_i_2 
       (.I0(Q_reg[7]),
        .I1(Q_reg[6]),
        .I2(Q_reg[5]),
        .I3(Q_reg[4]),
        .O(\wr_pntr_bin[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \wr_pntr_bin[2]_i_1 
       (.I0(Q_reg[8]),
        .I1(Q_reg[2]),
        .I2(Q_reg[3]),
        .I3(\wr_pntr_bin[2]_i_2_n_0 ),
        .I4(Q_reg[6]),
        .I5(Q_reg[7]),
        .O(D[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_bin[2]_i_2 
       (.I0(Q_reg[4]),
        .I1(Q_reg[5]),
        .O(\wr_pntr_bin[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \wr_pntr_bin[3]_i_1 
       (.I0(Q_reg[5]),
        .I1(Q_reg[3]),
        .I2(Q_reg[4]),
        .I3(Q_reg[8]),
        .I4(Q_reg[6]),
        .I5(Q_reg[7]),
        .O(D[3]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \wr_pntr_bin[4]_i_1 
       (.I0(Q_reg[6]),
        .I1(Q_reg[4]),
        .I2(Q_reg[5]),
        .I3(Q_reg[8]),
        .I4(Q_reg[7]),
        .O(D[4]));
  LUT4 #(
    .INIT(16'h6996)) 
    \wr_pntr_bin[5]_i_1 
       (.I0(Q_reg[6]),
        .I1(Q_reg[5]),
        .I2(Q_reg[8]),
        .I3(Q_reg[7]),
        .O(D[5]));
  LUT3 #(
    .INIT(8'h96)) 
    \wr_pntr_bin[6]_i_1 
       (.I0(Q_reg[7]),
        .I1(Q_reg[6]),
        .I2(Q_reg[8]),
        .O(D[6]));
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_bin[7]_i_1 
       (.I0(Q_reg[7]),
        .I1(Q_reg[8]),
        .O(D[7]));
endmodule

(* ORIG_REF_NAME = "synchronizer_ff" *) 
module prefetch_buffer_fifo_synchronizer_ff_5
   (\rd_pntr_bin_reg[8] ,
    D,
    out,
    wr_clk);
  output [0:0]\rd_pntr_bin_reg[8] ;
  output [7:0]D;
  input [8:0]out;
  input wr_clk;

  wire [7:0]D;
  (* async_reg = "true" *) (* msgon = "true" *) wire [8:0]Q_reg;
  wire [8:0]out;
  wire \rd_pntr_bin[1]_i_2_n_0 ;
  wire \rd_pntr_bin[2]_i_2_n_0 ;
  wire wr_clk;

  assign \rd_pntr_bin_reg[8] [0] = Q_reg[8];
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(out[0]),
        .Q(Q_reg[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(out[1]),
        .Q(Q_reg[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(out[2]),
        .Q(Q_reg[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(out[3]),
        .Q(Q_reg[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(out[4]),
        .Q(Q_reg[4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[5] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(out[5]),
        .Q(Q_reg[5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[6] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(out[6]),
        .Q(Q_reg[6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[7] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(out[7]),
        .Q(Q_reg[7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[8] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(out[8]),
        .Q(Q_reg[8]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \rd_pntr_bin[0]_i_1 
       (.I0(Q_reg[1]),
        .I1(Q_reg[0]),
        .I2(\rd_pntr_bin[1]_i_2_n_0 ),
        .I3(Q_reg[3]),
        .I4(Q_reg[2]),
        .I5(Q_reg[8]),
        .O(D[0]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \rd_pntr_bin[1]_i_1 
       (.I0(\rd_pntr_bin[1]_i_2_n_0 ),
        .I1(Q_reg[3]),
        .I2(Q_reg[2]),
        .I3(Q_reg[8]),
        .I4(Q_reg[1]),
        .O(D[1]));
  LUT4 #(
    .INIT(16'h6996)) 
    \rd_pntr_bin[1]_i_2 
       (.I0(Q_reg[7]),
        .I1(Q_reg[6]),
        .I2(Q_reg[5]),
        .I3(Q_reg[4]),
        .O(\rd_pntr_bin[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \rd_pntr_bin[2]_i_1 
       (.I0(Q_reg[8]),
        .I1(Q_reg[2]),
        .I2(Q_reg[3]),
        .I3(\rd_pntr_bin[2]_i_2_n_0 ),
        .I4(Q_reg[6]),
        .I5(Q_reg[7]),
        .O(D[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_bin[2]_i_2 
       (.I0(Q_reg[4]),
        .I1(Q_reg[5]),
        .O(\rd_pntr_bin[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \rd_pntr_bin[3]_i_1 
       (.I0(Q_reg[5]),
        .I1(Q_reg[3]),
        .I2(Q_reg[4]),
        .I3(Q_reg[8]),
        .I4(Q_reg[6]),
        .I5(Q_reg[7]),
        .O(D[3]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \rd_pntr_bin[4]_i_1 
       (.I0(Q_reg[6]),
        .I1(Q_reg[4]),
        .I2(Q_reg[5]),
        .I3(Q_reg[8]),
        .I4(Q_reg[7]),
        .O(D[4]));
  LUT4 #(
    .INIT(16'h6996)) 
    \rd_pntr_bin[5]_i_1 
       (.I0(Q_reg[6]),
        .I1(Q_reg[5]),
        .I2(Q_reg[8]),
        .I3(Q_reg[7]),
        .O(D[5]));
  LUT3 #(
    .INIT(8'h96)) 
    \rd_pntr_bin[6]_i_1 
       (.I0(Q_reg[7]),
        .I1(Q_reg[6]),
        .I2(Q_reg[8]),
        .O(D[6]));
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_bin[7]_i_1 
       (.I0(Q_reg[7]),
        .I1(Q_reg[8]),
        .O(D[7]));
endmodule

(* ORIG_REF_NAME = "wr_bin_cntr" *) 
module prefetch_buffer_fifo_wr_bin_cntr
   (Q,
    \gic0.gc0.count_d1_reg[8]_0 ,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    v1_reg,
    v1_reg_0,
    E,
    wr_clk,
    \rd_pntr_bin_reg[7] );
  output [0:0]Q;
  output [0:0]\gic0.gc0.count_d1_reg[8]_0 ;
  output [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  output [3:0]v1_reg;
  output [3:0]v1_reg_0;
  input [0:0]E;
  input wr_clk;
  input [7:0]\rd_pntr_bin_reg[7] ;

  wire [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire [0:0]Q;
  wire \gic0.gc0.count[8]_i_2_n_0 ;
  wire [0:0]\gic0.gc0.count_d1_reg[8]_0 ;
  wire [7:0]p_13_out;
  wire [8:0]plusOp__0;
  wire [7:0]\rd_pntr_bin_reg[7] ;
  wire [3:0]v1_reg;
  wire [3:0]v1_reg_0;
  wire wr_clk;
  wire [7:0]wr_pntr_plus2;

  LUT1 #(
    .INIT(2'h1)) 
    \gic0.gc0.count[0]_i_1 
       (.I0(wr_pntr_plus2[0]),
        .O(plusOp__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gic0.gc0.count[1]_i_1 
       (.I0(wr_pntr_plus2[0]),
        .I1(wr_pntr_plus2[1]),
        .O(plusOp__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gic0.gc0.count[2]_i_1 
       (.I0(wr_pntr_plus2[0]),
        .I1(wr_pntr_plus2[1]),
        .I2(wr_pntr_plus2[2]),
        .O(plusOp__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gic0.gc0.count[3]_i_1 
       (.I0(wr_pntr_plus2[1]),
        .I1(wr_pntr_plus2[0]),
        .I2(wr_pntr_plus2[2]),
        .I3(wr_pntr_plus2[3]),
        .O(plusOp__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gic0.gc0.count[4]_i_1 
       (.I0(wr_pntr_plus2[2]),
        .I1(wr_pntr_plus2[0]),
        .I2(wr_pntr_plus2[1]),
        .I3(wr_pntr_plus2[3]),
        .I4(wr_pntr_plus2[4]),
        .O(plusOp__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \gic0.gc0.count[5]_i_1 
       (.I0(wr_pntr_plus2[3]),
        .I1(wr_pntr_plus2[1]),
        .I2(wr_pntr_plus2[0]),
        .I3(wr_pntr_plus2[2]),
        .I4(wr_pntr_plus2[4]),
        .I5(wr_pntr_plus2[5]),
        .O(plusOp__0[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \gic0.gc0.count[6]_i_1 
       (.I0(\gic0.gc0.count[8]_i_2_n_0 ),
        .I1(wr_pntr_plus2[6]),
        .O(plusOp__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gic0.gc0.count[7]_i_1 
       (.I0(\gic0.gc0.count[8]_i_2_n_0 ),
        .I1(wr_pntr_plus2[6]),
        .I2(wr_pntr_plus2[7]),
        .O(plusOp__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gic0.gc0.count[8]_i_1 
       (.I0(wr_pntr_plus2[6]),
        .I1(\gic0.gc0.count[8]_i_2_n_0 ),
        .I2(wr_pntr_plus2[7]),
        .I3(\gic0.gc0.count_d1_reg[8]_0 ),
        .O(plusOp__0[8]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \gic0.gc0.count[8]_i_2 
       (.I0(wr_pntr_plus2[5]),
        .I1(wr_pntr_plus2[3]),
        .I2(wr_pntr_plus2[1]),
        .I3(wr_pntr_plus2[0]),
        .I4(wr_pntr_plus2[2]),
        .I5(wr_pntr_plus2[4]),
        .O(\gic0.gc0.count[8]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \gic0.gc0.count_d1_reg[0] 
       (.C(wr_clk),
        .CE(E),
        .D(wr_pntr_plus2[0]),
        .Q(p_13_out[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[1] 
       (.C(wr_clk),
        .CE(E),
        .D(wr_pntr_plus2[1]),
        .Q(p_13_out[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[2] 
       (.C(wr_clk),
        .CE(E),
        .D(wr_pntr_plus2[2]),
        .Q(p_13_out[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[3] 
       (.C(wr_clk),
        .CE(E),
        .D(wr_pntr_plus2[3]),
        .Q(p_13_out[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[4] 
       (.C(wr_clk),
        .CE(E),
        .D(wr_pntr_plus2[4]),
        .Q(p_13_out[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[5] 
       (.C(wr_clk),
        .CE(E),
        .D(wr_pntr_plus2[5]),
        .Q(p_13_out[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[6] 
       (.C(wr_clk),
        .CE(E),
        .D(wr_pntr_plus2[6]),
        .Q(p_13_out[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[7] 
       (.C(wr_clk),
        .CE(E),
        .D(wr_pntr_plus2[7]),
        .Q(p_13_out[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[8] 
       (.C(wr_clk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 ),
        .Q(Q),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[0] 
       (.C(wr_clk),
        .CE(E),
        .D(p_13_out[0]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[1] 
       (.C(wr_clk),
        .CE(E),
        .D(p_13_out[1]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[2] 
       (.C(wr_clk),
        .CE(E),
        .D(p_13_out[2]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[3] 
       (.C(wr_clk),
        .CE(E),
        .D(p_13_out[3]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[4] 
       (.C(wr_clk),
        .CE(E),
        .D(p_13_out[4]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[5] 
       (.C(wr_clk),
        .CE(E),
        .D(p_13_out[5]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[6] 
       (.C(wr_clk),
        .CE(E),
        .D(p_13_out[6]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[7] 
       (.C(wr_clk),
        .CE(E),
        .D(p_13_out[7]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[8] 
       (.C(wr_clk),
        .CE(E),
        .D(Q),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[0] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[0]),
        .Q(wr_pntr_plus2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \gic0.gc0.count_reg[1] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[1]),
        .Q(wr_pntr_plus2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[2] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[2]),
        .Q(wr_pntr_plus2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[3] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[3]),
        .Q(wr_pntr_plus2[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[4] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[4]),
        .Q(wr_pntr_plus2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[5] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[5]),
        .Q(wr_pntr_plus2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[6] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[6]),
        .Q(wr_pntr_plus2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[7] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[7]),
        .Q(wr_pntr_plus2[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[8] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[8]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__1 
       (.I0(p_13_out[0]),
        .I1(\rd_pntr_bin_reg[7] [0]),
        .I2(p_13_out[1]),
        .I3(\rd_pntr_bin_reg[7] [1]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__2 
       (.I0(wr_pntr_plus2[0]),
        .I1(\rd_pntr_bin_reg[7] [0]),
        .I2(wr_pntr_plus2[1]),
        .I3(\rd_pntr_bin_reg[7] [1]),
        .O(v1_reg_0[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__1 
       (.I0(p_13_out[2]),
        .I1(\rd_pntr_bin_reg[7] [2]),
        .I2(p_13_out[3]),
        .I3(\rd_pntr_bin_reg[7] [3]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__2 
       (.I0(wr_pntr_plus2[2]),
        .I1(\rd_pntr_bin_reg[7] [2]),
        .I2(wr_pntr_plus2[3]),
        .I3(\rd_pntr_bin_reg[7] [3]),
        .O(v1_reg_0[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__1 
       (.I0(p_13_out[4]),
        .I1(\rd_pntr_bin_reg[7] [4]),
        .I2(p_13_out[5]),
        .I3(\rd_pntr_bin_reg[7] [5]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__2 
       (.I0(wr_pntr_plus2[4]),
        .I1(\rd_pntr_bin_reg[7] [4]),
        .I2(wr_pntr_plus2[5]),
        .I3(\rd_pntr_bin_reg[7] [5]),
        .O(v1_reg_0[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__1 
       (.I0(p_13_out[6]),
        .I1(\rd_pntr_bin_reg[7] [6]),
        .I2(p_13_out[7]),
        .I3(\rd_pntr_bin_reg[7] [7]),
        .O(v1_reg[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__2 
       (.I0(wr_pntr_plus2[6]),
        .I1(\rd_pntr_bin_reg[7] [6]),
        .I2(wr_pntr_plus2[7]),
        .I3(\rd_pntr_bin_reg[7] [7]),
        .O(v1_reg_0[3]));
endmodule

(* ORIG_REF_NAME = "wr_logic" *) 
module prefetch_buffer_fifo_wr_logic
   (full,
    E,
    Q,
    \gic0.gc0.count_d1_reg[8] ,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    \rd_pntr_bin_reg[8] ,
    \rd_pntr_bin_reg[8]_0 ,
    wr_clk,
    wr_en,
    \rd_pntr_bin_reg[7] );
  output full;
  output [0:0]E;
  output [0:0]Q;
  output [0:0]\gic0.gc0.count_d1_reg[8] ;
  output [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input \rd_pntr_bin_reg[8] ;
  input \rd_pntr_bin_reg[8]_0 ;
  input wr_clk;
  input wr_en;
  input [7:0]\rd_pntr_bin_reg[7] ;

  wire [8:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire [0:0]Q;
  wire [3:0]\c1/v1_reg ;
  wire [3:0]\c2/v1_reg ;
  wire full;
  wire [0:0]\gic0.gc0.count_d1_reg[8] ;
  wire [7:0]\rd_pntr_bin_reg[7] ;
  wire \rd_pntr_bin_reg[8] ;
  wire \rd_pntr_bin_reg[8]_0 ;
  wire wr_clk;
  wire wr_en;

  prefetch_buffer_fifo_wr_status_flags_as \gwas.wsts 
       (.E(E),
        .full(full),
        .\rd_pntr_bin_reg[8] (\rd_pntr_bin_reg[8] ),
        .\rd_pntr_bin_reg[8]_0 (\rd_pntr_bin_reg[8]_0 ),
        .v1_reg(\c1/v1_reg ),
        .v1_reg_0(\c2/v1_reg ),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
  prefetch_buffer_fifo_wr_bin_cntr wpntr
       (.\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .E(E),
        .Q(Q),
        .\gic0.gc0.count_d1_reg[8]_0 (\gic0.gc0.count_d1_reg[8] ),
        .\rd_pntr_bin_reg[7] (\rd_pntr_bin_reg[7] ),
        .v1_reg(\c1/v1_reg ),
        .v1_reg_0(\c2/v1_reg ),
        .wr_clk(wr_clk));
endmodule

(* ORIG_REF_NAME = "wr_status_flags_as" *) 
module prefetch_buffer_fifo_wr_status_flags_as
   (full,
    E,
    v1_reg,
    \rd_pntr_bin_reg[8] ,
    v1_reg_0,
    \rd_pntr_bin_reg[8]_0 ,
    wr_clk,
    wr_en);
  output full;
  output [0:0]E;
  input [3:0]v1_reg;
  input \rd_pntr_bin_reg[8] ;
  input [3:0]v1_reg_0;
  input \rd_pntr_bin_reg[8]_0 ;
  input wr_clk;
  input wr_en;

  wire [0:0]E;
  wire c1_n_0;
  wire comp2;
  wire full;
  wire ram_full_fb;
  wire \rd_pntr_bin_reg[8] ;
  wire \rd_pntr_bin_reg[8]_0 ;
  wire [3:0]v1_reg;
  wire [3:0]v1_reg_0;
  wire wr_clk;
  wire wr_en;

  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_2 
       (.I0(wr_en),
        .I1(ram_full_fb),
        .O(E));
  prefetch_buffer_fifo_compare c1
       (.comp2(comp2),
        .ram_full_fb(ram_full_fb),
        .ram_full_i_reg(c1_n_0),
        .\rd_pntr_bin_reg[8] (\rd_pntr_bin_reg[8] ),
        .v1_reg(v1_reg),
        .wr_en(wr_en));
  prefetch_buffer_fifo_compare_0 c2
       (.comp2(comp2),
        .\rd_pntr_bin_reg[8] (\rd_pntr_bin_reg[8]_0 ),
        .v1_reg_0(v1_reg_0));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    ram_full_fb_i_reg
       (.C(wr_clk),
        .CE(1'b1),
        .D(c1_n_0),
        .Q(ram_full_fb),
        .R(1'b0));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    ram_full_i_reg
       (.C(wr_clk),
        .CE(1'b1),
        .D(c1_n_0),
        .Q(full),
        .R(1'b0));
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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
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
