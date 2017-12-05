library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_layer_engine_pooler is
    generic(
        C_DATAIN_WIDTH  : integer := 128;
        C_DATAOUT_WIDTH : integer := 128;
        C_OPCODE_WIDTH  : integer := 64;
        C_PIXEL_WIDTH   : integer := 16;
        C_MAX_IMG_WIDTH : integer := 10;
        C_POOL_WINDOW_SZ: integer := 3
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        opcode          : in     vl_logic_vector;
        opcode_valid    : in     vl_logic;
        opcode_accept   : out    vl_logic;
        opcode_complete : out    vl_logic;
        datain          : in     vl_logic_vector;
        datain_valid    : in     vl_logic;
        datain_ready    : out    vl_logic;
        dataout         : out    vl_logic_vector;
        dataout_valid   : out    vl_logic;
        dataout_ready   : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_DATAIN_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_DATAOUT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_OPCODE_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_PIXEL_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_MAX_IMG_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_POOL_WINDOW_SZ : constant is 1;
end cnn_layer_accel_layer_engine_pooler;
