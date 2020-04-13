#include "FAS.hpp"
using namespace sc_core;
using namespace sc_dt;
using namespace std;
using namespace tlm;
using namespace tlm_utils;


FAS::~FAS() { }


void FAS::ctrl_process()
{
    string str;
    while(true)
    {
        wait();
        switch(m_state)
        {
            case ST_IDLE:
            {
                wait(m_start);
                m_start_ack.notify();
                m_state = ST_CFG_START_AWP;
                break;
            }
            case ST_CFG_START_AWP:
            {
                b_cfg_Accel();
                m_state = ST_ACTIVE;
                break;
            }
            case ST_ACTIVE:
            {
                if(
                    m_partMapFetchCount == m_partMapFetchTotal_cfg
                    && m_inMapFetchCount == m_inMapFetchTotal_cfg
                    // && m_krnl1x1FetchCount == m_krnl1x1FetchTotal_cfg
                    && m_resMapFetchCount == m_resMapFetchTotal_cfg
                    && m_last_CO_recvd
                ) {
                    m_state = ST_WAIT_LAST_WRITE;
                }
                break;
            }
            case ST_WAIT_LAST_WRITE:
            {
                if(m_last_wrt)
                {
                    m_last_wrt = false;
                    m_last_CO_recvd = false;
                    m_state = ST_SEND_COMPLETE;
                }
                break;
            }
            case ST_SEND_COMPLETE:
            {
                bool all_complete = true;
                for(int i = 0; i < m_AWP_complt_arr.size(); i++)
                {
                    if(m_FAS_cfg->m_AWP_en_arr[i] && !m_AWP_complt_arr[i])
                    {
                        all_complete = false;
                        break;
                    }
                }
                if(all_complete)
                {
                    for (int i = 0; i < MAX_AWP_PER_FAS; i++)
                    {
                        m_AWP_complt_arr[i] = false;
                    }
                    m_complete.notify();
                    str = "[" + string(name()) + "]: sent complete\n";
                    cout << str;
                    wait(m_complete_ack);
                    m_state                     = ST_IDLE;
                    m_krnl3x3FetchCount			= 0;
                    m_krnl3x3BiasFetchCount		= 0;
                    m_partMapFetchCount			= 0;
                    m_inMapFetchCount			= 0;
                    m_krnl1x1FetchCount			= 0;
                    m_krnl1x1BiasFetchCount     = 0;
                    m_resMapFetchCount			= 0;
                    m_outMapStoreCount     		= 0;
                }
                break;
            }
        };
    }
}


void FAS::F_process()
{
    tlm::tlm_generic_payload* trans;
    sc_time delay;
    while(true)
    {
        wait();
        if(m_state == ST_ACTIVE && !m_first_depth_iter_cfg && m_partMap_fifo.size() <= PM_LOW_WATERMARK && m_partMapFetchCount != m_partMapFetchTotal_cfg)
        {
            trans = nb_createTLMTrans(
                m_mem_mng,
                0,
                TLM_READ_COMMAND,
                nullptr,
                (PM_NUM_PIX_READ * PIXEL_SIZE),
                0,
                nullptr,
                false,
                TLM_INCOMPLETE_RESPONSE
            );
            m_sys_mem_bus_sema.wait();
            sys_mem_init_soc->b_transport(*trans, delay);
            m_sys_mem_bus_sema.post();
            trans->release();
            b_fifo_trans(PARTMAP_FIFO, FIFO_WRITE, PM_FIFO_DEPTH, PM_NUM_PIX_READ, PM_FIFO_WR_WIDTH);
            m_partMapFetchCount += (PM_NUM_PIX_READ * PIXEL_SIZE);
        }
    }
}


