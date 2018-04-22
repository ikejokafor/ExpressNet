///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company:			
//				
// Engineer:		
//
// Create Date:		
// Design Name:		
// Module Name:		
// Project Name:	
// Target Devices:  
// Tool versions:
// Description:		
//
// Dependencies:
//	 
// 	 
//
// Revision:
//
//
//
//
// Additional Comments:     
//                          
//                          
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
`ifndef __CNN_LAYER_ACCEL_DEFS__
`define __CNN_LAYER_ACCEL_DEFS__


//-----------------------------------------------------------------------------------------------------------------------------------------------
//	Includes
//-----------------------------------------------------------------------------------------------------------------------------------------------
`include "math.vh"


//-----------------------------------------------------------------------------------------------------------------------------------------------
//	Utilities
//-----------------------------------------------------------------------------------------------------------------------------------------------
`define UNPACK_ARRAY_1D(PK_WIDTH, PK_LEN, PK_SRC, PK_DEST, g)                        \
    generate                                                                         \
        for(g = 0; g < (PK_LEN); g = g + 1) begin                                    \
            assign PK_DEST[g][PK_WIDTH - 1:0] = PK_SRC[(PK_WIDTH * g) +: PK_WIDTH];  \
        end                                                                          \
    endgenerate                                                                      \

`define PACK_ARRAY_1D(PK_WIDTH, PK_LEN, PK_SRC, PK_DEST, g)                             \
    generate                                                                            \
        for(g = 0; g < (PK_LEN); g = g + 1) begin                                       \
            assign PK_DEST[(PK_WIDTH * g) +: PK_WIDTH] = PK_SRC[g][PK_WIDTH - 1:0];     \
        end                                                                             \
    endgenerate                                                                         \


//-----------------------------------------------------------------------------------------------------------------------------------------------
//	MSC
//-----------------------------------------------------------------------------------------------------------------------------------------------
`define PIXEL_WIDTH                     16
`define WEIGHT_WIDTH                    16
`define BRAM_DEPTH                      1024
`define CONFIG_3x3                      1'b0
`define CONFIG_5x5                      1'b1
`define NUM_QUADS                       1     
`define NUM_AWE                         4
`define NUM_CE_PER_AWE                  2
`define NUM_WHT_SEQ_VALUES              5
`define WHT_SEQ_WIDTH                   4
`define NUM_DSP_PER_CE                  2
`define NUM_WHT_SEQ_TABLE_PER_AWE       4


//-----------------------------------------------------------------------------------------------------------------------------------------------
// SEQ DATA FIELDS
//-----------------------------------------------------------------------------------------------------------------------------------------------
`define PIX_SEQ_DATA_SEQ_WIDTH              clog2(`BRAM_DEPTH)
`define PIX_SEQ_DATA_SEQ_LOW                0
`define PIX_SEQ_DATA_SEQ_HIGH               (`PIX_SEQ_DATA_SEQ_LOW + `PIX_SEQ_DATA_SEQ_WIDTH - 1)
`define PIX_SEQ_DATA_SEQ_FIELD              (`PIX_SEQ_DATA_SEQ_HIGH):(`PIX_SEQ_DATA_SEQ_LOW)

`define PIX_SEQ_DATA_PARITY_WIDTH           1
`define PIX_SEQ_DATA_PARITY_LOW             (`PIX_SEQ_DATA_SEQ_HIGH + 1)
`define PIX_SEQ_DATA_PARITY_HIGH            (`PIX_SEQ_DATA_PARITY_LOW + `PIX_SEQ_DATA_PARITY_WIDTH - 1)
`define PIX_SEQ_DATA_PARITY_FIELD           (`PIX_SEQ_DATA_PARITY_HIGH):(`PIX_SEQ_DATA_PARITY_LOW)

`define PIX_SEQ_DATA_MACC_RST_WIDTH         1
`define PIX_SEQ_DATA_MACC_RST_LOW           (`PIX_SEQ_DATA_PARITY_HIGH + 1)
`define PIX_SEQ_DATA_MACC_RST_HIGH          (`PIX_SEQ_DATA_MACC_RST_LOW + `PIX_SEQ_DATA_MACC_RST_WIDTH - 1)
`define PIX_SEQ_DATA_MACC_RST_FIELD         (`PIX_SEQ_DATA_MACC_RST_HIGH):(`PIX_SEQ_DATA_MACC_RST_LOW)

`define PIX_SEQ_DATA_ROW_MATRIC_WIDTH       1
`define PIX_SEQ_DATA_ROW_MATRIC_LOW         (`PIX_SEQ_DATA_MACC_RST_HIGH + 1)
`define PIX_SEQ_DATA_ROW_MATRIC_HIGH        (`PIX_SEQ_DATA_ROW_MATRIC_LOW + `PIX_SEQ_DATA_ROW_MATRIC_WIDTH - 1)
`define PIX_SEQ_DATA_ROW_MATRIC_FIELD       (`PIX_SEQ_DATA_ROW_MATRIC_HIGH):(`PIX_SEQ_DATA_ROW_MATRIC_LOW)

`define PIX_SEQ_DATA_WIDTH                  (`PIX_SEQ_DATA_SEQ_WIDTH         + \
                                             `PIX_SEQ_DATA_PARITY_WIDTH      + \
                                             `PIX_SEQ_DATA_MACC_RST_WIDTH    + \
                                             `PIX_SEQ_DATA_ROW_MATRIC_WIDTH)
                                         
`define PIX_SEQ_BRAM_DATA_WIDTH             16                                   

`define PIX_SEQ_DATA_SEQ_WIDTH0             clog2(`BRAM_DEPTH) - 2
`define PIX_SEQ_DATA_SEQ_LOW0               1
`define PIX_SEQ_DATA_SEQ_HIGH0              (`PIX_SEQ_DATA_SEQ_LOW0 + `PIX_SEQ_DATA_SEQ_WIDTH0 - 1)
`define PIX_SEQ_DATA_SEQ_FIELD0             (`PIX_SEQ_DATA_SEQ_HIGH0):(`PIX_SEQ_DATA_SEQ_LOW0)

`define PIX_SEQ_DATA_SEQ_WIDTH1             1
`define PIX_SEQ_DATA_SEQ_LOW1               clog2(`BRAM_DEPTH) - 1
`define PIX_SEQ_DATA_SEQ_HIGH1              (`PIX_SEQ_DATA_SEQ_LOW1 + `PIX_SEQ_DATA_SEQ_WIDTH1 - 1)
`define PIX_SEQ_DATA_SEQ_FIELD1             (`PIX_SEQ_DATA_SEQ_HIGH1):(`PIX_SEQ_DATA_SEQ_LOW1)

`define PIX_SEQ_DATA_SEQ_WIDTH2             clog2(`BRAM_DEPTH) -1
`define PIX_SEQ_DATA_SEQ_LOW2               0
`define PIX_SEQ_DATA_SEQ_HIGH2              (`PIX_SEQ_DATA_SEQ_LOW2 + `PIX_SEQ_DATA_SEQ_WIDTH2 - 1)
`define PIX_SEQ_DATA_SEQ_FIELD2             (`PIX_SEQ_DATA_SEQ_HIGH2):(`PIX_SEQ_DATA_SEQ_LOW2)

//-----------------------------------------------------------------------------------------------------------------------------------------------
// TILE ROUTER FIELDS
//-----------------------------------------------------------------------------------------------------------------------------------------------
`define NUM_NETWORK_IF                  1
`define PAYLOAD_WIDTH                   128


`endif