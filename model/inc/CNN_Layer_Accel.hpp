// --------------------------------------------------------------------------------------------------------------------------------------------------
//
//  M: Memory Cycle Latency
//  C: Number of Input Columns
//  R: Number of Input Rows
//  K_3: Number of 3x3 Kernels
//  K_1: Number of 1x1 Kernels
//  K_1_D: 1x1 Kernel Depth
//
//  IDD2P
//
//
//  QUAD Cycle Latency:
//       PIX_SEQ_WRT_LAT
//          + KRNL_3x3_WRT_LAT
//          + KRNL_3x3_BIAS_WRT_LAT
//          + PRIM_LAT
//          + PRFTCH_WRT_LAT
//          + EXE_LAT
//
//       [M + 8192]
//          + [M + (10 * K_3)]
//          + [M +  K_3)]
//          + [3 * (M + C)]
//          + [(R - 3)(M + C)]
//          + [R * C]
//
//
//  FAS Cycle Latency:
//
//      [M + K_1 * K_1_D]   +   [M + K_1]
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
#include <random>
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


SC_MODULE(CNN_Layer_Accel)
{
    public:
        // Clocks
        sc_core::sc_in<bool> clk;
        tlm_utils::simple_target_socket<CNN_Layer_Accel>	tar_soc;

        AWP* awp[MAX_AWP_PER_FAS];
        FAS* fas[NUM_FAS];
        Interconnect FAS2AWP_bus;
        Interconnect AWP2FAS_bus;

        SC_CTOR(CNN_Layer_Accel)
            :	clk("clk"),
                FAS2AWP_bus("FAS2AWP_bus"),
                AWP2FAS_bus("AWP2FAS_bus")
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
            SC_THREAD(system_mem_read_arb_process)
                sensitive << clk.pos();
            SC_THREAD(system_mem_write_arb_process)
                sensitive << clk.pos();

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
            for(int i = 0; i < MAX_FAS_RD_REQ; i++)
            {
                m_rd_req_arr[i].req_pending = false;
            }
            for(int i = 0; i < MAX_FAS_WR_REQ; i++)
            {
                m_wr_req_arr[i].req_pending = false;
            }
            m_accelCfg = new AccelConfig();
            m_num_sys_mem_wr_in_prog = 0;
            m_num_sys_mem_rd_in_prog = 0;
            m_next_wr_req_id = 0;
            m_next_rd_req_id = 0;
        }

        // Destructor
        ~CNN_Layer_Accel();

        // Processes
        void main_process();
        int complt_process(int idx);
        void system_mem_read_arb_process();
        void system_mem_write_arb_process();


        // Methods
        void b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay);
        void setMemory(uint64_t addr);
        void start();
        void waitComplete(double& elapsedTime, double& memPower);
        double calculateMemPower();


        // Members
        sc_core::sc_event_queue m_complete;
        AccelConfig* m_accelCfg;
        std::vector<uint64_t> m_memory;
        std::vector<bool> m_FAS_complt_arr;
        Accel_Trans	m_rd_req_arr[MAX_FAS_RD_REQ];
        Accel_Trans	m_wr_req_arr[MAX_FAS_WR_REQ];
        int m_num_sys_mem_wr_in_prog;
        int m_num_sys_mem_rd_in_prog;
        int m_next_wr_req_id;
        int m_next_rd_req_id;
        double m_start_time;
};
