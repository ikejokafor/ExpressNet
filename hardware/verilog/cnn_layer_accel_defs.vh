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
// [1] Includes
//-----------------------------------------------------------------------------------------------------------------------------------------------
`include "utilities.svh"


//-----------------------------------------------------------------------------------------------------------------------------------------------
//	[] SYS DEFS
//-----------------------------------------------------------------------------------------------------------------------------------------------
`define SYS_RD_LEN_WIDTH                32
`define SYS_WR_LEN_WIDTH                32
`define SYS_RD_ADDR_WIDTH               32
`define SYS_WR_ADDR_WIDTH               32
`define SYS_RD_DATA_WIDTH               1024
`define SYS_WR_DATA_WIDTH               1024
`define SYS_INTC_DT_WIDTH               1024


//-----------------------------------------------------------------------------------------------------------------------------------------------
//	[3] AWP General Defs
//-----------------------------------------------------------------------------------------------------------------------------------------------
`define NUM_AWE                         4
`define NUM_CE_PER_AWE                  2
`define NUM_QUADS                       1
`define NUM_CE                          (`NUM_AWE * `NUM_CE_PER_AWE)
`define WINDOW_3x3_NUM_CYCLES           5    // num cycles to output a 3x3 window in our arch
`define NUM_CONV_WINDOW_VALUES          10
`define PIXEL_WIDTH                     16
`define WEIGHT_WIDTH                    16
`define ROW_BUF_BRAM_DEPTH              1024
`define WHT_TBL_BRAM_DEPTH              1024
`define CONFIG_3x3                      1'b0
`define CONFIG_5x5                      1'b1
`define NUM_WHT_SEQ_VALUES              5
`define WHT_SEQ_WIDTH                   4
`define NUM_DSP_PER_CE                  2
`define NUM_WHT_SEQ_TABLE_PER_AWE       4
`define DATA_WIDTH                      16
`define MAX_STRIDE                      2
`define WINDOW_3x3_NUM_CYCLES_MINUS_1   (`WINDOW_3x3_NUM_CYCLES - 1)
`define KERNEL_3x3_COUNT_FULL           10  // would be 3x3 = 9  pixels, but we load one more dummy 0 valued pixel
`define KERNEL_3x3_COUNT_FULL_MINUS_1   (`KERNEL_3x3_COUNT_FULL - 1)
`define KERNEL_BLOCK_SIZE               16  // every 3x3 kernel window takes up 16 slots
`define NUM_CE_PER_QUAD                 (`NUM_AWE * `NUM_CE_PER_AWE)
`define MIN_NUM_INPUT_ROWS              19
`define MIN_NUM_INPUT_COLS              19
`define MAX_NUM_INPUT_ROWS              512
`define MAX_NUM_INPUT_COLS              512
`define MAX_KERNEL_DEPTH                `NUM_CE_PER_QUAD
`define MAX_BRAM_3x3_KERNELS            64  // floor(`ROW_BUF_BRAM_DEPTH / `KERNEL_BLOCK_SIZE)
`define MIN_BRAM_3x3_KERNELS            1
`define MAX_PADDING                     1
`define MAX_UPSAMPLE_FACTOR             2
`define MAX_KERNEL_SIZE                 3
`define CONV_OUT_FMT0                   1'b0
`define CONV_OUT_FMT1                   1'b1
`define PIX_SEQ_BRAM_DEPTH              (`MAX_NUM_INPUT_COLS * 8) // (`MAX_NUM_INPUT_COLS * ceil2(`WINDOW_3x3_NUM_CYCLES))
`define NUM_WHT_TABLES                  `NUM_CE_PER_QUAD
// Act Field
// `define ACTV_NUM_FRAC_BITS              14
// `define ACTV_WIDTH                      16
// `define ACTV_WIDTH_LOW                  `ACTV_NUM_FRAC_BITS
// `define ACTV_WIDTH_HIGH                 (`ACTV_WIDTH + `ACTV_WIDTH - 1)
// `define ACTV_WIDTH_FIELD                (`ACTV_WIDTH_HIGH):(`ACTV_WIDTH_LOW)


