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
                if(m_opcode_cfg != 14)
                {
                    b_start_QUADs();
                }
                m_state = ST_ACTIVE;
                break;
            }
            case ST_ACTIVE:
            {
                if(m_partMapFetchCount == m_partMapFetchTotal_cfg
                    && (m_inMapFetchCount == m_inMapFetchTotal_cfg || m_opcode_cfg == 14)
                    && m_resdMapFetchCount == m_resdMapFetchTotal_cfg
                    && m_prevMapFetchCount == m_prevMapFetchTotal_cfg
                    && (m_last_CO_recvd || m_opcode_cfg == 14))
                {
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
                if(all_complete || m_opcode_cfg == 14)
                {
                    for(int i = 0; i < MAX_AWP_PER_FAS; i++)
                    {
                        m_AWP_complt_arr[i] = false;
                    }
                    wait();
                    m_complete.notify();
                    wait(m_complete_ack);
                    m_state                         = ST_IDLE;
                    m_krnl3x3FetchCount             = 0;
                    m_krnl3x3BiasFetchCount         = 0;
                    m_partMapFetchCount             = 0;
                    m_inMapFetchCount               = 0;
                    m_krnl1x1FetchCount             = 0;
                    m_krnl1x1BiasFetchCount         = 0;
                    m_resdMapFetchCount              = 0;
                    m_outMapStoreCount              = 0;
                    m_inMapFetchTotal_cfg           = 0;
                    m_resdMapFetchTotal_cfg          = 0;
                    m_prevMapFetchTotal_cfg         = 0;
                    m_dpth_count                    = 0;
                    m_krnl_count                    = 0;
                    m_krnl_1x1_bram_sz              = 0;
                    m_krnl_1x1_bias_bram_sz         = 0;
                    m_pixSeqCfgFetchTotal_cfg       = 0;
                    m_inMapFetchTotal_cfg           = 0;
                    m_krnl3x3FetchTotal_cfg         = 0;
                    m_krnl3x3BiasFetchTotal_cfg     = 0;
                    m_partMapFetchTotal_cfg         = 0;
                    m_krnl1x1FetchTotal_cfg         = 0;
                    m_krnl1x1BiasFetchTotal_cfg     = 0;
                    m_krnl1x1Depth_cfg              = 0;
                    m_num_1x1_kernels_cfg           = 0;
                    m_resdMapFetchTotal_cfg          = 0;
                    m_outMapStoreTotal_cfg          = 0;
                    m_inMapFetchFactor_cfg          = 0;
                    m_outMapStoreFactor_cfg         = 0;
                    m_krnl1x1Addr_cfg               = 0;
                    m_krnl1x1BiasAddr_cfg           = 0;
                    m_pixelSeqAddr_cfg              = 0;
                    m_partMapAddr_cfg               = 0;
                    m_resdMapAddr_cfg                = 0;
                    m_outMapAddr_cfg                = 0;
                    m_co_high_watermark_cfg         = 0;
                    m_rm_low_watermark_cfg          = 0;
                    m_pm_low_watermark_cfg          = 0;
                    m_pv_low_watermark_cfg          = 0;
                    m_krnl1x1_pding_cfg             = 0;
                    m_krnl1x1_pad_bgn_cfg           = 0;
                    m_krnl1x1_pad_end_cfg           = 0;
                    m_prevMapFetchCount             = 0;
                    m_prevMapFetchTotal_cfg         = 0;
                    m_opcode_cfg                    = -1;
                    if(m_prevMap_fifo_sz > 0 || m_resdMap_bram_sz > 0 
                        || m_partMap_bram_sz > 0 || m_convMap_bram_sz > 0 
                        || m_outBuf_fifo_sz > 0)
                    {
                        str = "Buffers are not empty\n";
                        cout << str;
                        sc_stop();
                        return;
                    }
                    str = "[" + string(name()) + "]: sent complete\n";
                    cout << str;
                }
                break;
            }
        }
    }
}


void FAS::job_fetch_process()
{
    // FIXME:   In this model you are loading a QUAD completely before moving to the next QUAD
    //              but in the hardware you will actually load the QUADs in a round robin fashion
    //              Shouldnt affect model accuracy.
    tlm::tlm_generic_payload* trans;
    sc_time delay;
    string str;
    while(true)
    {
        wait();
        if(m_trans_fifo.size() > 0 && m_convMap_bram_sz < m_co_high_watermark_cfg)
        {
            trans = m_trans_fifo.front();
            m_trans_fifo.pop_front();
            Accel_Trans* accel_trans = (Accel_Trans*)trans->get_data_ptr();
            int AWP_id = accel_trans->AWP_id;
            int QUAD_id = accel_trans->QUAD_id;
            trans->release();
            int inMapFetchAmt = m_inMapFetchFactor_cfg * m_inMapDepthFetchAmt[AWP_id][QUAD_id] * PIXEL_SIZE;
            accel_trans = new Accel_Trans();
            accel_trans->fas_rd_id = FAS_JOB_FETCH_ID;
            trans = nb_createTLMTrans(
                m_mem_mng,
                AWP_id,
                TLM_READ_COMMAND,
                (unsigned char*)accel_trans,
                inMapFetchAmt,
                0,
                nullptr,
                false,
                TLM_INCOMPLETE_RESPONSE
            );
            sys_mem_init_soc->b_transport(*trans, delay);
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
            if(m_inMapFetchCount == m_inMapFetchTotal_cfg)
            {
                str = "[" + string(name()) + "]:" + " finished last Input Map Fetch at " + sc_time_stamp().to_string() + "\n";
                cout << str;
            }
        }
    }
}


