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
                    m_num_ob_wr                 = 0;
                    m_dpth_count                = 0;
                    m_krnl_count                = 0;
                    m_num_convOut_wr            = 0;
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
            b_mem_trans(PARTMAP_FIFO, FIFO_WRITE, PM_FIFO_DEPTH, PM_NUM_PIX_READ, PM_FIFO_WR_WIDTH);
            m_partMapFetchCount += (PM_NUM_PIX_READ * PIXEL_SIZE);
        }
    }
}


void FAS::A_process()
{
    sc_time ONE_CYCLE(1 * CLK_PRD, SC_NS);
    sc_time TWO_CYCLE(2 * CLK_PRD, SC_NS);
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
            && m_convOutMap_bram.size() > 0
            && m_partMap_fifo.size() > 0
            && m_resMap_fifo.size() > 0
        ) {
            // pop convOut map, pop partial map, pop res map
            // add convOut map, partial map, and residual map pixel, pop 1x1 krnl
            // MACC 1x1, pop 1x1 Bias
            // Add bias
        }
        else if(
            (m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE)
            && m_first_depth_iter_cfg
            && m_do_res_layer_cfg
            && m_convOutMap_bram.size() > 0
            && m_resMap_fifo.size() > 0
        ) {
            // pop convOut map, pop res map
            // add convOut map and residual map pixel
        }
        else if(
            (m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE)
            && m_first_depth_iter_cfg
            && m_do_kernels1x1_cfg
            && m_convOutMap_bram.size() >= m_krnl1x1Depth_cfg
        ) {
            // str =   "[A_process]: " + sc_time_stamp().to_string() + "\n"
            //         "[A_process]: m_convOutMap_bram.size() - " + to_string(m_convOutMap_bram.size()) + "\n";
            // cout << str;
            if(m_dpth_count == (m_krnl1x1Depth_cfg - FAS_1x1_KRNL_DPTH_SIMD))
            {
                m_dpth_count = 0;
                if(m_krnl_count == (m_num_1x1_kernels_cfg - 1))
                {
                    m_krnl_count = 0;
                    m_convOutMap_bram.resize(
                        m_convOutMap_bram.size()
                        - m_krnl1x1Depth_cfg
                    );
                }
                else
                {
                    m_krnl_count++;
                }
            }
            else
            {
                m_dpth_count += FAS_1x1_KRNL_DPTH_SIMD;
            }
            // pop convOut map, pop 1x1 kernel; 1 cycle
            m_convOut_bram_rd.notify(ONE_CYCLE);
            m_krnl_1x1_bram_rd.notify(ONE_CYCLE);
            // Multipy 1x1 and pop 1x1 Bias; 1 cycle
            m_krnl_1x1_bias_bram_rd.notify(TWO_CYCLE);
            // Sum across depths 64 input adder tree latency = 6 cycles
            // Add bias; 1 cycle
            // Pipeline full in 9 cycles, 1 cycle per output
            m_accum_dp_wr.notify(NINE_CYCLES);
        }
        else if(
            (m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE)
            && !m_first_depth_iter_cfg
            && m_do_kernels1x1_cfg
            && m_convOutMap_bram.size() > 0
            && m_partMap_fifo.size() > 0
        ) {
            // pop convOut map, pop 1x1 fifo
            // pop partial map, multiply convOut map with 1x1
            // add convOut and partial map 1x1 product
        }
        else if(
            (m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE)
            && !m_first_depth_iter_cfg
            && m_convOutMap_bram.size() > 0
            && m_partMap_fifo.size() > 0
        ) {
            // pop convOut map, pop partial map
            // accum
        }
    }
}


void FAS::accum_krnl_1x1_dp_process()
{
    while(true)
    {
        wait(m_accum_krnl_1x1_dp.default_event());
        wait();
        // string str = "[accum_krnl_1x1_dp_process]: " + sc_time_stamp().to_string() + "\n";
        // cout << str;

    }
}


void FAS::convOut_bram_read_process()
{
    while(true)
    {
        wait(m_convOut_bram_rd.default_event());
        wait();
        // string str = "[convOut_fifo_read_process]: " + sc_time_stamp().to_string() + "\n";
        // cout << str;
        // b_mem_trans(CONVOUTMAP_BRAM, BRAM_READ, CO_FIFO_DEPTH, m_krnl1x1Depth_cfg, CO_FIFO_RD_WIDTH);
    }
}


void FAS::krnl_1x1_bram_read_process()
{
    while(true)
    {
        wait(m_krnl_1x1_bram_rd.default_event());
        wait();
        // string str = "[krnl_1x1_bram_read_process]: " + sc_time_stamp().to_string() + "\n";
        // cout << str;
        // b_mem_trans(KRNL_1X1_BRAM, BRAM_READ, KRNL_1X1_BRAM_DEPTH, m_krnl1x1Depth_cfg, KRNL_1x1_BRAM_RD_WIDTH);
    }
}


void FAS::krnl_1x1_bias_bram_read_process()
{
    while(true)
    {
        wait(m_krnl_1x1_bias_bram_rd.default_event());
        wait();
        // string str = "[krnl_1x1_bias_bram_read_process]: " + sc_time_stamp().to_string() + "\n";
        // cout << str;
        // b_mem_trans(KRNL_1X1_BIAS_BRAM, BRAM_READ, KRNL_1X1_BIAS_BRAM_DEPTH, KRNL_1X1_BIAS_BRAM_NUM_PIX_READ, KRNL_1X1_BIAS_BRAM_RD_WIDTH);
    }
}

