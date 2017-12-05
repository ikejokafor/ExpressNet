library verilog;
use verilog.vl_types.all;
entity max is
    generic(
        C_DATA_WIDTH    : integer := 16
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        operand0        : in     vl_logic_vector;
        operand1        : in     vl_logic_vector;
        max_out         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_DATA_WIDTH : constant is 1;
end max;