//-----------------------------------------------------------------------------------------------------------------------------------------------
// [4.0] SEQ DATA FIELDS
//-----------------------------------------------------------------------------------------------------------------------------------------------
`define PIX_SEQ_DATA_SEQ_WIDTH              clog2(`ROW_BUF_BRAM_DEPTH)
`define PIX_SEQ_DATA_SEQ_LOW                0
`define PIX_SEQ_DATA_SEQ_HIGH               (`PIX_SEQ_DATA_SEQ_LOW + `PIX_SEQ_DATA_SEQ_WIDTH - 1)
`define PIX_SEQ_DATA_SEQ_FIELD              (`PIX_SEQ_DATA_SEQ_HIGH):(`PIX_SEQ_DATA_SEQ_LOW)    // [9:0]

`define PIX_SEQ_DATA_PARITY_WIDTH           1
`define PIX_SEQ_DATA_PARITY_LOW             (`PIX_SEQ_DATA_SEQ_HIGH + 1)
`define PIX_SEQ_DATA_PARITY_HIGH            (`PIX_SEQ_DATA_PARITY_LOW + `PIX_SEQ_DATA_PARITY_WIDTH - 1)
`define PIX_SEQ_DATA_PARITY_FIELD           (`PIX_SEQ_DATA_PARITY_HIGH):(`PIX_SEQ_DATA_PARITY_LOW) // [10:10]

`define PIX_SEQ_DATA_MACC_RST_WIDTH         1
`define PIX_SEQ_DATA_MACC_RST_LOW           (`PIX_SEQ_DATA_PARITY_HIGH + 1)
`define PIX_SEQ_DATA_MACC_RST_HIGH          (`PIX_SEQ_DATA_MACC_RST_LOW + `PIX_SEQ_DATA_MACC_RST_WIDTH - 1)
`define PIX_SEQ_DATA_MACC_RST_FIELD         (`PIX_SEQ_DATA_MACC_RST_HIGH):(`PIX_SEQ_DATA_MACC_RST_LOW) // [11:11]

`define PIX_SEQ_DATA_ROW_MATRIC_WIDTH       1
`define PIX_SEQ_DATA_ROW_MATRIC_LOW         (`PIX_SEQ_DATA_MACC_RST_HIGH + 1)
`define PIX_SEQ_DATA_ROW_MATRIC_HIGH        (`PIX_SEQ_DATA_ROW_MATRIC_LOW + `PIX_SEQ_DATA_ROW_MATRIC_WIDTH - 1)
`define PIX_SEQ_DATA_ROW_MATRIC_FIELD       (`PIX_SEQ_DATA_ROW_MATRIC_HIGH):(`PIX_SEQ_DATA_ROW_MATRIC_LOW) // [12:12]

