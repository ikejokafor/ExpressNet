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
                wait();
                m_start_ack.notify();
                m_state = ST_CFG_START_AWP;
                break;
            }
            case ST_CFG_START_AWP:
            {
                b_cfg_Accel();
                b_start_QUADs();
                m_state = ST_ACTIVE;
                break;
            }
            case ST_ACTIVE:
            {
                if(
                    m_partMapFetchCount == m_partMapFetchTotal_cfg
                    && m_inMapFetchCount == m_inMapFetchTotal_cfg
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
                    for(int i = 0; i < MAX_AWP_PER_FAS; i++)
                    {
                        m_AWP_complt_arr[i] = false;
                    }
                    wait();
                    m_complete.notify();
                    str = "[" + string(name()) + "]: sent complete\n";
                    cout << str;
                    wait(m_complete_ack);
                    m_state                     = ST_IDLE;
                    m_krnl3x3FetchCount         = 0;
                    m_krnl3x3BiasFetchCount     = 0;
                    m_partMapFetchCount         = 0;
                    m_inMapFetchCount           = 0;
                    m_krnl1x1FetchCount         = 0;
                    m_krnl1x1BiasFetchCount     = 0;
                    m_resMapFetchCount          = 0;
                    m_outMapStoreCount          = 0;
                    m_ob_dwc                    = 0;
                    m_dpth_count                = 0;
                    m_krnl_count                = 0;
                    m_krnl_1x1_bram_sz          = 0;
                    m_krnl_1x1_bias_bram_sz     = 0;
                }
                break;
            }
        };
    }
}


void FAS::job_fetch_process()
{
    // FIXME:   you are fetching the ROWS * DEPTH where DEPTH is the total depth for this iteration
    //              but instead bc of the way the data is coming in, you are loading the QUADs in
    //              in round robin order instead of loading QUAD0 completely, then the next quad and next quad
    //              shouldnt affect model accuracy.
    tlm::tlm_generic_payload* trans;
    sc_time delay;
    while(true)
    {
        wait();
        bool convOut_bram_wr = (m_do_kernels1x1_cfg || m_do_res_layer_cfg) && m_convOutMap_bram_sz < m_co_high_watermark_cfg;
        bool outBuf_fifo_wr = !m_do_kernels1x1_cfg && !m_do_res_layer_cfg;
        if(m_trans_fifo.size() > 0 && (convOut_bram_wr || outBuf_fifo_wr))
        {
            trans = m_trans_fifo.front();
            m_trans_fifo.pop_front();
            Accel_Trans* accel_trans = (Accel_Trans*)trans->get_data_ptr();
            int AWP_id = accel_trans->AWP_id;
            int QUAD_id = accel_trans->QUAD_id;
            trans->release();
            int inMapFetchAmt = m_inMapFetchFactor_cfg * m_inMapDepthFetchAmt[AWP_id][QUAD_id] * PIXEL_SIZE;
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
            wait(clk->posedge_event());
            rout_init_soc->b_transport(*trans, delay);
            trans->release();
            m_inMapFetchCount += inMapFetchAmt;
        }
    }
}


void FAS::result_write_process()
{
    string str;
    while(true)
    {
        wait(m_result_write.default_event());
        wait();
        int numWr = m_res_pkt_size.front();
        m_res_pkt_size.pop_front();
        if(m_first_depth_iter_cfg && !m_do_kernels1x1_cfg && !m_do_res_layer_cfg)
        {
            if(m_outBuf_fifo_sz == OB_FIFO_DEPTH)
            {
                str = "m_outBuf_fifo is full\n";
                cout << str;
                sc_stop();
                return;
            }
            m_outBuf_fifo_sz += numWr;
        }
        else
        {
            if(m_convOutMap_bram_sz == CO_BRAM_DEPTH)
            {
                str = "m_convOutMap_bram_sz is full\n";
                cout << str;
                sc_stop();
                return;
            }
            m_convOutMap_bram_sz += numWr;
        }
    }
}


