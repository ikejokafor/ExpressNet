#pragma once


#include "systemc"


#define CLK_IF_PRD				10
#define CLK_CORE_PRD			2
#define WINDOW_3x3_NUM_CYCLES	uint64_t(5)
#define PIX_SEQ_CFG_WRT_CYCS	uint64_t(1024) * WINDOW_3x3_NUM_CYCLES
#define KRNL_SLOT_SIZE			10
#define RES_FIFO_RD_WIDTH		8
#define RES_PKT_SIZE			RES_FIFO_RD_WIDTH
#define NUM_AWE					4
#define NUM_QUADS_PER_AWE		4


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
	bool master_quad_cfg            ;
	bool cascade_cfg                ;
	bool result_quad_cfg			;
	int num_expd_input_cols_cfg     ;
	int quad_id                     ;
	int res_pkt_size				;
}accel_trans_t;
