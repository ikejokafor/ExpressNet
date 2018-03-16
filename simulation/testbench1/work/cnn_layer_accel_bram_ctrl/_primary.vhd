library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_bram_ctrl is
    generic(
        C_NUM_AWE       : integer := 1;
        C_BRAM_DEPTH    : integer := 1024
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        datain_valid    : in     vl_logic;
        pixel_datain_tag: in     vl_logic;
        seq_datain_tag  : in     vl_logic;
        new_map         : in     vl_logic;
        state           : out    vl_logic_vector(4 downto 0);
        row             : out    vl_logic_vector;
        col             : out    vl_logic_vector;
        numRows         : out    vl_logic_vector;
        numCols         : out    vl_logic_vector;
        seq_count       : in     vl_logic_vector;
        pfb_full        : in     vl_logic_vector;
        wrAddr          : out    vl_logic_vector;
        row_Matric      : in     vl_logic;
        gray_code_out   : out    vl_logic;
        pfb_wren        : out    vl_logic;
        pfb_rden        : out    vl_logic;
        seq_wrAddr      : out    vl_logic_vector;
        seq_rdAddr      : out    vl_logic_vector;
        seq_wren        : out    vl_logic;
        seq_rden        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_NUM_AWE : constant is 1;
    attribute mti_svvh_generic_type of C_BRAM_DEPTH : constant is 1;
end cnn_layer_accel_bram_ctrl;
