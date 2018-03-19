library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_awe_rowbuffers is
    generic(
        C_PIXEL_WIDTH   : integer := 18;
        C_BRAM_DEPTH    : integer := 1024
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        input_row_d     : in     vl_logic_vector;
        input_col       : in     vl_logic_vector;
        input_col_d     : in     vl_logic_vector;
        num_input_cols  : in     vl_logic_vector;
        state           : in     vl_logic_vector(6 downto 0);
        gray_code       : in     vl_logic_vector(1 downto 0);
        seq_datain      : in     vl_logic_vector(12 downto 0);
        row_matric      : in     vl_logic;
        pfb_rden        : in     vl_logic;
        cycle_counter   : in     vl_logic_vector(5 downto 0);
        pixel_datain    : in     vl_logic_vector(17 downto 0);
        pixel_datain_valid: in     vl_logic;
        pixel_dataout   : out    vl_logic_vector(71 downto 0);
        row_matric_done : in     vl_logic;
        wrAddr          : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_PIXEL_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_BRAM_DEPTH : constant is 1;
end cnn_layer_accel_awe_rowbuffers;