void FAS::partMap_fetch_process()
{
    tlm::tlm_generic_payload* trans;
    sc_time delay;
    Accel_Trans* accel_trans;
    string str;
    while(true)
    {
        wait();
        if(m_state == ST_ACTIVE && m_partMap_bram_sz <= m_pm_low_watermark_cfg && m_partMapFetchCount != m_partMapFetchTotal_cfg)
        {
#ifdef VERBOSE_DEBUG
            int start = sc_time_stamp().to_double();
            str = "[" + string(name()) + "]:" + " Starting Resd Map Fetch at " + sc_time_stamp().to_string() + "\n";
            cout << str;
#endif
            accel_trans = new Accel_Trans();
            accel_trans->fas_rd_id = FAS_PART_MAP_FETCH_ID;
            trans = nb_createTLMTrans(
                m_mem_mng,
                0,
                TLM_READ_COMMAND,
                (unsigned char*)accel_trans,
                (m_pm_fetch_amount_cfg * PIXEL_SIZE),
                0,
                nullptr,
                false,
                TLM_INCOMPLETE_RESPONSE
            );
            sys_mem_init_soc->b_transport(*trans, delay);
            trans->release();
            if(m_opcode_cfg == 14)
            {
                m_convMap_bram_sz += m_pm_fetch_amount_cfg;
            }
            else
            {
                m_partMap_bram_sz += m_pm_fetch_amount_cfg;
            }
            m_partMapFetchCount += (m_pm_fetch_amount_cfg * PIXEL_SIZE);
#ifdef VERBOSE_DEBUG
            str = "[" + string(name()) + "]:" + " finished Part Map Fetch in " + to_string(int(sc_time_stamp().to_double()) - start) + " ns at " + sc_time_stamp().to_string() + "\n";
            cout << str;
#endif
            if(m_partMapFetchCount == m_partMapFetchTotal_cfg)
            {
                str = "[" + string(name()) + "]:" + " finished last Part Map Fetch at " + sc_time_stamp().to_string() + "\n";
                cout << str;
            }
        }
    }
}


void FAS::prevMap_fetch_process()
{
    tlm::tlm_generic_payload* trans;
    sc_time delay;
    Accel_Trans* accel_trans;
    string str;
    int start;
    while(true)
    {
        wait();
        if(m_state == ST_ACTIVE && m_prevMap_fifo_sz <= m_pv_low_watermark_cfg && m_prevMapFetchCount != m_prevMapFetchTotal_cfg)
        {
#ifdef VERBOSE_DEBUG
            int start = sc_time_stamp().to_double();
            str = "[" + string(name()) + "]:" + " Starting Prev Map Fetch at " + sc_time_stamp().to_string() + "\n";
            cout << str;
#endif
            accel_trans = new Accel_Trans();
            accel_trans->fas_rd_id = FAS_PREV_MAP_FETCH_ID;
            trans = nb_createTLMTrans(
                m_mem_mng,
                0,
                TLM_READ_COMMAND,
                (unsigned char*)accel_trans,
                (m_pv_fetch_amount_cfg * PIXEL_SIZE),
                0,
                nullptr,
                false,
                TLM_INCOMPLETE_RESPONSE
            );
            sys_mem_init_soc->b_transport(*trans, delay);
            trans->release();
            m_prevMap_fifo_sz += m_pv_fetch_amount_cfg;
            m_prevMapFetchCount += (m_pv_fetch_amount_cfg * PIXEL_SIZE);
#ifdef VERBOSE_DEBUG
            str = "[" + string(name()) + "]:" + " finished Prev Map Fetch in " + to_string(int(sc_time_stamp().to_double()) - start) + " ns at " + sc_time_stamp().to_string() + "\n";
            cout << str;
#endif
            if(m_prevMapFetchCount == m_prevMapFetchTotal_cfg)
            {
                str = "[" + string(name()) + "]:" + " finished last Prev Map Fetch at " + sc_time_stamp().to_string() + "\n";
                cout << str;
            }
        }
    }
}


void FAS::resdMap_fetch_process()
{
    tlm::tlm_generic_payload* trans;
    sc_time delay;
    Accel_Trans* accel_trans;
    string str;
    while(true)
    {
        wait();
        if(m_state == ST_ACTIVE && m_resdMap_bram_sz <= m_rm_low_watermark_cfg && m_resdMapFetchCount != m_resdMapFetchTotal_cfg)
        {
#ifdef VERBOSE_DEBUG
            int start = sc_time_stamp().to_double();
            str = "[" + string(name()) + "]:" + " Starting Resd Map Fetch at " + sc_time_stamp().to_string() + "\n";
            cout << str;
#endif
            accel_trans = new Accel_Trans();
            accel_trans->fas_rd_id = FAS_RES_MAP_FETCH_ID;
            trans = nb_createTLMTrans(
                m_mem_mng,
                0,
                TLM_READ_COMMAND,
                (unsigned char*)accel_trans,
                (m_rm_fetch_amount_cfg * PIXEL_SIZE),
                0,
                nullptr,
                false,
                TLM_INCOMPLETE_RESPONSE
            );
            sys_mem_init_soc->b_transport(*trans, delay);
            trans->release();
            m_resdMap_bram_sz += m_rm_fetch_amount_cfg;
            m_resdMapFetchCount += (m_rm_fetch_amount_cfg * PIXEL_SIZE);
#ifdef VERBOSE_DEBUG
            str = "[" + string(name()) + "]:" + " finished Resd Map Fetch in " + to_string(int(sc_time_stamp().to_double()) - start) + " ns at " + sc_time_stamp().to_string() + "\n";
            cout << str;
#endif
            if(m_resdMapFetchCount == m_resdMapFetchTotal_cfg)
            {
                str = "[" + string(name()) + "]:" + " finished last Resd Map Fetch at " + sc_time_stamp().to_string() + "\n";
                cout << str;
            }
        }
    }
}


