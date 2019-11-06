library verilog;
use verilog.vl_types.all;
entity fifo_generator_v13_1_3_sync_stage is
    generic(
        C_WIDTH         : integer := 10
    );
    port(
        RST             : in     vl_logic;
        CLK             : in     vl_logic;
        DIN             : in     vl_logic_vector;
        DOUT            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_WIDTH : constant is 1;
end fifo_generator_v13_1_3_sync_stage;
