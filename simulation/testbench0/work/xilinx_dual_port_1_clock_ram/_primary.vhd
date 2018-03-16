library verilog;
use verilog.vl_types.all;
entity xilinx_dual_port_1_clock_ram is
    generic(
        RAM_WIDTH       : integer := 64;
        RAM_DEPTH       : integer := 512
    );
    port(
        wrAddr          : in     vl_logic_vector;
        rdAddr          : in     vl_logic_vector;
        din             : in     vl_logic_vector;
        clk             : in     vl_logic;
        wren            : in     vl_logic;
        rden            : in     vl_logic;
        dout            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of RAM_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of RAM_DEPTH : constant is 1;
end xilinx_dual_port_1_clock_ram;
