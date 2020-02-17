#include "QUAD.hpp"
using namespace sc_core;
using namespace std;


QUAD::~QUAD()
{
    
}


void QUAD::ctrl_process_0()
{
    while(true)
    {
        wait();
        switch(m_state)
        {
            case ST_WAIT_PFB_LOAD:
			{
				if(!(m_padding_cfg && (m_input_row == m_crpd_input_row_start_cfg || m_input_row == m_crpd_input_row_end_cfg)))
				{
					b_job_fetch();
				}
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
	                cout << name() << " finished Priming its buffer" << endl;
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
	            cout << name() << " Finished Workload " << int(sc_time_stamp().to_double()) - m_start << " ns" << endl;
				m_state = ST_IDLE;
                break;
            }
        };
    }
}


void QUAD::ctrl_process_1()
{
	while(true)
	{
		wait();
		if(m_state == ST_ACTIVE && m_res_fifo.num_available() < RES_PKT_SIZE)
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


void QUAD::conv_process()
{
	while(true)
	{
		wait();
		if(m_state == ST_ACTIVE && m_res_fifo.num_available() < RES_PKT_SIZE)
		{
			m_res_fifo.nb_write(int());
		}
	}
}


void QUAD::result_process()
{
	while(true)
	{
		wait();
		if(m_res_fifo.num_available() >= RES_PKT_SIZE || (m_state == ST_SEND_COMPLETE && m_res_fifo.num_available() > 0))
		{
			for (int i = 0; i < RES_PKT_SIZE; i += RES_FIFO_RD_WIDTH)
			{
				for (int j = 0; (j < RES_FIFO_RD_WIDTH) && (m_res_fifo.num_available() > 0); j++)
				{
					int dummVal;
					m_res_fifo.nb_read(dummVal);
				}
				wait();
			}
			m_mutex.lock();
			int start = sc_time_stamp().to_double();
			cout << name() << " sent a Pixel Write Request" << endl;
			bus->b_transaction(m_FAS_id, m_QUAD_id, ACCL_CMD_RESULT_WRITE, RES_PKT_SIZE);
			cout << name() << " finished Pixel Write Request in " << int(sc_time_stamp().to_double()) - start << " ns" << endl;
			m_mutex.unlock();
			if(m_state == ST_SEND_COMPLETE && m_res_fifo.num_available() == 0)
			{
				m_last_res_wrtn.notify();
			}
		}
	}
}


void QUAD::b_cfg_write(unsigned char* data)
{
	wait(CLK_IF_PRD, SC_NS);
	accel_trans_t* accel_trans  = (accel_trans_t*)data;
	m_FAS_id					= accel_trans->FAS_id;
	m_num_output_col_cfg		= accel_trans->num_output_col_cfg;
	m_num_output_rows_cfg		= accel_trans->num_output_rows_cfg;
	m_num_kernels_cfg			= accel_trans->num_kernels_cfg;
	m_master_QUAD_cfg			= accel_trans->master_QUAD_cfg;
	m_cascade_cfg				= accel_trans->cascade_cfg;
	m_num_expd_input_cols_cfg	= accel_trans->num_expd_input_cols_cfg;
	m_conv_out_fmt0_cfg			= accel_trans->conv_out_fmt0_cfg;
	m_padding_cfg				= accel_trans->padding_cfg;
	m_upsmaple_cfg				= accel_trans->upsmaple_cfg;
	m_crpd_input_row_start_cfg  = accel_trans->crpd_input_row_start_cfg;
	m_crpd_input_row_end_cfg    = accel_trans->crpd_input_row_end_cfg;
}



void QUAD::b_pxSeqCfg_write()
{
	wait(PIX_SEQ_CFG_WRT_CYCS, SC_NS);
}	


void QUAD::b_krnlCfg_write()
{
	int numcycles = m_num_kernels_cfg * KRNL_SLOT_SIZE;
	wait(numcycles, SC_NS);
}


bool QUAD::b_job_start()
{
	if (m_state == ST_IDLE)
	{
		cout << name() << " Started Workload" << endl;
		m_state = ST_PRIM_BUFFER;
		m_start = int(sc_time_stamp().to_double());
		cout << name() << " Begain Priming its buffer" << endl;
		return true;
	}
	else
	{
		return false;
	}
}


void QUAD::b_job_fetch()
{
	m_mutex.lock();
	int start = sc_time_stamp().to_double();
	cout << name() << " sent a Pixel Fetch Request" << endl;
	bus->b_transaction(m_FAS_id, m_QUAD_id, ACCL_CMD_JOB_FETCH, int());
	cout << name() << " finished Pixel Fetch Request in " << int(sc_time_stamp().to_double()) - start << " ns" << endl;
	m_mutex.unlock();
}


void QUAD::b_pfb_write()
{
	wait(m_num_expd_input_cols_cfg, SC_NS);
	m_pfb_count = m_num_expd_input_cols_cfg;
}


void QUAD::b_pfb_read()
{
	if(m_padding_cfg)
	{
		wait(m_num_expd_input_cols_cfg + 2, SC_NS);
	}
	else if(m_upsmaple_cfg)
	{
		wait(m_num_expd_input_cols_cfg * 2, SC_NS);
	}
	else
	{
		wait(m_num_expd_input_cols_cfg, SC_NS);
	}
	m_input_row = m_input_row + 1;
	m_pfb_count = 0;
}


void QUAD::b_job_compelete()
{
	wait(m_last_res_wrtn);
	wait();
	bus->b_transaction(m_FAS_id, m_QUAD_id, ACCL_CMD_JOB_COMPLETE, int());
}
