library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_quad is
    generic(
        C_PACKET_WIDTH  : integer := 66
    );
    port(
        clk_if          : in     vl_logic;
        clk_core        : in     vl_logic;
        rst             : in     vl_logic;
        job_start       : in     vl_logic;
        job_accept      : out    vl_logic;
        job_parameters  : in     vl_logic_vector(127 downto 0);
        job_fetch_request: out    vl_logic;
        job_fetch_ack   : in     vl_logic;
        job_fetch_complete: in     vl_logic;
        job_complete    : out    vl_logic;
        job_complete_ack: in     vl_logic;
        cascade_in_data : in     vl_logic_vector(127 downto 0);
        cascade_in_valid: in     vl_logic;
        cascade_in_ready: out    vl_logic;
        cascade_out_data: out    vl_logic_vector(127 downto 0);
        cascade_out_valid: out    vl_logic;
        cascade_out_ready: in     vl_logic;
        config_valid    : in     vl_logic_vector(3 downto 0);
        config_accept   : out    vl_logic_vector(3 downto 0);
        config_data     : in     vl_logic_vector(127 downto 0);
        weight_valid    : in     vl_logic;
        weight_ready    : out    vl_logic;
        weight_data     : in     vl_logic_vector(127 downto 0);
        result_valid    : out    vl_logic;
        result_accept   : in     vl_logic;
        result_data     : out    vl_logic_vector(15 downto 0);
        pixel_valid     : in     vl_logic;
        pixel_ready     : out    vl_logic;
        pixel_data      : in     vl_logic_vector(127 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_PACKET_WIDTH : constant is 1;
end cnn_layer_accel_quad;
