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
`ifndef __CNN_LAYER_ACCEL_FAS__
`define __CNN_LAYER_ACCEL_FAS__


//---------------------------------------------------------------------------------------------------------------------------------------------------
// Includes
//---------------------------------------------------------------------------------------------------------------------------------------------------
`include "utilities.svh"


//---------------------------------------------------------------------------------------------------------------------------------------------------
//	SYS INIT / TARG  READ / WRITE DEFS
//---------------------------------------------------------------------------------------------------------------------------------------------------
`define INIT_RD_LEN_WIDTH                   32
`define INIT_WR_LEN_WIDTH                   32
`define INIT_RD_ADDR_WIDTH                  32
`define INIT_WR_ADDR_WIDTH                  32
`define INIT_RD_DATA_WIDTH                  1024
`define INIT_WR_DATA_WIDTH                  1024
`define SYS_INTC_DT_WIDTH                   1024
`define TARG_WR_DATA_WTH                    1024
`define TARG_RD_DATA_WTH                    1024
`define CLOCK_FACTOR					    4


//---------------------------------------------------------------------------------------------------------------------------------------------------
// FAS DEFS
//---------------------------------------------------------------------------------------------------------------------------------------------------
`define CONVMAP_FIFO_WR_WTH                	1024 // TODO: Remove hard coding
`define CONVMAP_FIFO_RD_WTH                	1024 // TODO: Remove hard coding
`define CONVMAP_FIFO_RD_DTH					512	 // TODO: Remove hard coding

`define PARTMAP_FIFO_WR_WTH                 1024 // TODO: Remove hard coding
`define PARTMAP_FIFO_RD_WTH                 1024 // TODO: Remove hard coding

`define PREVMAP_FIFO_WR_WTH                 1024 // TODO: Remove hard coding
`define PREVMAP_FIFO_RD_WTH                 1024 // TODO: Remove hard coding

`define RESDMAP_FIFO_WR_WTH                 1024 // TODO: Remove hard coding
`define RESDMAP_FIFO_RD_WTH                 1024 // TODO: Remove hard coding

`define OUTBUF_FIFO_WR_WTH                  1024 // TODO: Remove hard coding
`define OUTBUF_FIFO_RD_WTH                  1024 // TODO: Remove hard coding

`define CONV1X1_DWC_FIFO_WR_WTH             128 // TODO: Remove hard coding
`define CONV1X1_DWC_FIFO_RD_WTH             1024 // TODO: Remove hard coding

`define RES_DWC_FIFO_WR_WTH                 1024 // TODO: Remove hard coding
`define RES_DWC_FIFO_RD_WTH                 1024 // TODO: Remove hard coding

`define JB_FTH_FIFO_WR_WTH                  1024 // TODO: Remove hard coding
`define JB_FTH_FIFO_RD_WTH                  1024 // TODO: Remove hard coding