void FAS::A_process()
{
    while(true)
    {
        wait();
        if(m_state == ST_ACTIVE
            && m_first_depth_iter_cfg
            && m_do_kernel1x1_cfg
            && m_convOutMap_fifo.size() > 0
            && m_partMap_fifo.size() > 0
        ) {
            // pop convOut map, pop partial map
            b_fifo_trans(CONVOUTMAP_FIFO, FIFO_READ, CO_FIFO_DEPTH, CO_NUM_PIX_READ, CO_FIFO_RD_WIDTH);
            b_fifo_trans(PARTMAP_FIFO, FIFO_READ, PM_FIFO_DEPTH, PM_NUM_PIX_READ, PM_FIFO_RD_WIDTH);
            // add convOut and partial map, pop 1x1 kernel
            b_fifo_trans(KRNL_1X1_FIFO, FIFO_READ, KRNL_1X1_FIFO_DEPTH, KRNL_1x1_NUM_PIX_READ, KRNL_1x1_FIFO_RD_WIDTH);
            // multiply sum with 1x1
            wait();
            // store to buffer
            if(m_num_ob_wr == OB_FIFO_WR_WIDTH)
            {
                m_num_ob_wr = 0;
                m_wr_outBuf.notify();
            }
            else
            {
                m_num_ob_wr++;
            }
        }
        else if(m_state == ST_ACTIVE
            && !m_first_depth_iter_cfg
            && m_do_kernel1x1_cfg
            && m_convOutMap_fifo.size() > 0
            && m_partMap_fifo.size() > 0
        ) {
            // pop convOut map, pop 1x1 fifo
            b_fifo_trans(PARTMAP_FIFO, FIFO_READ, PM_FIFO_DEPTH, PM_NUM_PIX_READ, PM_FIFO_RD_WIDTH);
            b_fifo_trans(KRNL_1X1_FIFO, FIFO_READ, KRNL_1X1_FIFO_DEPTH, KRNL_1x1_NUM_PIX_READ, KRNL_1x1_FIFO_RD_WIDTH);
            // pop partial map, multiply convOut map with 1x1
            b_fifo_trans(PARTMAP_FIFO, FIFO_READ, PM_FIFO_DEPTH, CO_NUM_PIX_READ, CO_FIFO_RD_WIDTH);
            // add convOut and partial map 1x1 product
            wait();
            // store to buffer
            if(m_num_ob_wr == OB_FIFO_WR_WIDTH)
            {
                m_num_ob_wr = 0;
                m_wr_outBuf.notify();
            }
            else
            {
                m_num_ob_wr++;
            }
        }
        else if(m_state == ST_ACTIVE
            && !m_first_depth_iter_cfg
            && m_convOutMap_fifo.size() > 0
            && m_partMap_fifo.size() > 0
        ) {
            // pop convOut map, pop partial map
            b_fifo_trans(CONVOUTMAP_FIFO, FIFO_READ, CO_FIFO_DEPTH, CO_NUM_PIX_READ, CO_FIFO_RD_WIDTH);
            b_fifo_trans(PARTMAP_FIFO, FIFO_READ, PM_FIFO_DEPTH, PM_NUM_PIX_READ, PM_FIFO_RD_WIDTH);
            // accum
            wait();
            // store to buffer
            m_wr_outBuf.notify();
        }
        else if(m_state == ST_ACTIVE
            && m_last_depth_iter_cfg
            && m_do_res_layer_cfg
            && m_convOutMap_fifo.size() > 0
            && m_partMap_fifo.size() > 0
            && m_resMap_fifo.size() > 0
        ) {
            // pop convOut map, pop partial map, pop res map
            b_fifo_trans(CONVOUTMAP_FIFO, FIFO_READ, CO_FIFO_DEPTH, CO_NUM_PIX_READ, CO_FIFO_RD_WIDTH);
            b_fifo_trans(PARTMAP_FIFO, FIFO_READ, PM_FIFO_DEPTH, PM_NUM_PIX_READ, PM_FIFO_RD_WIDTH);
            b_fifo_trans(RESMAP_FIFO, FIFO_READ, RSM_FIFO_DEPTH, RSM_NUM_PIX_READ, RSM_FIFO_RD_WIDTH);
            // add convOut map, partial map, and residual map pixel
            wait();
            // store to buffer
            m_wr_outBuf.notify();
        }
    }
}


