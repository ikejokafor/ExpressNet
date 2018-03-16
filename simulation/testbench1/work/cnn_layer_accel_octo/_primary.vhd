library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_octo is
    generic(
        C_NUM_AWE       : integer := 1;
        C_PIXEL_WIDTH   : integer := 18;
        C_BRAM_DEPTH    : integer := 1024;
        C_SEQ_DATA_WIDTH: integer := 13
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pixel_datain_tag: in     vl_logic;
        pixel_datain_rdy: out    vl_logic;
        seq_datain_tag  : in     vl_logic;
        seq_datain_rdy  : out    vl_logic;
        datain          : in     vl_logic_vector;
        datain_valid    : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_NUM_AWE : constant is 1;
    attribute mti_svvh_generic_type of C_PIXEL_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_BRAM_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of C_SEQ_DATA_WIDTH : constant is 1;
end cnn_layer_accel_octo;
