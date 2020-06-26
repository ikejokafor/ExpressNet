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


int CNN_Layer_Accel::complt_process(int idx)
{
    while(true)
    {
        wait(fas[idx]->m_complete);
        wait();
        m_FAS_complt_arr[idx] = true;
        fas[idx]->m_complete_ack.notify();
    }
}


void CNN_Layer_Accel::system_mem_read_arb_process()
{
#ifdef SIMULATE_MEMORY
    while (true)
    {
        wait();
        int numReq = 0;
        for(int i = 0; i < MAX_FAS_RD_REQ; i++)
        {
            if(m_rd_req_arr[i].req_pending)
            {
                numReq++;
            }
        }
        if(numReq > 0 && m_num_sys_mem_rd_in_prog < MAX_SYS_MEM_RD_TRANS)
        {
            for(int i = m_next_rd_req_id; true; i = (i + 1) % MAX_FAS_RD_REQ)
            {
                if(m_rd_req_arr[i].req_pending)
                {
                    wait();
                    m_rd_req_arr[i].ack.notify(SC_ZERO_TIME);
                    m_next_rd_req_id = (i + 1) % MAX_FAS_RD_REQ;
                    break;
                }
            }
        }
    }
#endif
}


void CNN_Layer_Accel::system_mem_write_arb_process()
{
#ifdef SIMULATE_MEMORY
    while(true)
    {
        wait();
        int numReq = 0;
        for(int i = 0; i < MAX_FAS_WR_REQ; i++)
        {
            if(m_wr_req_arr[i].req_pending)
            {
                numReq++;
            }
        }
        if(numReq > 0 && m_num_sys_mem_wr_in_prog < MAX_SYS_MEM_WR_TRANS)
        {
            for(int i = m_next_wr_req_id; true; i = (i + 1) % MAX_FAS_WR_REQ)
            {
                if(m_wr_req_arr[i].req_pending)
                {
                    wait();
                    m_wr_req_arr[i].ack.notify(SC_ZERO_TIME);
                    m_next_wr_req_id = (i + 1) % MAX_FAS_WR_REQ;
                    break;
                }
            }
        }
    }
#endif
}


#ifdef SIMULATE_MEMORY
int CNN_Layer_Accel::system_mem_read(int* memory, int id, uint64_t mem_trans_addr, uint32_t mem_trans_size)
{
    // FIXME: add error checking
    const char* id_c = toHexCharArr(id);
	while(true)
	{
		wait();
		if(axi_rvalid->read() && axi_rid->read() == id_c)
		{
            mem_trans_size -= AXI_BUS_SIZE;
            (*memory) += std::min((uint32_t)AXI_BUS_SIZE, mem_trans_size);
			if(axi_rlast->read())
			{
				break;
			}
		}
	}
	m_rd_req_arr[req_idx].ack.notify(SC_ZERO_TIME);
}


int CNN_Layer_Accel::system_mem_write(int* memory, int req_idx, uint64_t mem_trans_addr, uint32_t mem_trans_size)
{
	int AXITransSizeCount = ceilf((float)mem_trans_size / (float)AXI_BUS_SIZE) * AXI_BUS_SIZE;
	int rem_tran_size = mem_trans_size;
    axi_awvalid->write(false);
	//////	
	axi_wdata = toHexCharArr(rand());
	wait();
	axi_wvalid->write(true);
	while(true) 
	{
		wait();
		if(AXITransSizeCount == 0) 
		{
			break;
		}
		if(AXITransSizeCount == 1) 
		{
			axi_wlast = true;
		}
		if(axi_wready->read() && axi_bid->read() == id) 
		{
			axi_wdata = toHexCharArr(rand());
		}
		rem_tran_size = ((rem_tran_size - AXI_BUS_SIZE) < 0) ? rem_tran_size : (rem_tran_size - AXI_BUS_SIZE);
		AXITransSizeCount -= AXI_BUS_SIZE;
		(*memory) -= std::min((uint32_t)AXI_BUS_SIZE, rem_tran_size);
	}
	axi_wvalid = true;
	axi_wlast = "0x0";
	m_wr_req_arr[req_idx].ack.notify(SC_ZERO_TIME);
}


void CNN_Layer_Accel::read_resp_process()
{
    while(true)
    {
        wait();
        // FIXME: add error checking
        if(axi_rvalid->read() && axi_rresp->read() != )
        {
            // axi_rid
            raise(SIGINT);
        }
    }
}


void CNN_Layer_Accel::write_resp_process()
{
	while(true) 
	{
		wait();
        // FIXME: add error checking
		if(axi_bvalid->read() && axi_bresp->read() != ) 
		{
            // axi_bid 
			raise(SIGINT);
		}
	}
}
#endif