void FAS::outBuf_wr_process()
{
    while(true)
    {
        wait(m_wr_outBuf);
        wait();
        cout << "here" << endl;
        b_fifo_trans(OUTBUF_FIFO, FIFO_WRITE, OB_FIFO_DEPTH, OB_NUM_PIX_WRITE, OB_FIFO_WR_WIDTH);
        wait();
    }
}


void FAS::S_process()
{
    tlm::tlm_generic_payload* trans;
    sc_time delay;
    while(true)
    {
        wait();
        if((m_state == ST_ACTIVE && m_outBuf_fifo.size() >= m_outMapStoreFactor_cfg)
            || (m_state == ST_WAIT_LAST_WRITE && m_outBuf_fifo.size() > 0)
        ) {
            string str =
                "[" + string(name()) + "]" + " is doing an Output Buffer write at " + sc_time_stamp().to_string() + "\n";
            cout << str;
            b_fifo_trans(OUTBUF_FIFO, FIFO_READ, OB_FIFO_DEPTH, m_outMapStoreFactor_cfg, OB_FIFO_RD_WIDTH);
            trans = nb_createTLMTrans(
                m_mem_mng,
                0,
                TLM_WRITE_COMMAND,
                nullptr,
                (m_outMapStoreFactor_cfg * PIXEL_SIZE),
                0,
                nullptr,
                false,
                TLM_INCOMPLETE_RESPONSE
            );
            m_sys_mem_bus_sema.wait();
            sys_mem_init_soc->b_transport(*trans, delay);
            m_sys_mem_bus_sema.post();
            trans->release();
            m_outMapStoreCount += (m_outMapStoreFactor_cfg * PIXEL_SIZE);
            if(m_state == ST_WAIT_LAST_WRITE && m_outMapStoreCount == m_outMapStoreTotal_cfg)
            {
                m_last_wrt = true;
                string str = "[" + string(name()) + "]:" + " finished last Output Buffer write at " + sc_time_stamp().to_string() + "\n";
                cout << str;
            }
        }
    }
}


void FAS::resMap_fetch_process()
{
    tlm::tlm_generic_payload* trans;
    sc_time delay;
    while(true)
    {
        wait();
        if(m_state == ST_ACTIVE && m_last_depth_iter_cfg && m_resMap_fifo.size() <= RSM_LOW_WATERMARK && m_resMapFetchCount != m_resMapFetchTotal_cfg)
        {
            trans = nb_createTLMTrans(
                m_mem_mng,
                0,
                TLM_READ_COMMAND,
                nullptr,
                (RSM_NUM_PIX_READ * PIXEL_SIZE),
                0,
                nullptr,
                false,
                TLM_INCOMPLETE_RESPONSE
            );
            m_sys_mem_bus_sema.wait();
            sys_mem_init_soc->b_transport(*trans, delay);
            m_sys_mem_bus_sema.post();
            trans->release();
            b_fifo_trans(RESMAP_FIFO, FIFO_WRITE, RSM_FIFO_DEPTH, RSM_NUM_PIX_WRITE, RSM_FIFO_WR_WIDTH);
            wait();
            m_resMapFetchCount += (RSM_NUM_PIX_READ * PIXEL_SIZE);
        }
    }
}


