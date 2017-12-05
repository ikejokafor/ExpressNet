library verilog;
use verilog.vl_types.all;
entity row_buffer is
    generic(
        C_PIXEL_WIDTH   : integer := 16;
        C_IMAGE_WIDTH   : integer := 256
    );
    port(
        wr_addr         : in     vl_logic_vector;
        din             : in     vl_logic_vector;
        clk             : in     vl_logic;
        wren            : in     vl_logic;
        rden            : in     vl_logic;
        rst             : in     vl_logic;
        dout            : out    vl_logic_vector;
        full            : out    vl_logic;
        count           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_PIXEL_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_IMAGE_WIDTH : constant is 1;
end row_buffer;
