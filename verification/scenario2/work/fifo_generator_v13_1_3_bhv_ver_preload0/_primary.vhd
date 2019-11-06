library verilog;
use verilog.vl_types.all;
entity fifo_generator_v13_1_3_bhv_ver_preload0 is
    generic(
        C_DOUT_RST_VAL  : string  := "";
        C_DOUT_WIDTH    : integer := 8;
        C_HAS_RST       : integer := 0;
        C_ENABLE_RST_SYNC: integer := 0;
        C_HAS_SRST      : integer := 0;
        C_USE_EMBEDDED_REG: integer := 0;
        C_EN_SAFETY_CKT : integer := 0;
        C_USE_DOUT_RST  : integer := 0;
        C_USE_ECC       : integer := 0;
        C_USERVALID_LOW : integer := 0;
        C_USERUNDERFLOW_LOW: integer := 0;
        C_MEMORY_TYPE   : integer := 0;
        C_FIFO_TYPE     : integer := 0
    );
    port(
        SAFETY_CKT_RD_RST: in     vl_logic;
        RD_CLK          : in     vl_logic;
        RD_RST          : in     vl_logic;
        SRST            : in     vl_logic;
        WR_RST_BUSY     : in     vl_logic;
        RD_RST_BUSY     : in     vl_logic;
        RD_EN           : in     vl_logic;
        FIFOEMPTY       : in     vl_logic;
        FIFODATA        : in     vl_logic_vector;
        FIFOSBITERR     : in     vl_logic;
        FIFODBITERR     : in     vl_logic;
        USERDATA        : out    vl_logic_vector;
        USERVALID       : out    vl_logic;
        USERUNDERFLOW   : out    vl_logic;
        USEREMPTY       : out    vl_logic;
        USERALMOSTEMPTY : out    vl_logic;
        RAMVALID        : out    vl_logic;
        FIFORDEN        : out    vl_logic;
        USERSBITERR     : out    vl_logic;
        USERDBITERR     : out    vl_logic;
        STAGE2_REG_EN   : out    vl_logic;
        fab_read_data_valid_i_o: out    vl_logic;
        read_data_valid_i_o: out    vl_logic;
        ram_valid_i_o   : out    vl_logic;
        VALID_STAGES    : out    vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_DOUT_RST_VAL : constant is 1;
    attribute mti_svvh_generic_type of C_DOUT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_RST : constant is 1;
    attribute mti_svvh_generic_type of C_ENABLE_RST_SYNC : constant is 1;
    attribute mti_svvh_generic_type of C_HAS_SRST : constant is 1;
    attribute mti_svvh_generic_type of C_USE_EMBEDDED_REG : constant is 1;
    attribute mti_svvh_generic_type of C_EN_SAFETY_CKT : constant is 1;
    attribute mti_svvh_generic_type of C_USE_DOUT_RST : constant is 1;
    attribute mti_svvh_generic_type of C_USE_ECC : constant is 1;
    attribute mti_svvh_generic_type of C_USERVALID_LOW : constant is 1;
    attribute mti_svvh_generic_type of C_USERUNDERFLOW_LOW : constant is 1;
    attribute mti_svvh_generic_type of C_MEMORY_TYPE : constant is 1;
    attribute mti_svvh_generic_type of C_FIFO_TYPE : constant is 1;
end fifo_generator_v13_1_3_bhv_ver_preload0;
