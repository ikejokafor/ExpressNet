library verilog;
use verilog.vl_types.all;
entity sys_synch_intf is
    port(
        clk             : in     vl_logic;
        rst             : out    vl_logic
    );
end sys_synch_intf;
