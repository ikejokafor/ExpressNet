library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_awe_rowbuffers is
    generic(
        C_PIXEL_WIDTH   : integer := 16;
        C_BRAM_DEPTH    : integer := 1024;
        C_SEQ_DATA_WIDTH: integer := 16
    );
    port(
        clk_500MHz      : in     vl_logic;
        accel_rst       : in     vl_logic;
        input_row       : in     vl_logic_vector;
        input_col       : in     vl_logic_vector;
        num_input_cols  : in     vl_logic_vector;
        state           : in     vl_logic_vector(3 downto 0);
        gray_code       : in     vl_logic_vector(1 downto 0);
        seq_datain      : in     vl_logic_vector;
        row_matric      : in     vl_logic;
        pfb_rden        : in     vl_logic;
        cycle_counter   : in     vl_logic_vector(5 downto 0);
        ce0_pixel_datain: in     vl_logic_vector;
        ce1_pixel_datain: in     vl_logic_vector;
        ce0_start       : in     vl_logic;
        ce1_start       : in     vl_logic;
        ce0_pixel_dataout: out    vl_logic_vector;
        ce1_pixel_dataout: out    vl_logic_vector;
        wrAddr          : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_PIXEL_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_BRAM_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of C_SEQ_DATA_WIDTH : constant is 1;
end cnn_layer_accel_awe_rowbuffers;