void FAS::job_fetch_process()
{
    tlm::tlm_generic_payload* trans;
    sc_time delay;
    while(true)
    {
        wait();
        if(m_trans_fifo.size() > 0)
        {
            trans = m_trans_fifo.front();
            m_trans_fifo.pop_front();
            Accel_Trans* accel_trans = (Accel_Trans*)trans->get_data_ptr();
            int AWP_id = accel_trans->AWP_id;
            int QUAD_id = accel_trans->QUAD_id;
            trans->release();
            int inMapFetchAmt = m_inMapFetchFactor_cfg * m_depthFetchAmt[AWP_id][QUAD_id] * PIXEL_SIZE;
            trans = nb_createTLMTrans(
                m_mem_mng,
                AWP_id,
                TLM_READ_COMMAND,
                nullptr,
                inMapFetchAmt,
                0,
                nullptr,
                false,
                TLM_INCOMPLETE_RESPONSE
            );
            m_sys_mem_bus_sema.wait();
            sys_mem_init_soc->b_transport(*trans, delay);
            m_sys_mem_bus_sema.post();
            trans->release();
            accel_trans = new Accel_Trans();
            accel_trans->accel_cmd = ACCL_CMD_JOB_FETCH;
            accel_trans->FAS_id = m_FAS_id;
            accel_trans->AWP_id = AWP_id;
            accel_trans->QUAD_id = QUAD_id;
            trans = nb_createTLMTrans(
                m_mem_mng,
                AWP_id,
                TLM_WRITE_COMMAND,
                (unsigned char*)accel_trans,
                inMapFetchAmt,
                0,
                nullptr,
                false,
                TLM_INCOMPLETE_RESPONSE
            );
            rout_init_soc->b_transport(*trans, delay);
            trans->release();
            m_inMapFetchCount += inMapFetchAmt;
        }
    }
}


void FAS::b_rout_soc_transport(tlm::tlm_generic_payload& trans, sc_time& delay)
{
    trans.acquire();
    Accel_Trans* accel_trans;
    accel_trans = (Accel_Trans*)trans.get_data_ptr();
    if(accel_trans->last_CO)
    {
        m_last_CO_recvd = accel_trans->last_CO;
        string str = "[" + string(name()) + "]: recieved last convolutional output\n";
        cout << str;
    }
    tlm_response_status status = TLM_OK_RESPONSE;
    switch (accel_trans->accel_cmd)
    {
        case ACCL_CMD_JOB_FETCH:
        {
            m_trans_fifo.push_back(&trans);
            break;
        }
        case ACCL_CMD_RESULT_WRITE:
        {
            b_result_write();
            trans.release();
            break;
        }
        case ACCL_CMD_JOB_COMPLETE:
        {
            m_AWP_complt_arr[accel_trans->AWP_id] = true;
            trans.release();
            break;
        }
    }
}


void FAS::b_result_write()
{
    if(m_first_depth_iter_cfg)
    {
        b_fifo_trans(OUTBUF_FIFO, FIFO_WRITE, OB_FIFO_DEPTH, RES_PKT_SIZE, OB_FIFO_WR_WIDTH);
    }
    else
    {
        b_fifo_trans(PARTMAP_FIFO, FIFO_WRITE, PM_FIFO_DEPTH, RES_PKT_SIZE, PM_FIFO_WR_WIDTH);
    }
}


void FAS::b_fifo_trans(fifo_sel_t fifo_sel, FAS::fifo_cmd_t fifo_cmd, int fifo_depth, int fifo_trans_size, int fifo_trans_width)
{
    switch(fifo_sel)
    {
        case PARTMAP_FIFO:
        {
            b_fifo_trans("Partial Map Fifo", m_partMap_fifo, fifo_cmd, fifo_depth, fifo_trans_size, fifo_trans_width);
            break;
        }
        case CONVOUTMAP_FIFO:
        {
            b_fifo_trans("Convolutional Map Output Fifo", m_convOutMap_fifo, fifo_cmd, fifo_depth, fifo_trans_size, fifo_trans_width);
            break;
        }
        case KRNL_1X1_FIFO:
        {
            b_fifo_trans("1x1 Kernel Fifo", m_krnl1x1_fifo, fifo_cmd, fifo_depth, fifo_trans_size, fifo_trans_width);
            break;
        }
        case RESMAP_FIFO:
        {
            b_fifo_trans("Residual Map Fifo", m_resMap_fifo, fifo_cmd, fifo_depth, fifo_trans_size, fifo_trans_width);
            break;
        }
        case OUTBUF_FIFO:
        {
            b_fifo_trans("Output Buffer Fifo", m_outBuf_fifo, fifo_cmd, fifo_depth, fifo_trans_size, fifo_trans_width);
            break;
        }
    }
}


