library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_awe_rowbuffers_intf is
    port(
        clk             : in     vl_logic;
        ce0_pixel_dataout: in     vl_logic_vector(31 downto 0);
        ce1_pixel_dataout: in     vl_logic_vector(31 downto 0);
        ce0_pixel_dataout_valid: in     vl_logic;
        ce1_pixel_dataout_valid: in     vl_logic;
        output_row_ce0  : in     integer;
        output_row_ce1  : in     integer;
        output_col_ce0  : in     integer;
        output_col_ce1  : in     integer;
        ce0_last_kernel : in     vl_logic;
        ce1_last_kernel : in     vl_logic;
        ce0_cycle_counter: in     vl_logic_vector(2 downto 0);
        ce1_cycle_counter: in     vl_logic_vector(2 downto 0)
    );
end cnn_layer_accel_awe_rowbuffers_intf;
