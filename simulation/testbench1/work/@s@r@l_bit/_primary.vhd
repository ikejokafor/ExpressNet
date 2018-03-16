library verilog;
use verilog.vl_types.all;
entity SRL_bit is
    generic(
        C_CLOCK_CYCLES  : integer := 1
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ce              : in     vl_logic;
        data_in         : in     vl_logic;
        data_out        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_CLOCK_CYCLES : constant is 1;
end SRL_bit;
