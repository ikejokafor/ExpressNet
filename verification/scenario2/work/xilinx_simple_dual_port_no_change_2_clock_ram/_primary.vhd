library verilog;
use verilog.vl_types.all;
entity xilinx_simple_dual_port_no_change_2_clock_ram is
    generic(
        C_RAM_A_WIDTH   : integer := 16;
        C_RAM_A_DEPTH   : integer := 1024;
        C_RAM_B_WIDTH   : integer := 32;
        C_PORT_A_RAM_PERF: string  := "PORT_A_LOW_LATENCY";
        C_PORT_B_RAM_PERF: string  := "PORT_B_LOW_LATENCY"
    );
    port(
        wr_clk          : in     vl_logic;
        wrAddr          : in     vl_logic_vector;
        wren            : in     vl_logic;
        din             : in     vl_logic_vector;
        rd_clk          : in     vl_logic;
        rdAddr          : in     vl_logic_vector;
        rden            : in     vl_logic;
        dout            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_RAM_A_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_RAM_A_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of C_RAM_B_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_PORT_A_RAM_PERF : constant is 1;
    attribute mti_svvh_generic_type of C_PORT_B_RAM_PERF : constant is 1;
end xilinx_simple_dual_port_no_change_2_clock_ram;
