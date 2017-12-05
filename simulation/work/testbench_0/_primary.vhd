library verilog;
use verilog.vl_types.all;
entity testbench_0 is
    generic(
        C_PERIOD        : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_PERIOD : constant is 1;
end testbench_0;
