`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company:
//
// Engineer:
//
// Create Date:
// Design Name:
// Module Name:
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
//
//
// Revision:
//
//
//
//
// Additional Comments:
//
//
//
//
//
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_axi_bridge (
	parameter C_NUM_CLIENTS = 8;
) (
	clk				        ,
	rst				        ,
	// AXI Write Address Ports
	axi_awready		        ,	// Indicates slave is ready to accept a 
	axi_awid		        ,	// Write ID
	axi_awaddr		        ,	// Write address
	axi_awlen		        ,	// Write Burst Length
	axi_awsize		        ,	// Write Burst size
	axi_awburst		        ,	// Write Burst type
	axi_awcache		        ,	// Write Cache type
	axi_awvalid		        ,	// Write address valid
	// AXI write data channel signals
	axi_wready		        ,	// Write data ready
	axi_wdata		        ,	// Write data
	axi_wstrb		        ,	// Write strobes
	axi_wlast		        ,	// Last write transaction   
	axi_wvalid		        ,	// Write valid  
	// AXI write response channel signals
	axi_bid			        ,	// Response ID
	axi_bresp		        ,	// Write response
	axi_bvalid		        ,	// Write reponse valid
	axi_bready		        ,	// Response ready
	// AXI read address channel signals
	axi_arready		        ,   // Read address ready
	axi_arid		        ,	// Read ID
	axi_araddr		        ,   // Read address
	axi_arlen		        ,   // Read Burst Length
	axi_arsize		        ,   // Read Burst size
	axi_arburst		        ,   // Read Burst type
	axi_arcache		        ,   // Read Cache type
	axi_arvalid		        ,   // Read address valid 
	// AXI read data channel signals   
	axi_rid			        ,   // Response ID
	axi_rresp		        ,   // Read response
	axi_rvalid		        ,   // Read reponse valid
	axi_rdata		        ,   // Read data
	axi_rlast		        ,   // Read last
	axi_rready		        ,   // Read Response ready 
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    init_read_req           ,
    init_read_req_id        ,
    init_read_addr          ,
    init_read_len           ,
    init_read_req_ack       ,
    init_read_in_prog       ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    init_read_data          ,
    init_read_data_vld      ,
    init_read_data_rdy      ,
    init_read_cmpl          ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    init_write_req          ,
    init_write_req_id       ,
    init_write_addr         ,
    init_write_len          ,
    init_write_req_ack      ,
    init_write_in_prog      ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------   
    init_write_data         ,
    init_write_data_vld     ,
    init_write_data_rdy     ,
    init_write_cmpl  
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "math.svh"
	`include "cnn_layer_accel_FAS.svh"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------    
	localparam C_NUM_CLIENTS_FIXED          = C_NUM_CLIENTS;
    localparam C_LOG2_NUM_CLIENTS_FIXED     = clog2(C_NUM_CLIENTS_FIXED);
    localparam C_MAX_N_TAGS                 = 16;
    localparam C_INIT_REQ_ID_WTH            = `MAX_FAS_RD_ID * `MAX_FAS_RD_ID;
    localparam C_INIT_MEM_RD_ADDR_WTH       = `MAX_FAS_RD_ID * `INIT_RD_ADDR_WIDTH;
    localparam C_INIT_MEM_RD_LEN_WTH        = `MAX_FAS_RD_ID * `INIT_RD_LEN_WIDTH;  


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	// AXI Write Address Ports
	input logic             clk             ;
    input logic             rst             ;
 	// AXI Write Address Ports   
    input  logic   	        axi_awready		;	// Wrire address is ready
	output logic [ 3:0]  	axi_awid		;	// Write ID
	output logic [28:0]  	axi_awaddr		;	// Write address
	output logic [ 7:0]  	axi_awlen		;	// Write Burst Length
	output logic [ 2:0]  	axi_awsize		;	// Write Burst size
	output logic [ 1:0]  	axi_awburst		;	// Write Burst type
	output logic [ 3:0]  	axi_awcache		;	// Write Cache type
	output logic  	        axi_awvalid		;	// Write address valid
	// AXI write data channel signals
	input  logic  	        axi_wready		;	// Write data ready
	output logic [63:0]  	axi_wdata		;	// Write data
	output logic [ 7:0]  	axi_wstrb		;	// Write strobes
	output logic  	        axi_wlast		;	// Last write transaction   
	output logic  	        axi_wvalid		;	// Write valid  
	// AXI write response channel signals
	input  logic [3:0]  	axi_bid			;	// Response ID
	input  logic [1:0]  	axi_bresp		;	// Write response
	input  logic  	        axi_bvalid		;	// Write reponse valid
	output logic  	        axi_bready		;	// Response ready
	// AXI read address channel signals
	input  logic   	        axi_arready		;   // Read address ready
	output logic [ 3:0]     axi_arid		;	// Read ID
	output logic [28:0]     axi_araddr		;   // Read address
	output logic [ 7:0]     axi_arlen		;   // Read Burst Length
	output logic [ 2:0]     axi_arsize		;   // Read Burst size
	output logic [ 1:0]     axi_arburst		;   // Read Burst type
	output logic [ 3:0]     axi_arcache		;   // Read Cache type
	output logic  	        axi_arvalid		;   // Read address valid 
	// AXI read data channel signals   
	input  logic [ 3:0]     axi_rid			;   // Response ID
	input  logic [ 1:0]     axi_rresp		;   // Read response
	input  logic            axi_rvalid		;   // Read reponse valid
	input  logic [63:0]     axi_rdata		;   // Read data
	input  logic            axi_rlast		;   // Read last
	output logic            axi_rready		;   // Read Response ready
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input  logic [            `MAX_FAS_RD_ID - 1:0]   cX_init_read_req              							    ;
    input  logic [         C_INIT_REQ_ID_WTH - 1:0]   cX_init_read_req_id           							    ;
    input  logic [    C_INIT_MEM_RD_ADDR_WTH - 1:0]   cX_init_read_addr             							    ;
    input  logic [     C_INIT_MEM_RD_LEN_WTH - 1:0]   cX_init_read_len              							    ;
    output logic [            `MAX_FAS_RD_ID - 1:0]   cX_init_read_req_ack          							    ;
    output logic [            `MAX_FAS_RD_ID - 1:0]   cX_init_read_in_prog          							    ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    output logic [       `INIT_RD_DATA_WIDTH - 1:0]   cX_init_read_data             							    ;
    output logic [            `MAX_FAS_RD_ID - 1:0]   cX_init_read_data_vld         							    ;
    input  logic [            `MAX_FAS_RD_ID - 1:0]   cX_init_read_data_rdy         							    ;
    output logic [            `MAX_FAS_RD_ID - 1:0]   cX_init_read_cmpl             							    ;
    // BEGIN -------------------------------------------------------------------------------------------------------------------------------------------    
    input  logic                                      cX_init_write_req             							    ;
    input  logic                                      cX_init_write_req_id          							    ;
    input  logic [       `INIT_WR_ADDR_WIDTH - 1:0]   cX_init_write_addr            							    ;
    input  logic [        `INIT_WR_LEN_WIDTH - 1:0]   cX_init_write_len             							    ;
    output logic                                      cX_init_write_req_ack         							    ;
    output logic                                      cX_init_write_in_prog         							    ;
    // BEGIN -------------------------------------------------------------------------------------------------------------------------------------------   
    input  logic [       `INIT_RD_DATA_WIDTH - 1:0]   cX_init_write_data            							    ;
    input  logic                                      cX_init_write_data_vld        							    ;
    output logic                                      cX_init_write_data_rdy        							    ;
    output logic                                      cX_init_write_cmpl  	


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------	
	logic	[        C_NUM_CLIENTS_FIXED - 1:0]		tag_to_client_lookaside_oh  [C_MAX_N_TAGS - 1:0];
	logic	[   C_LOG2_NUM_CLIENTS_FIXED - 1:0]		tag_to_client_lookaside		[C_MAX_N_TAGS - 1:0];
	logic	[        C_NUM_CLIENTS_FIXED - 1:0]		request;
	logic											grant_release;
	logic											grant_valid;
	logic	[   C_LOG2_NUM_CLIENTS_FIXED - 1:0]		grant;
	logic	[        C_NUM_CLIENTS_FIXED - 1:0]		grant_oh;
    logic                                           axi_rd_ack;
    logic                                           axi_wr_ack;
    logic                                           axi_rd_cmpl;
    logic                                           axi_wr_cmpl;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Instantiations
    //----------------------------------------------------------------------------------------------------------------------------------------------- 
    arbitration_nway_single_cycle #(
        .C_NUM_REQUESTORS(C_NUM_CLIENTS_FIXED)
    ) arbiter (
        .clk            ( clk           ),
        .rst            ( rst           ),
        .requests       ( request       ),
        .grant_release  ( grant_release ),
        .grant_valid    ( grant_valid   ),
        .grant          ( grant         ),
        .grant_oh       ( grant_oh      )
    );


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------	
	assign axi_rd_ack                           = (axi_arready && axi_arvalid);
    assign grant_release 						= axi_rd_ack;
	
	assign axi_arvalid 						    = cX_init_read_req[grant] && grant_valid;
	assign axi_araddr               			= cX_init_read_addr[grant * 64 +: 29];
	assign axi_arid                             = cX_init_read_req_id[grant];
    assign axi_arburst                          = 1;    // burst type ALWAYS 1
    assign axi_arsize		                    = 3;    // clog2(BUS_WIDTH / `BITS_PER_BYTE) // 8 Bytes
    assign axi_arlen				            = cX_init_read_len[grant * 36 +: 36];
    assign axi_rready                           = init_read_data_rdy[grant];
    // END logic ------------------------------------------------------------------------------------------------------------------------------------



    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------	
    integer i0;
    always@(*) begin
        for(i0 = 0; i0 < `MAX_FAS_RD_ID; i0 = i0 + 1) begin
            if(grant_oh[i0] && ) begin
                init_read_in_prog[grant] = 1;            
            end else if(grant_oh[i0] && axi_rlast  begin
                init_read_in_prog[grant] = 0;
            end
        end
    end
    
    integer i1;
    always@(*) begin
        for(i0 = 0; i0 < `MAX_FAS_RD_ID; i0 = i0 + 1) begin
            if(grant_oh[i0] && ) begin
                init_read_in_prog[grant] = 1;            
            end else if(grant_oh[i0] && axi_rlast  begin
                init_read_in_prog[grant] = 0;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    integer i1;
    always@(posedge clk) begin
		if(rst) begin
			for(i1 = 0; i1 < C_MAX_N_TAGS; i1 = i1 + 1) begin
				tag_to_client_lookaside_oh[i1] 	<= {C_NUM_CLIENTS_FIXED{1'b0}};
				tag_to_client_lookaside[i1] 		<= {C_NUM_CLIENTS_FIXED{1'b0}};
			end
		end else begin
			if(master_request && master_request_ack && (master_request_tag != 0)) begin
				tag_to_client_lookaside_oh[master_request_tag] 	<= grant_oh[C_NUM_CLIENTS_FIXED-1:0];
				tag_to_client_lookaside[master_request_tag] 	<= grant[C_LOG2_NUM_CLIENTS_FIXED-1:0];
			end
		end
	end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
	genvar r;
	generate
		for (r = 0; r < C_NUM_CLIENTS_FIXED; r = r + 1) begin: LBL_REQUEST_GEN
			if(r < C_NUM_CLIENTS_FIXED) begin
				assign request[r] = (grant_oh[r] && (axi_rd_ack || (master_request_complete) ? 1'b0 : cX_init_read_req[r];
			end else begin
				assign request[r] = 1'b0;
			end
		end
	endgenerate
    // END logic ------------------------------------------------------------------------------------------------------------------------------------	
endmodule
