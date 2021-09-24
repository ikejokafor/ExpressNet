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
//  cX - clientX or that individual bus line for that particular client
//  reason0 - hardcoded 0 because AXI4 does not suport write interleaving 
//
//
//
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_axi_bridge (
	parameter C_NUM_RD_CLIENTS = 8,
    parameter C_NUM_WR_CLIENTS = 8
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
    localparam C_LOG2_NUM_RD_CLIENTS        = clog2(C_NUM_RD_CLIENTS);
    localparam C_LOG2_NUM_WR_CLIENTS        = clog2(C_NUM_WR_CLIENTS);
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
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------		
    logic	[        C_NUM_RD_CLIENTS - 1:0]		rd_tag_to_client_lookaside_oh   [C_MAX_N_TAGS - 1:0];
	logic	[   C_LOG2_NUM_RD_CLIENTS_FIXED - 1:0]  rd_tag_to_client_lookaside	    [C_MAX_N_TAGS - 1:0];
	logic	[        C_NUM_RD_CLIENTS - 1:0]		rd_request;
	logic											rd_grant_release;
	logic											rd_grant_valid;
	logic	[   C_LOG2_NUM_RD_CLIENTS_FIXED - 1:0]	rd_grant;
	logic	[        C_NUM_RD_CLIENTS - 1:0]		rd_grant_oh;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic	[        C_NUM_WR_CLIENTS - 1:0]		wr_tag_to_client_lookaside_oh   [C_MAX_N_TAGS - 1:0];
	logic	[   C_LOG2_NUM_WR_CLIENTS_FIXED - 1:0]  wr_tag_to_client_lookaside	    [C_MAX_N_TAGS - 1:0];
	logic	[        C_NUM_WR_CLIENTS - 1:0]		wr_request;
	logic											wr_grant_release;
	logic											wr_grant_valid;
	logic	[   C_LOG2_NUM_WR_CLIENTS_FIXED - 1:0]	wr_grant;
	logic	[        C_NUM_WR_CLIENTS - 1:0]		wr_grant_oh;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
    logic                                           axi_addr_rd_ack;
    logic                                           axi_addr_wr_ack;
    logic                                           axi_rd_cmpl;
    logic                                           axi_wr_cmpl;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Instantiations
    //----------------------------------------------------------------------------------------------------------------------------------------------- 
    arbitration_nway_single_cycle #(
        .C_NUM_REQUESTORS(C_RD_NUM_CLIENTS_FIXED)
    ) arbiter (
        .clk            ( clk               ),
        .rst            ( rst               ),
        .requests       ( rd_request        ),
        .grant_release  ( rd_grant_release  ),
        .grant_valid    ( rd_grant_valid    ),
        .grant          ( rd_grant          ),
        .grant_oh       ( rd_grant_oh       )
    );
    
    
    arbitration_nway_single_cycle #(
        .C_NUM_REQUESTORS(C_WR_NUM_CLIENTS_FIXED)
    ) arbiter (
        .clk            ( clk               ),
        .rst            ( rst               ),
        .requests       ( wr_request        ),
        .grant_release  ( wr_grant_release  ),
        .grant_valid    ( wr_grant_valid    ),
        .grant          ( wr_grant          ),
        .grant_oh       ( wr_grant_oh       )
    );
    
    
     


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------	
	assign axi_arvalid 						                            = cX_init_read_req[rd_grant] && rd_grant_valid;	
    assign axi_addr_rd_ack                                              = (axi_arready && axi_arvalid);
    assign rd_grant_release 					                        = axi_addr_rd_ack;	
	assign axi_araddr               			                        = cX_init_read_addr[rd_grant * 64 +: 29];
	assign axi_arid                                                     = cX_init_read_req_id[rd_grant];
    assign axi_arburst                                                  = 1;    // burst type ALWAYS 1
    assign axi_arsize		                                            = 3;    // clog2(BUS_WIDTH / `BITS_PER_BYTE) // 8 Bytes
    assign axi_arlen				                                    = cX_init_read_len[rd_grant * 36 +: 36];
    assign axi_rready                                                   = cX_init_read_data_rdy[rd_tag_to_client_lookaside[axi_rid]];
    assign cX_init_read_data_vld[rd_tag_to_client_lookaside[axi_rid]]   = tag_to_client_lookaside_oh[axi_rid] && {C_NUM_RD_CLIENTS_FIXED{axi_rvalid}};
    assign cX_init_read_data[rd_tag_to_client_lookaside[axi_rid]]       = axi_rdata;
    assign axi_rd_cmpl                                                  = axi_rlast;
    assign cX_init_read_cmpl[rd_tag_to_client_lookaside[axi_rid]]       = axi_rd_cmpl;
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------	
    assign axi_awvalid                                                  = cX_init_write_req[wr_grant] && wr_grant_valid;	
    assign axi_addr_wr_ack                                              = (axi_awready && axi_awvalid);
    assign wr_grant_release 					                        = axi_addr_wr_ack;
	assign axi_awaddr		                                            = cX_init_write_addr[wr_grant * 64 +: 29];  
	assign axi_awid		                                                = cX_init_write_req_id[wr_grant];
    assign axi_arburst                                                  = 1;    // burst type ALWAYS 1
    assign axi_arsize		                                            = 3;    // clog2(BUS_WIDTH / `BITS_PER_BYTE) // 8 Bytes   
    assign axi_awlen		                                            = cX_init_write_len[wr_grant * 36 +: 36];
    assign axi_wvalid                                                   = cX_init_write_data_vld[wr_tag_to_client_lookaside[0]]; // reason0                
    assign cX_init_write_data_rdy[wr_tag_to_client_lookaside[0]]        = tag_to_client_lookaside_oh[0] && {C_NUM_WR_CLIENTS_FIXED{axi_wready}};    // reason0               
	assign axi_wstrb                                                    =
    assign axi_wdata						                            = cX_init_write_data[wr_tag_to_client_lookaside[master_dataout_tag] * 64 +: 64];    
    assign axi_wr_cmpl                                                  =
    assign cX_init_write_cmpl[wr_tag_to_client_lookaside[0]]            = axi_wr_cmpl;  // reason0
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------	
    integer i0;
    always@(*) begin
        for(i0 = 0; i0 < `MAX_FAS_RD_ID; i0 = i0 + 1) begin
            if(rd_grant_oh[i0]) begin
                init_read_in_prog[rd_grant] = 1;            
            end else if(grant_oh[i0] && axi_rlast  begin
                init_read_in_prog[rd_grant] = 0;
            end
        end
    end
    
    integer i1;
    always@(*) begin
        for(i1 = 0; i1 < `MAX_FAS_RD_ID; i1 = i1 + 1) begin
            if(wr_grant_oh[i1]) begin
                init_read_in_prog[wr_grant] = 1;            
            end else if(grant_oh[i1] && axi_rlast  begin
                init_read_in_prog[wr_grant] = 0;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    integer i2;
    always@(posedge clk) begin
		if(rst) begin
			for(i2 = 0; i2 < C_MAX_N_TAGS; i2 = i2 + 1) begin
				rd_tag_to_client_lookaside_oh[i2] 	<= {C_NUM_RD_CLIENTS{1'b0}};
				rd_tag_to_client_lookaside[i2] 		<= {C_NUM_RD_CLIENTS{1'b0}};
			end
		end else begin
			if(axi_arvalid && axi_addr_rd_ack) begin
				rd_tag_to_client_lookaside_oh[axi_arid] 	<= rd_grant_oh[C_NUM_RD_CLIENTS - 1:0];
				rd_tag_to_client_lookaside[axi_arid] 	    <= rd_grant[C_NUM_RD_CLIENTS - 1:0];
			end
		end
	end
    
    integer i3;
    always@(posedge clk) begin
		if(rst) begin
			for(i3 = 0; i3 < C_MAX_N_TAGS; i3 = i3 + 1) begin
				wr_tag_to_client_lookaside_oh[i3] 	<= {C_NUM_WR_CLIENTS{1'b0}};
				wr_tag_to_client_lookaside[i3] 		<= {C_NUM_WR_CLIENTS{1'b0}};
			end
		end else begin
			if(axi_awvalid && axi_addr_wr_ack) begin
				wr_tag_to_client_lookaside_oh[axi_awid] 	<= wr_grant_oh[C_NUM_WR_CLIENTS - 1:0];
				wr_tag_to_client_lookaside[axi_awid] 	    <= wr_grant[C_NUM_WR_CLIENTS - 1:0];
			end
		end
	end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
	genvar r0;
	generate
		for(r0 = 0; r0 < C_NUM_RD_CLIENTS; r0 = r0 + 1) begin: LBL_REQUEST_GEN
			if(r0 < C_NUM_RD_CLIENTS) begin
				assign rd_request[r0] = (rd_grant_oh[r0] && (axi_rd_ack || (axi_rd_cmpl) ? 1'b0 : cX_init_read_req[r0];
			end else begin
				assign rd_request[r0] = 1'b0;
			end
		end
	endgenerate
    
    genvar r1;
    generate
		for(r1 = 0; r1 < C_NUM_WR_CLIENTS; r1 = r1 + 1) begin: LBL_REQUEST_GEN
			if(r1 < C_NUM_WR_CLIENTS) begin
				assign wr_request[r1] = (wr_grant_oh[r1] && (axi_wr_ack || (axi_wr_cmpl) ? 1'b0 : cX_init_write_req[r1];
			end else begin
				assign wr_request[r1] = 1'b0;
			end
		end
	endgenerate
    // END logic ------------------------------------------------------------------------------------------------------------------------------------	
endmodule
