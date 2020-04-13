#include "QUAD.hpp"
using namespace sc_core;
using namespace std;


QUAD::~QUAD()
{

}


void QUAD::ctrl_process_0()
{
    string str;
    while(true)
    {
        wait();
        switch(m_state)
        {
            case ST_WAIT_PFB_LOAD:
            {
                if(m_padding_cfg && (m_input_row < m_crpd_input_row_start_cfg || m_input_row > m_crpd_input_row_end_cfg))
                {
                    b_pfb_write();
                }
                else
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
                    str = "[" + string(name()) + "]:" + " finished Priming its buffer at " + sc_time_stamp().to_string() + "\n";
                    cout << str;
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
                if(m_input_row != (m_num_expd_input_rows_cfg - 1) && m_pfb_count == 0)
                {
                    m_return_state = ST_ACTIVE;
                    m_state = ST_WAIT_PFB_LOAD;
                }
                else if(m_stride_count == 1)
                {
                    b_pfb_read();
                    m_stride_count = (m_stride_count + 1) % m_stride_cfg;
                }
                else if(m_input_row == (m_num_expd_input_rows_cfg - 1))
                {
                    m_state = ST_WAIT_LAST_RES_WRITE;
                }
                break;
            }
            case ST_WAIT_LAST_RES_WRITE:
            {
                if(m_last_res_wrtn && m_master_QUAD_cfg)
                {
                    m_state = ST_SEND_COMPLETE;
                    m_last_res_wrtn = false;
                }
                else if(m_cascade_cfg && !m_master_QUAD_cfg)
                {
                    m_state = ST_SEND_COMPLETE;
                }
                break;
            }
            case ST_SEND_COMPLETE:
            {
                // str = "[" + string(name()) + "]:" + " finished Workload in " + to_string(int(sc_time_stamp().to_double()) - m_start) + " ns\n";
                // cout << str;
                // str = "[" + string(name()) + "]: num_rd_req - " + to_string(m_num_rd_req) + "\n";
                // cout << str;
                // str = "[" + string(name()) + "]: num_wr_req - " + to_string(m_num_wr_req) + "\n";
                // cout << str;
                // str = "[" + string(name()) + "]: num_fifo_wr - " + to_string(m_num_fifo_wr) + "\n";
                // cout << str;
                // str = "[" + string(name()) + "]: num_fifo_rd - " + to_string(m_num_fifo_rd) + "\n";
                // cout << str;
                bus->b_request(m_QUAD_id, ACCL_CMD_JOB_COMPLETE, int());
                m_krnl_count = 0;
                m_input_row = 0;
                m_output_col = 0;
                m_output_row = 0;
                m_stride_count = 0;
                m_num_rd_req = 0;
                m_num_wr_req = 0;
                m_num_fifo_wr = 0;
                m_num_fifo_rd = 0;
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
        if(
            (m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_RES_WRITE)
                && ((m_res_fifo.size() < QUAD_RES_FIFO_DEPTH) || (m_cascade_cfg && !m_master_QUAD_cfg))
                && m_output_row != m_num_output_rows_cfg && m_stride_count == 0
        ) {
            if(m_output_col == (m_num_output_cols_cfg - 1))
            {
                m_output_col = 0;
                if(m_krnl_count == (m_num_kernels_cfg - 1))
                {
                    string str =
                        "[" + string(name()) + "]:" + " finished output Row " + to_string(m_output_row) + " at time " + sc_time_stamp().to_string() + "\n";
                    cout << str;
                    m_stride_count = (m_stride_count + 1) % m_stride_cfg;
                    m_input_row++;
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
        if(
            ((m_cascade_cfg && m_master_QUAD_cfg) || (!m_cascade_cfg && m_master_QUAD_cfg))
            && (m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_RES_WRITE)
            && (m_res_fifo.size() < QUAD_RES_FIFO_DEPTH)
            && m_output_row != m_num_output_rows_cfg
            && m_stride_count != 1
        ) {
            m_res_fifo.push_back(int());
            m_num_fifo_wr++;
        }
    }
}


void QUAD::result_write_process()
{
    string str;
    while(true)
    {
        wait();
        if(
            ((m_cascade_cfg && m_master_QUAD_cfg) || (!m_cascade_cfg && m_master_QUAD_cfg))
            && (m_res_fifo.size() >= RES_PKT_SIZE || (m_state == ST_WAIT_LAST_RES_WRITE && m_res_fifo.size() > 0 && m_res_fifo.size() < RES_PKT_SIZE && m_output_row == m_num_output_rows_cfg))
        ) {
            for(int i = 0; i < RES_PKT_SIZE; i += RES_FIFO_RD_WIDTH)
            {
                for(int j = 0; (j < RES_FIFO_RD_WIDTH) && (m_res_fifo.size() > 0); j++)
                {
                    m_res_fifo.pop_front();
                    m_num_fifo_rd++;
                }
                wait();
            }
            bool last_CO = (m_state == ST_WAIT_LAST_RES_WRITE && m_res_fifo.size() == 0 && m_output_row == m_num_output_rows_cfg) ? true : false;
#ifdef VERBOSE_DEBUG
            int start = sc_time_stamp().to_double();
            str = "[" + string(name()) + "]:" + " sent a Pixel Write Request at " + sc_time_stamp().to_string() + "\n";
            cout << str;
#endif
            bus->b_request(m_QUAD_id, ACCL_CMD_RESULT_WRITE, RES_PKT_SIZE, last_CO);
            m_num_wr_req++;
#ifdef VERBOSE_DEBUG
            str = "[" + string(name()) + "]:" + " finished Pixel Write Request in " + to_string(int(sc_time_stamp().to_double()) - start) + " ns at " + sc_time_stamp().to_string() + "\n";
            cout << str;
#endif
            if(last_CO)
            {
                str = "[" + string(name()) + "]:" + " finished sending last Pixel Write Request at " + sc_time_stamp().to_string() + "\n";
                cout << str;
                m_last_res_wrtn = true;
            }
        }
    }
}


void QUAD::b_cfg_write(unsigned char* data)
{
    wait(CLK_PRD, SC_NS);
    Accel_Trans* accel_trans    = (Accel_Trans*)data;
    m_num_output_cols_cfg		= accel_trans->num_output_cols_cfg;
    m_num_output_rows_cfg		= accel_trans->num_output_rows_cfg;
    m_num_kernels_cfg			= accel_trans->num_kernels_cfg;
    m_master_QUAD_cfg			= accel_trans->master_QUAD_cfg;
    m_cascade_cfg				= accel_trans->cascade_cfg;
    m_num_expd_input_cols_cfg	= accel_trans->num_expd_input_cols_cfg;
    m_num_expd_input_rows_cfg   = accel_trans->num_expd_input_rows_cfg;
    m_conv_out_fmt0_cfg			= accel_trans->conv_out_fmt0_cfg;
    m_padding_cfg				= accel_trans->padding_cfg;
    m_upsmaple_cfg				= accel_trans->upsample_cfg;
    m_stride_cfg                = accel_trans->stride_cfg;
    m_crpd_input_row_start_cfg  = accel_trans->crpd_input_row_start_cfg;
    m_crpd_input_row_end_cfg    = accel_trans->crpd_input_row_end_cfg;
    print_cfg();
}

void QUAD::print_cfg()
{
    string str =
        "[" + string(name()) + "]:" + " Configured with....\n" + ""
        "\tNumber of Output Columns:            " + to_string(m_num_output_cols_cfg) 		+ "\n"
        "\tNumber of Output Rows:               " + to_string(m_num_output_rows_cfg) 		+ "\n"
        "\tNumber of Kernels:                   " + to_string(m_num_kernels_cfg) 			+ "\n"
        "\tMaster QUAD:                         " + to_string(m_master_QUAD_cfg) 			+ "\n"
        "\tCascade:                             " + to_string(m_cascade_cfg) 				+ "\n"
        "\tNumber of Expanded Input Coloumns:   " + to_string(m_num_expd_input_cols_cfg) 	+ "\n"
        "\tNumber of Expanded Input Rows:       " + to_string(m_num_expd_input_rows_cfg)    + "\n"
        "\tPadding:                             " + to_string(m_padding_cfg) 				+ "\n"
        "\tUpsmaple:                            " + to_string(m_upsmaple_cfg) 			    + "\n"
        "\tStride:                              " + to_string(m_stride_cfg)                 + "\n"
        "\tCropped Input Row Start:             " + to_string(m_crpd_input_row_start_cfg)   + "\n"
        "\tCropped Input Row End:               " + to_string(m_crpd_input_row_end_cfg) 	+ "\n";
    cout << str;
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
    if(m_state == ST_IDLE)
    {
        string str = "[" + string(name()) + "]:" + " Started Workload at " + sc_time_stamp().to_string() + "\n";
        cout << str;
        m_state = ST_PRIM_BUFFER;
        m_start = int(sc_time_stamp().to_double());
        return true;
    }
    else
    {
        return false;
    }
}


void QUAD::b_job_fetch()
{
#ifdef VERBOSE_DEBUG
    int start = sc_time_stamp().to_double();
    string str = "[" + string(name()) + "]:" + " sent a Pixel Fetch Request at " + sc_time_stamp().to_string() + "\n";
    cout << str;
#endif
    bus->b_request(m_QUAD_id, ACCL_CMD_JOB_FETCH, int());
    m_num_rd_req++;
#ifdef VERBOSE_DEBUG
    str = "[" + string(name()) + "]:" + " finished Pixel Fetch Request in " + to_string(int(sc_time_stamp().to_double()) - start) + " ns at " + sc_time_stamp().to_string() + "\n";
    cout << str;
#endif
    wait(m_pfb_wrtn);
    wait();
}


void QUAD::b_pfb_write()
{
#ifdef VERBOSE_DEBUG
    string str = "[" + string(name()) + "]:" + " is doing a Prefetch Buffer Write\n";
    cout << str;
#endif
    wait(m_num_expd_input_cols_cfg, SC_NS);
    m_pfb_count = m_num_expd_input_cols_cfg;
    m_pfb_wrtn.notify();
}


void QUAD::b_pfb_read()
{
    wait(m_num_expd_input_cols_cfg, SC_NS);
    m_input_row = m_input_row + 1;
    m_pfb_count = 0;
}
