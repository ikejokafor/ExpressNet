`ifndef	__CNN_LAYER_ACCEL_QUAD_INTF__
`define	__CNN_LAYER_ACCEL_QUAD_INTF__


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


interface cnn_layer_accel_quad_intf (
    clk_if                          ,
    clk_core                        ,

    job_start                       ,
    job_accept                      ,
    job_parameters                  ,
    job_parameters_valid            ,
    job_fetch_request               ,
    job_fetch_ack                   ,
    job_fetch_complete              ,
    job_complete                    ,
    job_complete_ack                ,

    config_valid                    ,
    config_accept                   ,
    config_data                     ,

    weight_valid                    ,
    weight_ready                    ,
    weight_data                     ,

    result_valid                    ,
    result_accept                   ,
    result_data                     ,

    pixel_valid                     ,
    pixel_ready                     ,
    pixel_data                      ,

    output_row                      , 
    output_col                      , 
    output_depth    
    
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    `include "math.svh"
    `include "utilities.svh"
    `include "cnn_layer_accel.svh"
    `include "cnn_layer_accel_AWP.svh"
    `include "cnn_layer_accel_conv1x1_pip.svh"
    `include "cnn_layer_accel_FAS.svh"
    `include "cnn_layer_accel_FAS_pip_ctrl.svh"
    `include "cnn_layer_accel_QUAD.svh"
    `include "cnn_layer_accel_trans_fifo.svh"
    `include "awe.svh"
    `include "axi_defs.svh"
    

    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_CLG2_ROW_BUF_BRAM_DEPTH    = $clog2(`ROW_BUF_BRAM_DEPTH);

    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Interface Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input  logic            clk_if                          ;
    input  logic            clk_core                        ;

    output logic            job_start                       ;
    input  logic            job_accept                      ;
    output logic [127:0]    job_parameters                  ;
    output                  job_parameters_valid            ;
    input  logic            job_fetch_request               ;
    output logic            job_fetch_ack                   ;
    output logic            job_fetch_complete              ;
    input  logic            job_complete                    ;
    output logic            job_complete_ack                ;

    output logic [  3:0]    config_valid                    ;
    input  logic [  3:0]    config_accept                   ;
    output logic [127:0]    config_data                     ;

    output logic            weight_valid                    ;
    input  logic            weight_ready                    ;
    output logic [127:0]    weight_data                     ;

    input  logic            result_valid                    ;
    output logic            result_accept                   ;
    input  logic [15:0]     result_data                     ;

    output logic            pixel_valid                     ;
    input  logic            pixel_ready                     ;
    output logic [127:0]    pixel_data                      ;
    
    input int               output_row                      ;
    input int               output_col                      ;
    input int               output_depth                    ;

    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Clocking Blocks
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	clocking clk_if_cb @(posedge clk_if);
        output job_start                      ;
        input  job_accept                     ;
        output job_parameters                 ;
        output job_parameters_valid           ;
        input  job_fetch_request              ;
        output job_fetch_ack                  ;
        output job_fetch_complete             ;
        input  job_complete                   ;
        output job_complete_ack               ;
        
        output config_valid                   ;
        input  config_accept                  ;
        output config_data                    ;
        
        output pixel_valid                    ;
        input  pixel_ready                    ;
        output pixel_data                     ;
	endclocking
   

    clocking clk_core_cb @(posedge clk_core);        
        output weight_valid        ;
        input  weight_ready        ;
        output weight_data         ;

        input  result_valid        ;
        output result_accept       ;
        input  result_data         ;
        
        input  output_row          ;
        input  output_col          ;
        input  output_depth        ;
    endclocking


endinterface: cnn_layer_accel_quad_intf


`endif