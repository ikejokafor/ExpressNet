library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_ce_dsps is
    generic(
        C_PACKET_WIDTH  : integer := 66;
        C_MAX_WINDOW_SIZE_COUNTER: integer := 12
    );
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        clk_5x          : in     vl_logic;
        new_map         : in     vl_logic;
        kernal_window_size: in     vl_logic_vector(4 downto 0);
        mode            : in     vl_logic_vector(1 downto 0);
        cascade_datain  : in     vl_logic_vector(47 downto 0);
        cascade_carryin : in     vl_logic;
        cascade_datain_valid: in     vl_logic;
        pixel_valid_upper: in     vl_logic;
        pixel_datain_upper: in     vl_logic_vector(15 downto 0);
        pixel_valid_lower: in     vl_logic;
        pixel_datain_lower: in     vl_logic_vector(15 downto 0);
        weight_valid_upper: in     vl_logic;
        weight_datain_upper: in     vl_logic_vector(15 downto 0);
        weight_valid_lower: in     vl_logic;
        weight_datain_lower: in     vl_logic_vector(15 downto 0);
        dataout_valid   : out    vl_logic;
        dataout_p       : out    vl_logic_vector(47 downto 0);
        dataout_c       : out    vl_logic;
        cascade_dataout : out    vl_logic_vector(47 downto 0);
        cascade_carryout: out    vl_logic;
        cascade_dataout_valid: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_PACKET_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_MAX_WINDOW_SIZE_COUNTER : constant is 1;
end cnn_layer_accel_ce_dsps;