void FAS::F_process()
{
    tlm::tlm_generic_payload* trans;
    sc_time delay;
    while(true)
    {
        wait();
        if(m_state == ST_ACTIVE && !m_first_depth_iter_cfg && m_partMap_fifo_sz <= PM_LOW_WATERMARK && m_partMapFetchCount != m_partMapFetchTotal_cfg)
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
            m_partMap_fifo_sz += PM_NUM_PIX_READ;
            m_partMapFetchCount += (PM_NUM_PIX_READ * PIXEL_SIZE);
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
        if(m_state == ST_ACTIVE && m_first_depth_iter_cfg && m_resMap_fifo_sz <= RM_LOW_WATERMARK && m_resMapFetchCount != m_resMapFetchTotal_cfg)
        {
            trans = nb_createTLMTrans(
                m_mem_mng,
                0,
                TLM_READ_COMMAND,
                nullptr,
                (RM_NUM_PIX_READ * PIXEL_SIZE),
                0,
                nullptr,
                false,
                TLM_INCOMPLETE_RESPONSE
            );
            m_sys_mem_bus_sema.wait();
            sys_mem_init_soc->b_transport(*trans, delay);
            m_sys_mem_bus_sema.post();
            trans->release();
            m_resMap_fifo_sz += RM_NUM_PIX_READ;
            m_resMapFetchCount += (RM_NUM_PIX_READ * PIXEL_SIZE);
        }
    }
}


void FAS::A_process()
{
    sc_time ONE_CYCLE(1 * CLK_PRD, SC_NS);
    sc_time TWO_CYCLES(2 * CLK_PRD, SC_NS);
    sc_time NINE_CYCLES(9 * CLK_PRD, SC_NS);
    string str;
    while(true)
    {
        wait();
        if(
            (m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE)
            && m_first_depth_iter_cfg
            && m_do_res_layer_cfg
            && m_do_kernels1x1_cfg
            && m_convOutMap_bram_sz > 0
            && m_partMap_fifo_sz > 0
            && m_resMap_fifo_sz > 0
        ) {
            // pop convOut map, pop partial map, pop res map
            m_convOut_bram_rd.notify(SC_ZERO_TIME);
            m_partMap_fifo_rd.notify(SC_ZERO_TIME);
            m_resMap_fifo_rd.notify(SC_ZERO_TIME);
            // add convOut map, partial map, and residual map pixel, pop 1x1 krnl
            m_krnl_1x1_bram_rd.notify(ONE_CYCLE);
            // MACC 1x1, pop 1x1 Bias
            m_krnl_1x1_bram_rd.notify(TWO_CYCLES);
            // Add bias


            m_outBuf_fifo_wr.notify(NINE_CYCLES);
        }
        else if(
            (m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE)
            && m_first_depth_iter_cfg
            && m_do_res_layer_cfg
            && m_convOutMap_bram_sz > 0
            && m_resMap_fifo_sz > 0
        ) {
            // pop convOut map, pop res map
            m_convOut_bram_rd.notify(SC_ZERO_TIME);
            m_resMap_fifo_rd.notify(SC_ZERO_TIME);
            // add convOut map and residual map pixel
            m_outBuf_fifo_wr.notify(TWO_CYCLES);
        }
        else if(
            (m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE)
            && m_first_depth_iter_cfg
            && m_do_kernels1x1_cfg
            && m_convOutMap_bram_sz >= CO_BRAM_RD_WIDTH
        ) {
            //  pop convOut map, pop 1x1 kernel; 1 cycle
            //  Multipy 1x1 and pop 1x1 Bias; 1 cycle
            //  Sum across depths 64 input adder tree latency = 6 cycles
            //  Add bias; 1 cycle
            //  Pipeline full in 9 cycles, 1 cycle per output
            if(m_dpth_count >= (m_krnl1x1Depth_cfg - CO_BRAM_RD_WIDTH))
            {
                m_dpth_count = 0;
                m_outBuf_fifo_wr.notify(NINE_CYCLES);
                if(m_krnl_count == (m_num_1x1_kernels_cfg - 1))
                {
                    m_convOutMap_bram_sz -= m_krnl1x1Depth_cfg;
                    m_krnl_count = 0;
                }
                else
                {
                    m_krnl_count++;
                }
            }
            else
            {
                m_dpth_count += CO_BRAM_RD_WIDTH;
            }
        }
        else if(
            (m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE)
            && !m_first_depth_iter_cfg
            && m_do_kernels1x1_cfg
            && m_convOutMap_bram_sz > 0
            && m_partMap_fifo_sz > 0
        ) {
            // pop convOut map, pop 1x1 fifo
            // pop partial map, multiply convOut map with 1x1
            // add convOut and partial map 1x1 product
        }
        else if(
            (m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE)
            && !m_first_depth_iter_cfg
            && m_convOutMap_bram_sz > 0
            && m_partMap_fifo_sz > 0
        ) {
            // pop convOut map, pop partial map
            // accum
        }
    }
}


