library verilog;
use verilog.vl_types.all;
entity fifo_generator_v13_1_3_beh_ver_ll_afifo is
    generic(
        C_DIN_WIDTH     : integer := 8;
        C_DOUT_RST_VAL  : string  := "";
        C_DOUT_WIDTH    : integer := 8;
        C_FULL_FLAGS_RST_VAL: integer := 1;
        C_HAS_RD_DATA_COUNT: integer := 0;
        C_HAS_WR_DATA_COUNT: integer := 0;
        C_RD_DEPTH      : integer := 256;
        C_RD_PNTR_WIDTH : integer := 8;
        C_USE_DOUT_RST  : integer := 0;
        C_WR_DATA_COUNT_WIDTH: integer := 2;
        C_WR_DEPTH      : integer := 256;
        C_WR_PNTR_WIDTH : integer := 8;
        C_FIFO_TYPE     : integer := 0
    );
    port(
        DIN             : in     vl_logic_vector;
        RD_CLK          : in     vl_logic;
        RD_EN           : in     vl_logic;
        WR_RST          : in     vl_logic;
        RD_RST          : in     vl_logic;
        WR_CLK          : in     vl_logic;
        WR_EN           : in     vl_logic;
        DOUT            : out    vl_logic_vector;
        EMPTY           : out    vl_logic;
        FULL            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_DIN_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_DOUT_RST_VAL : constant is 1;
    attribute mti_svvh_generic_type of C_DOUT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_FULL_FLAGS_RST_VAL : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_RD_DATA_COUNT : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_WR_DATA_COUNT : constant is 1;
    attribute mti_svvh_generic_type of C_RD_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of C_RD_PNTR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_USE_DOUT_RST : constant is 1;
    attribute mti_svvh_generic_type of C_WR_DATA_COUNT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_WR_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of C_WR_PNTR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_FIFO_TYPE : constant is 1;
end fifo_generator_v13_1_3_beh_ver_ll_afifo;
