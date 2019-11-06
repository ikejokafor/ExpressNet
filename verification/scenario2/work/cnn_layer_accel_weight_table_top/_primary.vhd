library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_weight_table_top is
    generic(
        C_CE_WHT_SEQ_ADDR_DELAY: integer := 3
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        config_mode     : in     vl_logic;
        job_accept      : in     vl_logic;
        next_kernel     : in     vl_logic;
        last_kernel     : out    vl_logic;
        kernel_config_valid: in     vl_logic;
        num_kernels     : in     vl_logic_vector(15 downto 0);
        wht_config_wren : in     vl_logic;
        wht_config_data : in     vl_logic_vector(15 downto 0);
        wht_seq_addr0   : in     vl_logic_vector(3 downto 0);
        wht_seq_addr1   : in     vl_logic_vector(3 downto 0);
        ce_execute      : in     vl_logic;
        ce_cycle_counter: in     vl_logic_vector(2 downto 0);
        output_stride   : in     vl_logic_vector(2 downto 0);
        wht_table_dout  : out    vl_logic_vector(31 downto 0);
        wht_table_dout_valid: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_CE_WHT_SEQ_ADDR_DELAY : constant is 1;
end cnn_layer_accel_weight_table_top;
