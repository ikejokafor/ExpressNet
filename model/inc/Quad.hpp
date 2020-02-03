#pragma once


#include <queue>
#include <string>
#include "systemc"
#include "common.hpp"
#include "AWE_if.hpp"


typedef enum
{
    ST_IDLE             = 0,
    ST_PRIM_BUFFER		= 1,
    ST_WAIT_PFB_LOAD    = 2,
    ST_ACTIVE			= 3,
    ST_SEND_COMPLETE	= 4
} state_t;


SC_MODULE(Quad)
{
    public:
        // Ports
        sc_core::sc_in<bool>		clk;
		sc_core::sc_port<AWE_if>	bus;

        // Constructor
        SC_HAS_PROCESS(Quad);
        Quad(
            sc_core::sc_module_name	_name,
			int						quad_id
        )
            :	sc_module(_name),
				clk("clk"),
				bus("bus")
        {
            SC_THREAD(ctrl_process_0);
                sensitive << clk.pos();
			SC_THREAD(ctrl_process_1);
				sensitive << clk.pos();
			SC_THREAD(conv_process)
				sensitive << clk.pos();
			SC_THREAD(result_process);
				sensitive << clk.pos();

            m_state = ST_IDLE;
			m_pfb_count = 0;
			m_num_ex_cycles = 0;
			m_krnl_count = 0;
			m_input_row = 0;
			m_output_col = 0;
			m_output_row = 0;
			m_quad_id = quad_id;
        }
        
        
        // Destructor
        ~Quad();

        // Processes
        void ctrl_process_0();
		void ctrl_process_1();
		void conv_process();
		void result_process();
        
        // Methods
		void b_cfg_write(unsigned char* data);
		void b_pxSeqCfg_write();
		void b_krnlCfg_write();
		bool b_job_start();
        void b_job_fetch();
		void b_pfb_write();
		void b_pfb_read();
		void b_execute();
        void b_job_compelete();
        
        // Module Variables
        state_t					m_state						;
		state_t					m_return_state				;
		uint64_t				m_ex_start_time				;
		int						m_pfb_count					;
		uint64_t				m_num_ex_cycles				;
		sc_core::sc_mutex		m_mutex						;
		int						m_krnl_count				;
        int						m_input_row					;
		int						m_input_col					;
		int						m_output_col				;
		int						m_output_row				;
		int						m_num_intput_col_cfg		;
		int						m_num_output_col_cfg		;
		int						m_num_output_rows_cfg		;
        int						m_num_kernels_cfg			;
        bool					m_master_quad_cfg			;
        bool					m_cascade_cfg				;
		bool					m_result_quad_cfg			;
		int						m_num_expd_input_cols_cfg	;
		int						m_quad_id					;
		std::queue<int>			m_res_fifo					;
		sc_core::sc_event		m_last_res_wrtn				;
};
