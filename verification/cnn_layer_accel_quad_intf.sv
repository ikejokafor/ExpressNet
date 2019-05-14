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

    pfb_full_count_cfg              ,
    stride_cfg                      , 
    conv_out_fmt_cfg    		    ,
    padding_cfg                     ,
    upsample_cfg                    ,
    num_kernels_cfg                 ,
    num_output_rows_cfg             ,
    num_output_cols_cfg             ,
    pix_seq_data_full_count_cfg     ,
    num_expd_input_cols_cfg         ,
    num_expd_input_rows_cfg         ,
    crpd_input_col_start_cfg        ,
    crpd_input_row_start_cfg        ,
    crpd_input_col_end_cfg          ,
    crpd_input_row_end_cfg          ,
    master_quad_cfg                 ,
    cascade_cfg                     ,
    
    output_row                      ,
    output_col                      ,
    output_depth    
    
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    `include "math.vh"
    `include "cnn_layer_accel_defs.vh"
    `include "cnn_layer_accel_verif_defs.svh"
    

    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_CLG2_ROW_BUF_BRAM_DEPTH    = clog2(`ROW_BUF_BRAM_DEPTH);

    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Interface Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input  logic            clk_if                          ;
    input  logic            clk_core                        ;

    output logic            job_start                       ;
    input  logic            job_accept                      ;
    output logic [127:0]    job_parameters                  ;
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

    output logic [   9:0]    pfb_full_count_cfg              ;
    output logic [   6:0]    stride_cfg                      ;
	output logic [   4:0]    conv_out_fmt_cfg    		     ;
    output logic [   4:0]    padding_cfg                     ;
    output logic             upsample_cfg                    ;
    output logic [   6:0]    num_kernels_cfg                 ;
    output logic [   9:0]    num_output_rows_cfg             ;
    output logic [   9:0]    num_output_cols_cfg             ;
    output logic [  11:0]    pix_seq_data_full_count_cfg     ;
    output logic             master_quad_cfg                 ;
    output logic             cascade_cfg                     ;

    output logic  [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0] num_expd_input_cols_cfg ;
    output logic  [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0] num_expd_input_rows_cfg ;
    output logic  [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0] crpd_input_col_start_cfg ;
    output logic  [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0] crpd_input_row_start_cfg ;
    output logic  [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0] crpd_input_col_end_cfg   ;
    output logic  [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0] crpd_input_row_end_cfg   ;

    
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

        output pfb_full_count_cfg              ;
        output stride_cfg                      ; 
        output conv_out_fmt_cfg    		       ; 
        output padding_cfg                     ;
        output upsample_cfg                    ;
        output num_kernels_cfg                 ;
        output num_output_rows_cfg             ;
        output num_output_cols_cfg             ;
        output pix_seq_data_full_count_cfg     ;
        output num_expd_input_cols_cfg         ; 
        output num_expd_input_rows_cfg         ;
        output crpd_input_col_start_cfg        ;
        output crpd_input_row_start_cfg        ;
        output crpd_input_col_end_cfg          ;
        output crpd_input_row_end_cfg          ;
        output master_quad_cfg                 ;
        output cascade_cfg                     ;
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