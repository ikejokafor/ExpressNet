#include "Quad.hpp"
using namespace sc_core;
using namespace std;


Quad::~Quad()
{
    
}


void Quad::ctrl_process_0()
{
    while(true)
    {
        wait();
        switch(m_state)
        {
            case ST_WAIT_PFB_LOAD:
			{
                b_job_fetch();
				// if (m_return_state == ST_ACTIVE)
				// {
				// 	m_ex_start_time = uint64_t(sc_time_stamp().to_double());
				// }
                m_state = m_return_state;
                break;
            }              
			case ST_PRIM_BUFFER:
            {   
                if(m_pfb_count == 0 && m_input_row < 4)
                {
                    m_return_state = m_state;
                    m_state = ST_WAIT_PFB_LOAD;
                }
                else if(m_input_row == 3)
                {
					// m_num_ex_cycles = uint64_t(m_num_expd_input_cols_cfg) * uint64_t(m_num_kernels_cfg);
					// m_ex_start_time = uint64_t(sc_time_stamp().to_double());
					m_state = ST_ACTIVE;
                }
                else if(m_input_row != 3)
                {
                    b_pfb_read();
                }
                break;
            }          
            case ST_ACTIVE:
            {
				// uint64_t cur_time = uint64_t(sc_time_stamp().to_double());
				// int cycle_count = (cur_time - m_ex_start_time) / CLK_IF_PRD;
				if(m_output_row != m_num_output_rows_cfg && m_pfb_count == 0)
				{
					m_return_state = ST_ACTIVE;
					m_state = ST_WAIT_PFB_LOAD;
				}
				else if (m_output_row == m_num_output_rows_cfg && m_pfb_count == 0)
				{
					m_state = ST_SEND_COMPLETE;
				}
				else
				{
					m_state = ST_ACTIVE;
				}
                break;
            }          
            case ST_SEND_COMPLETE:
            {
                b_job_compelete();
				m_num_ex_cycles = 0;
				m_krnl_count = 0;
				m_input_row = 0;
				m_output_col = 0;
				m_output_row = 0;
				cout << name() << " Finished Workload" << endl;
				m_state = ST_IDLE;
                break;
            }
        };
    }
}


void Quad::ctrl_process_1()
{
	while(true)
	{
		wait();
		if(m_state == ST_ACTIVE && m_res_fifo.size() < RES_PKT_SIZE)
		{
			if (m_output_col == (m_num_output_col_cfg - 1))
			{
				m_output_col = 0;
				if(m_krnl_count == (m_num_kernels_cfg - 1))
				{
					m_krnl_count = 0;
					m_pfb_count = 0;
					m_output_row++;
				}
				else
				{
					m_krnl_count++;
				}
			}
			else
			{
				m_output_col++;
			}
		}
	}
}


void Quad::conv_process()
{
	while(true)
	{
		wait();
		if(m_state == ST_ACTIVE && m_res_fifo.size() < RES_PKT_SIZE)
		{
			m_res_fifo.push(int());
		}
	}
}


void Quad::result_process()
{
	while(true)
	{
		wait();
		if(m_res_fifo.size() >= RES_PKT_SIZE || m_state == ST_SEND_COMPLETE && m_res_fifo.size() > 0)
		{
			for (int i = 0; i < RES_PKT_SIZE; i += RES_FIFO_RD_WIDTH)
			{
				for (int j = 0; (j < RES_FIFO_RD_WIDTH) && (m_res_fifo.size() > 0); j++)
				{
					m_res_fifo.pop();
				}
				wait();
			}
			m_mutex.lock();
			// int start = int(sc_time_stamp().to_double()) / CLK_IF_PRD;
			bus->b_transaction(m_quad_id, ACCL_CMD_RESULT_WRITE, RES_PKT_SIZE);
			// cout << (int(sc_time_stamp().to_double()) / CLK_IF_PRD) - start << endl;
			m_mutex.unlock();
			if(m_state == ST_SEND_COMPLETE && m_res_fifo.size() == 0)
			{
				m_last_res_wrtn.notify();
			}
		}
	}
}


void Quad::b_cfg_write(unsigned char* data)
{
	wait(CLK_IF_PRD, SC_NS);
	accel_trans_t* accel_trans  = (accel_trans_t*)data;
	m_num_output_col_cfg		= accel_trans->num_output_col_cfg;
	m_num_output_rows_cfg		= accel_trans->num_output_rows_cfg;
	m_num_kernels_cfg			= accel_trans->num_kernels_cfg;
	m_master_quad_cfg			= accel_trans->master_quad_cfg;
	m_cascade_cfg				= accel_trans->cascade_cfg;
	m_result_quad_cfg			= accel_trans->result_quad_cfg;
	m_num_expd_input_cols_cfg	= accel_trans->num_expd_input_cols_cfg;
}



void Quad::b_pxSeqCfg_write()
{
	wait(PIX_SEQ_CFG_WRT_CYCS, SC_NS);
}	


void Quad::b_krnlCfg_write()
{
	int numcycles = m_num_kernels_cfg * KRNL_SLOT_SIZE;
	wait(numcycles, SC_NS);
}


bool Quad::b_job_start()
{
	if (m_state == ST_IDLE)
	{
		cout << name() << " Started Workload" << endl;
		m_state = ST_PRIM_BUFFER;
		return true;
	}
	else
	{
		return false;
	}
}


void Quad::b_job_fetch()
{
	m_mutex.lock();
	bus->b_transaction(m_quad_id, ACCL_CMD_JOB_FETCH, int());
	m_mutex.unlock();
}


void Quad::b_pfb_write()
{
	wait(m_num_expd_input_cols_cfg, SC_NS);
	m_pfb_count = m_num_expd_input_cols_cfg;
}


void Quad::b_pfb_read()
{
	string sc_name = string(name());
	wait(m_num_expd_input_cols_cfg, SC_NS);
	m_input_row = m_input_row + 1;
	m_pfb_count = 0;
}


void Quad::b_job_compelete()
{
	wait(m_last_res_wrtn);
	wait();
	bus->b_transaction(m_quad_id, ACCL_CMD_JOB_COMPLETE, int());
}
