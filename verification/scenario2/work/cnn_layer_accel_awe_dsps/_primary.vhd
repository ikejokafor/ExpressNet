library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_awe_dsps is
    generic(
        C_DATAIN_DELAY  : integer := 0
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
        ce0_pixel_valid : in     vl_logic;
        ce0_pixel_datain: in     vl_logic_vector(31 downto 0);
        ce1_pixel_valid : in     vl_logic;
        ce1_pixel_datain: in     vl_logic_vector(31 downto 0);
        ce0_weight_valid: in     vl_logic;
        ce0_weight_datain: in     vl_logic_vector(31 downto 0);
        ce1_weight_valid: in     vl_logic;
        ce1_weight_datain: in     vl_logic_vector(31 downto 0);
        dataout_valid   : out    vl_logic;
        dataout_p       : out    vl_logic_vector(47 downto 0);
        dataout_c       : out    vl_logic;
        cascade_dataout : out    vl_logic_vector(47 downto 0);
        cascade_carryout: out    vl_logic;
        cascade_dataout_valid: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_DATAIN_DELAY : constant is 1;
end cnn_layer_accel_awe_dsps;
