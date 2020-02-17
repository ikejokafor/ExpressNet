#pragma once


#include "systemc"
#include "util.hpp"


#define CLK_IF_PRD				10
#define CLK_CORE_PRD			2
#define WINDOW_3x3_NUM_CYCLES	uint64_t(5)
#define PIX_SEQ_CFG_WRT_CYCS	(uint64_t(1024) * WINDOW_3x3_NUM_CYCLES)
#define KRNL_SLOT_SIZE			10
#define RES_FIFO_RD_WIDTH		8
#define PM_FIFO_WR_WIDTH		8
#define PM_FIFO_RD_WIDTH		8
#define OB_FIFO_WR_WIDTH		8
#define OB_FIFO_RD_WIDTH		8
#define IM_FIFO_WR_WIDTH		8
#define IM_FIFO_RD_WIDTH		PM_FIFO_RD_WIDTH
#define RES_PKT_SIZE			RES_FIFO_RD_WIDTH
#define IM_NUM_FETCH_PIX		16
#define PIXEL_SIZE				2 // bytes
#define SYS_MEM_NUM_PIX_WRITE	8	// 16 bytes
#define SYS_MEM_NUM_PIX_READ	8	// 16 bytes
#define NUM_FAS					1
#define MAX_AWP_PER_FAS			2
#define NUM_QUADS_PER_AWP		4
#define	MAX_AWP_TRANS			1
#define MAX_3x3_KERNELS			64
#define MAX_1x1_KERNELS			64
#define QUAD_RES_FIFO_SIZE		16
#define PARTMAP_FIFO_SIZE		16
#define INMAP_FIFO_SIZE			16
#define KRNL_1X1_FIFO_SIZE		16
#define OUTBUF_FIFO_SIZE		16


typedef enum
{
	ACCL_CMD_CFG_WRITE			= 0,
	ACCL_CMD_PIX_SEQ_CFG_WRITE	= 1,
	ACCL_CMD_KRL_CFG_WRITE		= 2,
	ACCL_CMD_JOB_START			= 3,
	ACCL_CMD_JOB_FETCH			= 4,
	ACCL_CMD_RESULT_WRITE		= 5,
	ACCL_CMD_JOB_COMPLETE		= 6
}accel_cmd_t;


typedef struct
{
	accel_cmd_t accel_cmd           ;
	int num_output_col_cfg          ;
	int num_output_rows_cfg         ;
	int num_kernels_cfg             ;
	int num_1x1_kernels_cfg			;
	bool master_QUAD_cfg            ;
	bool cascade_cfg                ;
	int num_expd_input_cols_cfg     ;
	int QUAD_id                     ;
	int num_QUADS_cfgd				;
	int AWP_id						;
	int FAS_id						;
	int res_pkt_size				;
	bool conv_out_fmt0_cfg			;
	bool padding_cfg				;
	bool upsmaple_cfg				;
	int crpd_input_row_start_cfg	;
	int crpd_input_row_end_cfg		;
}accel_trans_t;