void FAS::A_process()
{
    while(true)
    {
        wait();
        if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE) && m_opcode_cfg == 0
            && m_convMap_bram_sz >= CM_BRAM_RD_WIDTH
            && m_partMap_bram_sz >= PM_BRAM_RD_WIDTH
            && m_resdMap_bram_sz >= RM_BRAM_RD_WIDTH) 
        {
            //  Arch
            //      for(KRNL_DPTH / DPTH_SIMD) cycles
            //          pop conv map, pop part map; 1 cycle
            //          add [conv map, part map], pop 1x1 krnl depth chunk; 1 cycle
            //          Multiply 1x1; 1 cycle
            //          Sum across depth with adder tree; log2(KRNL_DPTH / DPTH_SIMD)-cycles
            //          pop 1x1 Bias; last iteration
            //      Add bias - 1 1x1 krnl done; 1 cycle
            //      Buffer up RM_BRAM_RD_WIDTH values; RM_BRAM_RD_WIDTH cycles
            //      add resdMap; 1 cycle
            //      write to output buffer; 1 cycle
            m_krnl_1x1_read_valid.notify(m_two_cycles_later);
            if(m_resdMap_dwc_fifo_sz == RM_BRAM_RD_WIDTH)
            {
                m_resdMap_bram_sz -= RM_BRAM_RD_WIDTH;
                m_resdMap_dwc_fifo_sz = 0;
                m_outBuf_wr.notify(m_two_cycles_later);
            }
        }
        else if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE) && m_opcode_cfg == 1
            && m_convMap_bram_sz >= CM_BRAM_RD_WIDTH
            && m_partMap_bram_sz >= PM_BRAM_RD_WIDTH
            && m_prevMap_fifo_sz >= PV_FIFO_RD_WIDTH) 
        {
            //  Arch
            //      for(KRNL_DPTH / DPTH_SIMD) cycles
            //          pop conv map, pop part map; 1 cycle
            //          add [conv map, part map], pop 1x1 krnl depth chunk; 1 cycle
            //          Multiply 1x1; 1 cycle
            //          Sum across depth with adder tree; log2(KRNL_DPTH / DPTH_SIMD)-cycles
            //      Buffer up PV_FIFO_RD_WIDTH values; PV_FIFO_RD_WIDTH cycles
            //      add prevMap; 1 cycle
            //      write to output buffer; 1 cycle
            m_krnl_1x1_read_valid.notify(m_two_cycles_later);
            if(m_prevMap_dwc_fifo_sz == PV_FIFO_RD_WIDTH)
            {
                m_prevMap_fifo_sz -= PV_FIFO_RD_WIDTH;
                m_prevMap_dwc_fifo_sz = 0;
                m_outBuf_wr.notify(m_two_cycles_later);
            }
        }
        else if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE) && m_opcode_cfg == 2
            && m_convMap_bram_sz >= CM_BRAM_RD_WIDTH
            && m_resdMap_bram_sz >= RM_BRAM_RD_WIDTH) 
        {
            //  Arch
            //      for(KRNL_DPTH / DPTH_SIMD) cycles
            //          pop conv map; pop 1x1 krnl depth chunk; 1 cycle
            //          Multiply 1x1; 1 cycle
            //          Sum across depth with adder tree; log2(KRNL_DPTH / DPTH_SIMD)-cycles
            //          pop 1x1 Bias; last iteration
            //      Add bias - 1 1x1 krnl done; 1 cycle
            //      Buffer up RM_BRAM_RD_WIDTH values; RM_BRAM_RD_WIDTH cycles
            //      add resdMap; 1 cycle
            //      write to output buffer; 1 cycle
            m_krnl_1x1_read_valid.notify(m_two_cycles_later);
            if(m_resdMap_dwc_fifo_sz == RM_BRAM_RD_WIDTH)
            {
                m_resdMap_bram_sz -= RM_BRAM_RD_WIDTH;
                m_resdMap_dwc_fifo_sz = 0;
                m_outBuf_wr.notify(m_two_cycles_later);
            }
        }
        else if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE) && m_opcode_cfg == 3
            && m_convMap_bram_sz >= CM_BRAM_RD_WIDTH
            && m_prevMap_fifo_sz >= PV_FIFO_RD_WIDTH) 
        {
            //  Arch
            //      for(KRNL_DPTH / DPTH_SIMD) cycles
            //          pop conv map, pop part map; 1 cycle
            //          add [conv map, part map], pop 1x1 krnl depth chunk; 1 cycle
            //          Multiply 1x1; 1 cycle
            //          Sum across depth with adder tree; log2(KRNL_DPTH / DPTH_SIMD)-cycles
            //      Buffer up PV_FIFO_RD_WIDTH values; PV_FIFO_RD_WIDTH cycles
            //      add prevMap; 1 cycle
            //      write to output buffer; 1 cycle
            m_krnl_1x1_read_valid.notify(m_two_cycles_later);
            if(m_prevMap_dwc_fifo_sz == PV_FIFO_RD_WIDTH)
            {
                m_prevMap_fifo_sz -= PV_FIFO_RD_WIDTH;
                m_prevMap_dwc_fifo_sz = 0;
                m_outBuf_wr.notify(m_two_cycles_later);
            }
        }
        else if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE) && m_opcode_cfg == 4
            && m_convMap_bram_sz >= m_krnl1x1Depth_cfg
            && m_partMap_bram_sz >= m_krnl1x1Depth_cfg
            && m_resdMap_bram_sz >= m_krnl1x1Depth_cfg) 
        {
            //  Arch
            //      pop conv map, pop part map; 1 cycle
            //      add [conv map, part map], pop resd map; 1 cycle
            //      for(KRNL_DPTH / DPTH_SIMD) cycles
            //          pop conv map; pop 1x1 krnl depth chunk; 1 cycle
            //          Multiply 1x1; 1 cycle
            //          Sum across depth with adder tree; log2(KRNL_DPTH / DPTH_SIMD)-cycles
            //          pop 1x1 Bias; last iteration
            //      Add bias - 1 1x1 krnl done; 1 cycle
            //      write to output buffer; 1 cycle
            m_krnl_1x1_read_valid.notify(m_three_cycles_later);
        }
        else if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE) && m_opcode_cfg == 5
            && m_convMap_bram_sz >= CM_BRAM_RD_WIDTH
            && m_partMap_bram_sz >= PM_BRAM_RD_WIDTH
            && m_resdMap_bram_sz >= RM_BRAM_RD_WIDTH
            && m_prevMap_fifo_sz >= PV_FIFO_RD_WIDTH) 
        {
            //  Arch
            //      pop conv map, pop part map; 1 cycle
            //      add [conv map, part map], pop resd map; 1 cycle
            //      for(KRNL_DPTH / DPTH_SIMD) cycles
            //          pop conv map; pop 1x1 krnl depth chunk; 1 cycle
            //          Multiply 1x1; 1 cycle
            //          Sum across depth with adder tree; log2(KRNL_DPTH / DPTH_SIMD)-cycles
            //          pop 1x1 Bias; last iteration
            //      Add bias - 1 1x1 krnl done; 1 cycle
            //      Buffer up PV_FIFO_RD_WIDTH values; PV_FIFO_RD_WIDTH cycles
            //      add prevMap; 1 cycle
            //      write to output buffer; 1 cycle
            m_krnl_1x1_read_valid.notify(m_three_cycles_later);
            if(m_prevMap_dwc_fifo_sz == PV_FIFO_RD_WIDTH)
            {
                m_prevMap_fifo_sz -= PV_FIFO_RD_WIDTH;
                m_prevMap_dwc_fifo_sz = 0;
                m_outBuf_wr.notify(m_two_cycles_later);
            }
        }
        else if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE) && m_opcode_cfg == 6
            && m_convMap_bram_sz >= CM_BRAM_RD_WIDTH
            && m_resdMap_bram_sz >= RM_BRAM_RD_WIDTH) 
        {
            //  Arch
            //      pop conv map, pop resd map; 1 cycle
            //      add [conv map, resd map]; 1 cycle
            //      for(KRNL_DPTH / DPTH_SIMD) cycles
            //          pop conv map; pop 1x1 krnl depth chunk; 1 cycle
            //          Multiply 1x1; 1 cycle
            //          Sum across depth with adder tree; log2(KRNL_DPTH / DPTH_SIMD)-cycles
            //          pop 1x1 Bias; last iteration
            //      Add bias - 1 1x1 krnl done; 1 cycle
            //      write to output buffer; 1 cycle
            m_krnl_1x1_read_valid.notify(m_two_cycles_later);
        }
        else if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE) && m_opcode_cfg == 7
            && m_convMap_bram_sz >= CM_BRAM_RD_WIDTH
            && m_resdMap_bram_sz >= RM_BRAM_RD_WIDTH
            && m_prevMap_fifo_sz >= PV_FIFO_RD_WIDTH) 
        {
            //  Arch
            //      pop conv map, pop resd map; 1 cycle
            //      add conv map, resd map; 1 cycle
            //      for(KRNL_DPTH / DPTH_SIMD) cycles
            //          pop conv map; pop 1x1 krnl depth chunk; 1 cycle
            //          Multiply 1x1; 1 cycle
            //          Sum across depth with adder tree; log2(KRNL_DPTH / DPTH_SIMD)-cycles
            //      Buffer up PV_FIFO_RD_WIDTH values; PV_FIFO_RD_WIDTH cycles
            //      add prevMap; 1 cycle
            //      write to output buffer; 1 cycle
            m_krnl_1x1_read_valid.notify(m_two_cycles_later);
            if(m_prevMap_dwc_fifo_sz == PV_FIFO_RD_WIDTH)
            {
                m_prevMap_fifo_sz -= PV_FIFO_RD_WIDTH;
                m_prevMap_dwc_fifo_sz = 0;
                m_outBuf_wr.notify(m_two_cycles_later);
            }
        }
        else if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE) && m_opcode_cfg == 8
            && m_convMap_bram_sz >= CM_BRAM_RD_WIDTH
            && m_partMap_bram_sz >= PM_BRAM_RD_WIDTH
            && m_resdMap_bram_sz >= RM_BRAM_RD_WIDTH) 
        {
            //  Arch
            //      pop conv map, pop part map; 1 cycle
            //      add [conv map, part map], pop resd Map; 1 cycle
            //      add [..., resd Map]; 1 cycle
            //      write to output buffer; 1 cycle
            m_convMap_bram_sz -= CM_BRAM_RD_WIDTH;
            m_partMap_bram_sz -= PM_BRAM_RD_WIDTH;
            m_resdMap_read_valid.notify(m_two_cycles_later);
            m_outBuf_wr.notify(m_four_cycles_later);
        }
        else if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE) && m_opcode_cfg == 9
            && m_convMap_bram_sz >= CM_BRAM_RD_WIDTH
            && m_resdMap_bram_sz >= RM_BRAM_RD_WIDTH) 
        {
            //  Arch
            //      pop conv map, pop resd map; 1 cycle
            //      add [conv map, resd map]; 1 cycle
            //      write to output buffer; 1 cycle
            m_convMap_bram_sz -= CM_BRAM_RD_WIDTH;
            m_resdMap_bram_sz -= RM_BRAM_RD_WIDTH;
            m_outBuf_wr.notify(m_three_cycles_later);
        }
        else if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE) && m_opcode_cfg == 10
            && m_convMap_bram_sz >= CM_BRAM_RD_WIDTH
            && m_partMap_bram_sz >= PM_BRAM_RD_WIDTH) 
        {
            //  Arch
            //      pop conv map, pop part map; 1 cycle
            //      add conv map, part map; 1 cycle
            //      for(KRNL_DPTH / DPTH_SIMD) cycles
            //          pop conv map; pop 1x1 krnl depth chunk; 1 cycle
            //          Multiply 1x1; 1 cycle
            //          Sum across depth with adder tree; log2(KRNL_DPTH / DPTH_SIMD)-cycles
            //      write to output buffer; 1 cycle
            m_krnl_1x1_read_valid.notify(m_two_cycles_later);
        }
        else if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE) && m_opcode_cfg == 11
            && m_convMap_bram_sz >= CM_BRAM_RD_WIDTH
            && m_partMap_bram_sz >= PM_BRAM_RD_WIDTH
            && m_prevMap_fifo_sz >= PV_FIFO_RD_WIDTH) 
        {
            //  Arch
            //      pop conv map, pop part map; 1 cycle
            //      add conv map, part map; 1 cycle
            //      for(KRNL_DPTH / DPTH_SIMD) cycles
            //          pop conv map; pop 1x1 krnl depth chunk; 1 cycle
            //          Multiply 1x1; 1 cycle
            //          Sum across depth with adder tree; log2(KRNL_DPTH / DPTH_SIMD)-cycles
            //      Buffer up PV_FIFO_RD_WIDTH values; PV_FIFO_RD_WIDTH cycles
            //      add prevMap; 1 cycle
            //      write to output buffer; 1 cycle
            m_krnl_1x1_read_valid.notify(m_two_cycles_later);
            if(m_prevMap_dwc_fifo_sz == PV_FIFO_RD_WIDTH)
            {
                m_prevMap_fifo_sz -= PV_FIFO_RD_WIDTH;
                m_prevMap_dwc_fifo_sz = 0;
                m_outBuf_wr.notify(m_two_cycles_later);
            }
        }
        else if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE) && m_opcode_cfg == 12
            && m_convMap_bram_sz >= CM_BRAM_RD_WIDTH)
        {
            //  Arch
            //      for(KRNL_DPTH / DPTH_SIMD) cycles
            //          pop conv map; pop 1x1 krnl depth chunk; 1 cycle
            //          Multiply 1x1; 1 cycle
            //          Sum across depth with adder tree; log2(KRNL_DPTH / DPTH_SIMD)-cycles
            //          pop 1x1 Bias; last iteration
            //      Add bias - 1 1x1 krnl done; 1 cycle
            //      write to output buffer; 1 cycle
            m_krnl_1x1_read_valid.notify(SC_ZERO_TIME);
        }
        else if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE) && m_opcode_cfg == 13
            && m_convMap_bram_sz >= CM_BRAM_RD_WIDTH
            && m_prevMap_fifo_sz >= PV_FIFO_RD_WIDTH)
        {
            //  Arch
            //      for(KRNL_DPTH / DPTH_SIMD) cycles
            //          pop conv map; pop 1x1 krnl depth chunk; 1 cycle
            //          Multiply 1x1; 1 cycle
            //          Sum across depth with adder tree; log2(KRNL_DPTH / DPTH_SIMD)-cycles
            //      write to output buffer; 1 cycle
            //      Buffer up PV_FIFO_RD_WIDTH values; PV_FIFO_RD_WIDTH cycles
            //      add prevMap; 1 cycle
            //      write to output buffer; 1 cycle
            m_krnl_1x1_read_valid.notify(SC_ZERO_TIME);
            if(m_prevMap_dwc_fifo_sz == PV_FIFO_RD_WIDTH)
            {
                m_prevMap_fifo_sz -= PV_FIFO_RD_WIDTH;
                m_prevMap_dwc_fifo_sz = 0;
                m_outBuf_wr.notify(m_two_cycles_later);
            }
        }
        else if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE) && m_opcode_cfg == 14
            && m_convMap_bram_sz >= CM_BRAM_RD_WIDTH)
        {
            //  Arch
            //      pop conv map, pop part map; 1 cycle
            //      add conv map, part map; 1 cycle
            //      for(KRNL_DPTH / DPTH_SIMD) cycles
            //          pop conv map; pop 1x1 krnl depth chunk; 1 cycle
            //          Multiply 1x1; 1 cycle
            //          Sum across depth with adder tree; log2(KRNL_DPTH / DPTH_SIMD)-cycles
            //          pop 1x1 Bias; last iteration
            //      Add bias - 1 1x1 krnl done; 1 cycle
            //      write to output buffer; 1 cycle
            m_krnl_1x1_read_valid.notify(SC_ZERO_TIME);
        }
        else if((m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE) && m_opcode_cfg == 15
            && m_partMap_bram_sz >= PM_BRAM_RD_WIDTH)
        {
            //  Arch
            //      pop conv map, pop part map; 1 cycle
            //      add [conv map, part map]; 1 cycle
            //      write to output buffer; 1 cycle
            m_convMap_bram_sz -= CM_BRAM_RD_WIDTH;
            m_partMap_bram_sz -= PM_BRAM_RD_WIDTH;
            m_outBuf_wr.notify(m_three_cycles_later);
        }
    }
}


