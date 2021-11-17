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
`ifndef __CNN_LAYER_ACCEL_QUAD__
`define __CNN_LAYER_ACCEL_QUAD__


//-----------------------------------------------------------------------------------------------------------------------------------------------
// Includes
//-----------------------------------------------------------------------------------------------------------------------------------------------
`include "math.svh"
`include "utilities.svh"



//-----------------------------------------------------------------------------------------------------------------------------------------------
// AWP General Defs
//-----------------------------------------------------------------------------------------------------------------------------------------------
`define KRNL_3X3_SIMD                   8
`define NUM_AWE                         (32'd4)
`define NUM_CE_PER_AWE                  2
`define NUM_QUADS                       1
`define NUM_CE                          (`NUM_AWE * `NUM_CE_PER_AWE)
`define WINDOW_3x3_NUM_CYCLES           5    // num cycles to output a 3x3 window in our arch
`define NUM_CONV_WINDOW_VALUES          10
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
`define MAX_QUAD_PER_AWP				4
// Act Field
// `define ACTV_NUM_FRAC_BITS              14
// `define ACTV_WIDTH                      16
// `define ACTV_WIDTH_LOW                  `ACTV_NUM_FRAC_BITS
// `define ACTV_WIDTH_HIGH                 (`ACTV_WIDTH + `ACTV_WIDTH - 1)
// `define ACTV_WIDTH_FIELD                (`ACTV_WIDTH_HIGH):(`ACTV_WIDTH_LOW)


//-----------------------------------------------------------------------------------------------------------------------------------------------
// SEQ DATA FIELDS
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
// SEQ DATA FIELDS
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
// JOB PARAMETERS FIELDS
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

`define ENABLE_WIDTH						1
`define ENABLE_LOW							(`NUM_EXPD_INPUT_COLS_HIGH + 1)
`define ENABLE_HIGH							(`ENABLE_LOW + `ENABLE_WIDTH - 1)
`define ENABLE_FIELD						(`ENABLE_HIGH):(`ENABLE_LOW)

`define UNUSED_WIDTH                        1
`define UNUSED_LOW                          (`ENABLE_HIGH + 1)
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


`endif
