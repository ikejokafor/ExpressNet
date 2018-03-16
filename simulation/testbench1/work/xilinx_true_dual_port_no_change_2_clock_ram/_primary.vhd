library verilog;
use verilog.vl_types.all;
entity xilinx_true_dual_port_no_change_2_clock_ram is
    generic(
        RAM_WIDTH       : integer := 64;
        RAM_DEPTH       : integer := 512
    );
    port(
        addrA           : in     vl_logic_vector;
        addrB           : in     vl_logic_vector;
        addrA_plus_strideA: in     vl_logic_vector;
        addrB_plus_strideB: in     vl_logic_vector;
        dinA            : in     vl_logic_vector;
        dinB            : in     vl_logic_vector;
        clkA            : in     vl_logic;
        clkB            : in     vl_logic;
        wrenA           : in     vl_logic;
        wrenB           : in     vl_logic;
        rdenA           : in     vl_logic;
        rdenB           : in     vl_logic;
        rstA            : in     vl_logic;
        rstB            : in     vl_logic;
        doutA           : out    vl_logic_vector;
        doutB           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of RAM_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of RAM_DEPTH : constant is 1;
end xilinx_true_dual_port_no_change_2_clock_ram;
