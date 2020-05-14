#pragma once


#include "systemc"
#include "tlm_utils/peq_with_cb_and_phase.h"
#include "tlm_utils/simple_initiator_socket.h"
#include "tlm_utils/simple_target_socket.h"
#include "mem_mng.hpp"
#include "cnn_layer_accel_common.hpp"
#include "AWP_if.hpp"


class AWPBus : public sc_core::sc_module, public AWP_if
{
    public:
        sc_core::sc_in<bool> clk;
        tlm_utils::simple_initiator_socket<AWPBus>	init_soc;

        SC_CTOR(AWPBus)
        {
            for(int i = 0; i < NUM_QUADS_PER_AWP; i++)
            {
                m_QUAD_complt_arr.push_back(false);
            }
            for(int i = 0; i < MAX_AWP_TRANS; i++)
            {
                m_req_arr[i].req_pending = false;
            }
        }

        ~AWPBus();

        // Channel Methods
        void b_request(int QUAD_id, accel_cmd_t accel_cmd, int res_pkt_size, bool last_CO = false);
        void b_transaction(int idx, bool last_CO = false);


        // Memebers
        int					m_AWP_id;
        int					m_FAS_id;
        Accel_Trans			m_req_arr[MAX_AWP_TRANS];
        std::vector<bool>	m_QUAD_complt_arr;
        mem_mng				m_mem_mng;
};