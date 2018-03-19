library verilog;
use verilog.vl_types.all;
entity fifo_fwft_prog_full_count_mod is
    generic(
        C_DATA_WIDTH    : integer := 128;
        C_FIFO_DEPTH    : integer := 16;
        C_PROG_FULL_THRESHOLD: integer := 10
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        wren            : in     vl_logic;
        rden            : in     vl_logic;
        datain          : in     vl_logic_vector;
        dataout         : out    vl_logic_vector;
        dataout_valid   : out    vl_logic;
        empty           : out    vl_logic;
        full            : out    vl_logic;
        prog_full       : out    vl_logic;
        count           : out    vl_logic_vector(17 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_FIFO_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of C_PROG_FULL_THRESHOLD : constant is 1;
end fifo_fwft_prog_full_count_mod;
