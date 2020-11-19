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
                    m_primed[m_QUAD_id] = true;
                    if(!m_primed[m_QUAD_id])
                    {
                        str = "[" + string(name()) + "]: finished Priming at " + sc_time_stamp().to_string() + "\n";
                        m_primed[m_QUAD_id] = true;
                    }
                    if(m_cascade_cfg && m_master_QUAD_cfg)
                    {
                        bool all_primed = true;
                        for(int i = 0; i < NUM_QUADS_PER_AWP; i++)
                        {
                            if(!m_primed[i])
                            {
                                all_primed = false;
                            }
                        }
                        if(all_primed)
                        {
                            m_QUAD_start->notify(SC_ZERO_TIME);
                            m_primed[m_QUAD_id] = false;
                            str = "[" + string(name()) + "]: All Quads primed. Starting Convolution process at " + sc_time_stamp().to_string() + "\n";
                            cout << str;
                            m_state = ST_ACTIVE;
                        }
                    }
                    else if(m_cascade_cfg && !m_master_QUAD_cfg)
                    {
                        wait(m_QUAD_start->default_event());
                        m_primed[m_QUAD_id] = false;
                        cout << str;
                        m_state = ST_ACTIVE;
                    }
                    else
                    {
                        str = "[" + string(name()) + "]: Starting Convolution process "+ sc_time_stamp().to_string() + "\n";
                        cout << str;
                        m_state = ST_ACTIVE;
                    }
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
                else if(m_stride_count > 0)
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
                if((m_last_res_wrtn && m_master_QUAD_cfg) || (m_cascade_cfg && !m_master_QUAD_cfg && m_output_row == m_num_output_rows_cfg))
                {
                    m_state = ST_SEND_COMPLETE;
                    m_last_res_wrtn = false;
                }
                break;
            }
            case ST_SEND_COMPLETE:
            {
                m_QUAD_time = sc_time_stamp().to_double() - m_start_time;
                str = "[" + string(name()) + "]: QUAD processing time: " + to_string((int)m_QUAD_time) + " ns\n";
                if(m_master_QUAD_cfg)
                {
                    cout << str;
                }
                if(m_res_fifo_sz > 0)
                {
                    str = "[" + string(name()) + "]: m_res_fifo_sz is not empty\n";
                    cout << str;
                    raise(SIGINT);
                }
                bus->b_request(m_QUAD_id, ACCL_CMD_JOB_COMPLETE, -1, bool(), m_dataout);
                m_krnl_count = 0;
                m_input_row = 0;
                m_output_col = 0;
                m_output_row = 0;
                m_stride_count = 0;
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
        if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_RES_WRITE)
            && ((m_res_fifo_sz < RES_FIFO_DEPTH) || (m_cascade_cfg && !m_master_QUAD_cfg))
            && m_output_row != m_num_output_rows_cfg && m_stride_count == 0)
        {
            if(m_output_col == (m_num_output_cols_cfg - 1))
            {
                m_output_col = 0;
                if(m_krnl_count == ((m_num_3x3_kernels_cfg / KRNL_3X3_SIMD) - 1))
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
        if(((m_cascade_cfg && m_master_QUAD_cfg) || (!m_cascade_cfg && m_master_QUAD_cfg))
            && (m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_RES_WRITE)
            && (m_res_fifo_sz < m_res_high_watermark_cfg)
            && m_output_row != m_num_output_rows_cfg
            && m_stride_count != 1)
        {
            m_res_fifo_sz++;
        }
    }
}


