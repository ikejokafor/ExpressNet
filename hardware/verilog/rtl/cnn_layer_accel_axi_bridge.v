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
//   
//
//
//
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_axi_bridge #(
	parameter C_NUM_RD_CLIENTS = 8,
    parameter C_NUM_WR_CLIENTS = 8
) (
	clk				        ,
	rst				        ,
	// AXI Write Address Ports
	cX_axi_awready		        ,	// Indicates slave is ready to accept a 
	cX_axi_awid		            ,	// Write ID
	cX_axi_awaddr		        ,	// Write address
	cX_axi_awlen		        ,	// Write Burst Length
	cX_axi_awsize		        ,	// Write Burst size
	cX_axi_awburst		        ,	// Write Burst type
	cX_axi_awvalid		        ,	// Write address valid
	// AXI write data channel signals
	cX_axi_wready		        ,	// Write data ready
	cX_axi_wdata		        ,	// Write data
	cX_axi_wstrb		        ,	// Write strobes
	cX_axi_wlast		        ,	// Last write transaction   
	cX_axi_wvalid		        ,	// Write valid  
	// AXI write response channel signals
	cX_axi_bid			        ,	// Response ID
	cX_axi_bresp		        ,	// Write response
	cX_axi_bvalid		        ,	// Write reponse valid
	cX_axi_bready		        ,	// Response ready
	// AXI read address channel signals
	cX_axi_arready		        ,   // Read address ready
	cX_axi_arid		            ,	// Read ID
	cX_axi_araddr		        ,   // Read address
	cX_axi_arlen		        ,   // Read Burst Length
	cX_axi_arsize		        ,   // Read Burst size
	cX_axi_arburst		        ,   // Read Burst type
	cX_axi_arvalid		        ,   // Read address valid 
	// AXI read data channel signals   
	cX_axi_rid			        ,   // Response ID
	cX_axi_rdata		        ,   // Read data
	cX_axi_rresp		        ,   // Read response	
    cX_axi_rlast		        ,   // Read last
	cX_axi_rvalid		        ,   // Read reponse valid	
    cX_axi_rready		        ,   // Read Response ready 
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    cX_init_read_req        ,
    cX_init_read_req_id     ,
    cX_init_read_addr       ,
    cX_init_read_len        ,
    cX_init_read_req_ack    ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    cX_init_read_data       ,
    cX_init_read_data_vld   ,
    cX_init_read_data_rdy   ,
    cX_init_read_cmpl       ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    cX_init_write_req       ,
    cX_init_write_req_id    ,
    cX_init_write_addr      ,
    cX_init_write_len       ,
    cX_init_write_req_ack   ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------   
    cX_init_write_data      ,
    cX_init_write_data_vld  ,
    cX_init_write_data_rdy  ,
    cX_init_write_cmpl  
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "math.svh"
	`include "cnn_layer_accel_FAS.svh"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------    
    localparam C_NUM_RD_CLIENTS_FIXED       = C_NUM_RD_CLIENTS;
    localparam C_NUM_WR_CLIENTS_FIXED       = C_NUM_WR_CLIENTS;   
    localparam C_LOG2_NUM_RD_CLIENTS        = clog2(C_NUM_RD_CLIENTS);
    localparam C_LOG2_NUM_WR_CLIENTS        = clog2(C_NUM_WR_CLIENTS);
    localparam C_MAX_N_TAGS                 = 16;
    
    localparam C_INIT_RD_REQ_ID_WTH         = C_NUM_RD_CLIENTS * `MAX_FAS_RD_ID;
    localparam C_INIT_MEM_RD_ADDR_WTH       = C_NUM_RD_CLIENTS * `INIT_RD_ADDR_WIDTH;
    localparam C_INIT_MEM_RD_LEN_WTH        = C_NUM_RD_CLIENTS * `INIT_RD_LEN_WIDTH;  
    localparam C_INIT_MEM_RD_DATA_WTH       = C_NUM_RD_CLIENTS * `INIT_RD_DATA_WIDTH;

    localparam C_INIT_WR_REQ_ID_WTH         = C_NUM_WR_CLIENTS;
    localparam C_INIT_MEM_WR_ADDR_WTH       = C_NUM_WR_CLIENTS * `INIT_RD_ADDR_WIDTH;
    localparam C_INIT_MEM_WR_LEN_WTH        = C_NUM_WR_CLIENTS * `INIT_RD_LEN_WIDTH;  
    localparam C_INIT_MEM_WR_DATA_WTH       = C_NUM_WR_CLIENTS * `INIT_RD_DATA_WIDTH;

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	// AXI Write Address Ports
	input logic             clk             ;
    input logic             rst             ;
 	// AXI Write Address Ports   
    input  logic   	        cX_axi_awready		;	// Wrire address is ready
	output logic [ 3:0]  	cX_axi_awid		    ;	// Write ID
	output logic [28:0]  	cX_axi_awaddr		;	// Write address
	output logic [ 7:0]  	cX_axi_awlen		;	// Write Burst Length
	output logic [ 2:0]  	cX_axi_awsize		;	// Write Burst size
	output logic [ 1:0]  	cX_axi_awburst		;	// Write Burst type
	output logic [ 3:0]  	cX_axi_awcache		;	// Write Cache type
	output logic  	        cX_axi_awvalid		;	// Write address valid
	// AXI write data channel signals
	input  logic  	        cX_axi_wready		;	// Write data ready
	output logic [63:0]  	cX_axi_wdata		;	// Write data
	output logic [ 7:0]  	cX_axi_wstrb		;	// Write strobes
	output logic  	        cX_axi_wlast		;	// Last write transaction   
	output logic  	        cX_axi_wvalid		;	// Write valid  
	// AXI write response channel signals
	input  logic [3:0]  	cX_axi_bid			;	// Response ID
	input  logic [1:0]  	cX_axi_bresp		;	// Write response
	input  logic  	        cX_axi_bvalid		;	// Write reponse valid
	output logic  	        cX_axi_bready		;	// Response ready
	// AXI read address channel signals
	input  logic   	        cX_axi_arready		;   // Read address ready
	output logic [ 3:0]     cX_axi_arid		    ;	// Read ID
	output logic [28:0]     cX_axi_araddr		;   // Read address
	output logic [ 7:0]     cX_axi_arlen		;   // Read Burst Length
	output logic [ 2:0]     cX_axi_arsize		;   // Read Burst size
	output logic [ 1:0]     cX_axi_arburst		;   // Read Burst type
	output logic [ 3:0]     cX_axi_arcache		;   // Read Cache type
	output logic  	        cX_axi_arvalid		;   // Read address valid 
	// AXI read data channel signals   
	input  logic [ 3:0]     cX_axi_rid			;   // Response ID
	input  logic [63:0]     cX_axi_rdata		;   // Read data
	input  logic [ 1:0]     cX_axi_rresp		;   // Read response
	input  logic            cX_axi_rlast		;   // Read last
	input  logic            cX_axi_rvalid		;   // Read reponse valid
	output logic            cX_axi_rready		;   // Read Response ready
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input  logic [          C_NUM_RD_CLIENTS - 1:0]   cX_init_read_req          ;
    input  logic [      C_INIT_RD_REQ_ID_WTH - 1:0]   cX_init_read_req_id       ;
    input  logic [    C_INIT_MEM_RD_ADDR_WTH - 1:0]   cX_init_read_addr         ;
    input  logic [     C_INIT_MEM_RD_LEN_WTH - 1:0]   cX_init_read_len          ;
    output logic [          C_NUM_RD_CLIENTS - 1:0]   cX_init_read_req_ack      ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    output logic [    C_INIT_MEM_RD_DATA_WTH - 1:0]   cX_init_read_data         ;
    output logic [          C_NUM_RD_CLIENTS - 1:0]   cX_init_read_data_vld     ;
    input  logic [          C_NUM_RD_CLIENTS - 1:0]   cX_init_read_data_rdy     ;
    output logic [          C_NUM_RD_CLIENTS - 1:0]   cX_init_read_cmpl         ;
    // BEGIN -------------------------------------------------------------------------------------------------------------------------------------------    
    input  logic [          C_NUM_WR_CLIENTS - 1:0]   cX_init_write_req         ;
    input  logic [      C_INIT_WR_REQ_ID_WTH - 1:0]   cX_init_write_req_id      ;
    input  logic [    C_INIT_MEM_WR_ADDR_WTH - 1:0]   cX_init_write_addr        ;
    input  logic [     C_INIT_MEM_WR_LEN_WTH - 1:0]   cX_init_write_len         ;
    output logic [          C_NUM_WR_CLIENTS - 1:0]   cX_init_write_req_ack     ;
    // BEGIN -------------------------------------------------------------------------------------------------------------------------------------------   
    input  logic [    C_INIT_MEM_WR_DATA_WTH - 1:0]   cX_init_write_data        ;
    input  logic [          C_NUM_WR_CLIENTS - 1:0]   cX_init_write_data_vld    ;
    output logic [          C_NUM_WR_CLIENTS - 1:0]   cX_init_write_data_rdy    ;
    output logic [          C_NUM_WR_CLIENTS - 1:0]   cX_init_write_cmpl  	    ;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------	
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
    logic                                       cX_axi_addr_rd_ack;
    logic                                       cX_axi_addr_wr_ack;



    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    generate genvar g0; for(g0 = 0; g0 < C_NUM_RD_CLIENTS; g0 = g0 + 1) begin
        assign cX_axi_arvalid[g0] 						                = cX_init_read_req[g0];
        assign cX_axi_addr_rd_ack[g0]                                   = (axi_arready[g0] && axi_arvalid[g0]);
        assign cX_init_read_req_ack[g0] 			                    = axi_addr_rd_ack[g0];	
        assign cX_axi_araddr[g0 * `AXI_ADDR_WTH +: `AXI_ADDR_WTH]       = cX_init_read_addr[g0 * `AXI_ADDR_WTH +: `AXI_ADDR_WTH];
        assign cX_axi_arid[g0 * `AXI_ID_WTH +: `AXI_ID_WTH]             = cX_init_read_req_id[g0 * `AXI_ID_WTH +: `AXI_ID_WTH];
        assign cX_axi_arburst[g0]                                       = 1;    // burst type ALWAYS 1
        assign cX_axi_arsize[g0]                                        = 3;    // clog2(BUS_WIDTH / `BITS_PER_BYTE) // 8 Bytes
        assign cX_axi_arlen[g0 * `AXI_LEN_WTH +: `AXI_LEN_WTH]          = cX_init_read_len[g0 * `AXI_LEN_WTH +: `AXI_LEN_WTH];
        assign cX_axi_rready[g0]	                                    = cX_init_read_data_rdy[g0];
        assign cX_init_read_data_vld[g0]                                = axi_rvalid[g0];
        assign cX_init_read_data[                                        = axi_rdata}};
        assign cX_init_read_cmpl[g0]                                    = axi_rlast[g0];
    end endgenerate
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    generate genvar g1; for(g1 = 0; g1 < C_NUM_WR_CLIENTS; g1 = g1 + 1) begin
        assign axi_awvalid                                                  = cX_init_write_req[wr_grant] && wr_grant_valid;	 
        assign axi_addr_wr_ack                                              = (axi_awready && axi_awvalid);
        assign wr_grant_release 					                        = axi_addr_wr_ack;
        assign axi_awaddr		                                            = cX_init_write_addr[wr_grant * 64 +: 29];  
        assign axi_awid		                                                = cX_init_write_req_id[wr_grant];
        assign axi_awburst                                                  = 1;    // burst type ALWAYS 1
        assign axi_awsize		                                            = 3;    // clog2(BUS_WIDTH / `BITS_PER_BYTE) // 8 Bytes   
        assign axi_awlen		                                            = cX_init_write_len[wr_grant * 36 +: 36];
        assign axi_wvalid                                                   = cX_init_write_data_vld[wr_grant];                 
        assign cX_init_write_data_rdy                                       = wr_tag_to_client_lookaside_oh[axi_bid] && {C_NUM_WR_CLIENTS{axi_wready}};                   
        assign axi_wstrb                                                    = 8'hFF;
        assign axi_wdata						                            = cX_init_write_data[wr_tag_to_client_lookaside[axi_bid] * 64 +: 64];      
        assign axi_bready                                                   = 1;
        assign axi_wr_cmpl                                                  = axi_bvalid;
        assign cX_init_write_cmpl[0]                                        = {{C_NUM_WR_CLIENTS - 1{1'b0}}, axi_wr_cmpl} << wr_tag_to_client_lookaside[axi_bid];   
    end endgenerate
    // END logic ------------------------------------------------------------------------------------------------------------------------------------   


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    generate genvar g1; for(g1 = 0; g1 < C_NUM_WR_CLIENTS; g1 = g1 + 1) begin
    
    end generate
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    generate if(C_NUM_WR_CLIENTS > 1) begin

    end else begin
        assign axi_awvalid                                                  = cX_init_write_req; 
        assign axi_addr_wr_ack                                              = (axi_awready && axi_awvalid);
        assign wr_grant_release 					                        = axi_addr_wr_ack;
        assign axi_awaddr		                                            = cX_init_write_addr[wr_grant * 64 +: 29];  
        assign axi_awid		                                                = cX_init_write_req_id;
        assign axi_awburst                                                  = 1;    // burst type ALWAYS 1
        assign axi_awsize		                                            = 3;    // clog2(BUS_WIDTH / `BITS_PER_BYTE) // 8 Bytes   
        assign axi_awlen		                                            = cX_init_write_len[wr_grant * 36 +: 36];
        assign axi_wvalid                                                   = cX_init_write_data_vld;                 
        assign cX_init_write_data_rdy                                       = axi_wready;                 
        assign axi_wstrb                                                    = 8'hFF;
        assign axi_wdata						                            = cX_init_write_data;    
        assign axi_bready                                                   = 1;
        assign axi_wr_cmpl                                                  = axi_bvalid;
        assign cX_init_write_cmpl                                           = axi_wr_cmpl;  
    end endgenerate
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ---------------------------------------------------------------------------------------------------------------------------------- 
    integer i2; always@(posedge clk) begin
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
    
    integer i3; always@(posedge clk) begin
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
	genvar r0; generate for(r0 = 0; (r0 < C_NUM_RD_CLIENTS && C_NUM_RD_CLIENTS > 1); r0 = r0 + 1) begin: LBL_WR_REQUEST_GEN
        if(r0 < C_NUM_RD_CLIENTS) begin
			assign rd_request[r0] = (rd_grant_oh[r0] && (axi_addr_rd_ack || (axi_rd_cmpl))) ? 1'b0 : cX_init_read_req[r0];
		end else begin
            assign rd_request[r0] = 1'b0;
        end
	end endgenerate
    
    genvar r1; generate for(r1 = 0; (r1 < C_NUM_WR_CLIENTS && C_NUM_WR_CLIENTS > 1); r1 = r1 + 1) begin: LBL_RD_REQUEST_GEN
        if(r1 < C_NUM_WR_CLIENTS) begin
            assign wr_request[r1] = (wr_grant_oh[r1] && (axi_addr_wr_ack || (axi_wr_cmpl))) ? 1'b0 : cX_init_write_req[0]; 
        end else begin
            assign wr_request[r1] = 1'b0;
        end
    end endgenerate   
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
     // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------	
    always@(posedge clk) begin
        if(rst) begin
            axi_trans_rd_state <= ST_WAIT;
        end else begin
        
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------	
    always@(posedge clk) begin
        if(rst) begin
            axi_trans_wr_state <= ST_WAIT;
        end else begin
            case(axi_trans_wr_state)
                ST_WAIT_DATA: begin
                    if() begin
                        wr_Addr <= cX_init_write_addr[wr_grant * 64 +: 29] + cX_init_write_len[wr_grant * 36 +: 36];
                        axi_trans_wr_state <= ST_ANALYZE_DATA;
                    end
                end
                ST_ANALYZE_DATA: begin
                    if() begin
                        axi_trans_wr_state <= ST_PROCESS;
                    end else begin
                        axi_trans_wr_state <= ST_STORE_RES;
                    end
                end
                ST_PROCESS: begin
                    if() begin
                        axi_trans_wr_state <= ST_STORE_RES;
                    end
                end
                ST_STORE_RES: begin
                    axi_trans_wr_state <= ST_ANALYZE_DATA;
                end
            endcase
        end    
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


endmodule
