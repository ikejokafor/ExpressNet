library verilog;
use verilog.vl_types.all;
entity xilinx_simple_dual_port_no_change_ram is
    generic(
        C_RAM_WIDTH     : integer := 64;
        C_RAM_DEPTH     : integer := 512;
        C_RAM_PERF      : string  := "LOW_LATENCY"
    );
    port(
        wrAddr          : in     vl_logic_vector;
        rdAddr          : in     vl_logic_vector;
        datain          : in     vl_logic_vector;
        clk             : in     vl_logic;
        wren            : in     vl_logic;
        rden            : in     vl_logic;
        dataout         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_RAM_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_RAM_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of C_RAM_PERF : constant is 1;
end xilinx_simple_dual_port_no_change_ram;
