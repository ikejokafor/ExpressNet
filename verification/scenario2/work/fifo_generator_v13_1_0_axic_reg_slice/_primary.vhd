library verilog;
use verilog.vl_types.all;
entity fifo_generator_v13_1_0_axic_reg_slice is
    generic(
        C_FAMILY        : string  := "virtex7";
        C_DATA_WIDTH    : integer := 32;
        C_REG_CONFIG    : integer := 0
    );
    port(
        ACLK            : in     vl_logic;
        ARESET          : in     vl_logic;
        S_PAYLOAD_DATA  : in     vl_logic_vector;
        S_VALID         : in     vl_logic;
        S_READY         : out    vl_logic;
        M_PAYLOAD_DATA  : out    vl_logic_vector;
        M_VALID         : out    vl_logic;
        M_READY         : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_FAMILY : constant is 1;
    attribute mti_svvh_generic_type of C_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_REG_CONFIG : constant is 1;
end fifo_generator_v13_1_0_axic_reg_slice;
