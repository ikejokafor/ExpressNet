library verilog;
use verilog.vl_types.all;
entity xilinx_true_dual_port_no_change_ram is
    generic(
        C_RAM_A_WIDTH   : integer := 16;
        C_RAM_A_DEPTH   : integer := 1024;
        C_RAM_B_WIDTH   : integer := 32;
        C_PORT_A_RAM_PERF: string  := "PORT_A_LOW_LATENCY";
        C_PORT_B_RAM_PERF: string  := "PORT_B_LOW_LATENCY"
    );
    port(
        clkA            : in     vl_logic;
        addrA           : in     vl_logic_vector;
        wrenA           : in     vl_logic;
        dinA            : in     vl_logic_vector;
        rdenA           : in     vl_logic;
        doutA           : out    vl_logic_vector;
        clkB            : in     vl_logic;
        addrB           : in     vl_logic_vector;
        wrenB           : in     vl_logic;
        dinB            : in     vl_logic_vector;
        rdenB           : in     vl_logic;
        doutB           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_RAM_A_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_RAM_A_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of C_RAM_B_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_PORT_A_RAM_PERF : constant is 1;
    attribute mti_svvh_generic_type of C_PORT_B_RAM_PERF : constant is 1;
end xilinx_true_dual_port_no_change_ram;
