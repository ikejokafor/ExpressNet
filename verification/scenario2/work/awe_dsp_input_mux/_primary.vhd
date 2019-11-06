library verilog;
use verilog.vl_types.all;
entity awe_dsp_input_mux is
    generic(
        C_PACKET_WIDTH  : integer := 66;
        C_DATA_WIDTH    : integer := 18
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        mode            : in     vl_logic_vector(1 downto 0);
        datain_0        : in     vl_logic_vector;
        datain_1        : in     vl_logic_vector;
        datain_2        : in     vl_logic_vector;
        datain_3        : in     vl_logic_vector;
        dataout         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_PACKET_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_DATA_WIDTH : constant is 1;
end awe_dsp_input_mux;
