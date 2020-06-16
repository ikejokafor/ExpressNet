#pragma once


#define SC_INCLUDE_DYNAMIC_PROCESSES


#include "systemc"
#include "string.h"
#include "tlm.h"
#include "tlm_utils/peq_with_cb_and_phase.h"
#include "tlm_utils/simple_initiator_socket.h"
#include "tlm_utils/simple_target_socket.h"
#include "mem_mng.hpp"
#include "cnn_layer_accel_common.hpp"
#include "QUAD.hpp"
#include "AWP_if.hpp"
#include "AWPBus.hpp"
#include <csignal>


SC_MODULE(AWP)
{
    public:
        // Ports
        sc_core::sc_in<bool>						clk;
        tlm_utils::simple_initiator_socket<AWP>		init_soc;
        tlm_utils::simple_target_socket<AWP>		tar_soc;
        tlm_utils::simple_target_socket<AWP>		bus_tar_soc;
        AWPBus										bus;

        // Modules
        QUAD* quad[NUM_QUADS_PER_AWP];

        // Constructor
        SC_CTOR(AWP)
            :	clk("clk"),
                bus("bus"),
                m_num_trans_in_prog(0),
                m_next_req_id(0)
        {
            // Bindings
            tar_soc.register_b_transport(this, &AWP::b_transport);
            bus_tar_soc.register_b_transport(this, &AWP::bus_tar_b_transport);
            bus.clk(clk);
            bus.init_soc(bus_tar_soc);


            // Create Modules
            memset(m_primed, 0x0, (sizeof(bool) * NUM_QUADS_PER_AWP));
            for(int i = 0; i < NUM_QUADS_PER_AWP; i++)
            {
                quad[i] = new QUAD(("QUAD_" + std::to_string(i)).c_str());
                quad[i]->m_QUAD_id = i;
                quad[i]->clk(clk);
                quad[i]->bus(bus);
                quad[i]->m_primed = m_primed;
                quad[i]->m_QUAD_start = &m_QUAD_start;
            }


            // SC processes
            SC_THREAD(bus_arbitrate)
                sensitive << clk.pos();
            SC_THREAD(send_complete)
                sensitive << clk.pos();

            m_next_req_id = 0;
            for (int i = 0; i < NUM_QUADS_PER_AWP; i++)
            {
                m_QUADs_cfgd_arr.push_back(false);
            }
            m_num_QUADs_cfgd = 0;
            m_AWP_cfgd = false;
        }

        // Destructor
        ~AWP();

        // Processes
        void bus_arbitrate();
        int request_process(int idx);
        void send_complete();

        // Methods
        void b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay);
        void bus_tar_b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay);

        // Members
        mem_mng m_mem_mng;
        sc_core::sc_event m_trans;
        int m_AWP_id;
        int m_FAS_id;
        int m_num_trans_in_prog;
        int	m_next_req_id;
        std::vector<bool> m_QUADs_cfgd_arr;
        int m_num_QUADs_cfgd;
        bool m_AWP_cfgd;
        bool m_primed[NUM_QUADS_PER_AWP];
        sc_core::sc_event_queue m_QUAD_start;
};
