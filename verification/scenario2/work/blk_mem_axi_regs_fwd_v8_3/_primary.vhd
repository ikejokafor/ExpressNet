library verilog;
use verilog.vl_types.all;
entity blk_mem_axi_regs_fwd_v8_3 is
    generic(
        C_DATA_WIDTH    : integer := 8
    );
    port(
        ACLK            : in     vl_logic;
        ARESET          : in     vl_logic;
        S_VALID         : in     vl_logic;
        S_READY         : out    vl_logic;
        S_PAYLOAD_DATA  : in     vl_logic_vector;
        M_VALID         : out    vl_logic;
        M_READY         : in     vl_logic;
        M_PAYLOAD_DATA  : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_DATA_WIDTH : constant is 1;
end blk_mem_axi_regs_fwd_v8_3;