static int t = 0;
void FAS::accum_dp_wr_process()
{
    while(true)
    {
        wait(m_accum_dp_wr.default_event());
        wait();
        // string str = "[accum_dp_wr_process]: " + sc_time_stamp().to_string() + "\n";
        // cout << str;
        if(m_ob_dwc == (OB_FIFO_WR_WIDTH - 1))
        {
            m_ob_dwc = 0;
            t++;
            m_wr_outBuf.notify();
        }
        else
        {
            m_ob_dwc++;
        }
    }
}


void FAS::outBuf_wr_process()
{
    while(true)
    {
        wait(m_wr_outBuf);
        wait();
        b_mem_trans(OUTBUF_FIFO, FIFO_WRITE, OB_FIFO_DEPTH, OB_NUM_PIX_WRITE, OB_FIFO_WR_WIDTH);
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
            b_mem_trans(OUTBUF_FIFO, FIFO_READ, OB_FIFO_DEPTH, m_outMapStoreFactor_cfg, OB_FIFO_RD_WIDTH);
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
        if(m_state == ST_ACTIVE && m_first_depth_iter_cfg && m_resMap_fifo.size() <= RSM_LOW_WATERMARK && m_resMapFetchCount != m_resMapFetchTotal_cfg)
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
            b_mem_trans(RESMAP_FIFO, FIFO_WRITE, RSM_FIFO_DEPTH, RSM_NUM_PIX_WRITE, RSM_FIFO_WR_WIDTH);
            wait();
            m_resMapFetchCount += (RSM_NUM_PIX_READ * PIXEL_SIZE);
        }
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
        if(m_trans_fifo.size() > 0 && m_convOutMap_bram.size() < m_co_high_watermark_cfg)
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
    while(true)
    {
        wait(m_result_write.default_event());
        wait();
        m_num_convOut_wr += RES_PKT_SIZE;
        if(m_first_depth_iter_cfg && !m_do_kernels1x1_cfg && !m_do_res_layer_cfg)
        {
            b_mem_trans(OUTBUF_FIFO, FIFO_WRITE, OB_FIFO_DEPTH, RES_PKT_SIZE, OB_FIFO_WR_WIDTH);
        }
        else
        {
            b_mem_trans(CONVOUTMAP_BRAM, BRAM_WRITE, CO_BRAM_DEPTH, RES_PKT_SIZE, CO_BRAM_WR_WIDTH);
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


void FAS::b_mem_trans(FPGA_mem_sel_t mem_sel, FPGA_mem_cmd_t mem_cmd, int mem_depth, int mem_trans_size, int mem_trans_width, bool callWait)
{
    switch(mem_sel)
    {
        case PARTMAP_FIFO:
        {
            b_mem_trans("Partial Map BRAM", m_partMap_fifo, mem_cmd, mem_depth, mem_trans_size, mem_trans_width, callWait);
            break;
        }
        case CONVOUTMAP_BRAM:
        {
            b_mem_trans("Convolutional Map Output FIFO", m_convOutMap_bram, mem_cmd, mem_depth, mem_trans_size, mem_trans_width, callWait);
            break;
        }
        case KRNL_1X1_BRAM:
        {
            b_mem_trans("1x1 Kernel BRAM", m_krnl1x1_bram, mem_cmd, mem_depth, mem_trans_size, mem_trans_width, callWait);
            break;
        }
        case KRNL_1X1_BIAS_BRAM:
        {
            b_mem_trans("1x1 Kernel Bias BRAM", m_krnl1x1Bias_bram, mem_cmd, mem_depth, mem_trans_size, mem_trans_width, callWait);
            break;
        }
        case RESMAP_FIFO:
        {
            b_mem_trans("Residual Map FIFO", m_resMap_fifo, mem_cmd, mem_depth, mem_trans_size, mem_trans_width, callWait);
            break;
        }
        case OUTBUF_FIFO:
        {
            b_mem_trans("Output Buffer FIFO", m_outBuf_fifo, mem_cmd, mem_depth, mem_trans_size, mem_trans_width, callWait);
            break;
        }
    }
}


void FAS::b_mem_trans(std::string mem_name, std::deque<int>& mem, FPGA_mem_cmd_t mem_cmd, int mem_depth, int mem_trans_size, int mem_trans_width, bool callWait)
{
    for(int i = 0; i < mem_trans_size; i += mem_trans_width)
    {
        switch (mem_cmd)
        {
            case BRAM_WRITE:
            case FIFO_WRITE:
            {
                if(mem.size() == mem_depth)
                {
                    string str =
                        "[" + mem_name + "]: is full\n";
                    cout << str;
                    sc_stop();
                    return;
                }
                mem.resize(mem.size() + mem_trans_width);
                break;
            }
            case BRAM_READ:
            {
                break;
            }
            case FIFO_READ:
            {
                if(mem.size() == 0)
                {
                    break;
                }
                else if(mem.size() < mem_trans_width)
                {
                    mem.resize(0);
                }
                else
                {
                    mem.resize(mem.size() - mem_trans_width);
                }
                break;
            }
        }
        (callWait) ? wait() : void();
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
    b_mem_trans(
        KRNL_1X1_BRAM,
        BRAM_WRITE,
        KRNL_1X1_BRAM_DEPTH,
        KRNL_1x1_BRAM_NUM_PIX_WRITE,
        KRNL_1x1_BRAM_WR_WIDTH,
        false
    );
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
    b_mem_trans(
        KRNL_1X1_BIAS_BRAM,
        BRAM_WRITE,
        KRNL_1X1_BIAS_BRAM_DEPTH,
        KRNL_1X1_BIAS_BRAM_NUM_PIX_WRITE,
        KRNL_1X1_BIAS_BRAM_WR_WIDTH,
        false
    );
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
