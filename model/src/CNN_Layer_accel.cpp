#include "CNN_Layer_Accel.hpp"
using namespace std;
using namespace sc_core;
using namespace sc_dt;
using namespace tlm;
using namespace tlm_utils;


CNN_Layer_Accel::~CNN_Layer_Accel()
{
    for (int i = 0; i < MAX_AWP_PER_FAS; i++)
    {
        delete awp[i];
    }
    for (int i = 0; i < NUM_FAS; i++)
    {
        delete fas[i];
    }
}


void CNN_Layer_Accel::main_process()
{
#ifdef DDR_AXI_MEMORY
    init_read_req_id[(MAX_FAS_RD_ID * FAS_JOB_FETCH_ID) +: MAX_FAS_RD_ID] = FAS_JOB_FETCH_ID;
    init_read_req_id[(MAX_FAS_RD_ID * FAS_PART_MAP_FETCH_ID) +: MAX_FAS_RD_ID] = FAS_PART_MAP_FETCH_ID;
    init_read_req_id[(MAX_FAS_RD_ID * FAS_RES_MAP_FETCH_ID) +: MAX_FAS_RD_ID] = FAS_RES_MAP_FETCH_ID;
    init_read_req_id[(MAX_FAS_RD_ID * FAS_PREV_MAP_FETCH_ID) +: MAX_FAS_RD_ID] = FAS_PREV_MAP_FETCH_ID;
    init_write_req_id[(MAX_FAS_RD_ID * FAS_STORE_ID) +: MAX_FAS_RD_ID] = FAS_STORE_ID;
    
    
    init_read_data_rdy[C_IM_IT_RD_ID]   = 1;
    init_read_data_rdy[C_IM_IT_RD_ID]   = 1;
    init_read_data_rdy[C_IM_IT_RD_ID]   = 1;
    init_read_data_rdy[C_IM_IT_RD_ID]   = 1;
    init_write_data_vld[C_IM_IT_RD_ID]  = 1;
#endif   
    string str;
    while (true)
    {
        wait();
        bool all_complete = true;
        for (int i = 0; i < m_FAS_complt_arr.size(); i++)
        {
            if (!m_FAS_complt_arr[i])
            {
                all_complete = false;
                break;
            }
        }
        if(all_complete)
        {
            if(FAS2AWP_bus.m_trans_fifo.size() > 0
                || AWP2FAS_bus.m_trans_fifo.size() > 0)
            {
                str = "[" + string(name()) + "]: Buffers are not empty\n"
                    "\tFAS2AWP_bus.m_trans_fifo_sz:     " + to_string(FAS2AWP_bus.m_trans_fifo.size()) + "\n"
                    "\tAWP2FAS_bus.m_trans_fifo.sz:     " + to_string(AWP2FAS_bus.m_trans_fifo.size()) + "\n";
                cout << str;
                raise(SIGINT);
            }
            for (int i = 0; i < m_FAS_complt_arr.size(); i++)
            {
                m_FAS_complt_arr[i] = false;
            }
            str = "[" + string(name()) + "]: Processing Complete at " + sc_time_stamp().to_string() + "\n";
            cout << str;
            wait();
            m_complete.notify(SC_ZERO_TIME);
        }
    }
}


int CNN_Layer_Accel::complt_process(int _idx)
{
    int idx = _idx;
    while(true)
    {
        wait(fas[idx]->m_complete);
        wait();
        m_FAS_complt_arr[idx] = true;
        fas[idx]->m_complete_ack.notify();
    }
}


