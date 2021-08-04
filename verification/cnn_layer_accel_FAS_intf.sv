`ifndef	__CNN_LAYER_ACCEL_FAS_INTF__
`define	__CNN_LAYER_ACCEL_FAS_INTF__


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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
interface cnn_layer_accel_FAS_intf (
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    clk_intf                    ,
    rst                         ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    init_read_req               ,
    init_read_req_id            ,
    init_read_addr              ,
    init_read_len               ,
    init_read_req_ack           ,
    init_read_in_prog           ,
    init_read_data              ,
    init_read_data_vld          ,
    init_read_data_rdy          ,
    init_read_cmpl              ,
    init_write_req              ,
    init_write_req_id           ,
    init_write_addr             ,
    init_write_len              ,
    init_write_req_ack          ,
    init_write_in_prog          ,
    init_write_data             ,
    init_write_data_vld         ,
    init_write_data_rdy         ,
    init_write_cmpl             ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    targ_write_addr             ,
    targ_write_addr_vld         ,
    targ_write_data             ,
    targ_write_ack              ,
    targ_read_addr              ,
    targ_read_addr_vld          ,
    targ_read_data              ,
    targ_read_ack               ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    init_usrIntr                ,
    init_usrIntr_ack            ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    trans_in_fifo_din_vld       ,
    trans_in_fifo_din_rdy       ,
    trans_in_fifo_din           ,
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    trans_eg_fifo_dout_vl       ,
    trans_eg_fifo_dout_rdy      ,
    trans_eg_fifo_dout       
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    `include "math.vh"

    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Interface Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    input  logic                                      clk                      ;
    input  logic                                      rst                      ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input  logic [            `MAX_FAS_RD_ID - 1:0]   init_read_req            ;
    input  logic [         C_INIT_REQ_ID_WTH - 1:0]   init_read_req_id         ;
    input  logic [    C_INIT_MEM_RD_ADDR_WTH - 1:0]   init_read_addr           ;
    input  logic [     C_INIT_MEM_RD_LEN_WTH - 1:0]   init_read_len            ;
    output logic [            `MAX_FAS_RD_ID - 1:0]   init_read_req_ack        ;
    output logic [            `MAX_FAS_RD_ID - 1:0]   init_read_in_prog        ;
    output logic [       `INIT_RD_DATA_WIDTH - 1:0]   init_read_data           ;
    output logic [            `MAX_FAS_RD_ID - 1:0]   init_read_data_vld       ;
    input  logic [            `MAX_FAS_RD_ID - 1:0]   init_read_data_rdy       ;
    output logic [            `MAX_FAS_RD_ID - 1:0]   init_read_cmpl           ;
    input  logic                                      init_write_req           ;
    input  logic                                      init_write_req_id        ;
    input  logic [       `INIT_WR_ADDR_WIDTH - 1:0]   init_write_addr          ;
    input  logic [        `INIT_WR_LEN_WIDTH - 1:0]   init_write_len           ;
    output logic                                      init_write_req_ack       ;
    output logic                                      init_write_in_prog       ;
    output logic [       `INIT_WR_DATA_WIDTH - 1:0]   init_write_data          ;
    output logic                                      init_write_data_vld      ;
    input  logic                                      init_write_data_rdy      ;
    output logic                                      init_write_cmpl          ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    output logic                                      targ_write_addr          ;
    output logic                                      targ_write_addr_vld      ;
    input  logic [         `TARG_WR_DATA_WTH - 1:0]   targ_write_data          ;
    input  logic                                      targ_write_ack           ;
    output logic                                      targ_read_addr           ;
    output logic                                      targ_read_addr_vld       ;
    input  logic [         `TARG_RD_DATA_WTH - 1:0]   targ_read_data           ;
    input  logic                                      targ_read_ack            ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input  logic                                      init_usrIntr             ;
    output logic                                      init_usrIntr_ack         ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    output logic                                      trans_in_fifo_din_vld    ;
    input  logic                                      trans_in_fifo_din_rdy    ;
    output logic [     C_TRANS_IN_FIFO_WR_WTH - 1:0]  trans_in_fifo_din        ;
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    output logic                                      trans_eg_fifo_dout_vld   ;
    input  logic                                      trans_eg_fifo_dout_rdy   ;
    output logic [     C_TRANS_IN_FIFO_RD_WTH - 1:0]  trans_eg_fifo_dout       ;

    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Clocking Blocks
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	clocking inRd_cb @(posedge clk);
        input   init_read_req           ;
        input   init_read_req_id        ;
        input   init_read_addr          ;
        input   init_read_len           ;
        output  init_read_req_ack       ;
        output  init_read_in_prog       ;
        output  init_read_data          ;
        output  init_read_data_vld      ;
        input   init_read_data_rdy      ;
        output  init_read_cmpl          ;
	endclocking
   

    clocking inWr_cb @(posedge clk);        
        input   init_write_req          ;
        input   init_write_req_id       ;
        input   init_write_addr         ;
        input   init_write_len          ;
        output  init_write_req_ack      ;
        output  init_write_in_prog      ;
        output  init_write_data         ;
        output  init_write_data_vld     ;
        input   init_write_data_rdy     ;
        output  init_write_cmpl         ;
    endclocking


endinterface: cnn_layer_accel_FAS_intf


`endif