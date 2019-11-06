library verilog;
use verilog.vl_types.all;
entity fifo_generator_vlog_beh is
    generic(
        C_COMMON_CLOCK  : integer := 0;
        C_COUNT_TYPE    : integer := 0;
        C_DATA_COUNT_WIDTH: integer := 2;
        C_DEFAULT_VALUE : string  := "";
        C_DIN_WIDTH     : integer := 8;
        C_DOUT_RST_VAL  : string  := "";
        C_DOUT_WIDTH    : integer := 8;
        C_ENABLE_RLOCS  : integer := 0;
        C_FAMILY        : string  := "";
        C_FULL_FLAGS_RST_VAL: integer := 1;
        C_HAS_ALMOST_EMPTY: integer := 0;
        C_HAS_ALMOST_FULL: integer := 0;
        C_HAS_BACKUP    : integer := 0;
        C_HAS_DATA_COUNT: integer := 0;
        C_HAS_INT_CLK   : integer := 0;
        C_HAS_MEMINIT_FILE: integer := 0;
        C_HAS_OVERFLOW  : integer := 0;
        C_HAS_RD_DATA_COUNT: integer := 0;
        C_HAS_RD_RST    : integer := 0;
        C_HAS_RST       : integer := 1;
        C_HAS_SRST      : integer := 0;
        C_HAS_UNDERFLOW : integer := 0;
        C_HAS_VALID     : integer := 0;
        C_HAS_WR_ACK    : integer := 0;
        C_HAS_WR_DATA_COUNT: integer := 0;
        C_HAS_WR_RST    : integer := 0;
        C_IMPLEMENTATION_TYPE: integer := 0;
        C_INIT_WR_PNTR_VAL: integer := 0;
        C_MEMORY_TYPE   : integer := 1;
        C_MIF_FILE_NAME : string  := "";
        C_OPTIMIZATION_MODE: integer := 0;
        C_OVERFLOW_LOW  : integer := 0;
        C_EN_SAFETY_CKT : integer := 0;
        C_PRELOAD_LATENCY: integer := 1;
        C_PRELOAD_REGS  : integer := 0;
        C_PRIM_FIFO_TYPE: string  := "4kx4";
        C_PROG_EMPTY_THRESH_ASSERT_VAL: integer := 0;
        C_PROG_EMPTY_THRESH_NEGATE_VAL: integer := 0;
        C_PROG_EMPTY_TYPE: integer := 0;
        C_PROG_FULL_THRESH_ASSERT_VAL: integer := 0;
        C_PROG_FULL_THRESH_NEGATE_VAL: integer := 0;
        C_PROG_FULL_TYPE: integer := 0;
        C_RD_DATA_COUNT_WIDTH: integer := 2;
        C_RD_DEPTH      : integer := 256;
        C_RD_FREQ       : integer := 1;
        C_RD_PNTR_WIDTH : integer := 8;
        C_UNDERFLOW_LOW : integer := 0;
        C_USE_DOUT_RST  : integer := 0;
        C_USE_ECC       : integer := 0;
        C_USE_EMBEDDED_REG: integer := 0;
        C_USE_PIPELINE_REG: integer := 0;
        C_POWER_SAVING_MODE: integer := 0;
        C_USE_FIFO16_FLAGS: integer := 0;
        C_USE_FWFT_DATA_COUNT: integer := 0;
        C_VALID_LOW     : integer := 0;
        C_WR_ACK_LOW    : integer := 0;
        C_WR_DATA_COUNT_WIDTH: integer := 2;
        C_WR_DEPTH      : integer := 256;
        C_WR_FREQ       : integer := 1;
        C_WR_PNTR_WIDTH : integer := 8;
        C_WR_RESPONSE_LATENCY: integer := 1;
        C_MSGON_VAL     : integer := 1;
        C_ENABLE_RST_SYNC: integer := 1;
        C_ERROR_INJECTION_TYPE: integer := 0;
        C_SYNCHRONIZER_STAGE: integer := 2;
        C_INTERFACE_TYPE: integer := 0;
        C_AXI_TYPE      : integer := 0;
        C_HAS_AXI_WR_CHANNEL: integer := 0;
        C_HAS_AXI_RD_CHANNEL: integer := 0;
        C_HAS_SLAVE_CE  : integer := 0;
        C_HAS_MASTER_CE : integer := 0;
        C_ADD_NGC_CONSTRAINT: integer := 0;
        C_USE_COMMON_UNDERFLOW: integer := 0;
        C_USE_COMMON_OVERFLOW: integer := 0;
        C_USE_DEFAULT_SETTINGS: integer := 0;
        C_AXI_ID_WIDTH  : integer := 0;
        C_AXI_ADDR_WIDTH: integer := 0;
        C_AXI_DATA_WIDTH: integer := 0;
        C_AXI_LEN_WIDTH : integer := 8;
        C_AXI_LOCK_WIDTH: integer := 2;
        C_HAS_AXI_ID    : integer := 0;
        C_HAS_AXI_AWUSER: integer := 0;
        C_HAS_AXI_WUSER : integer := 0;
        C_HAS_AXI_BUSER : integer := 0;
        C_HAS_AXI_ARUSER: integer := 0;
        C_HAS_AXI_RUSER : integer := 0;
        C_AXI_ARUSER_WIDTH: integer := 0;
        C_AXI_AWUSER_WIDTH: integer := 0;
        C_AXI_WUSER_WIDTH: integer := 0;
        C_AXI_BUSER_WIDTH: integer := 0;
        C_AXI_RUSER_WIDTH: integer := 0;
        C_HAS_AXIS_TDATA: integer := 0;
        C_HAS_AXIS_TID  : integer := 0;
        C_HAS_AXIS_TDEST: integer := 0;
        C_HAS_AXIS_TUSER: integer := 0;
        C_HAS_AXIS_TREADY: integer := 0;
        C_HAS_AXIS_TLAST: integer := 0;
        C_HAS_AXIS_TSTRB: integer := 0;
        C_HAS_AXIS_TKEEP: integer := 0;
        C_AXIS_TDATA_WIDTH: integer := 1;
        C_AXIS_TID_WIDTH: integer := 1;
        C_AXIS_TDEST_WIDTH: integer := 1;
        C_AXIS_TUSER_WIDTH: integer := 1;
        C_AXIS_TSTRB_WIDTH: integer := 1;
        C_AXIS_TKEEP_WIDTH: integer := 1;
        C_WACH_TYPE     : integer := 0;
        C_WDCH_TYPE     : integer := 0;
        C_WRCH_TYPE     : integer := 0;
        C_RACH_TYPE     : integer := 0;
        C_RDCH_TYPE     : integer := 0;
        C_AXIS_TYPE     : integer := 0;
        C_IMPLEMENTATION_TYPE_WACH: integer := 0;
        C_IMPLEMENTATION_TYPE_WDCH: integer := 0;
        C_IMPLEMENTATION_TYPE_WRCH: integer := 0;
        C_IMPLEMENTATION_TYPE_RACH: integer := 0;
        C_IMPLEMENTATION_TYPE_RDCH: integer := 0;
        C_IMPLEMENTATION_TYPE_AXIS: integer := 0;
        C_APPLICATION_TYPE_WACH: integer := 0;
        C_APPLICATION_TYPE_WDCH: integer := 0;
        C_APPLICATION_TYPE_WRCH: integer := 0;
        C_APPLICATION_TYPE_RACH: integer := 0;
        C_APPLICATION_TYPE_RDCH: integer := 0;
        C_APPLICATION_TYPE_AXIS: integer := 0;
        C_PRIM_FIFO_TYPE_WACH: string  := "512x36";
        C_PRIM_FIFO_TYPE_WDCH: string  := "512x36";
        C_PRIM_FIFO_TYPE_WRCH: string  := "512x36";
        C_PRIM_FIFO_TYPE_RACH: string  := "512x36";
        C_PRIM_FIFO_TYPE_RDCH: string  := "512x36";
        C_PRIM_FIFO_TYPE_AXIS: string  := "512x36";
        C_USE_ECC_WACH  : integer := 0;
        C_USE_ECC_WDCH  : integer := 0;
        C_USE_ECC_WRCH  : integer := 0;
        C_USE_ECC_RACH  : integer := 0;
        C_USE_ECC_RDCH  : integer := 0;
        C_USE_ECC_AXIS  : integer := 0;
        C_ERROR_INJECTION_TYPE_WACH: integer := 0;
        C_ERROR_INJECTION_TYPE_WDCH: integer := 0;
        C_ERROR_INJECTION_TYPE_WRCH: integer := 0;
        C_ERROR_INJECTION_TYPE_RACH: integer := 0;
        C_ERROR_INJECTION_TYPE_RDCH: integer := 0;
        C_ERROR_INJECTION_TYPE_AXIS: integer := 0;
        C_DIN_WIDTH_WACH: integer := 1;
        C_DIN_WIDTH_WDCH: integer := 1;
        C_DIN_WIDTH_WRCH: integer := 1;
        C_DIN_WIDTH_RACH: integer := 1;
        C_DIN_WIDTH_RDCH: integer := 1;
        C_DIN_WIDTH_AXIS: integer := 1;
        C_WR_DEPTH_WACH : integer := 16;
        C_WR_DEPTH_WDCH : integer := 16;
        C_WR_DEPTH_WRCH : integer := 16;
        C_WR_DEPTH_RACH : integer := 16;
        C_WR_DEPTH_RDCH : integer := 16;
        C_WR_DEPTH_AXIS : integer := 16;
        C_WR_PNTR_WIDTH_WACH: integer := 4;
        C_WR_PNTR_WIDTH_WDCH: integer := 4;
        C_WR_PNTR_WIDTH_WRCH: integer := 4;
        C_WR_PNTR_WIDTH_RACH: integer := 4;
        C_WR_PNTR_WIDTH_RDCH: integer := 4;
        C_WR_PNTR_WIDTH_AXIS: integer := 4;
        C_HAS_DATA_COUNTS_WACH: integer := 0;
        C_HAS_DATA_COUNTS_WDCH: integer := 0;
        C_HAS_DATA_COUNTS_WRCH: integer := 0;
        C_HAS_DATA_COUNTS_RACH: integer := 0;
        C_HAS_DATA_COUNTS_RDCH: integer := 0;
        C_HAS_DATA_COUNTS_AXIS: integer := 0;
        C_HAS_PROG_FLAGS_WACH: integer := 0;
        C_HAS_PROG_FLAGS_WDCH: integer := 0;
        C_HAS_PROG_FLAGS_WRCH: integer := 0;
        C_HAS_PROG_FLAGS_RACH: integer := 0;
        C_HAS_PROG_FLAGS_RDCH: integer := 0;
        C_HAS_PROG_FLAGS_AXIS: integer := 0;
        C_PROG_FULL_TYPE_WACH: integer := 0;
        C_PROG_FULL_TYPE_WDCH: integer := 0;
        C_PROG_FULL_TYPE_WRCH: integer := 0;
        C_PROG_FULL_TYPE_RACH: integer := 0;
        C_PROG_FULL_TYPE_RDCH: integer := 0;
        C_PROG_FULL_TYPE_AXIS: integer := 0;
        C_PROG_FULL_THRESH_ASSERT_VAL_WACH: integer := 0;
        C_PROG_FULL_THRESH_ASSERT_VAL_WDCH: integer := 0;
        C_PROG_FULL_THRESH_ASSERT_VAL_WRCH: integer := 0;
        C_PROG_FULL_THRESH_ASSERT_VAL_RACH: integer := 0;
        C_PROG_FULL_THRESH_ASSERT_VAL_RDCH: integer := 0;
        C_PROG_FULL_THRESH_ASSERT_VAL_AXIS: integer := 0;
        C_PROG_EMPTY_TYPE_WACH: integer := 0;
        C_PROG_EMPTY_TYPE_WDCH: integer := 0;
        C_PROG_EMPTY_TYPE_WRCH: integer := 0;
        C_PROG_EMPTY_TYPE_RACH: integer := 0;
        C_PROG_EMPTY_TYPE_RDCH: integer := 0;
        C_PROG_EMPTY_TYPE_AXIS: integer := 0;
        C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH: integer := 0;
        C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH: integer := 0;
        C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH: integer := 0;
        C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH: integer := 0;
        C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH: integer := 0;
        C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS: integer := 0;
        C_REG_SLICE_MODE_WACH: integer := 0;
        C_REG_SLICE_MODE_WDCH: integer := 0;
        C_REG_SLICE_MODE_WRCH: integer := 0;
        C_REG_SLICE_MODE_RACH: integer := 0;
        C_REG_SLICE_MODE_RDCH: integer := 0;
        C_REG_SLICE_MODE_AXIS: integer := 0
    );
    port(
        backup          : in     vl_logic;
        backup_marker   : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        srst            : in     vl_logic;
        wr_clk          : in     vl_logic;
        wr_rst          : in     vl_logic;
        rd_clk          : in     vl_logic;
        rd_rst          : in     vl_logic;
        din             : in     vl_logic_vector;
        wr_en           : in     vl_logic;
        rd_en           : in     vl_logic;
        prog_empty_thresh: in     vl_logic_vector;
        prog_empty_thresh_assert: in     vl_logic_vector;
        prog_empty_thresh_negate: in     vl_logic_vector;
        prog_full_thresh: in     vl_logic_vector;
        prog_full_thresh_assert: in     vl_logic_vector;
        prog_full_thresh_negate: in     vl_logic_vector;
        int_clk         : in     vl_logic;
        injectdbiterr   : in     vl_logic;
        injectsbiterr   : in     vl_logic;
        sleep           : in     vl_logic;
        dout            : out    vl_logic_vector;
        full            : out    vl_logic;
        almost_full     : out    vl_logic;
        wr_ack          : out    vl_logic;
        overflow        : out    vl_logic;
        empty           : out    vl_logic;
        almost_empty    : out    vl_logic;
        valid           : out    vl_logic;
        underflow       : out    vl_logic;
        data_count      : out    vl_logic_vector;
        rd_data_count   : out    vl_logic_vector;
        wr_data_count   : out    vl_logic_vector;
        prog_full       : out    vl_logic;
        prog_empty      : out    vl_logic;
        sbiterr         : out    vl_logic;
        dbiterr         : out    vl_logic;
        wr_rst_busy     : out    vl_logic;
        rd_rst_busy     : out    vl_logic;
        m_aclk          : in     vl_logic;
        s_aclk          : in     vl_logic;
        s_aresetn       : in     vl_logic;
        s_aclk_en       : in     vl_logic;
        m_aclk_en       : in     vl_logic;
        s_axi_awid      : in     vl_logic_vector;
        s_axi_awaddr    : in     vl_logic_vector;
        s_axi_awlen     : in     vl_logic_vector;
        s_axi_awsize    : in     vl_logic_vector(2 downto 0);
        s_axi_awburst   : in     vl_logic_vector(1 downto 0);
        s_axi_awlock    : in     vl_logic_vector;
        s_axi_awcache   : in     vl_logic_vector(3 downto 0);
        s_axi_awprot    : in     vl_logic_vector(2 downto 0);
        s_axi_awqos     : in     vl_logic_vector(3 downto 0);
        s_axi_awregion  : in     vl_logic_vector(3 downto 0);
        s_axi_awuser    : in     vl_logic_vector;
        s_axi_awvalid   : in     vl_logic;
        s_axi_awready   : out    vl_logic;
        s_axi_wid       : in     vl_logic_vector;
        s_axi_wdata     : in     vl_logic_vector;
        s_axi_wstrb     : in     vl_logic_vector;
        s_axi_wlast     : in     vl_logic;
        s_axi_wuser     : in     vl_logic_vector;
        s_axi_wvalid    : in     vl_logic;
        s_axi_wready    : out    vl_logic;
        s_axi_bid       : out    vl_logic_vector;
        s_axi_bresp     : out    vl_logic_vector(1 downto 0);
        s_axi_buser     : out    vl_logic_vector;
        s_axi_bvalid    : out    vl_logic;
        s_axi_bready    : in     vl_logic;
        m_axi_awid      : out    vl_logic_vector;
        m_axi_awaddr    : out    vl_logic_vector;
        m_axi_awlen     : out    vl_logic_vector;
        m_axi_awsize    : out    vl_logic_vector(2 downto 0);
        m_axi_awburst   : out    vl_logic_vector(1 downto 0);
        m_axi_awlock    : out    vl_logic_vector;
        m_axi_awcache   : out    vl_logic_vector(3 downto 0);
        m_axi_awprot    : out    vl_logic_vector(2 downto 0);
        m_axi_awqos     : out    vl_logic_vector(3 downto 0);
        m_axi_awregion  : out    vl_logic_vector(3 downto 0);
        m_axi_awuser    : out    vl_logic_vector;
        m_axi_awvalid   : out    vl_logic;
        m_axi_awready   : in     vl_logic;
        m_axi_wid       : out    vl_logic_vector;
        m_axi_wdata     : out    vl_logic_vector;
        m_axi_wstrb     : out    vl_logic_vector;
        m_axi_wlast     : out    vl_logic;
        m_axi_wuser     : out    vl_logic_vector;
        m_axi_wvalid    : out    vl_logic;
        m_axi_wready    : in     vl_logic;
        m_axi_bid       : in     vl_logic_vector;
        m_axi_bresp     : in     vl_logic_vector(1 downto 0);
        m_axi_buser     : in     vl_logic_vector;
        m_axi_bvalid    : in     vl_logic;
        m_axi_bready    : out    vl_logic;
        s_axi_arid      : in     vl_logic_vector;
        s_axi_araddr    : in     vl_logic_vector;
        s_axi_arlen     : in     vl_logic_vector;
        s_axi_arsize    : in     vl_logic_vector(2 downto 0);
        s_axi_arburst   : in     vl_logic_vector(1 downto 0);
        s_axi_arlock    : in     vl_logic_vector;
        s_axi_arcache   : in     vl_logic_vector(3 downto 0);
        s_axi_arprot    : in     vl_logic_vector(2 downto 0);
        s_axi_arqos     : in     vl_logic_vector(3 downto 0);
        s_axi_arregion  : in     vl_logic_vector(3 downto 0);
        s_axi_aruser    : in     vl_logic_vector;
        s_axi_arvalid   : in     vl_logic;
        s_axi_arready   : out    vl_logic;
        s_axi_rid       : out    vl_logic_vector;
        s_axi_rdata     : out    vl_logic_vector;
        s_axi_rresp     : out    vl_logic_vector(1 downto 0);
        s_axi_rlast     : out    vl_logic;
        s_axi_ruser     : out    vl_logic_vector;
        s_axi_rvalid    : out    vl_logic;
        s_axi_rready    : in     vl_logic;
        m_axi_arid      : out    vl_logic_vector;
        m_axi_araddr    : out    vl_logic_vector;
        m_axi_arlen     : out    vl_logic_vector;
        m_axi_arsize    : out    vl_logic_vector(2 downto 0);
        m_axi_arburst   : out    vl_logic_vector(1 downto 0);
        m_axi_arlock    : out    vl_logic_vector;
        m_axi_arcache   : out    vl_logic_vector(3 downto 0);
        m_axi_arprot    : out    vl_logic_vector(2 downto 0);
        m_axi_arqos     : out    vl_logic_vector(3 downto 0);
        m_axi_arregion  : out    vl_logic_vector(3 downto 0);
        m_axi_aruser    : out    vl_logic_vector;
        m_axi_arvalid   : out    vl_logic;
        m_axi_arready   : in     vl_logic;
        m_axi_rid       : in     vl_logic_vector;
        m_axi_rdata     : in     vl_logic_vector;
        m_axi_rresp     : in     vl_logic_vector(1 downto 0);
        m_axi_rlast     : in     vl_logic;
        m_axi_ruser     : in     vl_logic_vector;
        m_axi_rvalid    : in     vl_logic;
        m_axi_rready    : out    vl_logic;
        s_axis_tvalid   : in     vl_logic;
        s_axis_tready   : out    vl_logic;
        s_axis_tdata    : in     vl_logic_vector;
        s_axis_tstrb    : in     vl_logic_vector;
        s_axis_tkeep    : in     vl_logic_vector;
        s_axis_tlast    : in     vl_logic;
        s_axis_tid      : in     vl_logic_vector;
        s_axis_tdest    : in     vl_logic_vector;
        s_axis_tuser    : in     vl_logic_vector;
        m_axis_tvalid   : out    vl_logic;
        m_axis_tready   : in     vl_logic;
        m_axis_tdata    : out    vl_logic_vector;
        m_axis_tstrb    : out    vl_logic_vector;
        m_axis_tkeep    : out    vl_logic_vector;
        m_axis_tlast    : out    vl_logic;
        m_axis_tid      : out    vl_logic_vector;
        m_axis_tdest    : out    vl_logic_vector;
        m_axis_tuser    : out    vl_logic_vector;
        axi_aw_injectsbiterr: in     vl_logic;
        axi_aw_injectdbiterr: in     vl_logic;
        axi_aw_prog_full_thresh: in     vl_logic_vector;
        axi_aw_prog_empty_thresh: in     vl_logic_vector;
        axi_aw_data_count: out    vl_logic_vector;
        axi_aw_wr_data_count: out    vl_logic_vector;
        axi_aw_rd_data_count: out    vl_logic_vector;
        axi_aw_sbiterr  : out    vl_logic;
        axi_aw_dbiterr  : out    vl_logic;
        axi_aw_overflow : out    vl_logic;
        axi_aw_underflow: out    vl_logic;
        axi_aw_prog_full: out    vl_logic;
        axi_aw_prog_empty: out    vl_logic;
        axi_w_injectsbiterr: in     vl_logic;
        axi_w_injectdbiterr: in     vl_logic;
        axi_w_prog_full_thresh: in     vl_logic_vector;
        axi_w_prog_empty_thresh: in     vl_logic_vector;
        axi_w_data_count: out    vl_logic_vector;
        axi_w_wr_data_count: out    vl_logic_vector;
        axi_w_rd_data_count: out    vl_logic_vector;
        axi_w_sbiterr   : out    vl_logic;
        axi_w_dbiterr   : out    vl_logic;
        axi_w_overflow  : out    vl_logic;
        axi_w_underflow : out    vl_logic;
        axi_w_prog_full : out    vl_logic;
        axi_w_prog_empty: out    vl_logic;
        axi_b_injectsbiterr: in     vl_logic;
        axi_b_injectdbiterr: in     vl_logic;
        axi_b_prog_full_thresh: in     vl_logic_vector;
        axi_b_prog_empty_thresh: in     vl_logic_vector;
        axi_b_data_count: out    vl_logic_vector;
        axi_b_wr_data_count: out    vl_logic_vector;
        axi_b_rd_data_count: out    vl_logic_vector;
        axi_b_sbiterr   : out    vl_logic;
        axi_b_dbiterr   : out    vl_logic;
        axi_b_overflow  : out    vl_logic;
        axi_b_underflow : out    vl_logic;
        axi_b_prog_full : out    vl_logic;
        axi_b_prog_empty: out    vl_logic;
        axi_ar_injectsbiterr: in     vl_logic;
        axi_ar_injectdbiterr: in     vl_logic;
        axi_ar_prog_full_thresh: in     vl_logic_vector;
        axi_ar_prog_empty_thresh: in     vl_logic_vector;
        axi_ar_data_count: out    vl_logic_vector;
        axi_ar_wr_data_count: out    vl_logic_vector;
        axi_ar_rd_data_count: out    vl_logic_vector;
        axi_ar_sbiterr  : out    vl_logic;
        axi_ar_dbiterr  : out    vl_logic;
        axi_ar_overflow : out    vl_logic;
        axi_ar_underflow: out    vl_logic;
        axi_ar_prog_full: out    vl_logic;
        axi_ar_prog_empty: out    vl_logic;
        axi_r_injectsbiterr: in     vl_logic;
        axi_r_injectdbiterr: in     vl_logic;
        axi_r_prog_full_thresh: in     vl_logic_vector;
        axi_r_prog_empty_thresh: in     vl_logic_vector;
        axi_r_data_count: out    vl_logic_vector;
        axi_r_wr_data_count: out    vl_logic_vector;
        axi_r_rd_data_count: out    vl_logic_vector;
        axi_r_sbiterr   : out    vl_logic;
        axi_r_dbiterr   : out    vl_logic;
        axi_r_overflow  : out    vl_logic;
        axi_r_underflow : out    vl_logic;
        axi_r_prog_full : out    vl_logic;
        axi_r_prog_empty: out    vl_logic;
        axis_injectsbiterr: in     vl_logic;
        axis_injectdbiterr: in     vl_logic;
        axis_prog_full_thresh: in     vl_logic_vector;
        axis_prog_empty_thresh: in     vl_logic_vector;
        axis_data_count : out    vl_logic_vector;
        axis_wr_data_count: out    vl_logic_vector;
        axis_rd_data_count: out    vl_logic_vector;
        axis_sbiterr    : out    vl_logic;
        axis_dbiterr    : out    vl_logic;
        axis_overflow   : out    vl_logic;
        axis_underflow  : out    vl_logic;
        axis_prog_full  : out    vl_logic;
        axis_prog_empty : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_COMMON_CLOCK : constant is 1;
    attribute mti_svvh_generic_type of C_COUNT_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_DATA_COUNT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_DEFAULT_VALUE : constant is 1;
    attribute mti_svvh_generic_type of C_DIN_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_DOUT_RST_VAL : constant is 1;
    attribute mti_svvh_generic_type of C_DOUT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_ENABLE_RLOCS : constant is 1;
    attribute mti_svvh_generic_type of C_FAMILY : constant is 1;
    attribute mti_svvh_generic_type of C_FULL_FLAGS_RST_VAL : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_ALMOST_EMPTY : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_ALMOST_FULL : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_BACKUP : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_DATA_COUNT : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_INT_CLK : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_MEMINIT_FILE : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_OVERFLOW : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_RD_DATA_COUNT : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_RD_RST : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_RST : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_SRST : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_UNDERFLOW : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_VALID : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_WR_ACK : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_WR_DATA_COUNT : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_WR_RST : constant is 1;
    attribute mti_svvh_generic_type of C_IMPLEMENTATION_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_INIT_WR_PNTR_VAL : constant is 1;
    attribute mti_svvh_generic_type of C_MEMORY_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_MIF_FILE_NAME : constant is 1;
    attribute mti_svvh_generic_type of C_OPTIMIZATION_MODE : constant is 1;
    attribute mti_svvh_generic_type of C_OVERFLOW_LOW : constant is 1;
    attribute mti_svvh_generic_type of C_EN_SAFETY_CKT : constant is 1;
    attribute mti_svvh_generic_type of C_PRELOAD_LATENCY : constant is 1;
    attribute mti_svvh_generic_type of C_PRELOAD_REGS : constant is 1;
    attribute mti_svvh_generic_type of C_PRIM_FIFO_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_EMPTY_THRESH_ASSERT_VAL : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_EMPTY_THRESH_NEGATE_VAL : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_EMPTY_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_FULL_THRESH_ASSERT_VAL : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_FULL_THRESH_NEGATE_VAL : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_FULL_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_RD_DATA_COUNT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_RD_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of C_RD_FREQ : constant is 1;
    attribute mti_svvh_generic_type of C_RD_PNTR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_UNDERFLOW_LOW : constant is 1;
    attribute mti_svvh_generic_type of C_USE_DOUT_RST : constant is 1;
    attribute mti_svvh_generic_type of C_USE_ECC : constant is 1;
    attribute mti_svvh_generic_type of C_USE_EMBEDDED_REG : constant is 1;
    attribute mti_svvh_generic_type of C_USE_PIPELINE_REG : constant is 1;
    attribute mti_svvh_generic_type of C_POWER_SAVING_MODE : constant is 1;
    attribute mti_svvh_generic_type of C_USE_FIFO16_FLAGS : constant is 1;
    attribute mti_svvh_generic_type of C_USE_FWFT_DATA_COUNT : constant is 1;
    attribute mti_svvh_generic_type of C_VALID_LOW : constant is 1;
    attribute mti_svvh_generic_type of C_WR_ACK_LOW : constant is 1;
    attribute mti_svvh_generic_type of C_WR_DATA_COUNT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_WR_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of C_WR_FREQ : constant is 1;
    attribute mti_svvh_generic_type of C_WR_PNTR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_WR_RESPONSE_LATENCY : constant is 1;
    attribute mti_svvh_generic_type of C_MSGON_VAL : constant is 1;
    attribute mti_svvh_generic_type of C_ENABLE_RST_SYNC : constant is 1;
    attribute mti_svvh_generic_type of C_ERROR_INJECTION_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_SYNCHRONIZER_STAGE : constant is 1;
    attribute mti_svvh_generic_type of C_INTERFACE_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXI_WR_CHANNEL : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXI_RD_CHANNEL : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_SLAVE_CE : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_MASTER_CE : constant is 1;
    attribute mti_svvh_generic_type of C_ADD_NGC_CONSTRAINT : constant is 1;
    attribute mti_svvh_generic_type of C_USE_COMMON_UNDERFLOW : constant is 1;
    attribute mti_svvh_generic_type of C_USE_COMMON_OVERFLOW : constant is 1;
    attribute mti_svvh_generic_type of C_USE_DEFAULT_SETTINGS : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_ID_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_LEN_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_LOCK_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXI_ID : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXI_AWUSER : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXI_WUSER : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXI_BUSER : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXI_ARUSER : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXI_RUSER : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_ARUSER_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_AWUSER_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_WUSER_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_BUSER_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_RUSER_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXIS_TDATA : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXIS_TID : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXIS_TDEST : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXIS_TUSER : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXIS_TREADY : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXIS_TLAST : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXIS_TSTRB : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXIS_TKEEP : constant is 1;
    attribute mti_svvh_generic_type of C_AXIS_TDATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_AXIS_TID_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_AXIS_TDEST_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_AXIS_TUSER_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_AXIS_TSTRB_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_AXIS_TKEEP_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_WACH_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_WDCH_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_WRCH_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_RACH_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_RDCH_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_AXIS_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_IMPLEMENTATION_TYPE_WACH : constant is 1;
    attribute mti_svvh_generic_type of C_IMPLEMENTATION_TYPE_WDCH : constant is 1;
    attribute mti_svvh_generic_type of C_IMPLEMENTATION_TYPE_WRCH : constant is 1;
    attribute mti_svvh_generic_type of C_IMPLEMENTATION_TYPE_RACH : constant is 1;
    attribute mti_svvh_generic_type of C_IMPLEMENTATION_TYPE_RDCH : constant is 1;
    attribute mti_svvh_generic_type of C_IMPLEMENTATION_TYPE_AXIS : constant is 1;
    attribute mti_svvh_generic_type of C_APPLICATION_TYPE_WACH : constant is 1;
    attribute mti_svvh_generic_type of C_APPLICATION_TYPE_WDCH : constant is 1;
    attribute mti_svvh_generic_type of C_APPLICATION_TYPE_WRCH : constant is 1;
    attribute mti_svvh_generic_type of C_APPLICATION_TYPE_RACH : constant is 1;
    attribute mti_svvh_generic_type of C_APPLICATION_TYPE_RDCH : constant is 1;
    attribute mti_svvh_generic_type of C_APPLICATION_TYPE_AXIS : constant is 1;
    attribute mti_svvh_generic_type of C_PRIM_FIFO_TYPE_WACH : constant is 1;
    attribute mti_svvh_generic_type of C_PRIM_FIFO_TYPE_WDCH : constant is 1;
    attribute mti_svvh_generic_type of C_PRIM_FIFO_TYPE_WRCH : constant is 1;
    attribute mti_svvh_generic_type of C_PRIM_FIFO_TYPE_RACH : constant is 1;
    attribute mti_svvh_generic_type of C_PRIM_FIFO_TYPE_RDCH : constant is 1;
    attribute mti_svvh_generic_type of C_PRIM_FIFO_TYPE_AXIS : constant is 1;
    attribute mti_svvh_generic_type of C_USE_ECC_WACH : constant is 1;
    attribute mti_svvh_generic_type of C_USE_ECC_WDCH : constant is 1;
    attribute mti_svvh_generic_type of C_USE_ECC_WRCH : constant is 1;
    attribute mti_svvh_generic_type of C_USE_ECC_RACH : constant is 1;
    attribute mti_svvh_generic_type of C_USE_ECC_RDCH : constant is 1;
    attribute mti_svvh_generic_type of C_USE_ECC_AXIS : constant is 1;
    attribute mti_svvh_generic_type of C_ERROR_INJECTION_TYPE_WACH : constant is 1;
    attribute mti_svvh_generic_type of C_ERROR_INJECTION_TYPE_WDCH : constant is 1;
    attribute mti_svvh_generic_type of C_ERROR_INJECTION_TYPE_WRCH : constant is 1;
    attribute mti_svvh_generic_type of C_ERROR_INJECTION_TYPE_RACH : constant is 1;
    attribute mti_svvh_generic_type of C_ERROR_INJECTION_TYPE_RDCH : constant is 1;
    attribute mti_svvh_generic_type of C_ERROR_INJECTION_TYPE_AXIS : constant is 1;
    attribute mti_svvh_generic_type of C_DIN_WIDTH_WACH : constant is 1;
    attribute mti_svvh_generic_type of C_DIN_WIDTH_WDCH : constant is 1;
    attribute mti_svvh_generic_type of C_DIN_WIDTH_WRCH : constant is 1;
    attribute mti_svvh_generic_type of C_DIN_WIDTH_RACH : constant is 1;
    attribute mti_svvh_generic_type of C_DIN_WIDTH_RDCH : constant is 1;
    attribute mti_svvh_generic_type of C_DIN_WIDTH_AXIS : constant is 1;
    attribute mti_svvh_generic_type of C_WR_DEPTH_WACH : constant is 1;
    attribute mti_svvh_generic_type of C_WR_DEPTH_WDCH : constant is 1;
    attribute mti_svvh_generic_type of C_WR_DEPTH_WRCH : constant is 1;
    attribute mti_svvh_generic_type of C_WR_DEPTH_RACH : constant is 1;
    attribute mti_svvh_generic_type of C_WR_DEPTH_RDCH : constant is 1;
    attribute mti_svvh_generic_type of C_WR_DEPTH_AXIS : constant is 1;
    attribute mti_svvh_generic_type of C_WR_PNTR_WIDTH_WACH : constant is 1;
    attribute mti_svvh_generic_type of C_WR_PNTR_WIDTH_WDCH : constant is 1;
    attribute mti_svvh_generic_type of C_WR_PNTR_WIDTH_WRCH : constant is 1;
    attribute mti_svvh_generic_type of C_WR_PNTR_WIDTH_RACH : constant is 1;
    attribute mti_svvh_generic_type of C_WR_PNTR_WIDTH_RDCH : constant is 1;
    attribute mti_svvh_generic_type of C_WR_PNTR_WIDTH_AXIS : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_DATA_COUNTS_WACH : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_DATA_COUNTS_WDCH : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_DATA_COUNTS_WRCH : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_DATA_COUNTS_RACH : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_DATA_COUNTS_RDCH : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_DATA_COUNTS_AXIS : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_PROG_FLAGS_WACH : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_PROG_FLAGS_WDCH : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_PROG_FLAGS_WRCH : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_PROG_FLAGS_RACH : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_PROG_FLAGS_RDCH : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_PROG_FLAGS_AXIS : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_FULL_TYPE_WACH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_FULL_TYPE_WDCH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_FULL_TYPE_WRCH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_FULL_TYPE_RACH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_FULL_TYPE_RDCH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_FULL_TYPE_AXIS : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_FULL_THRESH_ASSERT_VAL_WACH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_FULL_THRESH_ASSERT_VAL_RACH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_EMPTY_TYPE_WACH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_EMPTY_TYPE_WDCH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_EMPTY_TYPE_WRCH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_EMPTY_TYPE_RACH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_EMPTY_TYPE_RDCH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_EMPTY_TYPE_AXIS : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : constant is 1;
    attribute mti_svvh_generic_type of C_REG_SLICE_MODE_WACH : constant is 1;
    attribute mti_svvh_generic_type of C_REG_SLICE_MODE_WDCH : constant is 1;
    attribute mti_svvh_generic_type of C_REG_SLICE_MODE_WRCH : constant is 1;
    attribute mti_svvh_generic_type of C_REG_SLICE_MODE_RACH : constant is 1;
    attribute mti_svvh_generic_type of C_REG_SLICE_MODE_RDCH : constant is 1;
    attribute mti_svvh_generic_type of C_REG_SLICE_MODE_AXIS : constant is 1;
end fifo_generator_vlog_beh;
