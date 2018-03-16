library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_awe_rowbuffer_logic is
    generic(
        C_PIXEL_WIDTH   : integer := 18;
        C_BRAM_DEPTH    : integer := 1024
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        new_map         : in     vl_logic;
        conv_config     : in     vl_logic;
        numRows         : in     vl_logic_vector;
        numCols         : in     vl_logic_vector;
        pixel_datain    : in     vl_logic_vector(17 downto 0);
        pixel_datain_valid: in     vl_logic;
        pixel_datain_rdy: out    vl_logic;
        pixel_dataout   : out    vl_logic_vector(71 downto 0);
        pixel_dataout_valid: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_PIXEL_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_BRAM_DEPTH : constant is 1;
end cnn_layer_accel_awe_rowbuffer_logic;
