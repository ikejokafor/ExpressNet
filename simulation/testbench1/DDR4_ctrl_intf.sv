`timescale 1ns / 1ps
interface DDR4_ctrl_intf #(
  parameter C_AXI_ID_WIDTH   = 4,
  parameter C_AXI_ADDR_WIDTH = 29, 
  parameter C_AXI_DATA_WIDTH = 64
) (
	clk				,
	// AXI write address channel signals
	axi_awready		, 	// Indicates slave is ready to accept a 
	axi_awid		,   // Write ID
	axi_awaddr		,  	// Write address
	axi_awlen		,   // Write Burst Length
	axi_awsize		,  	// Write Burst size
	axi_awburst		, 	// Write Burst type
	axi_awlock		,  	// Write lock type
	axi_awcache		, 	// Write Cache type
	axi_awprot		,  	// Write Protection type
	axi_awvalid		, 	// Write address valid
	// AXI write data channel signals
	axi_wready		,  	// Write data ready
	axi_wdata		,   // Write data
	axi_wstrb		,   // Write strobes
	axi_wlast		,   // Last write transaction   
	axi_wvalid		,   // Write valid  
	// AXI write response channel signals
	axi_bid			,   // Response ID
	axi_bresp		,   // Write response
	axi_bvalid		,  	// Write reponse valid
	axi_bready		,	// Response ready
	// AXI read address channel signals
	axi_arready		,   // Read address ready
	axi_arid		,	// Read ID
	axi_araddr		,   // Read address
	axi_arlen		,   // Read Burst Length
	axi_arsize		,   // Read Burst size
	axi_arburst		,   // Read Burst type
	axi_arlock		,   // Read lock type
	axi_arcache		,   // Read Cache type
	axi_arprot		,   // Read Protection type
	axi_arvalid		,   // Read address valid 
	// AXI read data channel signals   
	axi_rid			,   // Response ID
	axi_rresp		,   // Read response
	axi_rvalid		,   // Read reponse valid
	axi_rdata		,   // Read data
	axi_rlast		,   // Read last
	axi_rready		    // Read Response ready
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
	

    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	input clk										;
	// AXI write address channel signals
	input                               axi_awready	;	// Indicates slave is ready to accept a 
	output [C_AXI_ID_WIDTH-1:0]         axi_awid	;   // Write ID
	output [C_AXI_ADDR_WIDTH-1:0]       axi_awaddr	;  	// Write address
	output [7:0]                        axi_awlen	;   // Write Burst Length
	output [2:0]                        axi_awsize	;  	// Write Burst size
	output [1:0]                        axi_awburst	; 	// Write Burst type
	output                              axi_awlock	;  	// Write lock type
	output [3:0]                        axi_awcache	; 	// Write Cache type
	output [2:0]                        axi_awprot	;  	// Write Protection type
	output                              axi_awvalid	; 	// Write address valid
	// AXI write data channel signals
	input                               axi_wready	;	// Write data ready
	output [C_AXI_DATA_WIDTH-1:0]       axi_wdata	;   // Write data
	output [C_AXI_DATA_WIDTH/8-1:0]		axi_wstrb	;   // Write strobes
	output                              axi_wlast	;   // Last write transaction   
	output                              axi_wvalid	;   // Write valid  
	// AXI write response channel signals
	input  [C_AXI_ID_WIDTH -1:0]          axi_bid		;   // Response ID
	input  [1:0]                         axi_bresp		;   // Write response
	input                                axi_bvalid		;  	// Write reponse valid
	output                               axi_bready		;  	// Response ready
	// AXI read address channel signals
	input                                axi_arready	;	// Read address ready
	output [C_AXI_ID_WIDTH-1:0]          axi_arid		;   // Read ID
	output [C_AXI_ADDR_WIDTH-1:0]        axi_araddr		;   // Read address
	output [7:0]                         axi_arlen		;   // Read Burst Length
	output [2:0]                         axi_arsize		;   // Read Burst size
	output [1:0]                         axi_arburst	;  	// Read Burst type
	output                               axi_arlock		;   // Read lock type
	output [3:0]                         axi_arcache	;  	// Read Cache type
	output [2:0]                         axi_arprot		;   // Read Protection type
	output                               axi_arvalid	;  	// Read address valid 
	// AXI read data channel signals   
	input  [C_AXI_ID_WIDTH-1:0]          axi_rid		;   // Response ID
	input  [1:0]                         axi_rresp		;   // Read response
	input                                axi_rvalid		;  	// Read reponse valid
	input  [C_AXI_DATA_WIDTH-1:0]        axi_rdata		;   // Read data
	input                                axi_rlast		;   // Read last
	output                               axi_rready		;  	// Read Response ready
	

    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Clocking Blocks
	//-----------------------------------------------------------------------------------------------------------------------------------------------	
	clocking WrtAddr_cb @(posedge clk);
		input	axi_awready	;
		output 	axi_awid	;
		output 	axi_awaddr	;
		output 	axi_awlen	;
		output 	axi_awsize	;
		output 	axi_awburst	;
		output 	axi_awlock	;
		output 	axi_awcache	;
		output 	axi_awprot	;
		output 	axi_awvalid	;
	endclocking
	
	
	clocking WrtData_cb @(posedge clk);
		input	axi_wready	;
		output 	axi_wdata	;
		output 	axi_wstrb	;
		output 	axi_wlast	;  
		output 	axi_wvalid	;
	endclocking


	clocking WrtResp_cb @(posedge clk);
		input	axi_bid		;
		input	axi_bresp	;
		input	axi_bvalid	;
		output 	axi_bready	;
	endclocking

	
	clocking RdAddr_cb @(posedge clk);
		input	axi_arready	;
		output 	axi_arid	;
		output 	axi_araddr	;
		output 	axi_arlen	;
		output 	axi_arsize	;
		output 	axi_arburst	;
		output 	axi_arlock	;
		output 	axi_arcache	;
		output 	axi_arprot	;
		output 	axi_arvalid	;
	endclocking

	
	clocking RdData_cb @(posedge clk);
		input	axi_rid		;
		input	axi_rresp	;
		input	axi_rvalid	;
		input	axi_rdata	;
		input	axi_rlast	;
		output 	axi_rready	;
	endclocking


endinterface