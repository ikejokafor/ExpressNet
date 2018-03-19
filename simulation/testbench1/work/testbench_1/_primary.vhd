library verilog;
use verilog.vl_types.all;
entity testbench_1 is
    generic(
        C_PERIOD0       : integer := 2;
        C_PERIOD1       : integer := 10;
        C_PACKET_WIDTH  : integer := 66
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_PERIOD0 : constant is 1;
    attribute mti_svvh_generic_type of C_PERIOD1 : constant is 1;
    attribute mti_svvh_generic_type of C_PACKET_WIDTH : constant is 1;
end testbench_1;
