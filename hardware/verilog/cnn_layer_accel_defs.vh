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
//	MSC
//-----------------------------------------------------------------------------------------------------------------------------------------------
`define NUM_AWE                         1
`define PIXEL_WIDTH                     18
`define WEIGHT_WIDTH                    18
`define BRAM_DEPTH                      1024
`define CONFIG_3x3                      1'b0
`define CONFIG_5x5                      1'b1
`define NUM_QUADS                       1     
`define NUM_AWE                         4
`define NUM_CE_PER_AWE                  2


//-----------------------------------------------------------------------------------------------------------------------------------------------
// SEQ DATA FIELDS
//-----------------------------------------------------------------------------------------------------------------------------------------------
`define SEQ_DATA_SEQ_WIDTH              clog2(`BRAM_DEPTH)
`define SEQ_DATA_SEQ_LOW                0
`define SEQ_DATA_SEQ_HIGH               (`SEQ_DATA_SEQ_LOW + `SEQ_DATA_SEQ_WIDTH - 1)
`define SEQ_DATA_SEQ_FIELD              (`SEQ_DATA_SEQ_HIGH):(`SEQ_DATA_SEQ_LOW)

`define SEQ_DATA_PARITY_WIDTH           1
`define SEQ_DATA_PARITY_LOW             (`SEQ_DATA_SEQ_HIGH + 1)
`define SEQ_DATA_PARITY_HIGH            (`SEQ_DATA_PARITY_LOW + `SEQ_DATA_PARITY_WIDTH - 1)
`define SEQ_DATA_PARITY_FIELD           (`SEQ_DATA_PARITY_HIGH):(`SEQ_DATA_PARITY_LOW)

`define SEQ_DATA_MACC_RST_WIDTH         1
`define SEQ_DATA_MACC_RST_LOW           (`SEQ_DATA_PARITY_HIGH + 1)
`define SEQ_DATA_MACC_RST_HIGH          (`SEQ_DATA_MACC_RST_LOW + `SEQ_DATA_MACC_RST_WIDTH - 1)
`define SEQ_DATA_MACC_RST_FIELD         (`SEQ_DATA_MACC_RST_HIGH):(`SEQ_DATA_MACC_RST_LOW)

`define SEQ_DATA_ROW_MATRIC_WIDTH       1
`define SEQ_DATA_ROW_MATRIC_LOW         (`SEQ_DATA_MACC_RST_HIGH + 1)
`define SEQ_DATA_ROW_MATRIC_HIGH        (`SEQ_DATA_ROW_MATRIC_LOW + `SEQ_DATA_ROW_MATRIC_WIDTH - 1)
`define SEQ_DATA_ROW_MATRIC_FIELD       (`SEQ_DATA_ROW_MATRIC_HIGH):(`SEQ_DATA_ROW_MATRIC_LOW)

`define SEQ_DATA_WIDTH                  (`SEQ_DATA_SEQ_WIDTH         + \
                                         `SEQ_DATA_PARITY_WIDTH      + \
                                         `SEQ_DATA_MACC_RST_WIDTH    + \
                                         `SEQ_DATA_ROW_MATRIC_WIDTH)

`define SEQ_DATA_SEQ_WIDTH0             clog2(`BRAM_DEPTH) - 2
`define SEQ_DATA_SEQ_LOW0               1
`define SEQ_DATA_SEQ_HIGH0              (`SEQ_DATA_SEQ_LOW0 + `SEQ_DATA_SEQ_WIDTH0 - 1)
`define SEQ_DATA_SEQ_FIELD0             (`SEQ_DATA_SEQ_HIGH0):(`SEQ_DATA_SEQ_LOW0)

`define SEQ_DATA_SEQ_WIDTH1             clog2(`BRAM_DEPTH) - 1
`define SEQ_DATA_SEQ_LOW1               0
`define SEQ_DATA_SEQ_HIGH1              (`SEQ_DATA_SEQ_LOW1 + `SEQ_DATA_SEQ_WIDTH1 - 1)
`define SEQ_DATA_SEQ_FIELD1             (`SEQ_DATA_SEQ_HIGH1):(`SEQ_DATA_SEQ_LOW1)


//-----------------------------------------------------------------------------------------------------------------------------------------------
// TILE ROUTER FIELDS
//-----------------------------------------------------------------------------------------------------------------------------------------------
`define NUM_NETWORK_IF                  1
`define PACKET_WIDTH                    128


`endif