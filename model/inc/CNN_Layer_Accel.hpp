// --------------------------------------------------------------------------------------------------------------------------------------------------
//
//  M: Memory Cycle Latency
//  I_R: Number of Ssliding WIndow Input Rows
//  I_C: Number of Ssliding WIndow Input Columns
//  O_R: Number of Sliding Window Output Rows
//  O_C: Number of Sliding Window Output Columns
//  O_D: Output Depth
//  A_S: Accumulation SIMD
//  K_3: Number of 3x3 Kernels
//  K_1: Number of 1x1 Kernels
//  K_3_S: 3x3 Kernel SIMD
//  K_1_S: 1x1 Kernel SIMD
//  K_1_D: 1x1 Kernel Depth
//  K_1_D_S: 1x1 Kernel Depth SIMD
//
//  IDD2P
//
//
//  QUAD Cycle Latency:
//
//      PIX_SEQ_WRT_LAT
//          + KRNL_3x3_WRT_LAT
//          + KRNL_3x3_BIAS_WRT_LAT
//          + PRIM_LAT
//          + PRFTCH_WRT_LAT
//          + EXE_LAT
//
//      For stride 1:
//          (M + 8192)
//          + (M + (10 * K_3))
//          + (M +  K_3))
//          + (3 * (M + I_C))
//          + ((I_R - 3)(M + I_C))
//          + ((K_3 / K_3_S) * O_R * O_C)
//
//      For stride 2:
//          (M + 8192)
//          + (M + (10 * K_3))
//          + (M +  K_3))
//          + (3 * (M + I_C))
//          + ((I_R - 3)(M + I_C))
//          + ((K_3 / K_3_S)* O_R * O_C) + (I_R / 2)
//
//  FAS Cycle Latency:
//
//      EXE_LAT
//
//      (M + (O_R * O_C)) * (K_1_D / K_1_D_S) * (K_1 / K_1_S)
//  
//  Streaming Accumulation Latency
//      
//      EXE_LAT
//
//      (M + (O_R * O_C * O_D) / A_S)
//
//  Power Consumption:
//
//      IDD2P x VDD
//      IDD2F x VDD
//      IDD3P * VDD
//
//
// --------------------------------------------------------------------------------------------------------------------------------------------------
#pragma once


#define SC_INCLUDE_DYNAMIC_PROCESSES


#include <vector>
#include <string>
#include <iomanip>
#include <sstream>
#include "systemc"
#include "tlm.h"
#include "tlm_utils/peq_with_cb_and_phase.h"
#include "tlm_utils/simple_initiator_socket.h"
#include "tlm_utils/simple_target_socket.h"
#include "mem_mng.hpp"
#include "cnn_layer_accel_common.hpp"
#include "FAS.hpp"
#include "AWP.hpp"
#include "Interconnect.hpp"


typedef struct
{
    uint64_t 	addr;
    int   		size;
} mem_ele_t;


