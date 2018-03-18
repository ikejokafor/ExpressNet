library verilog;
use verilog.vl_types.all;
entity xilinx_dual_port_1_clock_ram is
    generic(
        C_RAM_WIDTH     : integer := 64;
        C_RAM_DEPTH     : integer := 512;
        C_SEQ_ACCESS    : integer := 1
    );
    port(
        wrAddr          : in     vl_logic_vector;
        rdAddr          : in     vl_logic_vector;
        datain          : in     vl_logic_vector;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        wren            : in     vl_logic;
        rden            : in     vl_logic;
        dataout         : out    vl_logic_vector;
        count           : out    vl_logic_vector;
        count_rst       : in     vl_logic;
        count_set       : in     vl_logic;
        count_set_value : in     vl_logic_vector;
        full            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_RAM_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_RAM_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of C_SEQ_ACCESS : constant is 1;
end xilinx_dual_port_1_clock_ram;
