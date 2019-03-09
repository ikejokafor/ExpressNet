library verilog;
use verilog.vl_types.all;
entity testbench is
    generic(
        C_PERIOD_100MHz : integer := 10;
        C_PERIOD_500MHz : integer := 2;
        C_NUM_TESTS     : integer := 1
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_PERIOD_100MHz : constant is 1;
    attribute mti_svvh_generic_type of C_PERIOD_500MHz : constant is 1;
    attribute mti_svvh_generic_type of C_NUM_TESTS : constant is 1;
end testbench;
