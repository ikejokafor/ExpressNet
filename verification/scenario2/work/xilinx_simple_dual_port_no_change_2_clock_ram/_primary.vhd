library verilog;
use verilog.vl_types.all;
entity xilinx_simple_dual_port_no_change_2_clock_ram is
    generic(
        C_RAM_WR_WIDTH  : integer := 16;
        C_RAM_WR_DEPTH  : integer := 1024;
        C_RAM_RD_WIDTH  : integer := 32;
        C_RD_PORT_HIGH_PERF: integer := 1;
        C_FIFO_FWFT     : integer := 0
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
    attribute mti_svvh_generic_type of C_RAM_WR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_RAM_WR_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of C_RAM_RD_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_RD_PORT_HIGH_PERF : constant is 1;
    attribute mti_svvh_generic_type of C_FIFO_FWFT : constant is 1;
end xilinx_simple_dual_port_no_change_2_clock_ram;
