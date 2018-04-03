library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_awe_rowbuffers is
    generic(
        C_CE0_ROW_MATRIC_DELAY: integer := 3;
        C_CE1_ROW_MATRIC_DELAY: integer := 4;
        C_SEQ_DATAIN_DELAY: integer := 0;
        C_CE0_ROW_MAT_WR_ADDR_DELAY: integer := 4;
        C_CE1_ROW_MAT_WR_ADDR_DELAY: integer := 5;
        C_CE0_ROW_MAT_PX_DIN_DELAY: integer := 2;
        C_CE1_ROW_MAT_PX_DIN_DELAY: integer := 3
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        input_row       : in     vl_logic_vector;
        input_col       : in     vl_logic_vector;
        num_input_cols  : in     vl_logic_vector;
        state           : in     vl_logic_vector(4 downto 0);
        gray_code       : in     vl_logic_vector(1 downto 0);
        pix_seq_datain  : in     vl_logic_vector(15 downto 0);
        pfb_rden        : in     vl_logic;
        last_kernel     : in     vl_logic;
        row_matric      : in     vl_logic;
        ce0_pixel_datain: in     vl_logic_vector(15 downto 0);
        ce1_pixel_datain: in     vl_logic_vector(15 downto 0);
        ce0_execute     : in     vl_logic;
        ce1_execute     : in     vl_logic;
        ce0_pixel_dataout: out    vl_logic_vector(31 downto 0);
        ce1_pixel_dataout: out    vl_logic_vector(31 downto 0);
        row_matric_wrAddr: in     vl_logic_vector;
        ce0_pixel_dataout_valid: out    vl_logic;
        ce1_pixel_dataout_valid: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_CE0_ROW_MATRIC_DELAY : constant is 1;
    attribute mti_svvh_generic_type of C_CE1_ROW_MATRIC_DELAY : constant is 1;
    attribute mti_svvh_generic_type of C_SEQ_DATAIN_DELAY : constant is 1;
    attribute mti_svvh_generic_type of C_CE0_ROW_MAT_WR_ADDR_DELAY : constant is 1;
    attribute mti_svvh_generic_type of C_CE1_ROW_MAT_WR_ADDR_DELAY : constant is 1;
    attribute mti_svvh_generic_type of C_CE0_ROW_MAT_PX_DIN_DELAY : constant is 1;
    attribute mti_svvh_generic_type of C_CE1_ROW_MAT_PX_DIN_DELAY : constant is 1;
end cnn_layer_accel_awe_rowbuffers;