void FAS::b_fifo_trans(string fifo_name, deque<int>& fifo, FAS::fifo_cmd_t fifo_cmd, int fifo_depth, int fifo_trans_size, int fifo_trans_width)
{
    for (int i = 0; i < fifo_trans_size; i += fifo_trans_width)
    {
        for (int j = 0; j < fifo_trans_width; j++)
        {
            switch (fifo_cmd)
            {
                case FAS::FIFO_READ:
                {
                    if(fifo.size() == 0) break;
                    fifo.pop_front();
                    break;
                }
                case FAS::FIFO_WRITE:
                {
                    if(fifo.size() == fifo_depth)
                    {
                        string str =
                            "[" + fifo_name + "]: is full\n";
                        cout << str;
                        sc_stop();
                        return;
                    }
                    fifo.push_back(int());
                    break;
                }
            }
        }
        wait();
    }
}


void FAS::b_cfg_Accel()
{
    b_getCfgData();
    b_cfg1x1Kernels();
    b_sendCfgs();
}


void FAS::b_getCfgData()
{
    wait(clk.posedge_event());
    m_first_depth_iter_cfg 			= m_FAS_cfg->m_first_depth_iter;
    m_last_depth_iter_cfg 			= m_FAS_cfg->m_last_depth_iter;
    m_do_res_layer_cfg 				= m_FAS_cfg->m_do_res_layer;
    // m_do_kernel1x1_cfg              = m_FAS_cfg->m_do_kernels1x1;
    m_pixSeqCfgFetchTotal_cfg		= m_FAS_cfg->m_pixSeqCfgFetchTotal;
    m_inMapFetchTotal_cfg    		= m_FAS_cfg->m_inMapFetchTotal;
    m_krnl3x3FetchTotal_cfg     	= m_FAS_cfg->m_krnl3x3FetchTotal;
    m_krnl3x3BiasFetchTotal_cfg		= m_FAS_cfg->m_krnl3x3BiasFetchTotal;
    m_partMapFetchTotal_cfg			= m_FAS_cfg->m_partMapFetchTotal;
    m_krnl1x1FetchTotal_cfg    		= m_FAS_cfg->m_krnl1x1FetchTotal;
    m_krnl1x1BiasFetchTotal_cfg		= m_FAS_cfg->m_krnl1x1BiasFetchTotal;
    m_num_1x1_kernels_cfg           = m_FAS_cfg->m_num_1x1_kernels;
    m_resMapFetchTotal_cfg  		= m_FAS_cfg->m_resMapFetchTotal;
    m_outMapStoreTotal_cfg          = m_FAS_cfg->m_outMapStoreTotal;
    m_inMapFetchFactor_cfg          = m_FAS_cfg->m_inMapFetchFactor;
    m_outMapStoreFactor_cfg         = m_FAS_cfg->m_outMapStoreFactor;
    string str =
        "[" + string(name()) + "]" + " Configured with.......\n" + ""
        "\tFirst depth iter:                            "   + to_string(m_first_depth_iter_cfg)         + "\n"
        "\tLast depth iter:                             "   + to_string(m_last_depth_iter_cfg)          + "\n"
        "\tDo Residual layer:                           "   + to_string(m_do_res_layer_cfg)             + "\n"
        "\tDo Kernel 1x1:                               "   + to_string(m_do_kernel1x1_cfg)             + "\n"
        "\tNum 1x1 Kernels:                             "   + to_string(m_num_1x1_kernels_cfg)          + "\n"
        "\tPixel Sequence Configuration Fetch Total:    "	+ to_string(m_pixSeqCfgFetchTotal_cfg)      + "\n"
        "\tInput Map Fetch Total:                       "   + to_string(m_inMapFetchTotal_cfg)          + "\n"
        "\tInput Map Fetch Factor:                      "   + to_string(m_inMapFetchFactor_cfg)         + "\n"
        "\tKernel 3x3 Fetch Total:                      "   + to_string(m_krnl3x3FetchTotal_cfg)        + "\n"
        "\tKernel 3x3 Bias Fetch Total:                 "   + to_string(m_krnl3x3BiasFetchTotal_cfg)    + "\n"
        "\tPartial Map Fetch Total:                     "   + to_string(m_partMapFetchTotal_cfg)        + "\n"
        "\tKernel 1x1 Fetch Total:                      "   + to_string(m_krnl1x1FetchTotal_cfg)        + "\n"
        "\tKernel 1x1 Bias Fetch Total:                 "   + to_string(m_krnl1x1BiasFetchTotal_cfg)    + "\n"
        "\tResidual Map Fetch Total:                    "   + to_string(m_resMapFetchTotal_cfg)         + "\n"
        "\tOutput Map Store Total:                      "   + to_string(m_outMapStoreTotal_cfg)         + "\n";
    cout << str;

    auto& AWP_cfg_arr = m_FAS_cfg->m_AWP_cfg_arr;
    for(int i = 0; i < MAX_AWP_PER_FAS; i++)
    {
        int num_QUAD_cfgd = 0;
        for(int j = 0; j < NUM_QUADS_PER_AWP; j++)
        {
            m_depthFetchAmt[i][j] = AWP_cfg_arr[i]->m_QUAD_cfg_arr[j]->m_inMapDepth;
            m_QUAD_en_arr[i][j] = AWP_cfg_arr[i]->m_QUAD_en_arr[j];
            if(m_QUAD_en_arr[i][j]) num_QUAD_cfgd++;
        }
        m_num_QUAD_cfgd[i] = num_QUAD_cfgd;
    }
}


