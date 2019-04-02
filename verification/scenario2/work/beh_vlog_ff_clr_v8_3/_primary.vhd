library verilog;
use verilog.vl_types.all;
entity beh_vlog_ff_clr_v8_3 is
    generic(
        INIT            : integer := 0
    );
    port(
        Q               : out    vl_logic;
        C               : in     vl_logic;
        CLR             : in     vl_logic;
        D               : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INIT : constant is 1;
end beh_vlog_ff_clr_v8_3;
