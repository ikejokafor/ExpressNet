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
`ifndef __CNN_LAYER_ACCEL_TRANS_FIFO__
`define __CNN_LAYER_ACCEL_TRANS_FIFO__


//-----------------------------------------------------------------------------------------------------------------------------------------------
//  Includes
//-----------------------------------------------------------------------------------------------------------------------------------------------
`include "utilities.svh"


//-----------------------------------------------------------------------------------------------------------------------------------------------
// DEFS
//-----------------------------------------------------------------------------------------------------------------------------------------------
`define TRANS_IN_META_FIFO_WR_WTH			1024 // TODO: Remove hard coding
`define TRANS_IN_PYLD_FIFO_WR_WTH			1024 // TODO: Remove hard coding
`define TRANS_IN_META_FIFO_RD_WTH			1024 // TODO: Remove hard coding
`define TRANS_IN_PYLD_FIFO_RD_WTH			1024 // TODO: Remove hard coding

`define TRANS_EG_META_FIFO_WR_WTH			1024 // TODO: Remove hard coding
`define TRANS_EG_PYLD_FIFO_WR_WTH			1024 // TODO: Remove hard coding
`define TRANS_EG_META_FIFO_RD_WTH			1024 // TODO: Remove hard coding
`define TRANS_EG_PYLD_FIFO_RD_WTH			1024 // TODO: Remove hard coding

`define TRANS_IN_FIFO_PYLD_WIDTH            1024
`define TRANS_IN_FIFO_PYLD_LOW              0
`define TRANS_IN_FIFO_PYLD_HIGH             (`TRANS_IN_FIFO_PYLD_LOW + (`TRANS_IN_FIFO_PYLD_WIDTH - 1))
`define TRANS_IN_FIFO_PYLD_FIELD            (`TRANS_IN_FIFO_PYLD_HIGH):(`TRANS_IN_FIFO_PYLD_LOW)

`define TRANS_IN_FIFO_META_WIDTH            1024
`define TRANS_IN_FIFO_META_LOW              (`TRANS_IN_FIFO_PYLD_HIGH + 1)
`define TRANS_IN_FIFO_META_HIGH             (`TRANS_IN_FIFO_META_LOW + (`TRANS_IN_FIFO_META_WIDTH - 1))
`define TRANS_IN_FIFO_META_FIELD            (`TRANS_IN_FIFO_META_HIGH):(`TRANS_IN_FIFO_META_LOW)

`define TRANS_EG_FIFO_PYLD_WIDTH            1024
`define TRANS_EG_FIFO_PYLD_LOW              0
`define TRANS_EG_FIFO_PYLD_HIGH             (`TRANS_EG_FIFO_PYLD_LOW + (`TRANS_EG_FIFO_PYLD_WIDTH - 1))
`define TRANS_EG_FIFO_PYLD_FIELD            (`TRANS_EG_FIFO_PYLD_HIGH):(`TRANS_EG_FIFO_PYLD_LOW)

`define TRANS_EG_FIFO_META_WIDTH            1024
`define TRANS_EG_FIFO_META_LOW              (`TRANS_EG_FIFO_PYLD_HIGH + 1)
`define TRANS_EG_FIFO_META_HIGH             (`TRANS_EG_FIFO_META_LOW + (`TRANS_EG_FIFO_META_WIDTH - 1))
`define TRANS_EG_FIFO_META_FIELD            (`TRANS_EG_FIFO_META_HIGH):(`TRANS_EG_FIFO_META_LOW)

`define TRANS_AWP_CFG                   	0
`define TRANS_AWP_PXS_CFG                   1
`define TRANS_AWP_KRN_CFG                   2
`define TRANS_AWP_KNB_CFG                   3
`define TRANS_JOB_FETCH                     4
`define TRANS_AWP_START                     5
`define TRANS_RESULT_WRITE                  6
`define TRANS_LAST_CO                       7
`define TRANS_JOB_CMPL                      8

`define TRANS_OP_WIDTH			            4
`define TRANS_OP_LOW			            0
`define TRANS_OP_HIGH				        (`TRANS_OP_LOW + (`TRANS_OP_WIDTH  - 1))
`define TRANS_OP_FIELD			            (`TRANS_OP_HIGH:`TRANS_OP_LOW)

`define JOB_FTCH_AWP_ID_WIDTH			   16
`define JOB_FTCH_AWP_ID_LOW	               0
`define JOB_FTCH_AWP_ID_HIGH			   (`JOB_FTCH_AWP_ID_LOW + (`JOB_FTCH_AWP_ID_WIDTH - 1))
`define JOB_FTCH_AWP_ID_FIELD			   (`JOB_FTCH_AWP_ID_HIGH):(`JOB_FTCH_AWP_ID_LOW)


`endif