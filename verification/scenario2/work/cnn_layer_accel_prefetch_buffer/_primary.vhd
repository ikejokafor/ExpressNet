library verilog;
use verilog.vl_types.all;
entity cnn_layer_accel_prefetch_buffer is
    port(
        wr_clk          : in     vl_logic;
        rd_clk          : in     vl_logic;
        rst             : in     vl_logic;
        din             : in     vl_logic_vector(15 downto 0);
        wr_en           : in     vl_logic;
        rd_en           : in     vl_logic;
        dout            : out    vl_logic_vector(15 downto 0);
        padding         : in     vl_logic;
        upsample        : in     vl_logic;
        input_col       : in     vl_logic_vector;
        input_row       : in     vl_logic_vector;
        pded_num_input_cols: in     vl_logic_vector;
        pded_num_input_rows: in     vl_logic_vector;
        crpd_input_col_start: in     vl_logic_vector;
        crpd_input_row_start: in     vl_logic_vector;
        crpd_input_col_end: in     vl_logic_vector;
        crpd_input_row_end: in     vl_logic_vector;
        job_fetch_ack   : in     vl_logic;
        job_complete_ack: in     vl_logic;
        rst_addr        : in     vl_logic
    );
end cnn_layer_accel_prefetch_buffer;
