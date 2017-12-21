library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_layer_conv_array is
    generic(
        C_MAX_WINDOW_SIZE: integer := 3;
        C_IMG_DATA_WIDTH: integer := 18;
        C_FILTER_DATA_WIDTH: integer := 18;
        C_CONV_RESULT_WIDTH: integer := 16
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        count_init      : in     vl_logic;
        pipeline_active : in     vl_logic;
        i_img_datain    : in     vl_logic_vector;
        img_datain_valid: in     vl_logic;
        i_filter_datain : in     vl_logic_vector;
        i_filter_init   : in     vl_logic_vector;
        dataout         : out    vl_logic_vector;
        dataout_valid   : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_MAX_WINDOW_SIZE : constant is 1;
    attribute mti_svvh_generic_type of C_IMG_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_FILTER_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_CONV_RESULT_WIDTH : constant is 1;
end cnn_layer_accel_layer_conv_array;