SC_MODULE(CNN_Layer_Accel)
{
    public:
		sc_core::sc_in<bool>						clk				;
#ifdef DDR_AXI_MEM_SIM
        sc_core:: sc_in<bool>                               ce                  ;
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        sc_core::sc_out<sc_bv<MAX_FAS_RD_REQ> >             init_rd_req         ;
        sc_core::sc_out<sc_bv<N_INIT_ID_WTH> >              init_rd_req_id      ;
        sc_core::sc_out<sc_bv<N_INIT_ADDR_WTH> >            init_rd_addr        ;
        sc_core::sc_out<sc_bv<N_INIT_LEN_WTH> >             init_rd_len         ;
        sc_core:: sc_in<sc_bv<MAX_FAS_RD_REQ> >             init_rd_req_ack     ;
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
        sc_core:: sc_in<sc_bv<N_INIT_DATA_WTH> >            init_rd_data        ;
        sc_core:: sc_in<sc_bv<MAX_FAS_RD_REQ> >             init_rd_data_vld    ;
        sc_core::sc_out<sc_bv<MAX_FAS_RD_REQ> >             init_rd_data_rdy    ;
        sc_core:: sc_in<sc_bv<MAX_FAS_RD_REQ> >             init_rd_cmpl        ;
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
        sc_core::sc_out<bool>                               init_wr_req         ;
        sc_core::sc_out<sc_bv<INIT_ID_WTH> >                init_wr_req_id      ;
        sc_core::sc_out<sc_bv<INIT_ADDR_WTH> >              init_wr_addr        ;
        sc_core::sc_out<sc_bv<INIT_LEN_WTH> >               init_wr_len         ;
        sc_core:: sc_in<bool>                               init_wr_req_ack     ;
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------   
        sc_core::sc_out<sc_bv<INIT_DATA_WTH> >              init_wr_data        ;
        sc_core::sc_out<bool>                               init_wr_data_vld    ;
        sc_core:: sc_in<bool>                               init_wr_data_rdy    ;
        sc_core:: sc_in<bool>                               init_wr_cmpl        ;
#endif	
        tlm_utils::simple_target_socket<CNN_Layer_Accel>	tar_soc;

        AWP* awp[MAX_AWP_PER_FAS];
        FAS* fas[NUM_FAS];
        Interconnect FAS2AWP_bus;
        Interconnect AWP2FAS_bus;

        SC_CTOR(CNN_Layer_Accel)
            :	clk("clk"),
                FAS2AWP_bus("FAS2AWP_bus"),
                AWP2FAS_bus("AWP2FAS_bus"),
                m_memory(9, mem_ele_t())
        {
            tar_soc.register_b_transport(this, &CNN_Layer_Accel::b_transport);
            FAS2AWP_bus.clk(clk);
            AWP2FAS_bus.clk(clk);
            for(int i = 0, k = 0; i < NUM_FAS; i++)
            {
                fas[i] = new FAS(("FAS_" + std::to_string(i)).c_str());
                fas[i]->m_FAS_id = i;
                fas[i]->clk(clk);
                fas[i]->rout_init_soc(FAS2AWP_bus.tar_soc);
                AWP2FAS_bus.init_soc(fas[i]->rout_tar_soc);
                fas[i]->sys_mem_init_soc(tar_soc);
                for (int j = 0; j < MAX_AWP_PER_FAS; j++, k++)
                {
                    awp[k] = new AWP(("AWP_" + std::to_string(k)).c_str());
                    awp[k]->m_AWP_id = k;
                    awp[k]->bus.m_AWP_id = k;
                    awp[k]->clk(clk);
                    FAS2AWP_bus.init_soc(awp[k]->tar_soc);
                    awp[k]->init_soc(AWP2FAS_bus.tar_soc);
                }
            }

            SC_THREAD(main_process);
                sensitive << clk.pos();
#ifdef DDR_AXI_MEM_SIM
            SC_THREAD(b_wait_ce)
                sensitive << clk.pos();
#else
            SC_THREAD(system_mem_arb_process);
                sensitive << clk.pos();
#endif
            for(int i = 0 ; i < NUM_FAS ; i++)
            {
                m_FAS_complt_arr.push_back(false);
                sc_core::sc_spawn_options args;
                args.set_sensitivity(&clk);
                sc_core::sc_spawn(
                    nullptr,
                    sc_core::sc_bind(
                        &CNN_Layer_Accel::complt_process,
                        this,
                        i
                    ),
                    ("complt_process" + std::to_string(i)).c_str(),
                    &args
                );
            }
            for(int i = 0; i < MAX_FAS_REQ; i++)
            {
                m_req_arr[i].req_pending = false;
            }
            m_accelCfg                  = new AccelConfig(NULL);
            m_num_sys_mem_wr_in_prog    = 0;
            m_num_sys_mem_rd_in_prog    = 0;
            m_next_wr_req_id            = 0;
            m_next_rd_req_id            = 0;
            m_total_sys_mem_trans       = 0;
            m_max_sys_mem_trans         = 0;
        }

        // Destructor
        ~CNN_Layer_Accel();

        // Processes
        void main_process();
        int complt_process(int idx);

        
        // Methods
        void b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay);
		void setMemory(int idx, uint64_t addr, int size);
		mem_ele_t* getMemory(int idx);
        void start();
        void waitComplete(double& elapsedTime, double& memPower, double& QUAD_time, double& FAS_time);
#ifdef DDR_AXI_MEM_SIM
        void b_wait_ce();
#else
        void system_mem_arb_process();
#endif
		
        double calculateMemPower();
		const char* toHexCharArr(int value);
		const char* toHexCharArr(uint32_t value);
		const char* toHexCharArr(uint64_t value);


        // Members
        sc_core::sc_event_queue m_complete;
        AccelConfig* m_accelCfg;
        std::vector<mem_ele_t> m_memory;
        std::vector<bool> m_FAS_complt_arr;
        Accel_Trans	m_req_arr[MAX_FAS_REQ];
        int m_num_sys_mem_wr_in_prog;
        int m_num_sys_mem_rd_in_prog;
        int m_next_wr_req_id;
        int m_next_rd_req_id;
        double m_start_time;
        double m_QUAD_time;
        double m_FAS_time;
        
        int m_total_sys_mem_trans;
        int m_max_sys_mem_trans;
};
