library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_quad_intf is
    port(
        clk_if          : in     vl_logic;
        clk_core        : in     vl_logic;
        rst             : out    vl_logic;
        job_start       : out    vl_logic;
        job_accept      : in     vl_logic;
        job_parameters  : out    vl_logic_vector(127 downto 0);
        job_fetch_request: in     vl_logic;
        job_fetch_ack   : out    vl_logic;
        job_fetch_complete: out    vl_logic;
        job_complete    : in     vl_logic;
        job_complete_ack: out    vl_logic;
        cascade_in_valid: out    vl_logic;
        cascade_in_ready: in     vl_logic;
        cascade_in_data : out    vl_logic_vector(127 downto 0);
        cascade_out_valid: in     vl_logic;
        cascade_out_ready: out    vl_logic;
        cascade_out_data: in     vl_logic_vector(127 downto 0);
        config_valid    : out    vl_logic_vector(3 downto 0);
        config_accept   : in     vl_logic_vector(3 downto 0);
        config_data     : out    vl_logic_vector(127 downto 0);
        weight_valid    : out    vl_logic;
        weight_ready    : in     vl_logic;
        weight_data     : out    vl_logic_vector(127 downto 0);
        result_valid    : in     vl_logic;
        result_accept   : out    vl_logic;
        result_data     : in     vl_logic_vector(15 downto 0);
        pixel_valid     : out    vl_logic;
        pixel_ready     : in     vl_logic;
        pixel_data      : out    vl_logic_vector(127 downto 0)
    );
end cnn_layer_accel_quad_intf;
