library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_macc_DSP is
    generic(
        C_DSP_INPUT_WIDTH: integer := 18;
        C_INPUT_DELAY   : integer := 1;
        C_IS_ACCUM      : integer := 0;
        C_DSP_OUTPUT_WIDTH: integer := 48
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        accum           : in     vl_logic;
        accum_rst       : in     vl_logic;
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        pcin            : in     vl_logic_vector;
        pout            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_DSP_INPUT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_INPUT_DELAY : constant is 1;
    attribute mti_svvh_generic_type of C_IS_ACCUM : constant is 1;
    attribute mti_svvh_generic_type of C_DSP_OUTPUT_WIDTH : constant is 1;
end cnn_layer_accel_macc_DSP;