void FAS::b_cfg1x1Kernels()
{
    int krnl_1x1_depth = MAX_3x3_KERNELS;
    wait(MAX_1x1_KERNELS * krnl_1x1_depth, SC_NS);
    for (int i = 0; i <(krnl_1x1_depth); i++)
    {
        m_krnl1x1_fifo.push_back(int());
    }
    m_krnl1x1FetchCount += (krnl_1x1_depth * PIXEL_SIZE);
}


void FAS::b_sendCfgs()
{
    for (int i = 0; i < MAX_AWP_PER_FAS; i++)
    {
        if(!m_FAS_cfg->m_AWP_en_arr[i])
        {
            continue;
        }
        for (int j = 0; j < NUM_QUADS_PER_AWP; j++)
        {
            if(!m_QUAD_en_arr[i][j])
            {
                continue;
            }
            b_QUAD_config(i, j);
            b_QUAD_pix_seq_config(i, j);
            b_QUAD_krnl_config(i, j);
        }
    }
    for (int i = 0; i < MAX_AWP_PER_FAS; i++)
    {
        if(!m_FAS_cfg->m_AWP_en_arr[i])
        {
            continue;
        }
        for (int j = 0; j < NUM_QUADS_PER_AWP; j++)
        {
            if(!m_QUAD_en_arr[i][j])
            {
                continue;
            }
            b_QUAD_job_start(i, j);
        }
    }
}