`define KRNL_1X1_BIAS_RD_WTH				128	 // TODO: Remove hard coding


//---------------------------------------------------------------------------------------------------------------------------------------------------
// FAS GENERAL DEFS
//---------------------------------------------------------------------------------------------------------------------------------------------------
`define PIXEL_WIDTH							16
`define FAS_DSP_LATENCY                     5    
`define FAS_BRAM_LATENCY                    3
`define FAS_FIFO_LATENCY                    3
`define KRNL_1X1_BRAM_WR_DEPTH				256
`define KRNL_1X1_BRAM_RD_DEPTH              256
`define KRNL_1X1_BIAS_BRAM_WR_DEPTH         256
`define KRNL_1X1_BIAS_BRAM_RD_DEPTH         256
`define MAX_AWP_PER_FAS						1
`define MAX_FAS_RD_ID						6
`define KRNL_1X1_SIMD                       1
`define KRNL_1X1_DEPTH_SIMD                 64
`define KRNL_1X1_DPH_SIMD_SHMAT             (clog2(`KRNL_1X1_DEPTH_SIMD))
`define VECTOR_ADD_SIMD                     `KRNL_1X1_DEPTH_SIMD
`define VECTOR_MULT_SIMD                    `KRNL_1X1_DEPTH_SIMD
`define KRNL_1X1_SIMD_SHMAT                 (clog2(`KRNL_1X1_SIMD))
`define VEC_MULT_LATENCY                    `FAS_DSP_LATENCY
`define VEC_ADD_LATENCY                     1
`define ADDER_TREE_LATENCY                  clog2(`KRNL_1X1_DEPTH_SIMD)
`define ADD_BIAS_LATENCY                    1
`define MAX_1X1_KRNL_DEPTH                  1024                        
`define MAX_1X1_KRNL_IT						4


//---------------------------------------------------------------------------------------------------------------------------------------------------
// FAS CFG DEFS
//---------------------------------------------------------------------------------------------------------------------------------------------------
`define KRNL1X1_DEPTH_WIDTH					16
`define KRNL1X1_DEPTH_LOW					0
`define KRNL1X1_DEPTH_HIGH					(`KRNL1X1_DEPTH_LOW + (`KRNL1X1_DEPTH_WIDTH - 1))
`define KRNL1X1_DEPTH_FIELD  				(`KRNL1X1_DEPTH_HIGH):(`KRNL1X1_DEPTH_LOW)

`define KRNL1X1_ADDR_WIDTH					16
`define KRNL1X1_ADDR_LOW					(`KRNL1X1_DEPTH_HIGH + 1)
`define KRNL1X1_ADDR_HIGH					(`KRNL1X1_ADDR_LOW + (`KRNL1X1_ADDR_WIDTH - 1))
`define KRNL1X1_ADDR_FIELD					(`KRNL1X1_ADDR_HIGH):(`KRNL1X1_ADDR_LOW)

`define KRNL1X1_BIAS_ADDR_WIDTH				16
`define KRNL1X1_BIAS_ADDR_LOW				(`KRNL1X1_ADDR_HIGH + 1)
`define KRNL1X1_BIAS_ADDR_HIGH				(`KRNL1X1_BIAS_ADDR_LOW + (`KRNL1X1_BIAS_ADDR_WIDTH - 1))
`define KRNL1X1_BIAS_ADDR_FIELD				(`KRNL1X1_BIAS_ADDR_HIGH):(`KRNL1X1_BIAS_ADDR_LOW)

`define KRNL1X1_FETCHTOTAL_WIDTH			16
`define KRNL1X1_FETCHTOTAL_LOW	            (`KRNL1X1_BIAS_ADDR_HIGH + 1)
`define KRNL1X1_FETCHTOTAL_HIGH				(`KRNL1X1_FETCHTOTAL_LOW + (`KRNL1X1_FETCHTOTAL_WIDTH - 1))
`define KRNL1X1_FETCHTOTAL_FIELD			(`KRNL1X1_FETCHTOTAL_HIGH):(`KRNL1X1_FETCHTOTAL_LOW)

`define KRNL1X1_BIAS_FETCHTOTAL_WIDTH		16
`define KRNL1X1_BIAS_FETCHTOTAL_LOW	 		(`KRNL1X1_FETCHTOTAL_HIGH + 1)
`define KRNL1X1_BIAS_FETCHTOTAL_HIGH		(`KRNL1X1_BIAS_FETCHTOTAL_LOW + (`KRNL1X1_BIAS_FETCHTOTAL_WIDTH - 1))
`define KRNL1X1_BIAS_FETCHTOTAL_FIELD		(`KRNL1X1_BIAS_FETCHTOTAL_HIGH):(`KRNL1X1_BIAS_FETCHTOTAL_LOW)

`define PIXEL_SEQ_ADDR_WIDTH				16
`define PIXEL_SEQ_ADDR_LOW					(`KRNL1X1_BIAS_FETCHTOTAL_HIGH + 1)
`define PIXEL_SEQ_ADDR_HIGH					(`PIXEL_SEQ_ADDR_LOW + (`PIXEL_SEQ_ADDR_WIDTH - 1))
`define PIXEL_SEQ_ADDR_FIELD				(`PIXEL_SEQ_ADDR_HIGH):(`PIXEL_SEQ_ADDR_LOW)

`define PARTMAP_ADDR_WIDTH					16
`define PARTMAP_ADDR_LOW					(`PIXEL_SEQ_ADDR_HIGH + 1)		
`define PARTMAP_ADDR_HIGH					(`PARTMAP_ADDR_LOW + (`PARTMAP_ADDR_WIDTH - 1))
`define PARTMAP_ADDR_FIELD					(`PARTMAP_ADDR_HIGH):(`PARTMAP_ADDR_LOW)

`define RESDMAP_ADDR_WIDTH					16
`define RESDMAP_ADDR_LOW	                (`PARTMAP_ADDR_HIGH + 1)
`define RESDMAP_ADDR_HIGH					(`RESDMAP_ADDR_LOW + (`RESDMAP_ADDR_WIDTH - 1))
`define RESDMAP_ADDR_FIELD					(`RESDMAP_ADDR_HIGH):(`RESDMAP_ADDR_LOW)

`define OUTMAP_ADDR_WIDTH					16
`define OUTMAP_ADDR_LOW	                    (`RESDMAP_ADDR_HIGH + 1)
`define OUTMAP_ADDR_HIGH					(`OUTMAP_ADDR_LOW + (`OUTMAP_ADDR_WIDTH - 1))
`define OUTMAP_ADDR_FIELD					(`OUTMAP_ADDR_HIGH):(`OUTMAP_ADDR_LOW)

`define INMAP_ADDR_WIDTH					16
`define INMAP_ADDR_LOW	                    (`OUTMAP_ADDR_HIGH + 1)
`define INMAP_ADDR_HIGH						(`INMAP_ADDR_LOW + (`INMAP_ADDR_WIDTH - 1))
`define INMAP_ADDR_FIELD					(`INMAP_ADDR_HIGH):(`INMAP_ADDR_LOW)

`define PREVMAP_ADDR_WIDTH					16
`define PREVMAP_ADDR_LOW	                (`INMAP_ADDR_HIGH + 1)
`define PREVMAP_ADDR_HIGH					(`PREVMAP_ADDR_LOW + (`PREVMAP_ADDR_WIDTH - 1))
`define PREVMAP_ADDR_FIELD					(`PREVMAP_ADDR_HIGH):(`PREVMAP_ADDR_LOW)

`define INMAP_FETCHFACTOR_WIDTH				16
`define INMAP_FETCHFACTOR_LOW	            (`PREVMAP_ADDR_HIGH + 1)
`define INMAP_FETCHFACTOR_HIGH				(`INMAP_FETCHFACTOR_LOW + (`INMAP_FETCHFACTOR_WIDTH - 1))
`define INMAP_FETCHFACTOR_FIELD				(`INMAP_FETCHFACTOR_HIGH):(`INMAP_FETCHFACTOR_LOW)

`define INMAP_FETCHTOTAL_WIDTH				16
`define INMAP_FETCHTOTAL_LOW	            (`INMAP_FETCHFACTOR_HIGH + 1)
`define INMAP_FETCHTOTAL_HIGH				(`INMAP_FETCHTOTAL_LOW + (`INMAP_FETCHTOTAL_WIDTH - 1))
`define INMAP_FETCHTOTAL_FIELD				(`INMAP_FETCHTOTAL_HIGH):(`INMAP_FETCHTOTAL_LOW)

`define KRNL3X3_ADDR_WIDTH					16
`define KRNL3X3_ADDR_LOW	                (`INMAP_FETCHTOTAL_HIGH + 1)
`define KRNL3X3_ADDR_HIGH					(`KRNL3X3_ADDR_LOW + (`KRNL3X3_ADDR_WIDTH - 1))
`define KRNL3X3_ADDR_FIELD					(`KRNL3X3_ADDR_HIGH):(`KRNL3X3_ADDR_LOW)

`define KRNL3X3_BIAS_ADDR_WIDTH				16
`define KRNL3X3_BIAS_ADDR_LOW	            (`KRNL3X3_ADDR_HIGH + 1)
`define KRNL3X3_BIAS_ADDR_HIGH				(`KRNL3X3_BIAS_ADDR_LOW + (`KRNL3X3_BIAS_ADDR_WIDTH - 1))
`define KRNL3X3_BIAS_ADDR_FIELD				(`KRNL3X3_BIAS_ADDR_HIGH):(`KRNL3X3_BIAS_ADDR_LOW)

`define KRNL3X3_FETCHTOTAL_WIDTH			16
`define KRNL3X3_FETCHTOTAL_LOW	            (`KRNL3X3_BIAS_ADDR_HIGH + 1)
`define KRNL3X3_FETCHTOTAL_HIGH				(`KRNL3X3_FETCHTOTAL_LOW + (`KRNL3X3_FETCHTOTAL_WIDTH - 1))
`define KRNL3X3_FETCHTOTAL_FIELD			(`KRNL3X3_FETCHTOTAL_HIGH):(`KRNL3X3_FETCHTOTAL_LOW)

`define KRNL3X3_BIAS_FETCHTOTAL_WIDTH		16
`define KRNL3X3_BIAS_FETCHTOTAL_LOW	        (`KRNL3X3_FETCHTOTAL_HIGH + 1)
`define KRNL3X3_BIAS_FETCHTOTAL_HIGH		(`KRNL3X3_BIAS_FETCHTOTAL_LOW + (`KRNL3X3_BIAS_FETCHTOTAL_WIDTH - 1))
`define KRNL3X3_BIAS_FETCHTOTAL_FIELD		(`KRNL3X3_BIAS_FETCHTOTAL_HIGH):(`KRNL3X3_BIAS_FETCHTOTAL_LOW)

`define PARTMAP_FETCHTOTAL_WIDTH			16
`define PARTMAP_FETCHTOTAL_LOW              (`KRNL3X3_BIAS_FETCHTOTAL_HIGH + 1)
`define PARTMAP_FETCHTOTAL_HIGH				(`PARTMAP_FETCHTOTAL_LOW + (`PARTMAP_FETCHTOTAL_WIDTH - 1))
`define PARTMAP_FETCHTOTAL_FIELD			(`PARTMAP_FETCHTOTAL_HIGH):(`PARTMAP_FETCHTOTAL_LOW)

`define RESDMAP_FETCHTOTAL_WIDTH			16
`define RESDMAP_FETCHTOTAL_LOW	            (`PARTMAP_FETCHTOTAL_HIGH + 1)
`define RESDMAP_FETCHTOTAL_HIGH				(`RESDMAP_FETCHTOTAL_LOW + (`RESDMAP_FETCHTOTAL_WIDTH - 1))
`define RESDMAP_FETCHTOTAL_FIELD			(`RESDMAP_FETCHTOTAL_HIGH):(`RESDMAP_FETCHTOTAL_LOW)
	
`define OUTMAP_STORETOTAL_WIDTH				16
`define OUTMAP_STORETOTAL_LOW				(`RESDMAP_FETCHTOTAL_HIGH + 1)
`define OUTMAP_STORETOTAL_HIGH				(`OUTMAP_STORETOTAL_LOW + (`OUTMAP_STORETOTAL_WIDTH - 1))
`define OUTMAP_STORETOTAL_FIELD				(`OUTMAP_STORETOTAL_HIGH):(`OUTMAP_STORETOTAL_LOW)

`define OUTMAP_STOREFACTOR_WIDTH			16
`define OUTMAP_STOREFACTOR_LOW	            (`OUTMAP_STORETOTAL_HIGH + 1)
`define OUTMAP_STOREFACTOR_HIGH				(`OUTMAP_STOREFACTOR_LOW + (`OUTMAP_STOREFACTOR_WIDTH - 1))
`define OUTMAP_STOREFACTOR_FIELD			(`OUTMAP_STOREFACTOR_HIGH):(`OUTMAP_STOREFACTOR_LOW)

`define PREVMAP_FETCHTOTAL_WIDTH			16
`define PREVMAP_FETCHTOTAL_LOW	            (`OUTMAP_STOREFACTOR_HIGH + 1)
`define PREVMAP_FETCHTOTAL_HIGH				(`PREVMAP_FETCHTOTAL_LOW + (`PREVMAP_FETCHTOTAL_WIDTH - 1))
`define PREVMAP_FETCHTOTAL_FIELD			(`PREVMAP_FETCHTOTAL_HIGH):(`PREVMAP_FETCHTOTAL_LOW)

`define NUM_1X1_KERNELS_WIDTH				16
`define NUM_1X1_KERNELS_LOW	                (`PREVMAP_FETCHTOTAL_HIGH + 1)
`define NUM_1X1_KERNELS_HIGH				(`NUM_1X1_KERNELS_LOW + (`NUM_1X1_KERNELS_WIDTH - 1))
`define NUM_1X1_KERNELS_FIELD				(`NUM_1X1_KERNELS_HIGH):(`NUM_1X1_KERNELS_LOW)

`define CM_HIGH_WATERMARK_WIDTH				16
`define CM_HIGH_WATERMARK_LOW	            (`NUM_1X1_KERNELS_HIGH + 1)
`define CM_HIGH_WATERMARK_HIGH				(`CM_HIGH_WATERMARK_LOW + (`CM_HIGH_WATERMARK_WIDTH - 1))
`define CM_HIGH_WATERMARK_FIELD				(`CM_HIGH_WATERMARK_HIGH):(`CM_HIGH_WATERMARK_LOW)

`define RM_LOW_WATERMARK_WIDTH				16
`define RM_LOW_WATERMARK_LOW	            (`CM_HIGH_WATERMARK_HIGH + 1)
`define RM_LOW_WATERMARK_HIGH				(`RM_LOW_WATERMARK_LOW + (`RM_LOW_WATERMARK_WIDTH - 1))
`define RM_LOW_WATERMARK_FIELD				(`RM_LOW_WATERMARK_HIGH):(`RM_LOW_WATERMARK_LOW)

`define PM_LOW_WATERMARK_WIDTH				16
`define PM_LOW_WATERMARK_LOW	            (`RM_LOW_WATERMARK_HIGH + 1)
`define PM_LOW_WATERMARK_HIGH				(`PM_LOW_WATERMARK_LOW + (`PM_LOW_WATERMARK_WIDTH - 1))
`define PM_LOW_WATERMARK_FIELD				(`PM_LOW_WATERMARK_HIGH):(`PM_LOW_WATERMARK_LOW)

`define PV_LOW_WATERMARK_WIDTH				16
`define PV_LOW_WATERMARK_LOW	            (`PM_LOW_WATERMARK_HIGH + 1)
`define PV_LOW_WATERMARK_HIGH				(`PV_LOW_WATERMARK_LOW + (`PV_LOW_WATERMARK_WIDTH - 1))
`define PV_LOW_WATERMARK_FIELD				(`PV_LOW_WATERMARK_HIGH):(`PV_LOW_WATERMARK_LOW)

`define RM_FETCH_AMOUNT_WIDTH				16
`define RM_FETCH_AMOUNT_LOW	                (`PV_LOW_WATERMARK_HIGH + 1)
`define RM_FETCH_AMOUNT_HIGH				(`RM_FETCH_AMOUNT_LOW + (`RM_FETCH_AMOUNT_WIDTH - 1))
`define RM_FETCH_AMOUNT_FIELD				(`RM_FETCH_AMOUNT_HIGH):(`RM_FETCH_AMOUNT_LOW)

`define PM_FETCH_AMOUNT_WIDTH				16
`define PM_FETCH_AMOUNT_LOW	                (`RM_FETCH_AMOUNT_HIGH + 1)
`define PM_FETCH_AMOUNT_HIGH				(`PM_FETCH_AMOUNT_LOW + (`PM_FETCH_AMOUNT_WIDTH - 1))
`define PM_FETCH_AMOUNT_FIELD				(`PM_FETCH_AMOUNT_HIGH):(`PM_FETCH_AMOUNT_LOW)

`define PV_FETCH_AMOUNT_WIDTH				16
`define PV_FETCH_AMOUNT_LOW	                (`PM_FETCH_AMOUNT_HIGH + 1)
`define PV_FETCH_AMOUNT_HIGH				(`PV_FETCH_AMOUNT_LOW + (`PV_FETCH_AMOUNT_WIDTH - 1))
`define PV_FETCH_AMOUNT_FIELD				(`PV_FETCH_AMOUNT_HIGH):(`PV_FETCH_AMOUNT_LOW)

`define KRNL1X1_PDING_WIDTH					16
`define KRNL1X1_PDING_LOW	                (`PV_FETCH_AMOUNT_HIGH + 1)
`define KRNL1X1_PDING_HIGH					(`KRNL1X1_PDING_LOW + (`KRNL1X1_PDING_WIDTH - 1))
`define KRNL1X1_PDING_FIELD					(`KRNL1X1_PDING_HIGH):(`KRNL1X1_PDING_LOW)

`define KRNL1X1_PAD_BGN_WIDTH				16
`define KRNL1X1_PAD_BGN_LOW	                (`KRNL1X1_PDING_HIGH + 1)
`define KRNL1X1_PAD_BGN_HIGH				(`KRNL1X1_PAD_BGN_LOW + (`KRNL1X1_PAD_BGN_WIDTH - 1))
`define KRNL1X1_PAD_BGN_FIELD				(`KRNL1X1_PAD_BGN_HIGH):(`KRNL1X1_PAD_BGN_LOW)

`define KRNL1X1_PAD_END_WIDTH				16
`define KRNL1X1_PAD_END_LOW					(`KRNL1X1_PAD_BGN_HIGH + 1)
`define KRNL1X1_PAD_END_HIGH				(`KRNL1X1_PAD_END_LOW + (`KRNL1X1_PAD_END_WIDTH - 1))
`define KRNL1X1_PAD_END_FIELD				(`KRNL1X1_PAD_END_HIGH):(`KRNL1X1_PAD_END_LOW)

`define OPCODE_WIDTH						16
`define OPCODE_LOW	                        (`KRNL1X1_PAD_END_HIGH + 1)
`define OPCODE_HIGH							(`OPCODE_LOW + (`OPCODE_WIDTH - 1))
`define OPCODE_FIELD						(`OPCODE_HIGH):(`OPCODE_LOW)

`define INMAP_FETCH_AMOUNT_WIDTH			16
`define INMAP_FETCH_AMOUNT_LOW	            (`OPCODE_HIGH + 1)
`define INMAP_FETCH_AMOUNT_HIGH				(`INMAP_FETCH_AMOUNT_LOW + (`INMAP_FETCH_AMOUNT_WIDTH - 1))
`define INMAP_FETCH_AMOUNT_FIELD			(`INMAP_FETCH_AMOUNT_HIGH):(`INMAP_FETCH_AMOUNT_LOW)

`define CFG_DATA_WIDTH						(`KRNL1X1_DEPTH_WIDTH			    	\
											+ `KRNL1X1_ADDR_WIDTH				    \
											+ `KRNL1X1_BIAS_ADDR_WIDTH		    	\
											+ `KRNL1X1_FETCHTOTAL_WIDTH		    	\
											+ `KRNL1X1_BIAS_FETCHTOTAL_WIDTH	    \
											+ `PIXEL_SEQ_ADDR_WIDTH			    	\
											+ `PARTMAP_ADDR_WIDTH				    \
											+ `RESDMAP_ADDR_WIDTH				    \
											+ `OUTMAP_ADDR_WIDTH				    \
											+ `INMAP_ADDR_WIDTH				   		\
											+ `PREVMAP_ADDR_WIDTH				    \
											+ `INMAP_FETCHFACTOR_WIDTH		    	\
											+ `INMAP_FETCHTOTAL_WIDTH			    \
											+ `KRNL3X3_ADDR_WIDTH				    \
											+ `KRNL3X3_BIAS_ADDR_WIDTH		    	\
											+ `KRNL3X3_FETCHTOTAL_WIDTH				\
											+ `KRNL3X3_BIAS_FETCHTOTAL_WIDTH		\
											+ `PARTMAP_FETCHTOTAL_WIDTH				\
											+ `RESDMAP_FETCHTOTAL_WIDTH		        \
											+ `OUTMAP_STORETOTAL_WIDTH		        \
											+ `OUTMAP_STOREFACTOR_WIDTH		        \
											+ `PREVMAP_FETCHTOTAL_WIDTH		        \
											+ `NUM_1X1_KERNELS_WIDTH			    \
											+ `CM_HIGH_WATERMARK_WIDTH		        \
											+ `RM_LOW_WATERMARK_WIDTH			    \
											+ `PM_LOW_WATERMARK_WIDTH			    \
											+ `PV_LOW_WATERMARK_WIDTH			    \
											+ `RM_FETCH_AMOUNT_WIDTH			    \
											+ `PM_FETCH_AMOUNT_WIDTH			    \
											+ `PV_FETCH_AMOUNT_WIDTH			    \
											+ `KRNL1X1_PDING_WIDTH			        \
											+ `KRNL1X1_PAD_BGN_WIDTH			    \
											+ `KRNL1X1_PAD_END_WIDTH			    \
											+ `OPCODE_WIDTH)


`endif
