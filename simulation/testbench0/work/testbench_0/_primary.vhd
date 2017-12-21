library verilog;
use verilog.vl_types.all;
entity testbench_0 is
    generic(
        C_PORT_CONFIG_NONE: integer := 0;
        C_PORT_CONFIG_LAYER_ENGINE_IO: integer := 1;
        C_PORT_CONFIG_LAYER_BRIDGE: integer := 2;
        C_PORT_CONFIG_DATA_MOVER_RD: integer := 3;
        C_PORT_CONFIG_DATA_MOVER_WR: integer := 4;
        C_PORT_CONFIG_CONTROLLER: integer := 5;
        C_PORT_CONFIG_MSG_INTF: integer := 6;
        C_COL           : integer := 0;
        C_ROW           : integer := 1;
        C_PERIOD        : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_PORT_CONFIG_NONE : constant is 1;
    attribute mti_svvh_generic_type of C_PORT_CONFIG_LAYER_ENGINE_IO : constant is 1;
    attribute mti_svvh_generic_type of C_PORT_CONFIG_LAYER_BRIDGE : constant is 1;
    attribute mti_svvh_generic_type of C_PORT_CONFIG_DATA_MOVER_RD : constant is 1;
    attribute mti_svvh_generic_type of C_PORT_CONFIG_DATA_MOVER_WR : constant is 1;
    attribute mti_svvh_generic_type of C_PORT_CONFIG_CONTROLLER : constant is 1;
    attribute mti_svvh_generic_type of C_PORT_CONFIG_MSG_INTF : constant is 1;
    attribute mti_svvh_generic_type of C_COL : constant is 1;
    attribute mti_svvh_generic_type of C_ROW : constant is 1;
    attribute mti_svvh_generic_type of C_PERIOD : constant is 1;
end testbench_0;