`define PIX_SEQ_DATA_ROW_RENAME_WIDTH       1
`define PIX_SEQ_DATA_ROW_RENAME_LOW         (`PIX_SEQ_DATA_ROW_MATRIC_HIGH + 1)
`define PIX_SEQ_DATA_ROW_RENAME_HIGH        (`PIX_SEQ_DATA_ROW_RENAME_LOW + `PIX_SEQ_DATA_ROW_RENAME_WIDTH - 1)
`define PIX_SEQ_DATA_ROW_RENAME_FIELD       (`PIX_SEQ_DATA_ROW_RENAME_HIGH):(`PIX_SEQ_DATA_ROW_RENAME_LOW) // [13:13]



//-----------------------------------------------------------------------------------------------------------------------------------------------
// [4.1] SEQ DATA FIELDS
//-----------------------------------------------------------------------------------------------------------------------------------------------
//`define PIX_SEQ_DATA_WIDTH                  (`PIX_SEQ_DATA_SEQ_WIDTH         + \
//                                             `PIX_SEQ_DATA_PARITY_WIDTH      + \
//                                             `PIX_SEQ_DATA_MACC_RST_WIDTH    + \  
//                                             `PIX_SEQ_DATA_ROW_MATRIC_WIDTH  + \
//											 `PIX_SEQ_DATA_ROW_RENAME_WIDTH)

`define PIX_SEQ_BRAM_DATA_WIDTH             16                                   

`define PIX_SEQ_DATA_SEQ_WIDTH0             clog2(`ROW_BUF_BRAM_DEPTH) - 2
`define PIX_SEQ_DATA_SEQ_LOW0               1
`define PIX_SEQ_DATA_SEQ_HIGH0              (`PIX_SEQ_DATA_SEQ_LOW0 + `PIX_SEQ_DATA_SEQ_WIDTH0 - 1)
`define PIX_SEQ_DATA_SEQ_FIELD0             (`PIX_SEQ_DATA_SEQ_HIGH0):(`PIX_SEQ_DATA_SEQ_LOW0)

`define PIX_SEQ_DATA_SEQ_WIDTH1             1
`define PIX_SEQ_DATA_SEQ_LOW1               clog2(`ROW_BUF_BRAM_DEPTH) - 1
`define PIX_SEQ_DATA_SEQ_HIGH1              (`PIX_SEQ_DATA_SEQ_LOW1 + `PIX_SEQ_DATA_SEQ_WIDTH1 - 1)
`define PIX_SEQ_DATA_SEQ_FIELD1             (`PIX_SEQ_DATA_SEQ_HIGH1):(`PIX_SEQ_DATA_SEQ_LOW1)  // MSB of seq value

`define PIX_SEQ_DATA_SEQ_WIDTH2             clog2(`ROW_BUF_BRAM_DEPTH) - 1
`define PIX_SEQ_DATA_SEQ_LOW2               0
`define PIX_SEQ_DATA_SEQ_HIGH2              (`PIX_SEQ_DATA_SEQ_LOW2 + `PIX_SEQ_DATA_SEQ_WIDTH2 - 1)
`define PIX_SEQ_DATA_SEQ_FIELD2             (`PIX_SEQ_DATA_SEQ_HIGH2):(`PIX_SEQ_DATA_SEQ_LOW2)  // seq value minus the MSB


//-----------------------------------------------------------------------------------------------------------------------------------------------
// [5] TILE ROUTER FIELDS
//-----------------------------------------------------------------------------------------------------------------------------------------------
`define NUM_NETWORK_IF                  1
`define PAYLOAD_WIDTH                   128


//-----------------------------------------------------------------------------------------------------------------------------------------------
// [6] JOB PARAMETERS FIELDS
//-----------------------------------------------------------------------------------------------------------------------------------------------
// TODO: some fields need not be hardcoded

`define PFB_FULL_COUNT_WIDTH                (clog2(`ROW_BUF_BRAM_DEPTH)) // 10
`define PFB_FULL_COUNT_LOW                  0
`define PFB_FULL_COUNT_HIGH                 (`PFB_FULL_COUNT_LOW + `PFB_FULL_COUNT_WIDTH - 1)
`define PFB_FULL_COUNT_FIELD                (`PFB_FULL_COUNT_HIGH):(`PFB_FULL_COUNT_LOW)  // [9:0]

`define STRIDE_WIDTH                        7
`define STRIDE_LOW                          (`PFB_FULL_COUNT_HIGH + 1)
`define STRIDE_HIGH                         (`STRIDE_LOW + `STRIDE_WIDTH - 1)
`define STRIDE_FIELD                        (`STRIDE_HIGH):(`STRIDE_LOW) // [16:10]

`define CONV_OUT_FMT_WIDTH                  1
`define CONV_OUT_FMT_LOW                    (`STRIDE_HIGH + 1)
`define CONV_OUT_FMT_HIGH                   (`CONV_OUT_FMT_LOW + `CONV_OUT_FMT_WIDTH - 1)
`define CONV_OUT_FMT_FIELD                  (`CONV_OUT_FMT_HIGH):(`CONV_OUT_FMT_LOW) // [17:17]

`define PADDING_WIDTH                       1
`define PADDING_LOW                         (`CONV_OUT_FMT_HIGH + 1)
`define PADDING_HIGH                        (`PADDING_LOW + `PADDING_WIDTH - 1)
`define PADDING_FIELD                       (`PADDING_HIGH):(`PADDING_LOW) // [18:18]

`define NUM_OUTPUT_COLS_WIDTH               (clog2(`ROW_BUF_BRAM_DEPTH)) // 10
`define NUM_OUTPUT_COLS_LOW                 (`PADDING_HIGH + 1)
`define NUM_OUTPUT_COLS_HIGH                (`NUM_OUTPUT_COLS_LOW + `NUM_OUTPUT_COLS_WIDTH - 1)
`define NUM_OUTPUT_COLS_FIELD               (`NUM_OUTPUT_COLS_HIGH):(`NUM_OUTPUT_COLS_LOW) // [28:19]

