library verilog;
use verilog.vl_types.all;
entity SRL_bus is
    generic(
        C_CLOCK_CYCLES  : integer := 1;
        C_DATA_WIDTH    : integer := 32
    );
    port(
        clk             : in     vl_logic;
        ce              : in     vl_logic;
        rst             : in     vl_logic;
        data_in         : in     vl_logic_vector;
        data_out        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_CLOCK_CYCLES : constant is 1;
    attribute mti_svvh_generic_type of C_DATA_WIDTH : constant is 1;
end SRL_bus;
