library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_ce_macc_0 is
    generic(
        C_PACKET_WIDTH  : integer := 66;
        C_DELAY         : integer := 3;
        C_OUTPUT_DELAY  : integer := 2
    );
    port(
        rst             : in     vl_logic;
        opmode          : in     vl_logic_vector(8 downto 0);
        alumode         : in     vl_logic_vector(3 downto 0);
        CE              : in     vl_logic;
        CLK             : in     vl_logic;
        C_IN            : in     vl_logic;
        P_IN            : in     vl_logic_vector(47 downto 0);
        A               : in     vl_logic_vector(29 downto 0);
        B               : in     vl_logic_vector(17 downto 0);
        C               : in     vl_logic_vector(47 downto 0);
        P               : out    vl_logic_vector(47 downto 0);
        C_OUT           : out    vl_logic_vector(3 downto 0);
        BCOUT           : out    vl_logic_vector(17 downto 0);
        CARRYCASCOUT    : out    vl_logic;
        PCOUT           : out    vl_logic_vector(47 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_PACKET_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_DELAY : constant is 1;
    attribute mti_svvh_generic_type of C_OUTPUT_DELAY : constant is 1;
end cnn_layer_accel_ce_macc_0;