void FAS::S_process()
{
    tlm::tlm_generic_payload* trans;
    sc_time delay;
    while(true)
    {
        wait();
        if(m_outBuf_fifo_sz >= m_outMapStoreFactor_cfg && (m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE))
        {
            string str =
                "[" + string(name()) + "]" + " is doing an Output Buffer write at " + sc_time_stamp().to_string() + "\n";
            cout << str;
            // m_outBuf_fifo_rd.notify(SC_ZERO_TIME);
            m_outBuf_fifo_sz -= m_outMapStoreFactor_cfg;
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


void FAS::partMap_fifo_rd_process()
{
    while(true)
    {
        wait(m_partMap_fifo_rd.default_event());
        m_partMap_fifo_sz -= PM_FIFO_RD_WIDTH;
    }
}


void FAS::resMap_fifo_rd_process()
{
    while(true)
    {
        wait(m_resMap_fifo_rd.default_event());
        m_resMap_fifo_sz -= RM_FIFO_RD_WIDTH;
    }
}


void FAS::outBuf_fifo_wr_process()
{
    while(true)
    {
        wait(m_outBuf_fifo_wr.default_event());
        if(m_ob_dwc == (OB_FIFO_WR_WIDTH - 1))
        {
            m_ob_dwc = 0;
            m_outBuf_fifo_sz += OB_FIFO_WR_WIDTH;
        }
        else
        {
            m_ob_dwc++;
        }
    }
}


void FAS::outBuf_fifo_rd_process()
{
    while(true)
    {
        wait(m_outBuf_fifo_rd.default_event());
        m_outBuf_fifo_sz -= OB_FIFO_RD_WIDTH;
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
            m_res_pkt_size.push_back(accel_trans->res_pkt_size);
            m_result_write.notify(SC_ZERO_TIME);
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


void FAS::b_cfg_Accel()
{
    b_getCfgData();
    b_cfg1x1Kernels();
    b_sendCfgs();
}


void FAS::b_getCfgData()
{
    wait(clk.posedge_event());
    m_first_depth_iter_cfg          = m_FAS_cfg->m_first_depth_iter;
    m_do_res_layer_cfg              = m_FAS_cfg->m_do_res_layer;
    m_do_kernels1x1_cfg             = m_FAS_cfg->m_do_kernels1x1;
    m_pixSeqCfgFetchTotal_cfg       = m_FAS_cfg->m_pixSeqCfgFetchTotal;
    m_inMapFetchTotal_cfg           = m_FAS_cfg->m_inMapFetchTotal;
    m_krnl3x3FetchTotal_cfg         = m_FAS_cfg->m_krnl3x3FetchTotal;
    m_krnl3x3BiasFetchTotal_cfg     = m_FAS_cfg->m_krnl3x3BiasFetchTotal;
    m_partMapFetchTotal_cfg         = m_FAS_cfg->m_partMapFetchTotal;
    m_krnl1x1FetchTotal_cfg         = m_FAS_cfg->m_krnl1x1FetchTotal;
    m_krnl1x1BiasFetchTotal_cfg     = m_FAS_cfg->m_krnl1x1BiasFetchTotal;
    m_krnl1x1Depth_cfg              = m_FAS_cfg->m_krnl1x1Depth;
    m_num_1x1_kernels_cfg           = m_FAS_cfg->m_num_1x1_kernels;
    m_resMapFetchTotal_cfg          = m_FAS_cfg->m_resMapFetchTotal;
    m_outMapStoreTotal_cfg          = m_FAS_cfg->m_outMapStoreTotal;
    m_inMapFetchFactor_cfg          = m_FAS_cfg->m_inMapFetchFactor;
    m_outMapStoreFactor_cfg         = m_FAS_cfg->m_outMapStoreFactor;
    m_krnl1x1Addr_cfg               = m_FAS_cfg->m_krnl1x1Addr;
    m_krnl1x1BiasAddr_cfg           = m_FAS_cfg->m_krnl1x1BiasAddr;
    m_pixelSeqAddr_cfg              = m_FAS_cfg->m_pixelSeqAddr;
    m_partMapAddr_cfg               = m_FAS_cfg->m_partMapAddr;
    m_resMapAddr_cfg                = m_FAS_cfg->m_resMapAddr;
    m_outMapAddr_cfg                = m_FAS_cfg->m_outMapAddr;
    m_inMapAddrArr                  = m_FAS_cfg->m_inMapAddrArr;
    m_krnl3x3AddrArr                = m_FAS_cfg->m_krnl3x3AddrArr;
    m_krnl3x3BiasAddrArr            = m_FAS_cfg->m_krnl3x3BiasAddrArr;
    m_co_high_watermark_cfg         = m_FAS_cfg->m_co_high_watermark;

    string str =
        "[" + string(name()) + "]" + " Configured with.......\n"
        "\tFirst depth iter:                            "  + to_string(m_first_depth_iter_cfg)         + "\n"
        "\tDo Residual layer:                           "  + to_string(m_do_res_layer_cfg)             + "\n"
        "\tDo Kernel 1x1:                               "  + to_string(m_do_kernels1x1_cfg)            + "\n"
        "\tNum 1x1 Kernels:                             "  + to_string(m_num_1x1_kernels_cfg)          + "\n"
        "\tKernel 1x1 Depth:                            "  + to_string(m_krnl1x1Depth_cfg)             + "\n"
        "\tPixel Sequence Configuration Fetch Total:    "  + to_string(m_pixSeqCfgFetchTotal_cfg)      + "\n"
        "\tInput Map Fetch Total:                       "  + to_string(m_inMapFetchTotal_cfg)          + "\n"
        "\tInput Map Fetch Factor:                      "  + to_string(m_inMapFetchFactor_cfg)         + "\n"
        "\tKernel 3x3 Fetch Total:                      "  + to_string(m_krnl3x3FetchTotal_cfg)        + "\n"
        "\tKernel 3x3 Bias Fetch Total:                 "  + to_string(m_krnl3x3BiasFetchTotal_cfg)    + "\n"
        "\tPartial Map Fetch Total:                     "  + to_string(m_partMapFetchTotal_cfg)        + "\n"
        "\tKernel 1x1 Fetch Total:                      "  + to_string(m_krnl1x1FetchTotal_cfg)        + "\n"
        "\tKernel 1x1 Bias Fetch Total:                 "  + to_string(m_krnl1x1BiasFetchTotal_cfg)    + "\n"
        "\tResidual Map Fetch Total:                    "  + to_string(m_resMapFetchTotal_cfg)         + "\n"
        "\tOutput Map Store Total:                      "  + to_string(m_outMapStoreTotal_cfg)         + "\n"
        "\tConvOut High Watermark:                      "  + to_string(m_co_high_watermark_cfg)        + "\n";
    cout << str;

    auto& AWP_cfg_arr = m_FAS_cfg->m_AWP_cfg_arr;
    for(int i = 0; i < MAX_AWP_PER_FAS; i++)
    {
        int num_QUAD_cfgd = 0;
        for(int j = 0; j < NUM_QUADS_PER_AWP; j++)
        {
            m_inMapDepthFetchAmt[i][j] = AWP_cfg_arr[i]->m_QUAD_cfg_arr[j]->m_inMapDepth;
            m_QUAD_en_arr[i][j] = AWP_cfg_arr[i]->m_QUAD_en_arr[j];
            if(m_QUAD_en_arr[i][j]) num_QUAD_cfgd++;
        }
        m_num_QUAD_cfgd[i] = num_QUAD_cfgd;
    }
}


void FAS::b_cfg1x1Kernels()
{
    int krnl_1x1_depth = MAX_3x3_KERNELS;
    sc_time delay;
    tlm::tlm_generic_payload* trans;

    trans = nb_createTLMTrans(
        m_mem_mng,
        m_krnl1x1Addr_cfg,
        TLM_IGNORE_COMMAND,
        nullptr,
        m_krnl1x1FetchTotal_cfg,
        0,
        nullptr,
        false,
        TLM_INCOMPLETE_RESPONSE
    );
    m_sys_mem_bus_sema.wait();
    sys_mem_init_soc->b_transport(*trans, delay);
    m_sys_mem_bus_sema.post();
    trans->release();

    wait((int)ceil(m_krnl1x1FetchTotal_cfg / KRNL_1x1_BRAM_WR_WIDTH), SC_NS);

    trans = nb_createTLMTrans(
        m_mem_mng,
        m_krnl1x1BiasAddr_cfg,
        TLM_IGNORE_COMMAND,
        nullptr,
        m_krnl1x1BiasFetchTotal_cfg,
        0,
        nullptr,
        false,
        TLM_INCOMPLETE_RESPONSE
    );
    m_sys_mem_bus_sema.wait();
    sys_mem_init_soc->b_transport(*trans, delay);
    m_sys_mem_bus_sema.post();
    trans->release();

    wait((int)ceil(m_krnl1x1BiasFetchTotal_cfg / KRNL_1X1_BIAS_BRAM_WR_WIDTH), SC_NS);
}


void FAS::b_sendCfgs()
{
    for(int i = 0; i < MAX_AWP_PER_FAS; i++)
    {
        if(!m_FAS_cfg->m_AWP_en_arr[i])
        {
            continue;
        }
        for(int j = 0; j < NUM_QUADS_PER_AWP; j++)
        {
            if(!m_QUAD_en_arr[i][j])
            {
                continue;
            }
            b_QUAD_config(i, j);
            b_QUAD_pix_seq_config(i, j);
            b_QUAD_krnl3x3_config(i, j);
            b_QUAD_krnl3x3Bias_config(i, j);
        }
    }
}


void FAS::b_start_QUADs()
{
    for(int i = 0; i < MAX_AWP_PER_FAS; i++)
    {
        if(!m_FAS_cfg->m_AWP_en_arr[i])
        {
            continue;
        }
        for(int j = 0; j < NUM_QUADS_PER_AWP; j++)
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
    auto& QUAD_cfg                          = m_FAS_cfg->m_AWP_cfg_arr[AWP_addr]->m_QUAD_cfg_arr[QUAD_addr];
    Accel_Trans* accel_trans                = new Accel_Trans();
    accel_trans->accel_cmd                  = ACCL_CMD_CFG_WRITE;
    accel_trans->QUAD_id                    = QUAD_addr;
    accel_trans->FAS_id                     = m_FAS_id;
    accel_trans->num_QUADS_cfgd             = m_num_QUAD_cfgd[AWP_addr];
    accel_trans->num_output_cols_cfg        = QUAD_cfg->m_num_output_cols;
    accel_trans->num_output_rows_cfg        = QUAD_cfg->m_num_output_rows;
    accel_trans->num_kernels_cfg            = QUAD_cfg->m_num_kernels;
    accel_trans->master_QUAD_cfg            = QUAD_cfg->m_master_QUAD;
    accel_trans->cascade_cfg                = QUAD_cfg->m_cascade;
    accel_trans->num_expd_input_cols_cfg    = QUAD_cfg->m_num_expd_input_cols;
    accel_trans->num_expd_input_rows_cfg    = QUAD_cfg->m_num_expd_input_rows;
    accel_trans->conv_out_fmt0_cfg          = true;
    accel_trans->padding_cfg                = QUAD_cfg->m_padding;
    accel_trans->upsample_cfg               = QUAD_cfg->m_upsample;
    accel_trans->stride_cfg                 = QUAD_cfg->m_stride;
    accel_trans->crpd_input_row_start_cfg   = QUAD_cfg->m_crpd_input_row_start;
    accel_trans->crpd_input_row_end_cfg     = QUAD_cfg->m_crpd_input_row_end;
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
    trans = nb_createTLMTrans(
        m_mem_mng,
        m_pixelSeqAddr_cfg,
        TLM_IGNORE_COMMAND,
        nullptr,
        PIXEL_SEQUENCE_SIZE,
        0,
        nullptr,
        false,
        TLM_INCOMPLETE_RESPONSE
    );
    m_sys_mem_bus_sema.wait();
    sys_mem_init_soc->b_transport(*trans, delay);
    m_sys_mem_bus_sema.post();
    trans->release();
    Accel_Trans* accel_trans = new Accel_Trans();
    accel_trans->accel_cmd = ACCL_CMD_PIX_SEQ_CFG_WRITE;
    accel_trans->AWP_id = AWP_addr;
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


void FAS::b_QUAD_krnl3x3_config(int AWP_addr, int QUAD_addr)
{
    wait(clk->posedge_event());
    sc_time delay;
    tlm::tlm_generic_payload* trans;
    trans = nb_createTLMTrans(
        m_mem_mng,
        m_krnl3x3AddrArr[AWP_addr][QUAD_addr],
        TLM_IGNORE_COMMAND,
        nullptr,
        m_krnl3x3BiasFetchTotal_cfg,
        0,
        nullptr,
        false,
        TLM_INCOMPLETE_RESPONSE
    );
    m_sys_mem_bus_sema.wait();
    sys_mem_init_soc->b_transport(*trans, delay);
    m_sys_mem_bus_sema.post();
    trans->release();
    Accel_Trans* accel_trans = new Accel_Trans();
    accel_trans->accel_cmd = ACCL_CMD_KRL3x3_CFG_WRITE;
    accel_trans->AWP_id = AWP_addr;
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


void FAS::b_QUAD_krnl3x3Bias_config(int AWP_addr, int QUAD_addr)
{
    wait(clk->posedge_event());
    sc_time delay;
    tlm::tlm_generic_payload* trans;
    trans = nb_createTLMTrans(
        m_mem_mng,
        m_krnl3x3BiasAddrArr[AWP_addr][QUAD_addr],
        TLM_IGNORE_COMMAND,
        nullptr,
        m_krnl3x3BiasFetchTotal_cfg,
        0,
        nullptr,
        false,
        TLM_INCOMPLETE_RESPONSE
    );
    m_sys_mem_bus_sema.wait();
    sys_mem_init_soc->b_transport(*trans, delay);
    m_sys_mem_bus_sema.post();
    trans->release();
    Accel_Trans* accel_trans = new Accel_Trans();
    accel_trans->accel_cmd = ACCL_CMD_KRL3x3BIAS_CFG_WRITE;
    accel_trans->AWP_id = AWP_addr;
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


void FAS::b_QUAD_job_start(int AWP_addr, int QUAD_addr)
{
    wait(clk->posedge_event());
    sc_time delay;
    tlm::tlm_generic_payload* trans;
    Accel_Trans* accel_trans = new Accel_Trans();
    accel_trans->accel_cmd = ACCL_CMD_JOB_START;
    accel_trans->AWP_id = AWP_addr;
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