void FAS::krnl_1x1_bram_rd_process()
{
    while(true)
    {
        wait(m_krnl_1x1_read_valid.default_event());
        if(m_dpth_count >= (m_krnl1x1Depth_cfg - KRNL_1x1_BRAM_RD_WIDTH))
        {
            m_dpth_count = 0;
            if(m_krnl_count == (m_num_1x1_kernels_cfg - 1))
            {
                buffer_update();
                m_krnl_count = 0;
            }
            else
            {
                m_krnl_count++;
            }
        }
        else
        {
            m_dpth_count += KRNL_1x1_BRAM_RD_WIDTH;
        }
        m_adder_tree_datain_valid.notify(m_two_cycles_later);
    }
}


void FAS::adder_tree_start_process()
{
    while(true)
    {
        wait(m_adder_tree_datain_valid.default_event());
        if(m_adder_tree_rdv_count == ((m_krnl1x1Depth_cfg / KERNEL_1x1_DEPTH_SIMD) - 1))
        {
            m_adder_tree_rdv_count = 0;
            double time;
            if(m_opcode_cfg == 0
                || m_opcode_cfg == 2
                || m_opcode_cfg == 4
                || m_opcode_cfg == 6
                || m_opcode_cfg == 10
                || m_opcode_cfg == 12
                || m_opcode_cfg == 14)
            {
                time = (LOG2_KERNEL_1x1_DEPTH_SIMD + 1) * CLK_PRD;
            }
            else
            {
                time = LOG2_KERNEL_1x1_DEPTH_SIMD * CLK_PRD;
            }
            m_adder_tree_dataout_valid.notify(sc_time(time, sc_core::SC_NS));
        }
        else 
        {
            m_adder_tree_rdv_count++;
        }
    }
}


