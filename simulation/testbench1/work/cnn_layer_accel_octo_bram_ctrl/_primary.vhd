library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_octo_bram_ctrl is
    generic(
        C_NUM_AWE       : integer := 1;
        C_BRAM_DEPTH    : integer := 1024
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        datain_valid    : in     vl_logic;
        pixel_datain_tag: in     vl_logic;
        pixel_datain_rdy: out    vl_logic;
        seq_datain_tag  : in     vl_logic;
        seq_datain_rdy  : out    vl_logic;
        new_map         : in     vl_logic;
        state           : out    vl_logic_vector(6 downto 0);
        input_row_d     : out    vl_logic_vector;
        input_col       : out    vl_logic_vector;
        input_col_d     : out    vl_logic_vector;
        num_input_cols  : out    vl_logic_vector;
        seq_count       : in     vl_logic_vector;
        pfb_count       : in     vl_logic_vector(17 downto 0);
        row_matric      : in     vl_logic;
        gray_code       : out    vl_logic_vector(1 downto 0);
        cycle_counter   : out    vl_logic_vector(5 downto 0);
        pfb_wren        : out    vl_logic;
        pfb_rden        : out    vl_logic;
        pfb_rden_d      : out    vl_logic;
        seq_wrAddr      : out    vl_logic_vector;
        seq_rdAddr      : out    vl_logic_vector;
        seq_wren        : out    vl_logic;
        seq_rden        : out    vl_logic;
        pixel_dataout_valid: out    vl_logic;
        row_matric_done : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_NUM_AWE : constant is 1;
    attribute mti_svvh_generic_type of C_BRAM_DEPTH : constant is 1;
end cnn_layer_accel_octo_bram_ctrl;