`define NUM_OUTPUT_ROWS_WIDTH               (clog2(`ROW_BUF_BRAM_DEPTH)) // 10
`define NUM_OUTPUT_ROWS_LOW                 (`NUM_OUTPUT_COLS_HIGH + 1)
`define NUM_OUTPUT_ROWS_HIGH                (`NUM_OUTPUT_ROWS_LOW + `NUM_OUTPUT_ROWS_WIDTH - 1)
`define NUM_OUTPUT_ROWS_FIELD               (`NUM_OUTPUT_ROWS_HIGH):(`NUM_OUTPUT_ROWS_LOW)  // [38:29]

`define PIX_SEQ_DATA_FULL_COUNT_WIDTH       12
`define PIX_SEQ_DATA_FULL_COUNT_LOW         (`NUM_OUTPUT_ROWS_HIGH + 1)
`define PIX_SEQ_DATA_FULL_COUNT_HIGH        (`PIX_SEQ_DATA_FULL_COUNT_LOW + `PIX_SEQ_DATA_FULL_COUNT_WIDTH - 1)
`define PIX_SEQ_DATA_FULL_COUNT_FIELD       (`PIX_SEQ_DATA_FULL_COUNT_HIGH):(`PIX_SEQ_DATA_FULL_COUNT_LOW) // [50:39]

`define UPSAMPLE_WIDTH                      1
`define UPSAMPLE_LOW                        (`PIX_SEQ_DATA_FULL_COUNT_HIGH + 1)
`define UPSAMPLE_HIGH                       (`UPSAMPLE_LOW + `UPSAMPLE_WIDTH - 1)
`define UPSAMPLE_FIELD                      (`UPSAMPLE_HIGH):(`UPSAMPLE_LOW) // [51:51]

`define NUM_EXPD_INPUT_COLS_WIDTH           (clog2(`ROW_BUF_BRAM_DEPTH)) // 10
`define NUM_EXPD_INPUT_COLS_LOW             (`UPSAMPLE_HIGH + 1)
`define NUM_EXPD_INPUT_COLS_HIGH            (`NUM_EXPD_INPUT_COLS_LOW + `NUM_EXPD_INPUT_COLS_WIDTH - 1)
`define NUM_EXPD_INPUT_COLS_FIELD           (`NUM_EXPD_INPUT_COLS_HIGH):(`NUM_EXPD_INPUT_COLS_LOW) // [61:52]

