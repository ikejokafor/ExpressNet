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
	axi_awready		        ,	// Indicates slave is ready to accept a 
	axi_awid		            ,	// Write ID
	axi_awaddr		        ,	// Write address
	axi_awlen		        ,	// Write Burst Length
	axi_awsize		        ,	// Write Burst size
	axi_awburst		        ,	// Write Burst type
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
	axi_arvalid		        ,   // Read address valid 
	// AXI read data channel signals   
	axi_rid			        ,   // Response ID
	axi_rdata		        ,   // Read data
	axi_rresp		        ,   // Read response	
    axi_rlast		        ,   // Read last
	axi_rvalid		        ,   // Read reponse valid	
    axi_rready		        ,   // Read Response ready 
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    init_rd_req        ,
    init_rd_req_id     ,
    init_rd_addr       ,
    init_rd_len        ,
    init_rd_req_ack    ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    init_rd_data       ,
    init_rd_data_vld   ,
    init_rd_data_rdy   ,
    init_rd_cmpl       ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    init_wr_req       ,
    init_wr_req_id    ,
    init_wr_addr      ,
    init_wr_len       ,
    init_wr_req_ack   ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------   
    init_wr_data      ,
    init_wr_data_vld  ,
    init_wr_data_rdy  ,
    init_wr_cmpl  
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "math.svh"
	`include "axi_defs.svh"
    `include "cnn_layer_accel_FAS.svh"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------    
    localparam C_NUM_TOTAL_CLIENTS      = C_NUM_RD_CLIENTS + C_NUM_WR_CLIENTS;
    
    localparam C_AXI_ID_WTH             = C_NUM_TOTAL_CLIENTS * `AXI_ID_WTH;
    localparam C_AXI_ADDR_WTH           = C_NUM_TOTAL_CLIENTS * `AXI_ADDR_WTH;
    localparam C_AXI_LEN_WTH            = C_NUM_TOTAL_CLIENTS * `AXI_LEN_WTH;
    localparam C_AXI_DATA_WTH           = C_NUM_TOTAL_CLIENTS * `AXI_DATA_WTH;
    localparam C_AXI_RESP_WTH           = C_NUM_TOTAL_CLIENTS * `AXI_RESP_WTH;
    localparam C_AXI_BR_WTH             = C_NUM_TOTAL_CLIENTS * `AXI_BR_WTH;    
    localparam C_AXI_SZ_WTH             = C_NUM_TOTAL_CLIENTS * `AXI_SZ_WTH;
    localparam C_AXI_WSTRB_WTH          = C_NUM_TOTAL_CLIENTS * `AXI_WSTRB_WTH;

    localparam C_INIT_ID_WTH            = C_NUM_RD_CLIENTS * `AXI_ID_WTH;
    localparam C_INIT_ADDR_WTH          = C_NUM_RD_CLIENTS * `AXI_ADDR_WTH;
    localparam C_INIT_LEN_WTH           = C_NUM_RD_CLIENTS * `AXI_LEN_WTH;  
    localparam C_INIT_DATA_WTH          = C_NUM_RD_CLIENTS * `AXI_DATA_WTH;

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	// AXI Write Address Ports
	input logic                                 clk                 ;
    input logic                                 rst                 ;
 	// AXI Write Address Ports   
    input  logic [C_NUM_TOTAL_CLIENTS - 1:0]    axi_awready		    ;	// Wrire address is ready
	output logic [       C_AXI_ID_WTH - 1:0]  	axi_awid		    ;	// Write ID
	output logic [     C_AXI_ADDR_WTH - 1:0]  	axi_awaddr		    ;	// Write address
	output logic [      C_AXI_LEN_WTH - 1:0]  	axi_awlen		    ;	// Write Burst Length
	output logic [       C_AXI_SZ_WTH - 1:0]  	axi_awsize		    ;	// Write Burst size
	output logic [       C_AXI_BR_WTH - 1:0]  	axi_awburst		    ;	// Write Burst type
	output logic [C_NUM_TOTAL_CLIENTS - 1:0] 	axi_awvalid		    ;	// Write address valid
	// AXI write data channel signals
	input  logic [C_NUM_TOTAL_CLIENTS - 1:0]	axi_wready		    ;	// Write data ready
	output logic [     C_AXI_DATA_WTH - 1:0]  	axi_wdata		    ;	// Write data
	output logic [    C_AXI_WSTRB_WTH - 1:0]  	axi_wstrb		    ;	// Write strobes
	output logic [C_NUM_TOTAL_CLIENTS - 1:0]	axi_wlast		    ;	// Last write transaction   
	output logic [C_NUM_TOTAL_CLIENTS - 1:0]	axi_wvalid		    ;	// Write valid  
	// AXI write response channel signals
	input  logic [       C_AXI_ID_WTH - 1:0]  	axi_bid			    ;	// Response ID
	input  logic [     C_AXI_RESP_WTH - 1:0]  	axi_bresp		    ;	// Write response
	input  logic [C_NUM_TOTAL_CLIENTS - 1:0] 	axi_bvalid		    ;	// Write reponse valid
	output logic [C_NUM_TOTAL_CLIENTS - 1:0] 	axi_bready		    ;	// Response ready
	// AXI read address channel signals
	input  logic [C_NUM_TOTAL_CLIENTS - 1:0]    axi_arready		    ;   // Read address ready
	output logic [       C_AXI_ID_WTH - 1:0]    axi_arid		    ;	// Read ID
	output logic [     C_AXI_ADDR_WTH - 1:0]    axi_araddr		    ;   // Read address
	output logic [      C_AXI_LEN_WTH - 1:0]    axi_arlen		    ;   // Read Burst Length
	output logic [       C_AXI_SZ_WTH - 1:0]    axi_arsize		    ;   // Read Burst size
	output logic [       C_AXI_BR_WTH - 1:0]    axi_arburst		    ;   // Read Burst type
	output logic [C_NUM_TOTAL_CLIENTS - 1:0]    axi_arvalid		    ;   // Read address valid 
	// AXI read data channel signals   
	input  logic [       C_AXI_ID_WTH - 1:0]    axi_rid			    ;   // Response ID
	input  logic [     C_AXI_DATA_WTH - 1:0]    axi_rdata		    ;   // Read data
	input  logic [     C_AXI_RESP_WTH - 1:0]    axi_rresp		    ;   // Read response
	input  logic [C_NUM_TOTAL_CLIENTS - 1:0]    axi_rlast		    ;   // Read last
	input  logic [C_NUM_TOTAL_CLIENTS - 1:0]    axi_rvalid		    ;   // Read reponse valid
	output logic [C_NUM_TOTAL_CLIENTS - 1:0]    axi_rready		    ;   // Read Response ready
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input  logic [   C_NUM_RD_CLIENTS - 1:0]    init_rd_req         ;
    input  logic [      C_INIT_ID_WTH - 1:0]    init_rd_req_id      ;
    input  logic [    C_INIT_ADDR_WTH - 1:0]    init_rd_addr        ;
    input  logic [     C_INIT_LEN_WTH - 1:0]    init_rd_len         ;
    output logic [   C_NUM_RD_CLIENTS - 1:0]    init_rd_req_ack     ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    output logic [    C_INIT_DATA_WTH - 1:0]    init_rd_data        ;
    output logic [   C_NUM_RD_CLIENTS - 1:0]    init_rd_data_vld    ;
    input  logic [   C_NUM_RD_CLIENTS - 1:0]    init_rd_data_rdy    ;
    output logic [   C_NUM_RD_CLIENTS - 1:0]    init_rd_cmpl        ;
    // BEGIN ---------------------------------------------------------------------------------------------------------------------------------------- 
    input  logic [   C_NUM_WR_CLIENTS - 1:0]    init_wr_req         ;
    input  logic [       `INIT_ID_WTH - 1:0]    init_wr_req_id      ;
    input  logic [     `INIT_ADDR_WTH - 1:0]    init_wr_addr        ;
    input  logic [      `INIT_LEN_WTH - 1:0]    init_wr_len         ;
    output logic                                init_wr_req_ack     ;
    // BEGIN ---------------------------------------------------------------------------------------------------------------------------------------- 
    input  logic [     `INIT_DATA_WTH - 1:0]    init_wr_data        ;
    input  logic [   C_NUM_WR_CLIENTS - 1:0]    init_wr_data_vld    ;
    output logic [   C_NUM_WR_CLIENTS - 1:0]    init_wr_data_rdy    ;
    output logic [   C_NUM_WR_CLIENTS - 1:0]    init_wr_cmpl  	    ;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------	
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
    logic [C_NUM_TOTAL_CLIENTS - 1:0]   axi_addr_rd_ack;
    logic [C_NUM_TOTAL_CLIENTS - 1:0]   axi_addr_wr_ack;
    logic [C_NUM_TOTAL_CLIENTS - 1:0]   axi_addr_wr_ackd;
    logic [                     15:0]   axi_wr_ct[C_NUM_TOTAL_CLIENTS - 1:0];
    logic [                     15:0]   axi_wr_len[C_NUM_TOTAL_CLIENTS - 1:0];


