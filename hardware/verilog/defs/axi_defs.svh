`ifndef __AXI_DEFS__
`define __AXI_DEFS__


`define AXI_ID_WTH          1
`define AXI_ADDR_WTH        32
`define AXI_LEN_WTH         8
`define AXI_DATA_WTH        512 
`define AXI_RESP_WTH        2
`define AXI_BR_WTH          4  
`define AXI_MX_BT_SZ        (`AXI_DATA_WTH << 3)
`define AXI_SZ_WTH          (clog2(`AXI_DATA_WTH))
`define AXI_WSTRB_WTH       (`AXI_MX_BT_SZ)


`endif
