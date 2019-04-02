library verilog;
use verilog.vl_types.all;
entity clock_gen is
    generic(
        C_PERIOD        : integer := 5
    );
    port(
        clk_out         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_PERIOD : constant is 1;
end clock_gen;