#ifndef DDR_AXI_MEMORY
void CNN_Layer_Accel::system_mem_arb_process()
{
    while(true)
    {
        wait();
        int numReq = 0;
        for(int i = 0; i < MAX_FAS_REQ; i++)
        {
            if(m_req_arr[i].req_pending)
            {
                m_req_arr[i].tally++;
                numReq++;
            }
        }
        numReq_st = max(numReq_st, numReq);
        total_sys_mem_trans_st = max(total_sys_mem_trans_st, m_total_sys_mem_trans);
        if(numReq > 0 && m_total_sys_mem_trans < m_max_sys_mem_trans)
        {
            for(int i = m_next_wr_req_id; true; i = (i + 1) % MAX_FAS_REQ)
            {
                if(m_req_arr[i].req_pending)
                {
                    wait();
                    m_req_arr[i].max_tally = max(m_req_arr[i].max_tally, m_req_arr[i].tally);
                    m_req_arr[i].tally = 0;
                    m_req_arr[i].req_pending = false;
                    m_req_arr[i].ack.notify(SC_ZERO_TIME);
                    m_next_wr_req_id = (i + 1) % MAX_FAS_REQ;
                    m_total_sys_mem_trans++;
                    break;
                }
            }
        }
    }
}
#endif


void CNN_Layer_Accel::b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay)
{
    trans.acquire();
    Accel_Trans* accel_trans = (Accel_Trans*)trans.get_data_ptr();
    int req_idx = accel_trans->fas_req_id;
#ifdef DDR_AXI_MEMORY
    if(trans.get_command() == TLM_READ_COMMAND)
    {
        while(true)
        {
        
        always@(posedge clk_FAS) begin
            begin
            init_read_data_rdy[C_IM_IT_RD_ID]        <= 0;
  
            
            init_read_addr[(`INIT_RD_ADDR_WIDTH * C_IM_IT_RD_ID) +: `INIT_RD_ADDR_WIDTH]	<= inMapAddr_cfg;
            init_read_len[(`INIT_RD_LEN_WIDTH * C_IM_IT_RD_ID) +: `INIT_RD_LEN_WIDTH]       <= im_fetch_amount_cfg;
            init_read_req[C_IM_IT_RD_ID]                                     
                <= init_read_req_ack[C_IM_IT_RD_ID] ? 1'b0 : (~init_read_req_acked[C_IM_IT_RD_ID] ? 1'b1 : init_read_req[C_IM_IT_RD_ID]);
            init_read_req_acked[C_IM_IT_RD_ID]                                
                <= init_read_req_ack[C_IM_IT_RD_ID] ? 1'b1 : init_read_req_acked[C_IM_IT_RD_ID];
  
            if(init_read_in_prog[C_IM_IT_RD_ID]) begin
                init_read_data_rdy[C_IM_IT_RD_ID]    <= 1;
            end
            if(init_read_cmpl[C_IM_IT_RD_ID]) begin
                job_fetch_data_vld  <= 0;
                inMapFetchCount     <= inMapFetchCount + im_fetch_amount_cfg;
            end
        end
    }
    else // TLM_WRITE_COMMAND
    {
        assign init_write_req_id[(`MAX_FAS_RD_ID * C_IM_IT_RD_ID) +: `MAX_FAS_RD_ID] = C_IM_IT_RD_ID;
        
        always@(posedge clk_FAS) begin
            begin
            init_write_data_rdy[C_IM_IT_RD_ID]        <= 0;
            if(!job_fetch_fifo_empty && !init_write_in_prog[C_IM_IT_RD_ID] && !job_fetch_data_vld) begin
                job_fetch_fifo_rden                   <= 1;
                job_fetch_data_vld                    <= 1;
            end
            if(!convMap_fifo_prog_full && job_fetch_data_vld && inMapFetchCount != inMapFetchTotal_cfg) begin
                init_write_addr[(`INIT_RD_ADDR_WIDTH * C_IM_IT_RD_ID) +: `INIT_RD_ADDR_WIDTH]	<= inMapAddr_cfg;
                init_write_len[(`INIT_RD_LEN_WIDTH * C_IM_IT_RD_ID) +: `INIT_RD_LEN_WIDTH]       <= im_fetch_amount_cfg;
                init_write_req[C_IM_IT_RD_ID]                                     
                    <= init_write_req_ack[C_IM_IT_RD_ID] ? 1'b0 : (~init_write_req_acked[C_IM_IT_RD_ID] ? 1'b1 : init_write_req[C_IM_IT_RD_ID]);
                init_write_req_acked[C_IM_IT_RD_ID]                                
                    <= init_write_req_ack[C_IM_IT_RD_ID] ? 1'b1 : init_write_req_acked[C_IM_IT_RD_ID];
            end
            if(init_write_in_prog[C_IM_IT_RD_ID]) begin
                init_write_data_rdy[C_IM_IT_RD_ID]    <= 1;
            end
            if(init_write_cmpl[C_IM_IT_RD_ID]) begin
                job_fetch_data_vld  <= 0;
                inMapFetchCount     <= inMapFetchCount + im_fetch_amount_cfg;
            end
        end        
    }
#else
    m_req_arr[req_idx].req_pending = true;
    wait(m_req_arr[req_idx].ack);
    int _numCycles = ceil((float)trans.get_data_length() / (float)BUS_SIZE);
    sc_core::sc_time numCycles(_numCycles * CLK_PRD, sc_core::SC_NS);
    wait(numCycles);
    m_total_sys_mem_trans--;
#endif
    trans.release();
}


void CNN_Layer_Accel::setMemory(int idx, uint64_t addr, int size)
{
    m_memory[idx].addr = addr;
    m_memory[idx].size = size;
}


mem_ele_t* CNN_Layer_Accel::getMemory(int idx)
{
    mem_ele_t* mem_ele = new mem_ele_t;
    mem_ele->addr = m_memory[idx].addr;
    mem_ele->size = m_memory[idx].size;
    return mem_ele;
}


void CNN_Layer_Accel::start()
{
    // TODO: Properly expand for multiple FAS's
    m_start_time = sc_time_stamp().to_double();
    m_accelCfg->m_buffer = (void*)m_memory[0].addr;
    m_accelCfg->deserialize();
    for(int i = 0; i < NUM_FAS; i++)
    {        
        fas[i]->m_FAS_cfg = m_accelCfg->m_FAS_cfg_arr[i];
        wait();
        fas[i]->m_start.notify();
        wait(fas[i]->m_start_ack);
        wait();
    }
}


void CNN_Layer_Accel::waitComplete(double& elapsedTime, double& memPower, double& QUAD_time, double& FAS_time)
{
    wait(m_complete.default_event());
    wait();
    elapsedTime = sc_time_stamp().to_double() - m_start_time;
    memPower = calculateMemPower();
    QUAD_time = awp[0]->quad[0]->m_QUAD_time;
    FAS_time = fas[0]->m_FAS_time;
    FPGA_hndl *m_fpga_hndl = m_accelCfg->m_fpga_hndl;
    delete m_accelCfg;
    m_accelCfg = new AccelConfig(NULL);
    m_accelCfg->m_fpga_hndl = m_fpga_hndl;
    
    cout << "max pending simal req: " << numReq_st << endl;
    cout << "max total_sys_mem_trans:" << total_sys_mem_trans_st << endl;
    cout << "m_req_arr_0: " << m_req_arr[0].max_tally << endl;
    cout << "m_req_arr_1: " << m_req_arr[1].max_tally << endl;
    cout << "m_req_arr_2: " << m_req_arr[2].max_tally << endl;
    cout << "m_req_arr_3: " << m_req_arr[3].max_tally << endl;
    cout << "m_req_arr_4: " << m_req_arr[4].max_tally << endl;
    numReq_st = 0;
    total_sys_mem_trans_st = 0;
    m_req_arr[0].max_tally = 0;
    m_req_arr[1].max_tally = 0;
    m_req_arr[2].max_tally = 0;
    m_req_arr[3].max_tally = 0;
    m_req_arr[4].max_tally = 0;
}


double CNN_Layer_Accel::calculateMemPower()
{
    return 0.0f;
}


const char* CNN_Layer_Accel::toHexCharArr(int value)
{
    stringstream stream;
    stream << hex << value;
    return (string("0x") + stream.str()).c_str();
}


const char* CNN_Layer_Accel::toHexCharArr(uint32_t value)
{
    stringstream stream;
    stream << hex << value;
    return (string("0x") + stream.str()).c_str();
}


const char* CNN_Layer_Accel::toHexCharArr(uint64_t value)
{
    stringstream stream;
    stream << hex << value;
    return (string("0x") + stream.str()).c_str();
}
