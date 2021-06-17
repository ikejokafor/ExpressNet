`ifndef __TESTBENCH_3__
`define __TESTBENCH_3__


//---------------------------------------------------------------------------------------------------------------------------------------------------
// Includes
//---------------------------------------------------------------------------------------------------------------------------------------------------
`include "utilities.svh"
`include "cnn_layer_accel_FAS.svh"


`define BYTES_PER_PIXEL	2


`define KL_IT_RD_ID  	7'b0000001
`define KB_IT_RD_ID  	7'b0000010
`define AC_IT_RD_ID  	7'b0000100
`define IM_IT_RD_ID  	7'b0001000
`define PM_IT_RD_ID  	7'b0010000
`define RM_IT_RD_ID  	7'b0100000
`define PV_IT_RD_ID  	7'b1000000


`define CO_HIGH_WATERMARK_FACTOR    3
`define RM_LOW_WATERMARK_FACTOR     1
`define PM_LOW_WATERMARK_FACTOR     1
`define PV_LOW_WATERMARK_FACTOR     1
`define OB_HIGH_WATERMARK_FACTOR    1
`define RM_FETCH_FACTOR             1
`define PM_FETCH_FACTOR             1
`define PV_FETCH_FACTOR             1
`define OB_STORE_FACTOR             1
`define NUM_PIX_PER_BUS             (`INIT_RD_DATA_WIDTH / `PIXEL_WIDTH)


`define OPCODE_0		18'b000000000000000001
`define OPCODE_1		18'b000000000000000010
`define OPCODE_2        18'b000000000000000100
`define OPCODE_3        18'b000000000000001000
`define OPCODE_4        18'b000000000000010000
`define OPCODE_5        18'b000000000000100000
`define OPCODE_6        18'b000000000001000000
`define OPCODE_7        18'b000000000010000000
`define OPCODE_8        18'b000000000100000000
`define OPCODE_9        18'b000000001000000000
`define OPCODE_10       18'b000000010000000000
`define OPCODE_11       18'b000000100000000000
`define OPCODE_12       18'b000001000000000000
`define OPCODE_13       18'b000010000000000000
`define OPCODE_14       18'b000100000000000000
`define OPCODE_15       18'b001000000000000000
`define OPCODE_16       18'b010000000000000000
`define OPCODE_17       18'b100000000000000000


`endif