void CNN_Layer_Accel::b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay)
{
    trans.acquire();
#ifdef SIMULATE_MEMORY
    Accel_Trans* accel_trans = (Accel_Trans*)trans.get_data_ptr();
    switch(trans.get_command())
    {
        case TLM_READ_COMMAND:
        {
			int req_idx = accel_trans->fas_rd_id;
            m_rd_req_arr[req_idx].req_pending = true;
			wait(m_rd_req_arr[req_idx].ack.default_event());
            m_num_sys_mem_rd_in_prog++;
            sc_core::sc_spawn_options args;
			args.set_sensitivity(&clk);
			sc_core::sc_spawn
            (
				nullptr,
				sc_core::sc_bind
                (
					&CNN_Layer_Accel::system_mem_read,
					this,
					accel_trans->memory,
					req_idx,
					trans.get_address(),
					trans.get_data_length()
				),
				("system_mem_read" + std::to_string(req_idx)).c_str(),
				&args
			);         
            b_schedule_read(req_idx, trans.get_address(), trans.get_data_length());
			wait(m_rd_req_arr[req_idx].ack.default_event());
			m_num_sys_mem_rd_in_prog--;
            break;
        }
        case TLM_WRITE_COMMAND:
        {
            int req_idx = accel_trans->fas_wr_id;
            m_wr_req_arr[req_idx].req_pending = true;
            wait(m_wr_req_arr[req_idx].ack.default_event());
            m_num_sys_mem_wr_in_prog++;
			sc_core::sc_spawn_options args;
			args.set_sensitivity(&clk);
			sc_core::sc_spawn
            (
				nullptr,
				sc_core::sc_bind
                (
					&CNN_Layer_Accel::system_mem_write,
					this,
					accel_trans->memory,
					req_idx,
					trans.get_address(),
					trans.get_data_length()
				),
				("system_mem_write" + std::to_string(req_idx)).c_str(),
				&args
			);
            b_schedule_write(req_idx, trans.get_address(), trans.get_data_length());
			wait(m_rd_req_arr[req_idx].ack.default_event());
            m_num_sys_mem_wr_in_prog--;
            break;
        }
    }
#endif
    trans.release();
}


void CNN_Layer_Accel::setMemory(uint64_t addr)
{
    m_memory.push_back(addr);
}


void CNN_Layer_Accel::start()
{
    m_start_time = sc_time_stamp().to_double();
    m_accelCfg->m_address = m_memory[0];
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


void CNN_Layer_Accel::waitComplete(double& elapsedTime, double& memPower)
{
    wait(m_complete.default_event());
    wait();
    elapsedTime = sc_time_stamp().to_double() - m_start_time;
    memPower = calculateMemPower();
    delete m_accelCfg;
    m_accelCfg = new AccelConfig();
    // FIXME: might need to read back data
    m_memory.clear();
}


double CNN_Layer_Accel::calculateMemPower()
{
    return 0.0f;
}

#ifdef SIMULATE_MEMORY
void CNN_Layer_Accel::b_schedule_read(int id, uint64_t mem_trans_addr, uint32_t mem_trans_size)
{
    while(true) 
    {
        wait(clk->posedge_event());
        if(axi_arready.read())
        {
            break;
        }
    }
    //////
    wait(clk->posedge_event());
    axi_arvalid 	    = true;
    axi_arid 		    = toHexCharArr(req_idx);
    axi_araddr 		    = toHexCharArr(mem_trans_addr);
    axi_arlen 		    = toHexCharArr(mem_trans_size);
    axi_arsize		    = toHexCharArr(ceil(log2(AXI_BUS_WIDTH / BITS_PER_BYTE)));
    axi_arburst		    = "0x1";	// ALWAYS 1
    wait(clk->posedge_event());
    axi_arvalid  	    = false;
    wait(clk->posedge_event());
    axi_arid 	        = "0x00000000";
	axi_araddr 	        = "0x0000000000000000";
	axi_arlen 	        = "0x00";
	axi_arsize	        = "0x0";
	axi_arburst	        = "0x0";
}


void CNN_Layer_Accel::b_schedule_write(int id, uint64_t mem_trans_addr, uint32_t mem_trans_size)
{
	while(true) 
	{
		wait(clk->posedge_event());
		if(axi_awready->read()) 
		{
			break;
		}
	}
	//////
	wait(clk->posedge_event());
	axi_awvalid     = true;
	axi_awid 	    = toHexCharArr(req_idx); 			
	axi_awaddr 	    = toHexCharArr(mem_trans_addr);
	axi_awlen 	    = toHexCharArr(mem_trans_size);	
	axi_awsize 	    = "110";
	axi_awburst     = "0x1";	// ALWAYS 1
	axi_wstrb 	    = "0xFFFFFFFFFFFFFFFF";
    wait(clk->posedge_event());
    axi_awid 	    = "0x00000000";			
	axi_awaddr 	    = "0x0000000000000000";
	axi_awlen 	    = "0x00";
	axi_awsize 	    = "000";
	axi_awburst     = "0x0";
	axi_wstrb 	    = "0x0000000000000000";
}
#endif


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