void QUAD::result_write_process()
{
    string str;
    int numRd;
    while(true)
    {
        wait();
        if(((m_cascade_cfg && m_master_QUAD_cfg) || (!m_cascade_cfg && m_master_QUAD_cfg))
            && (m_res_fifo_sz >= RES_PKT_SIZE || (m_state == ST_WAIT_LAST_RES_WRITE && m_res_fifo_sz > 0 && m_res_fifo_sz < RES_PKT_SIZE && m_output_row == m_num_output_rows_cfg)))
        {
            for(int i = 0; i < RES_PKT_SIZE; i += RES_FIFO_RD_WIDTH)
            {
                if(m_res_fifo_sz == 0)
                {
                    break;
                }
                else if(m_res_fifo_sz < RES_FIFO_RD_WIDTH)
                {
                    numRd = m_res_fifo_sz;
                    m_res_fifo_sz = 0;
                }
                else
                {
                    numRd = RES_FIFO_RD_WIDTH;
                    m_res_fifo_sz -= RES_FIFO_RD_WIDTH;
                }
                wait();
            }
            bool last_CO = (m_state == ST_WAIT_LAST_RES_WRITE && m_res_fifo_sz == 0 && m_output_row == m_num_output_rows_cfg) ? true : false;
#ifdef VERBOSE_DEBUG
            str = "[" + string(name()) + "]:" + " sent a Pixel Write Request at " + sc_time_stamp().to_string() + "\n";
            cout << str;
#endif
            // TODO: numRd should be RES_PKT_SIZE
            bus->b_request(m_QUAD_id, ACCL_CMD_RESULT_WRITE, numRd, last_CO);
#ifdef VERBOSE_DEBUG
            str = "[" + string(name()) + "]:" + " finished Pixel Write Request at " + sc_time_stamp().to_string() + "\n";
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
    m_res_high_watermark_cfg    = accel_trans->res_high_watermark_cfg;
    m_num_output_cols_cfg		= accel_trans->num_output_cols_cfg;
    m_num_output_rows_cfg		= accel_trans->num_output_rows_cfg;
    m_num_3x3_kernels_cfg	    = accel_trans->num_3x3_kernels_cfg;
    m_output_depth_cfg          = accel_trans->num_3x3_kernels_cfg;
    m_kernel3x3Depth_cfg        = accel_trans->kernel3x3Depth_cfg;
    m_master_QUAD_cfg			= accel_trans->master_QUAD_cfg;
    m_cascade_cfg				= accel_trans->cascade_cfg;
    m_num_expd_input_cols_cfg	= accel_trans->num_expd_input_cols_cfg;
    m_num_expd_input_rows_cfg   = accel_trans->num_expd_input_rows_cfg;
    m_num_input_rows_cfg        = accel_trans->num_input_rows_cfg;
    m_num_input_cols_cfg        = accel_trans->num_input_cols_cfg;
    m_conv_out_fmt0_cfg			= accel_trans->conv_out_fmt0_cfg;
    m_padding_cfg				= accel_trans->padding_cfg;
    m_upsmaple_cfg				= accel_trans->upsample_cfg;
    m_stride_cfg                = accel_trans->stride_cfg;
    m_crpd_input_row_start_cfg  = accel_trans->crpd_input_row_start_cfg;
    m_crpd_input_row_end_cfg    = accel_trans->crpd_input_row_end_cfg;
    // print_cfg();
}


void QUAD::print_cfg()
{
    string str =
        "[" + string(name()) + "]:" + " Configured with....\n"
        "\tResult Fifo HighWatermark:           " + to_string(m_res_high_watermark_cfg)     + "\n"
        "\tNumber of Output Columns:            " + to_string(m_num_output_cols_cfg) 		+ "\n"
        "\tNumber of Output Rows:               " + to_string(m_num_output_rows_cfg) 		+ "\n"
        "\tOuput Depth:                         " + to_string(m_output_depth_cfg)           + "\n"
        "\tNumber of 3x3 Kernels:               " + to_string(m_num_3x3_kernels_cfg) 		+ "\n"
        "\t3x3 Kernel Depth                     " + to_string(m_kernel3x3Depth_cfg)         + "\n"
        "\tMaster QUAD:                         " + to_string(m_master_QUAD_cfg) 			+ "\n"
        "\tCascade:                             " + to_string(m_cascade_cfg) 				+ "\n"
        "\tNumber of Expanded Input Coloumns:   " + to_string(m_num_expd_input_cols_cfg) 	+ "\n"
        "\tNumber of Expanded Input Rows:       " + to_string(m_num_expd_input_rows_cfg)    + "\n"
        "\tNumber of Input Coloumns:            " + to_string(m_num_input_rows_cfg)         + "\n"
        "\tNumber of Input Rows:                " + to_string(m_num_input_cols_cfg)         + "\n"
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


void QUAD::b_krnl3x3Cfg_write()
{
    int numcycles = m_num_3x3_kernels_cfg * KRNL_SLOT_SIZE;
    wait(numcycles, SC_NS);
}


void QUAD::b_krnl3x3BiasCfg_write()
{
    wait(m_num_3x3_kernels_cfg, SC_NS);
}


bool QUAD::b_job_start()
{
    if(m_state == ST_IDLE)
    {
        string str = "[" + string(name()) + "]:" + " Started Workload at " + sc_time_stamp().to_string() + "\n";
        cout << str;
        m_start_time = sc_time_stamp().to_double();
        m_state = ST_PRIM_BUFFER;
		nb_do_conv();
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
    string str = "[" + string(name()) + "]:" + " sent a Pixel Fetch Request at " + sc_time_stamp().to_string() + "\n";
    cout << str;
#endif
    bus->b_request(m_QUAD_id, ACCL_CMD_JOB_FETCH, int());
#ifdef VERBOSE_DEBUG
    str = "[" + string(name()) + "]:" + " finished Pixel Fetch Request at " + sc_time_stamp().to_string() + "\n";
    cout << str;
#endif
    wait(m_pfb_wrtn.default_event());
}


void QUAD::b_pfb_write()
{
    wait(m_num_expd_input_cols_cfg, SC_NS);
    m_pfb_count = m_num_expd_input_cols_cfg;
    m_pfb_wrtn.notify(SC_ZERO_TIME);
}


void QUAD::b_pfb_read()
{
    wait(m_num_expd_input_cols_cfg, SC_NS);
    m_input_row = m_input_row + 1;
    m_pfb_count = 0;
}


void QUAD::nb_do_conv()
{
    int nthreads = std::thread::hardware_concurrency();
    std::vector<std::thread> threads(nthreads);
    fixedPoint_t leakyScaleValue = fixedPoint::create(16, 14, 0.1f);    // FIXME: hardcoding
    fixedPoint_t one = fixedPoint::create(16, 14, 1.0f);                // FIXME: hardcoding
    for (int t = 0; t < nthreads; t++)
	{
		threads[t] = std::thread(std::bind(
		[&](const int bi_m, const int ei_m, const int t)
        {
            for (int m = bi_m; m < ei_m; m++) 
            {
                for (int x = 0, a = 0; x < m_num_output_rows_cfg; x++, a += m_stride_cfg)
                {
                    for (int y = 0, b = 0; y < m_num_output_cols_cfg; y++, b += m_stride_cfg)
                    {
                        int do_i = index3D(QUAD_MAX_INPUT_ROWS, QUAD_MAX_INPUT_COLS, m, x, y);
                        m_dataout[do_i] = m_bias3x3[m];
                        for (int k = 0; k < m_kernel3x3Depth_cfg; k++)
                        {
                            for (int i = a - m_padding_cfg, kr = 0; kr < 3; i++, kr++) // FIXME: hardcoding
                            {
                                for (int j = b - m_padding_cfg, kc = 0; kc < 3; j++, kc++) // FIXME: hardcoding
                                {
                                    if ((i >= 0 && j >= 0) && (i < m_num_input_rows_cfg && j < m_num_input_cols_cfg)) // in valid region, assuming zero padding
                                    {
                                        int di_i = index3D(QUAD_MAX_INPUT_ROWS, QUAD_MAX_INPUT_COLS, k, i, j);
                                        int f_i = index4D(QUAD_DEPTH_SIMD, 3, 3, m, k, kr, kc); // FIXME: hardcoding
                                        m_dataout[do_i] += (m_inputMap[di_i] + m_filters3x3[f_i]);
                                    }
                                }
                            }
                        }
                        fixedPoint::SetParam(32, 28, 16, 14, m_dataout[do_i]);
                        m_dataout[do_i] = (m_dataout[m] < 0) ? m_dataout[m] * leakyScaleValue : m_dataout[m] * one;
                        fixedPoint::SetParam(32, 28, 16, 14, m_dataout[do_i]);
                    }
                }
            }
        },
        t * m_num_3x3_kernels_cfg / nthreads,
        (t + 1) == nthreads ? m_num_3x3_kernels_cfg : (t + 1) * m_num_3x3_kernels_cfg / nthreads,
        t));
	}
	for_each(threads.begin(), threads.end(), [](std::thread& x){x.join(); });
}