void FAS::adder_tree_done_process()
{
    while(true)
    {
        wait(m_adder_tree_dataout_valid.default_event());
        if(m_opcode_cfg == 0 || m_opcode_cfg == 2)
        {
            m_resdMap_dwc_fifo_sz++;
        }
        else if(m_opcode_cfg == 1
            || m_opcode_cfg == 3
            || m_opcode_cfg == 5
            || m_opcode_cfg == 7
            || m_opcode_cfg == 11
            || m_opcode_cfg == 13) 
        {
            m_prevMap_dwc_fifo_sz++;
        }
        else if(m_opcode_cfg == 3
            || m_opcode_cfg == 4
            || m_opcode_cfg == 6
            || m_opcode_cfg == 10
            || m_opcode_cfg == 12
            || m_opcode_cfg == 14)
        {
            m_outBuf_dwc_wr.notify(SC_ZERO_TIME);
        }
    }
}


void FAS::resdMap_read_process()
{
    while(true)
    {
        wait(m_resdMap_read_valid.default_event());
        m_resdMap_bram_sz -= RM_BRAM_RD_WIDTH;
    }
}


void FAS::outBuf_dwc_wr_process()
{
    while(true)
    {
        wait(m_outBuf_dwc_wr.default_event());
        if(m_ob_dwc_fifo_sz == (OB_FIFO_WR_WIDTH - 1))
        {
            m_ob_dwc_fifo_sz = 0;
            m_outBuf_wr.notify(SC_ZERO_TIME);
        }
        else
        {
            m_ob_dwc_fifo_sz++;
        }
    }
}


