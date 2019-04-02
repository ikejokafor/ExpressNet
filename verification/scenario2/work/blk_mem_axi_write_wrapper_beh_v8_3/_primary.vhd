library verilog;
use verilog.vl_types.all;
entity blk_mem_axi_write_wrapper_beh_v8_3 is
    generic(
        C_INTERFACE_TYPE: integer := 0;
        C_AXI_TYPE      : integer := 0;
        C_AXI_SLAVE_TYPE: integer := 0;
        C_MEMORY_TYPE   : integer := 0;
        C_WRITE_DEPTH_A : integer := 0;
        C_AXI_AWADDR_WIDTH: integer := 32;
        C_ADDRA_WIDTH   : integer := 12;
        C_AXI_WDATA_WIDTH: integer := 32;
        C_HAS_AXI_ID    : integer := 0;
        C_AXI_ID_WIDTH  : integer := 4;
        C_AXI_OS_WR     : integer := 2
    );
    port(
        S_ACLK          : in     vl_logic;
        S_ARESETN       : in     vl_logic;
        S_AXI_AWID      : in     vl_logic_vector;
        S_AXI_AWADDR    : in     vl_logic_vector;
        S_AXI_AWLEN     : in     vl_logic_vector(7 downto 0);
        S_AXI_AWSIZE    : in     vl_logic_vector(2 downto 0);
        S_AXI_AWBURST   : in     vl_logic_vector(1 downto 0);
        S_AXI_AWVALID   : in     vl_logic;
        S_AXI_AWREADY   : out    vl_logic;
        S_AXI_WVALID    : in     vl_logic;
        S_AXI_WREADY    : out    vl_logic;
        S_AXI_BID       : out    vl_logic_vector;
        S_AXI_BVALID    : out    vl_logic;
        S_AXI_BREADY    : in     vl_logic;
        S_AXI_AWADDR_OUT: out    vl_logic_vector;
        S_AXI_WR_EN     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_INTERFACE_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_SLAVE_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_MEMORY_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_WRITE_DEPTH_A : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_AWADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_ADDRA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_WDATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_AXI_ID : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_ID_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_AXI_OS_WR : constant is 1;
end blk_mem_axi_write_wrapper_beh_v8_3;