void FAS::b_QUAD_config(int AWP_addr, int QUAD_addr)
{
    wait(clk->posedge_event());
    sc_time delay;
    tlm::tlm_generic_payload* trans;
    auto& QUAD_cfg 							= m_FAS_cfg->m_AWP_cfg_arr[AWP_addr]->m_QUAD_cfg_arr[QUAD_addr];
    Accel_Trans* accel_trans				= new Accel_Trans();
    accel_trans->accel_cmd					= ACCL_CMD_CFG_WRITE;
    accel_trans->QUAD_id					= QUAD_addr;
    accel_trans->FAS_id						= m_FAS_id;
    accel_trans->num_QUADS_cfgd				= m_num_QUAD_cfgd[AWP_addr];
    accel_trans->num_output_cols_cfg		= QUAD_cfg->m_num_output_cols;
    accel_trans->num_output_rows_cfg		= QUAD_cfg->m_num_output_rows;
    accel_trans->num_kernels_cfg			= QUAD_cfg->m_num_kernels;
    accel_trans->master_QUAD_cfg			= QUAD_cfg->m_master_QUAD;
    accel_trans->cascade_cfg				= QUAD_cfg->m_cascade;
    accel_trans->num_expd_input_cols_cfg	= QUAD_cfg->m_num_expd_input_cols;
    accel_trans->num_expd_input_rows_cfg    = QUAD_cfg->m_num_expd_input_rows;
    accel_trans->conv_out_fmt0_cfg			= true;
    accel_trans->padding_cfg				= QUAD_cfg->m_padding;
    accel_trans->upsample_cfg				= QUAD_cfg->m_upsample;
    accel_trans->stride_cfg                 = QUAD_cfg->m_stride;
    accel_trans->crpd_input_row_start_cfg	= QUAD_cfg->m_crpd_input_row_start;
    accel_trans->crpd_input_row_end_cfg		= QUAD_cfg->m_crpd_input_row_end;
    trans = nb_createTLMTrans(
        m_mem_mng,
        AWP_addr,
        TLM_IGNORE_COMMAND,
        (unsigned char*)accel_trans,
        0,
        0,
        nullptr,
        false,
        TLM_INCOMPLETE_RESPONSE
    );
    wait(clk->posedge_event());
    rout_init_soc->b_transport(*trans, delay);
    trans->release();
}


void FAS::b_QUAD_pix_seq_config(int AWP_addr, int QUAD_addr)
{
    wait(clk->posedge_event());
    sc_time delay;
    tlm::tlm_generic_payload* trans;
    Accel_Trans* accel_trans = new Accel_Trans();
    accel_trans->accel_cmd = ACCL_CMD_PIX_SEQ_CFG_WRITE;
    accel_trans->QUAD_id = QUAD_addr;
    accel_trans->FAS_id = m_FAS_id;
    trans = nb_createTLMTrans(
        m_mem_mng,
        AWP_addr,
        TLM_IGNORE_COMMAND,
        (unsigned char*)accel_trans,
        0,
        0,
        nullptr,
        false,
        TLM_INCOMPLETE_RESPONSE
    );
    wait(clk->posedge_event());
    rout_init_soc->b_transport(*trans, delay);
    trans->release();
}


void FAS::b_QUAD_krnl_config(int AWP_addr, int QUAD_addr)
{
    wait(clk->posedge_event());
    sc_time delay;
    tlm::tlm_generic_payload* trans;
    Accel_Trans* accel_trans = new Accel_Trans();
    accel_trans->accel_cmd = ACCL_CMD_KRL_CFG_WRITE;
    accel_trans->QUAD_id = QUAD_addr;
    accel_trans->FAS_id = m_FAS_id;
    // TODO: fetch from memory
    trans = nb_createTLMTrans(
        m_mem_mng,
        AWP_addr,
        TLM_IGNORE_COMMAND,
        (unsigned char*)accel_trans,
        0,
        0,
        nullptr,
        false,
        TLM_INCOMPLETE_RESPONSE
    );
    wait(clk->posedge_event());
    rout_init_soc->b_transport(*trans, delay);
    trans->release();
}


void FAS::b_QUAD_job_start(int AWP_addr, int QUAD_addr)
{
    wait(clk->posedge_event());
    sc_time delay;
    tlm::tlm_generic_payload* trans;
    Accel_Trans* accel_trans = new Accel_Trans();
    accel_trans->accel_cmd = ACCL_CMD_JOB_START;
    accel_trans->QUAD_id = QUAD_addr;
    accel_trans->FAS_id = m_FAS_id;
    trans = nb_createTLMTrans(
        m_mem_mng,
        AWP_addr,
        TLM_IGNORE_COMMAND,
        (unsigned char*)accel_trans,
        0,
        0,
        nullptr,
        false,
        TLM_INCOMPLETE_RESPONSE
    );
    wait(clk->posedge_event());
    rout_init_soc->b_transport(*trans, delay);
    trans->release();
}