void FAS::outBuf_wr_process()
{
    while(true)
    {
        wait(m_outBuf_wr.default_event());
        m_outBuf_fifo_sz += OB_FIFO_WR_WIDTH;
    }
}


void FAS::S_process()
{
    string str;
    tlm::tlm_generic_payload* trans;
    sc_time delay;
    Accel_Trans* accel_trans;
    while(true)
    {
        wait();
        if(m_outBuf_fifo_sz >= m_outMapStoreFactor_cfg && (m_state == ST_ACTIVE || m_state == ST_WAIT_LAST_WRITE))
        {
#ifdef VERBOSE_DEBUG
            int start = sc_time_stamp().to_double();
            str = "[" + string(name()) + "]:" + " Starting Output Buffer Write at " + sc_time_stamp().to_string() + "\n";
            cout << str;
#endif
            accel_trans = new Accel_Trans();
            accel_trans->fas_wr_id = FAS_STORE_ID;
            m_outBuf_fifo_sz -= m_outMapStoreFactor_cfg;
            trans = nb_createTLMTrans(
                m_mem_mng,
                0,
                TLM_WRITE_COMMAND,
                (unsigned char*)accel_trans,
                (m_outMapStoreFactor_cfg * PIXEL_SIZE),
                0,
                nullptr,
                false,
                TLM_INCOMPLETE_RESPONSE
            );
            sys_mem_init_soc->b_transport(*trans, delay);
            trans->release();
            m_outMapStoreCount += (m_outMapStoreFactor_cfg * PIXEL_SIZE);
            if(m_outMapStoreCount == m_outMapStoreTotal_cfg)
            {
                str = "[" + string(name()) + "]:" + " finished last Output Buffer Write at " + sc_time_stamp().to_string() + "\n";
                cout << str;
                m_last_wrt = true;
            }
#ifdef VERBOSE_DEBUG
            else
            {
                str = "[" + string(name()) + "]:" + " finished Output Buffer Write Request in " + to_string(int(sc_time_stamp().to_double()) - start) + " ns at " + sc_time_stamp().to_string() + "\n";
                cout << str;
            }
#endif
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
            // FIXME: add DWC code here
            nb_result_write(accel_trans->res_pkt_size);
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


void FAS::buffer_update()
{
    if(m_opcode_cfg == 0 
        || m_opcode_cfg == 1 
        || m_opcode_cfg == 10
        || m_opcode_cfg == 11) 
    {
        m_convMap_bram_sz -= m_krnl1x1Depth_cfg;
        m_partMap_bram_sz -= m_krnl1x1Depth_cfg;
    }
    else if(m_opcode_cfg == 4 || m_opcode_cfg == 5)
    {
        m_convMap_bram_sz -= m_krnl1x1Depth_cfg;
        m_partMap_bram_sz -= m_krnl1x1Depth_cfg;
        m_resdMap_bram_sz -= m_krnl1x1Depth_cfg;
    }
    else if(m_opcode_cfg == 6 || m_opcode_cfg == 7)
    {
        m_convMap_bram_sz -= m_krnl1x1Depth_cfg;
        m_resdMap_bram_sz -= m_krnl1x1Depth_cfg;
    }
    else if(m_opcode_cfg == 2 
        || m_opcode_cfg == 3 
        || m_opcode_cfg == 12 
        || m_opcode_cfg == 13
        || m_opcode_cfg == 15) 
    {
        m_convMap_bram_sz -= m_krnl1x1Depth_cfg;
    }
}


void FAS::nb_result_write(int res_pkt_size)
{
    string str;
    if(m_opcode_cfg == 16)
    {
        if(m_outBuf_fifo_sz == OB_FIFO_DEPTH)
        {
            str = "m_outBuf_fifo is full\n";
            cout << str;
            sc_stop();
            return;
        }
        m_outBuf_fifo_sz += res_pkt_size;
    }
    else
    {
        if(m_convMap_bram_sz == CM_BRAM_DEPTH)
        {
            str = "m_convMap_bram_sz is full\n";
            cout << str;
            sc_stop();
            return;
        }
        m_convMap_bram_sz += res_pkt_size;
    }
}


void FAS::b_cfg_Accel()
{
    b_getCfgData();
    b_cfg1x1Kernels();
    if(m_opcode_cfg != 14)
    {
        b_sendQUADCfgs();
    }
}


void FAS::b_getCfgData()
{
    wait(clk.posedge_event());
    m_opcode_cfg                    = m_FAS_cfg->m_opcode;
    m_pixSeqCfgFetchTotal_cfg       = m_FAS_cfg->m_pixSeqCfgFetchTotal;
    m_inMapFetchTotal_cfg           = m_FAS_cfg->m_inMapFetchTotal;
    m_krnl3x3FetchTotal_cfg         = m_FAS_cfg->m_krnl3x3FetchTotal;
    m_krnl3x3BiasFetchTotal_cfg     = m_FAS_cfg->m_krnl3x3BiasFetchTotal;
    m_partMapFetchTotal_cfg         = m_FAS_cfg->m_partMapFetchTotal;
    m_krnl1x1FetchTotal_cfg         = m_FAS_cfg->m_krnl1x1FetchTotal;
    m_krnl1x1BiasFetchTotal_cfg     = m_FAS_cfg->m_krnl1x1BiasFetchTotal;
    m_prevMapFetchTotal_cfg         = m_FAS_cfg->m_prevMapFetchTotal;
    m_krnl1x1Depth_cfg              = m_FAS_cfg->m_krnl1x1Depth;
    m_num_1x1_kernels_cfg           = m_FAS_cfg->m_krnl1x1_pad_end;
    m_resdMapFetchTotal_cfg          = m_FAS_cfg->m_resMapFetchTotal;
    m_outMapStoreTotal_cfg          = m_FAS_cfg->m_outMapStoreTotal;
    m_inMapFetchFactor_cfg          = m_FAS_cfg->m_inMapFetchFactor;
    m_outMapStoreFactor_cfg         = m_FAS_cfg->m_outMapStoreFactor;
    m_krnl1x1Addr_cfg               = m_FAS_cfg->m_krnl1x1Addr;
    m_krnl1x1BiasAddr_cfg           = m_FAS_cfg->m_krnl1x1BiasAddr;
    m_pixelSeqAddr_cfg              = m_FAS_cfg->m_pixelSeqAddr;
    m_partMapAddr_cfg               = m_FAS_cfg->m_partMapAddr;
    m_resdMapAddr_cfg                = m_FAS_cfg->m_resMapAddr;
    m_outMapAddr_cfg                = m_FAS_cfg->m_outMapAddr;
    m_inMapAddrArr                  = m_FAS_cfg->m_inMapAddrArr;
    m_krnl3x3AddrArr                = m_FAS_cfg->m_krnl3x3AddrArr;
    m_krnl3x3BiasAddrArr            = m_FAS_cfg->m_krnl3x3BiasAddrArr;
    m_co_high_watermark_cfg         = m_FAS_cfg->m_co_high_watermark;
    m_rm_low_watermark_cfg          = m_FAS_cfg->m_rm_low_watermark;
    m_pm_low_watermark_cfg          = m_FAS_cfg->m_pm_low_watermark;
    m_pv_low_watermark_cfg          = m_FAS_cfg->m_pv_low_watermark;
    m_rm_fetch_amount_cfg           = m_FAS_cfg->m_rm_fetch_amount;   
    m_pm_fetch_amount_cfg           = m_FAS_cfg->m_pm_fetch_amount;
    m_pv_fetch_amount_cfg           = m_FAS_cfg->m_pv_fetch_amount;
    m_krnl1x1_pding_cfg             = m_FAS_cfg->m_krnl1x1_pding;
    m_krnl1x1_pad_bgn_cfg           = m_FAS_cfg->m_krnl1x1_pad_bgn;
    m_krnl1x1_pad_end_cfg           = m_FAS_cfg->m_krnl1x1_pad_end;
    // print_cfg();

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
    sys_mem_init_soc->b_transport(*trans, delay);
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
    sys_mem_init_soc->b_transport(*trans, delay);
    trans->release();

    wait((int)ceil(m_krnl1x1BiasFetchTotal_cfg / KRNL_1X1_BIAS_BRAM_WR_WIDTH), SC_NS);
}


void FAS::b_sendQUADCfgs()
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
    sys_mem_init_soc->b_transport(*trans, delay);
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
    sys_mem_init_soc->b_transport(*trans, delay);
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
    sys_mem_init_soc->b_transport(*trans, delay);
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


void FAS::nb_print_cfg()
{
    string str =
        "[" + string(name()) + "]" + " Configured with.......\n"
        "\tOpcode :                                     " + to_string(m_opcode_cfg)                    + "\n"
        "\tNum 1x1 Kernels:                             " + to_string(m_num_1x1_kernels_cfg)           + "\n"
        "\tKernel 1x1 Depth:                            " + to_string(m_krnl1x1Depth_cfg)              + "\n"
        "\tPixel Sequence Configuration Fetch Total:    " + to_string(m_pixSeqCfgFetchTotal_cfg)       + "\n"
        "\tInput Map Fetch Total:                       " + to_string(m_inMapFetchTotal_cfg)           + "\n"
        "\tInput Map Fetch Factor:                      " + to_string(m_inMapFetchFactor_cfg)          + "\n"
        "\tKernel 3x3 Fetch Total:                      " + to_string(m_krnl3x3FetchTotal_cfg)         + "\n"
        "\tKernel 3x3 Bias Fetch Total:                 " + to_string(m_krnl3x3BiasFetchTotal_cfg)     + "\n"
        "\tPartial Map Fetch Total:                     " + to_string(m_partMapFetchTotal_cfg)         + "\n"
        "\tKernel 1x1 Fetch Total:                      " + to_string(m_krnl1x1FetchTotal_cfg)         + "\n"
        "\tKernel 1x1 Bias Fetch Total:                 " + to_string(m_krnl1x1BiasFetchTotal_cfg)     + "\n"
        "\tResidual Map Fetch Total:                    " + to_string(m_resdMapFetchTotal_cfg)          + "\n"
        "\tOutput Map Store Total:                      " + to_string(m_outMapStoreTotal_cfg)          + "\n"
        "\tPrev1x1 Map Fetch Total                      " + to_string(m_prevMapFetchTotal_cfg)         + "\n"
        "\tOutput Map Store Factor:                     " + to_string(m_outMapStoreFactor_cfg)         + "\n"
        "\tConvOut High Watermark:                      " + to_string(m_co_high_watermark_cfg)         + "\n"
        "\tResdMap Low Watermark:                       " + to_string(m_rm_low_watermark_cfg)          + "\n"
        "\tPartMap Low Watermark:                       " + to_string(m_pm_low_watermark_cfg)          + "\n"
        "\tPrev1x1 Low Watermark:                       " + to_string(m_pv_low_watermark_cfg)          + "\n"
        "\tResdMap Fetch Amount:                        " + to_string(m_rm_fetch_amount_cfg)           + "\n"   
        "\tPartMap Fetch Amount:                        " + to_string(m_pm_fetch_amount_cfg)           + "\n"
        "\tPrev1x1 Fetch Amount:                        " + to_string(m_pv_fetch_amount_cfg)           + "\n"
        "\tKernel 1x1 padding:                          " + to_string(m_krnl1x1_pding_cfg)             + "\n"
        "\tKernel 1x1 Padding begin:                    " + to_string(m_krnl1x1_pad_bgn_cfg)           + "\n"
        "\tKernel 1x1 Padding end:                      " + to_string(m_krnl1x1_pad_end_cfg)           + "\n";
    cout << str;
}