`define UNUSED_WIDTH                        2
`define UNUSED_LOW                          (`NUM_EXPD_INPUT_COLS_HIGH + 1)
`define UNUSED_HIGH                         (`UNUSED_LOW + `UNUSED_WIDTH - 1)
`define UNUSED_FIELD                        (`UNUSED_HIGH):(`UNUSED_LOW) // [63:62]

`define NUM_EXPD_INPUT_ROWS_WIDTH           (clog2(`ROW_BUF_BRAM_DEPTH)) // 10
`define NUM_EXPD_INPUT_ROWS_LOW             (`UNUSED_HIGH + 1)
`define NUM_EXPD_INPUT_ROWS_HIGH            (`NUM_EXPD_INPUT_ROWS_LOW + `NUM_EXPD_INPUT_ROWS_WIDTH - 1)
`define NUM_EXPD_INPUT_ROWS_FIELD           (`NUM_EXPD_INPUT_ROWS_HIGH):(`NUM_EXPD_INPUT_ROWS_LOW) // [73:64]

`define CRPD_INPUT_COL_START_WIDTH          (clog2(`ROW_BUF_BRAM_DEPTH)) // 10
`define CRPD_INPUT_COL_START_LOW            (`NUM_EXPD_INPUT_ROWS_HIGH + 1)
`define CRPD_INPUT_COL_START_HIGH           (`CRPD_INPUT_COL_START_LOW + `CRPD_INPUT_COL_START_WIDTH - 1)
`define CRPD_INPUT_COL_START_FIELD          (`CRPD_INPUT_COL_START_HIGH):(`CRPD_INPUT_COL_START_LOW) // [83:74]

`define CRPD_INPUT_ROW_START_WIDTH          (clog2(`ROW_BUF_BRAM_DEPTH)) // 10
`define CRPD_INPUT_ROW_START_LOW            (`CRPD_INPUT_COL_START_HIGH + 1)
`define CRPD_INPUT_ROW_START_HIGH           (`CRPD_INPUT_ROW_START_LOW + `CRPD_INPUT_ROW_START_WIDTH - 1)
`define CRPD_INPUT_ROW_START_FIELD          (`CRPD_INPUT_ROW_START_HIGH):(`CRPD_INPUT_ROW_START_LOW) // [93:84]

`define CRPD_INPUT_COL_END_WIDTH            (clog2(`ROW_BUF_BRAM_DEPTH)) // 10
`define CRPD_INPUT_COL_END_LOW              (`CRPD_INPUT_ROW_START_HIGH + 1)
`define CRPD_INPUT_COL_END_HIGH             (`CRPD_INPUT_COL_END_LOW + `CRPD_INPUT_COL_END_WIDTH - 1)
`define CRPD_INPUT_COL_END_FIELD            (`CRPD_INPUT_COL_END_HIGH):(`CRPD_INPUT_COL_END_LOW) // [103:94]

`define CRPD_INPUT_ROW_END_WIDTH            (clog2(`ROW_BUF_BRAM_DEPTH)) // 10
`define CRPD_INPUT_ROW_END_LOW              (`CRPD_INPUT_COL_END_HIGH + 1)
`define CRPD_INPUT_ROW_END_HIGH             (`CRPD_INPUT_ROW_END_LOW + `CRPD_INPUT_ROW_END_WIDTH - 1)
`define CRPD_INPUT_ROW_END_FIELD            (`CRPD_INPUT_ROW_END_HIGH):(`CRPD_INPUT_ROW_END_LOW) // [113:104]

`define NUM_KERNELS_WIDTH                   (clog2(`MAX_BRAM_3x3_KERNELS)) // 10
`define NUM_KERNELS_LOW                     (`CRPD_INPUT_ROW_END_HIGH + 1)
`define NUM_KERNELS_HIGH                    (`NUM_KERNELS_LOW + `NUM_KERNELS_WIDTH - 1)
`define NUM_KERNELS_FIELD                   (`NUM_KERNELS_HIGH):(`NUM_KERNELS_LOW) // [119:114]

`define MASTER_QUAD_WIDTH                   1
`define MASTER_QUAD_LOW                     (`NUM_KERNELS_HIGH + 1)
`define MASTER_QUAD_HIGH                    (`MASTER_QUAD_LOW + `MASTER_QUAD_WIDTH - 1)
`define MASTER_QUAD_FIELD                   (`MASTER_QUAD_HIGH):(`MASTER_QUAD_LOW) // [120:120]

`define CASCADE_WIDTH                       1
`define CASCADE_LOW                         (`MASTER_QUAD_HIGH + 1)
`define CASCADE_HIGH                        (`CASCADE_LOW + `CASCADE_WIDTH + 1)
`define CASCADE_FIELD                       (`CASCADE_HIGH):(`CASCADE_LOW) // [121:121]

`define ACTV_WIDTH                          1
`define ACTV_LOW                            (`CASCADE_HIGH + 1)
`define ACTV_HIGH                           (`ACTV_LOW + `ACTV_WIDTH + 1)
`define ACTV_FIELD                          (`ACTV_HIGH):(`ACTV_LOW) // [122:122]


//-----------------------------------------------------------------------------------------------------------------------------------------------
// [8] FAS GENERAL DEFS
//-----------------------------------------------------------------------------------------------------------------------------------------------
`define FAS_DSP_LATENCY                     5    
`define FAS_BRAM_LATENCY                    3
`define FAS_FIFO_LATENCY                    3
`define CONVMAP_BRAM_WR_DEPTH				256
`define CONVMAP_BRAM_RD_DEPTH				256
`define KRNL_1X1_BRAM_WR_DEPTH				256
`define KRNL_1X1_BRAM_RD_DEPTH              256
`define KRNL_1X1_BIAS_BRAM_WR_DEPTH         256
`define KRNL_1X1_BIAS_BRAM_RD_DEPTH         256
`define	RESDMAP_BRAM_WR_DEPTH               256
`define	RESDMAP_BRAM_RD_DEPTH               256
`define	PARTMAP_BRAM_WR_DEPTH               256
`define	PARTMAP_BRAM_RD_DEPTH               256
`define OUTBUF_DWC_RD_WIDTH					(`KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH)
`define OUTBUF_DWC_FIFO_DEPTH				256
`define OUTBUF_WR_WIDTH						(`KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH)
`define OUTBUF_RD_WIDTH						`SYS_RD_DATA_WIDTH
`define OUTBUF_FIFO_DEPTH					256
`define OUTBUF_FIFO_DIN_FACTOR				floor(`SYS_WR_DATA_WIDTH, `PIXEL_WIDTH)
`define MAX_AWP_PER_FAS						1
`define MAX_FAS_RD_ID						5
`define FAS_JOB_FETCH_ID                    0
`define FAS_RES_MAP_FETCH_ID                1
`define FAS_PART_MAP_FETCH_ID               2
`define FAS_PREV_MAP_FETCH_ID               3
`define KRNL_1X1_SIMD                       1
`define KRNL_1X1_DEPTH_SIMD                 8
`define KRNL_1X1_DPH_SIMD_SHMAT             (clog2(`KRNL_1X1_DEPTH_SIMD))
`define KRNL_1X1_BRAM_RD_WIDTH				`KRNL_1X1_DEPTH_SIMD
`define VECTOR_ADD_SIMD                     `KRNL_1X1_DEPTH_SIMD
`define VECTOR_MULT_SIMD                    `KRNL_1X1_DEPTH_SIMD
`define KRNL_1X1_SIMD_SHMAT                 (clog2(`KRNL_1X1_SIMD))
`define VEC_MULT_LATENCY                    `FAS_DSP_LATENCY
`define VEC_ADD_LATENCY                     1
`define ADDER_TREE_LATENCY                  clog2(`KRNL_1X1_DEPTH_SIMD)
`define ADD_BIAS_LATENCY                    1


//-----------------------------------------------------------------------------------------------------------------------------------------------
// [8] FAS CFG DEFS
//-----------------------------------------------------------------------------------------------------------------------------------------------
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


//-----------------------------------------------------------------------------------------------------------------------------------------------
// [7] FAS OPCODE
//-----------------------------------------------------------------------------------------------------------------------------------------------
`define OPCODE_0                            0 
`define OPCODE_1                            1 
`define OPCODE_2                            2 
`define OPCODE_3                            3 
`define OPCODE_4                            4 
`define OPCODE_5                            5 
`define OPCODE_6                            6 
`define OPCODE_7                            7 
`define OPCODE_8                            8 
`define OPCODE_9                            9 
`define OPCODE_10                           10
`define OPCODE_11                           11
`define OPCODE_12                           12
`define OPCODE_13                           13
`define OPCODE_14                           14
`define OPCODE_15                           15
`define OPCODE_16                           16
`define OPCODE_17                           17
`define OPCODE_NULL                         -1


//-----------------------------------------------------------------------------------------------------------------------------------------------
// [9] FAS TRANS FIELDS
//-----------------------------------------------------------------------------------------------------------------------------------------------
`define TRANS_AWP_CFG                   0
`define TRANS_AWP_CFG_ACK               1
`define TRANS_JOB_FETCH                 2
`define TRANS_AWP_START                 3
`define TRANS_AWP_START_ACK             4
`define TRANS_RESULT_WRITE              5
`define TRANS_JOB_CMPL                  6


`define TRANS_OP_WIDTH			        3
`define TRANS_OP_LOW			        0
`define TRANS_OP_HIGH				    (`TRANS_OP_LOW + (`TRANS_OP_WIDTH  - 1))
`define TRANS_OP_FIELD			        (`TRANS_OP_HIGH:`TRANS_OP_LOW)

`define TRANS_PYLD_WIDTH			    floor((`SYS_INTC_DT_WIDTH - `TRANS_OP_WIDTH),  `PIXEL_WIDTH)
`define TRANS_PYLD_LOW			        (`TRANS_OP_HIGH + 1)
`define TRANS_PYLD_HIGH				    (`TRANS_PYLD_LOW + (`TRANS_PYLD_WIDTH - 1))
`define TRANS_PYLD_FIELD			    (`TRANS_PYLD_HIGH):(`TRANS_PYLD_LOW)

`define TRANS_FIFO_WIH                  (`TRANS_OP_WIDTH + `TRANS_PYLD_WIDTH)

`define JOB_FTCH_AWP_ID_WIDTH			16
`define JOB_FTCH_AWP_ID_LOW	            0
`define JOB_FTCH_AWP_ID_HIGH			(`JOB_FTCH_AWP_ID_LOW + (`JOB_FTCH_AWP_ID_WIDTH - 1))
`define JOB_FTCH_AWP_ID_FIELD			(`JOB_FTCH_AWP_ID_HIGH):(`JOB_FTCH_AWP_ID_LOW)


`endif
