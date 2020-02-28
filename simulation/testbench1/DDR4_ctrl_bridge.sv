// `include "uvm_macros.svh"
`include "DDR4_ctrl_intf.sv"
// import uvm_pkg::*;

typedef bit [63:0] mem_queue_t[$];

class DDR4_ctrl_bridge #(
	parameter C_AXI_DATA_WIDTH = 64
);
    extern function new(virtual DDR4_ctrl_intf ddr4_ctrl_intf);
    extern task run();
	extern task AXI_Write(logic[31:0] addr, logic[7:0] length, mem_queue_t mem_queue);
	extern task AXI_Read(logic[31:0] addr, logic[7:0] length, ref mem_queue_t mem_queue);

	virtual DDR4_ctrl_intf m_ddr4_ctrl_intf;
endclass: DDR4_ctrl_bridge


function DDR4_ctrl_bridge::new(virtual DDR4_ctrl_intf ddr4_ctrl_intf);
	m_ddr4_ctrl_intf 							= ddr4_ctrl_intf;

	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awid		<= 0;
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awaddr		<= 0;
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awlen		<= 0;
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awsize		<= 0;
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awburst		<= 0;
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awlock		<= 0;
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awcache		<= 0;
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awprot		<= 0;
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awvalid		<= 0;

	m_ddr4_ctrl_intf.WrtData_cb.axi_wdata		<= 0;
	m_ddr4_ctrl_intf.WrtData_cb.axi_wstrb		<= 0;
	m_ddr4_ctrl_intf.WrtData_cb.axi_wlast		<= 0;  
	m_ddr4_ctrl_intf.WrtData_cb.axi_wvalid		<= 0;

	m_ddr4_ctrl_intf.WrtResp_cb.axi_bready		<= 1;
	
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arid			<= 0;
	m_ddr4_ctrl_intf.RdAddr_cb.axi_araddr		<= 0;
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arlen	    <= 0;
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arsize	    <= 0;
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arburst	    <= 0;
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arlock	    <= 0;
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arcache	    <= 0;
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arprot	    <= 0;
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arvalid	    <= 0;

	m_ddr4_ctrl_intf.RdData_cb.axi_rready		<= 1;
endfunction: new


task DDR4_ctrl_bridge::run();
	mem_queue_t wrt_mem_queue;
	mem_queue_t wrt_mem_queue_sol;
	mem_queue_t rd_mem_queue;
	int addr;
	int length;
	int i;
	int rd_queue;
	int wrt_queue;
	
	length = 64;
	addr = 0;
	for(i = 0; i < length; i = i + 1) begin
		int rand_num = $urandom();
		wrt_mem_queue.push_back(rand_num);
		wrt_mem_queue_sol.push_back(rand_num);
	end

	AXI_Write(addr, length - 1, wrt_mem_queue);
	AXI_Read(addr, length - 1, rd_mem_queue);
	
	for(i = 0; i < length; i = i + 1) begin
		rd_queue = rd_mem_queue.pop_front();
		wrt_queue = wrt_mem_queue_sol.pop_front();
		$display("rd_queue %d, wrt_queue: %d", rd_queue, wrt_queue);
		if(rd_queue != wrt_queue) begin
			$stop;
		end
	end
endtask: run


task DDR4_ctrl_bridge::AXI_Write(logic[31:0] addr, logic[7:0] length, mem_queue_t mem_queue);
	while(1) begin
		@(m_ddr4_ctrl_intf.WrtAddr_cb);
		if(m_ddr4_ctrl_intf.WrtAddr_cb.axi_awready) begin
			break;
		end
	end

	@(m_ddr4_ctrl_intf.WrtAddr_cb);
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awvalid 	<= 1;
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awid 		<= 0;
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awaddr 		<= addr;
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awlen 		<= length;
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awsize		<= 3; 	// clog2(BUS_WIDTH / `BITS_PER_BYTE) // 8 Bytes
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awburst		<= 1;	// Always 1
	m_ddr4_ctrl_intf.WrtData_cb.axi_wstrb		<= 8'hFF;	// Typicall FF
	@(m_ddr4_ctrl_intf.WrtAddr_cb);
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awvalid 	<= 0;


	m_ddr4_ctrl_intf.WrtData_cb.axi_wdata 		<= mem_queue.pop_front();
	@(m_ddr4_ctrl_intf.WrtData_cb);
	m_ddr4_ctrl_intf.WrtData_cb.axi_wvalid 		<= 1;
	while(1) begin
		@(m_ddr4_ctrl_intf.WrtData_cb);
		if(mem_queue.size() == 0) begin
			break;
		end
		if(mem_queue.size() == 1) begin
			m_ddr4_ctrl_intf.WrtData_cb.axi_wlast 	<= 1;
		end
		if(m_ddr4_ctrl_intf.WrtData_cb.axi_wready) begin
			m_ddr4_ctrl_intf.WrtData_cb.axi_wdata 	<= mem_queue.pop_front();
		end
	end
	m_ddr4_ctrl_intf.WrtData_cb.axi_wvalid 	<= 0;
	m_ddr4_ctrl_intf.WrtData_cb.axi_wlast 	<= 0;

	while(1) begin
		@(m_ddr4_ctrl_intf.WrtResp_cb);
		if(m_ddr4_ctrl_intf.WrtResp_cb.axi_bvalid) begin
			break;
		end
	end
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awid 		<= 0;
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awaddr 		<= 0;
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awlen 		<= 0;
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awsize		<= 0;
	m_ddr4_ctrl_intf.WrtAddr_cb.axi_awburst		<= 0;
	m_ddr4_ctrl_intf.WrtData_cb.axi_wstrb		<= 0;
endtask: AXI_Write


task DDR4_ctrl_bridge::AXI_Read(logic[31:0] addr, logic[7:0] length, ref mem_queue_t mem_queue);
	while(1) begin
		@(m_ddr4_ctrl_intf.RdAddr_cb);
		if(m_ddr4_ctrl_intf.RdAddr_cb.axi_arready) begin
			break;
		end
	end

	@(m_ddr4_ctrl_intf.RdAddr_cb);
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arvalid 		<= 1;
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arid 		<= 0;
	m_ddr4_ctrl_intf.RdAddr_cb.axi_araddr 		<= addr;
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arlen 		<= length;
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arsize		<= 3; 	// clog2(BUS_WIDTH / `BITS_PER_BYTE) // 8 Bytes
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arburst		<= 1;	// ALWAYS 1
	m_ddr4_ctrl_intf.RdData_cb.axi_rready 		<= 1;
	@(m_ddr4_ctrl_intf.RdAddr_cb);
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arvalid  	<= 0;

	while(1) begin
		@(m_ddr4_ctrl_intf.RdData_cb);
		if(m_ddr4_ctrl_intf.RdData_cb.axi_rvalid) begin
			mem_queue.push_back(m_ddr4_ctrl_intf.RdData_cb.axi_rdata);
			if(m_ddr4_ctrl_intf.RdData_cb.axi_rlast) begin
				break;
			end
		end
	end

	m_ddr4_ctrl_intf.RdAddr_cb.axi_arid 		<= 0;
	m_ddr4_ctrl_intf.RdAddr_cb.axi_araddr 		<= 0;
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arlen 		<= 0;
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arsize		<= 0;
	m_ddr4_ctrl_intf.RdAddr_cb.axi_arburst		<= 0;
	m_ddr4_ctrl_intf.RdData_cb.axi_rready 		<= 0;
endtask: AXI_Read
