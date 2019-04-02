library verilog;
use verilog.vl_types.all;
entity write_netlist_v8_3 is
    generic(
        C_AXI_TYPE      : integer := 0
    );
    port(
        S_ACLK          : in     vl_logic;
        S_ARESETN       : in     vl_logic;
        S_AXI_AWVALID   : in     vl_logic;
        S_AXI_WVALID    : in     vl_logic;
        S_AXI_BREADY    : in     vl_logic;
        w_last_c        : in     vl_logic;
        bready_timeout_c: in     vl_logic;
        aw_ready_r      : out    vl_logic;
        S_AXI_WREADY    : out    vl_logic;
        S_AXI_BVALID    : out    vl_logic;
        S_AXI_WR_EN     : out    vl_logic;
        addr_en_c       : out    vl_logic;
        incr_addr_c     : out    vl_logic;
        bvalid_c        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_AXI_TYPE : constant is 1;
end write_netlist_v8_3;
