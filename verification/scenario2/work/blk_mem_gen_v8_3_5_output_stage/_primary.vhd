library verilog;
use verilog.vl_types.all;
entity blk_mem_gen_v8_3_5_output_stage is
    generic(
        C_FAMILY        : string  := "virtex7";
        C_XDEVICEFAMILY : string  := "virtex7";
        C_RST_TYPE      : string  := "SYNC";
        C_HAS_RST       : integer := 0;
        C_RSTRAM        : integer := 0;
        C_RST_PRIORITY  : string  := "CE";
        C_INIT_VAL      : string  := "0";
        C_HAS_EN        : integer := 0;
        C_HAS_REGCE     : integer := 0;
        C_DATA_WIDTH    : integer := 32;
        C_ADDRB_WIDTH   : integer := 10;
        C_HAS_MEM_OUTPUT_REGS: integer := 0;
        C_USE_SOFTECC   : integer := 0;
        C_USE_ECC       : integer := 0;
        NUM_STAGES      : integer := 1;
        C_EN_ECC_PIPE   : integer := 0;
        FLOP_DELAY      : integer := 100
    );
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        EN              : in     vl_logic;
        REGCE           : in     vl_logic;
        DIN_I           : in     vl_logic_vector;
        DOUT            : out    vl_logic_vector;
        SBITERR_IN_I    : in     vl_logic;
        DBITERR_IN_I    : in     vl_logic;
        SBITERR         : out    vl_logic;
        DBITERR         : out    vl_logic;
        RDADDRECC_IN_I  : in     vl_logic_vector;
        ECCPIPECE       : in     vl_logic;
        RDADDRECC       : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_FAMILY : constant is 1;
    attribute mti_svvh_generic_type of C_XDEVICEFAMILY : constant is 1;
    attribute mti_svvh_generic_type of C_RST_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_RST : constant is 1;
    attribute mti_svvh_generic_type of C_RSTRAM : constant is 1;
    attribute mti_svvh_generic_type of C_RST_PRIORITY : constant is 1;
    attribute mti_svvh_generic_type of C_INIT_VAL : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_EN : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_REGCE : constant is 1;
    attribute mti_svvh_generic_type of C_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_ADDRB_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_MEM_OUTPUT_REGS : constant is 1;
    attribute mti_svvh_generic_type of C_USE_SOFTECC : constant is 1;
    attribute mti_svvh_generic_type of C_USE_ECC : constant is 1;
    attribute mti_svvh_generic_type of NUM_STAGES : constant is 1;
    attribute mti_svvh_generic_type of C_EN_ECC_PIPE : constant is 1;
    attribute mti_svvh_generic_type of FLOP_DELAY : constant is 1;
end blk_mem_gen_v8_3_5_output_stage;
