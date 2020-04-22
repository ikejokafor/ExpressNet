#pragma once


#include "systemc"
#include "mem_mng.hpp"
#include "tlm.h"
#include "tlm_utils/peq_with_cb_and_phase.h"
#include "tlm_utils/simple_initiator_socket.h"
#include "tlm_utils/simple_target_socket.h"
#include "util.hpp"


// #define VERBOSE_DEBUG
#define CLK_PRD					            10
#define PIXEL_SEQUENCE_SIZE                 8192
#define MAX_NETWORK_TRANS		            1
#define NUM_FAS					            1
#define MAX_AWP_PER_FAS			            1
#define NUM_QUADS_PER_AWP		            4
#define QUAD_MAX_DEPTH                      8
#define QUAD_DEPTH_SIMD                     (MAX_AWP_PER_FAS * NUM_QUADS_PER_AWP * QUAD_MAX_DEPTH)
#define MAX_AWP_TRANS			            (NUM_QUADS_PER_AWP * 2)	// each quad can send 2 requests at a time
#define MAX_FAS_SYS_MEM_TRANS	            1
#define MAX_FAS_ROUT_TRANS		            1
#define MAX_3x3_KERNELS			            64
#define YOLOV3_MAX_1x1_INPUT_DEPTH          1024
#define MAX_1x1_KERNEL_DEPTH                YOLOV3_MAX_1x1_INPUT_DEPTH
#define FAS_1x1_KRNL_DPTH_SIMD              64
#define MAX_1x1_KERNELS			            64
#define PIXEL_SIZE				            2	// 2 bytes
#define WINDOW_3x3_NUM_CYCLES	            (uint64_t(5))
#define PIX_SEQ_CFG_WRT_CYCS	            (uint64_t(1024) * WINDOW_3x3_NUM_CYCLES)
#define KRNL_SLOT_SIZE			            10
#define QUAD_RES_FIFO_DEPTH		            16
#define KRNL_1X1_BRAM_DEPTH		            (MAX_1x1_KERNEL_DEPTH * MAX_1x1_KERNELS)
#define KRNL_1x1_BRAM_NUM_PIX_READ	        MAX_1x1_KERNEL_DEPTH
#define	KRNL_1x1_BRAM_RD_WIDTH	            MAX_1x1_KERNEL_DEPTH
#define KRNL_1x1_BRAM_NUM_PIX_WRITE         MAX_1x1_KERNEL_DEPTH
#define KRNL_1x1_BRAM_WR_WIDTH              MAX_1x1_KERNEL_DEPTH
#define KRNL_1X1_BIAS_BRAM_DEPTH            MAX_1x1_KERNELS
#define KRNL_1X1_BIAS_BRAM_NUM_PIX_READ     1
#define KRNL_1X1_BIAS_BRAM_RD_WIDTH         1
#define KRNL_1X1_BIAS_BRAM_NUM_PIX_WRITE    1
#define KRNL_1X1_BIAS_BRAM_WR_WIDTH         1
#define RES_FIFO_RD_WIDTH		            8
#define RES_PKT_SIZE			            RES_FIFO_RD_WIDTH
#define OB_FIFO_DEPTH			            256
#define OB_NUM_PIX_WRITE		            RES_PKT_SIZE
#define OB_FIFO_WR_WIDTH		            8
#define OB_FIFO_RD_WIDTH		            8
#define OB_HIGH_WATERMARK		            64
#define PM_FIFO_DEPTH			            256
#define PM_NUM_PIX_READ			            8
#define PM_FIFO_WR_WIDTH		            8
#define PM_FIFO_RD_WIDTH		            8
#define PM_LOW_WATERMARK		            16
#define CO_BRAM_DEPTH			            (MAX_1x1_KERNELS * MAX_1x1_KERNEL_DEPTH)
#define CO_NUM_PIX_READ			            MAX_1x1_KERNEL_DEPTH
#define CO_BRAM_WR_WIDTH		            8
#define CO_BRAM_RD_WIDTH		            MAX_1x1_KERNEL_DEPTH
#define RSM_FIFO_DEPTH			            256
#define RSM_NUM_PIX_READ		            8
#define RSM_FIFO_WR_WIDTH		            8
#define RSM_NUM_PIX_WRITE		            8
#define RSM_FIFO_RD_WIDTH		            8
#define RSM_LOW_WATERMARK		            8


typedef enum
{
    ACCL_CMD_CFG_WRITE			    = 0,
    ACCL_CMD_PIX_SEQ_CFG_WRITE	    = 1,
    ACCL_CMD_KRL3x3_CFG_WRITE	    = 2,
    ACCL_CMD_KRL3x3BIAS_CFG_WRITE	= 3,
    ACCL_CMD_JOB_START			    = 4,
    ACCL_CMD_JOB_FETCH			    = 5,
    ACCL_CMD_RESULT_WRITE		    = 6,
    ACCL_CMD_JOB_COMPLETE		    = 7
} accel_cmd_t;


class Accel_Trans
{
    public:
        Accel_Trans() : req_pending(false) {}
        accel_cmd_t accel_cmd           ;
        int num_output_cols_cfg         ;
        int num_output_rows_cfg         ;
        int num_kernels_cfg             ;
        int num_1x1_kernels_cfg			;
        bool master_QUAD_cfg            ;
        bool cascade_cfg                ;
        int num_expd_input_cols_cfg     ;
        int num_expd_input_rows_cfg     ;
        int QUAD_id                     ;
        int num_QUADS_cfgd				;
        int AWP_id						;
        int FAS_id						;
        int res_pkt_size				;
        bool conv_out_fmt0_cfg			;
        bool padding_cfg				;
        bool upsample_cfg				;
        int stride_cfg                  ;
        int crpd_input_row_start_cfg	;
        int crpd_input_row_end_cfg		;
        bool req_pending				;
        bool last_CO                    ;
        sc_core::sc_event ack			;
        sc_core::sc_event request		;
};


tlm::tlm_generic_payload* nb_createTLMTrans(
    mem_mng& mem_mng,
    uint64_t address,
    tlm::tlm_command cmd,
    unsigned char* data_ptr,
    unsigned int dataLength,
    unsigned int streamWidth,
    unsigned char* byteENptr,
    bool DMI_EN,
    tlm::tlm_response_status status
);