/*
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    genvar g0; generate for(g0 = 0; g0 < C_NUM_TOTAL_CLIENTS; g0 = g0 + 1) begin
        if(g0 < C_NUM_RD_CLIENTS) begin
            assign axi_arvalid[g0] 						                 = init_rd_req[g0];
            assign axi_addr_rd_ack[g0]                                   = (axi_arready[g0] && axi_arvalid[g0]);
            assign init_rd_req_ack[g0] 			                         = axi_addr_rd_ack[g0];	
            assign axi_araddr[g0 * `AXI_ADDR_WTH +: `AXI_ADDR_WTH]       = init_rd_addr[g0 * `AXI_ADDR_WTH +: `AXI_ADDR_WTH];
            assign axi_arid[g0 * `AXI_ID_WTH +: `AXI_ID_WTH]             = init_rd_req_id[g0 * `AXI_ID_WTH +: `AXI_ID_WTH];
            assign axi_arburst[g0 * `AXI_BR_WTH +: `AXI_BR_WTH]          = 1;    // burst type ALWAYS 1
            assign axi_arsize[g0 * `AXI_SZ_WTH +: `AXI_SZ_WTH]           = 3;    // clog2(BUS_WIDTH / `BITS_PER_BYTE) // 8 Bytes
            assign axi_arlen[g0 * `AXI_LEN_WTH +: `AXI_LEN_WTH]          = init_rd_len[g0 * `AXI_LEN_WTH +: `AXI_LEN_WTH];
            assign axi_rready[g0]	                                     = init_rd_data_rdy[g0];
            assign init_rd_data_vld[g0]                                  = axi_rvalid[g0];
            assign init_rd_data[g0]                                      = axi_rdata[g0];
            assign init_rd_cmpl[g0]                                      = axi_bvalid[g0];
        end else begin
            assign axi_arvalid[g0] 						                 = 0;
            assign axi_addr_rd_ack[g0]                                   = 0;
            assign axi_araddr[g0 * `AXI_ADDR_WTH +: `AXI_ADDR_WTH]       = 0;
            assign axi_arid[g0 * `AXI_ID_WTH +: `AXI_ID_WTH]             = 0;
            assign axi_arburst[g0 * `AXI_BR_WTH +: `AXI_BR_WTH]          = 0;
            assign axi_arsize[g0 * `AXI_SZ_WTH +: `AXI_SZ_WTH]           = 0;
            assign axi_arlen[g0 * `AXI_LEN_WTH +: `AXI_LEN_WTH]          = 0;
            assign axi_rready[g0]	                                     = 0; 
        end
    end endgenerate
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    genvar g1; generate for(g1 = 0; g1 < C_NUM_TOTAL_CLIENTS; g1 = g1 + 1) begin       
        if(g1 >= C_NUM_RD_CLIENTS) begin
            assign axi_awvalid[g1]                                           = init_wr_req[g1 - C_NUM_RD_CLIENTS];
            assign axi_addr_wr_ack[g1]                                       = (axi_awready[g1] && axi_awvalid[g1]);
            assign axi_awaddr[g1 * `AXI_ADDR_WTH +: `AXI_ADDR_WTH]           = init_wr_addr[(g1 - C_NUM_RD_CLIENTS) * `AXI_ADDR_WTH +: `AXI_ADDR_WTH];  
            assign axi_awid[g1 * `AXI_ID_WTH +: `AXI_ID_WTH]                 = init_wr_req_id[(g1 - C_NUM_RD_CLIENTS) * `AXI_ID_WTH +: `AXI_ID_WTH];
            assign axi_awburst[g1 * `AXI_BR_WTH +: `AXI_BR_WTH]              = 1;    // burst type ALWAYS 1
            assign axi_awsize[g1  * `AXI_SZ_WTH +: `AXI_SZ_WTH]              = 3;    // clog2(BUS_WIDTH / `BITS_PER_BYTE) // 8 Bytes   
            assign axi_awlen[g1 * `AXI_LEN_WTH +: `AXI_LEN_WTH]              = init_wr_len[(g1 - C_NUM_RD_CLIENTS) * `AXI_LEN_WTH +: `AXI_LEN_WTH];
            assign axi_wvalid[g1]                                            = init_wr_data_vld[g1 - C_NUM_RD_CLIENTS];                 
            assign init_wr_data_rdy[g1 - C_NUM_RD_CLIENTS]                   = axi_wready[g1];                   
            assign axi_wstrb[g1 * `AXI_WSTRB_WTH +: `AXI_WSTRB_WTH]          = 8'hFF;
            assign axi_wdata[g1 * `AXI_DATA_WTH +: `AXI_DATA_WTH]            = init_wr_data[(g1 - C_NUM_RD_CLIENTS) * `AXI_DATA_WTH +: `AXI_DATA_WTH];      
            assign axi_bready[g1]                                            = 1;
            assign axi_wlast[g1]                                             = (axi_addr_wr_ackd[g1] && axi_wr_ct[g1] == (axi_wr_len[g1] - axi_wr_ct[g1]));
            assign init_wr_cmpl[g1 - C_NUM_RD_CLIENTS]                       = axi_bvalid[g1];

            always@(posedge clk) begin
                if(rst) begin
                    axi_addr_wr_ackd            <= 0;
                    axi_wr_ct[g1]               <= 0;
                    axi_wr_len[g1]              <= 0;
                end else begin
                    if(axi_addr_wr_ack[g1]) begin
                        axi_wr_len[g1]          <= axi_awlen[g1];
                        axi_addr_wr_ackd[g1]    <= 1;
                    end
                    if(axi_addr_wr_ackd[g1] && axi_wvalid[g1] && axi_wready[g1]) begin
                        axi_wr_ct[g1]           <= axi_wr_ct[g1] + `AXI_MX_BT_SZ;
                    end                
                    if(axi_bvalid[g1]) begin
                        axi_addr_wr_ackd[g1]    <= 0;
                        axi_wr_ct[g1]           <= 0;
                        axi_wr_len[g1]          <= 0;
                    end
                end        
            end
        end else begin
            assign axi_awvalid[g1]                                              = 0;
            assign axi_addr_wr_ack[g1]                                          = 0;
            assign axi_awaddr[g1 * `AXI_ADDR_WTH +: `AXI_ADDR_WTH]              = 0;
            assign axi_awid[g1 * `AXI_ID_WTH +: `AXI_ID_WTH]                    = 0;
            assign axi_awburst[g1 *`AXI_BR_WTH +: `AXI_BR_WTH]                  = 0;
            assign axi_awsize[g1 * `AXI_SZ_WTH +: `AXI_SZ_WTH]                  = 0;
            assign axi_awlen[g1 * `AXI_LEN_WTH +: `AXI_LEN_WTH]                 = 0;
            assign axi_wvalid[g1]                                               = 0;
            assign axi_wstrb[g1 * `AXI_WSTRB_WTH +: `AXI_WSTRB_WTH]             = 0;
            assign axi_wdata[g1 * `AXI_DATA_WTH +: `AXI_DATA_WTH]               = 0;
            assign axi_bready[g1]                                               = 0;
            assign axi_wlast[g1]                                                = 0;
            always@(*) begin
                axi_addr_wr_ackd[g1]                                            = 0;
                axi_wr_ct[g1]                                                   = 0;
                axi_wr_len[g1]                                                  = 0;
            end
        end
    end endgenerate
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
*/


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    genvar g0; generate for(g0 = 0; g0 < C_NUM_TOTAL_CLIENTS; g0 = g0 + 1) begin
        assign axi_arvalid[g0] 						                 = 0;
        assign axi_addr_rd_ack[g0]                                   = 0;
        assign axi_araddr[g0 * `AXI_ADDR_WTH +: `AXI_ADDR_WTH]       = 0;
        assign axi_arid[g0 * `AXI_ID_WTH +: `AXI_ID_WTH]             = 0;
        assign axi_arburst[g0 * `AXI_BR_WTH +: `AXI_BR_WTH]          = 0;
        assign axi_arsize[g0 * `AXI_SZ_WTH +: `AXI_SZ_WTH]           = 0;
        assign axi_arlen[g0 * `AXI_LEN_WTH +: `AXI_LEN_WTH]          = 0;
        assign axi_rready[g0]	                                     = 0; 
    end endgenerate
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    genvar g1; generate for(g1 = 0; g1 < C_NUM_TOTAL_CLIENTS; g1 = g1 + 1) begin       
        assign axi_awvalid[g1]                                              = 0;
        assign axi_addr_wr_ack[g1]                                          = 0;
        assign axi_awaddr[g1 * `AXI_ADDR_WTH +: `AXI_ADDR_WTH]              = 0;
        assign axi_awid[g1 * `AXI_ID_WTH +: `AXI_ID_WTH]                    = 0;
        assign axi_awburst[g1 * `AXI_BR_WTH +: `AXI_BR_WTH]                 = 0;
        assign axi_awsize[g1 * `AXI_SZ_WTH +: `AXI_SZ_WTH]                                               = 0;
        assign axi_awlen[g1 * `AXI_LEN_WTH +: `AXI_LEN_WTH]                 = 0;
        assign axi_wvalid[g1]                                               = 0;
        assign axi_wstrb[g1 * `AXI_WSTRB_WTH +: `AXI_WSTRB_WTH]             = 0;
        assign axi_wdata[g1 * `AXI_DATA_WTH +: `AXI_DATA_WTH]               = 0;
        assign axi_bready[g1]                                               = 0;
        assign axi_wlast[g1]                                                = 0;
        always@(*) begin
            axi_addr_wr_ackd[g1]                                            = 0;
            axi_wr_ct[g1]                                                   = 0;
            axi_wr_len[g1]                                                  = 0;
        end
    end endgenerate
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
endmodule
