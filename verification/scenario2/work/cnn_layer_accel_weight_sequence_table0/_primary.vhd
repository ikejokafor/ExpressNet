library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_weight_sequence_table0 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        gray_code       : in     vl_logic_vector(1 downto 0);
        sequence_selector: in     vl_logic;
        seq_data_addr   : in     vl_logic_vector(2 downto 0);
        wht_data_addr   : out    vl_logic_vector(3 downto 0)
    );
end cnn_layer_accel_weight_sequence_table0;
