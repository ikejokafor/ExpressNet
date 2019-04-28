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
    rst                             ,

    job_start                       ,
    job_accept                      ,
    job_parameters                  ,
    job_fetch_request               ,
    job_fetch_ack                   ,
    job_fetch_complete              ,
    job_complete                    ,
    job_complete_ack                ,

    cascade_in_valid                ,
    cascade_in_ready                ,
    cascade_in_data                 ,

    cascade_out_valid               ,
    cascade_out_ready               ,
    cascade_out_data                ,

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
    kernel_full_count_cfg           ,
    kernel_group_cfg                ,
    stride_cfg                      , 
    kernel_size_cfg    		        ,
    padding_cfg                     ,
    upsample_cfg                    ,
    num_kernel_cfg                  ,
    num_output_rows_cfg             ,
    num_output_cols_cfg             ,
    pix_seq_data_full_count_cfg     ,
    num_expd_input_cols_cfg         ,
    num_expd_input_rows_cfg         ,
    crpd_input_col_start_cfg        ,
    crpd_input_row_start_cfg        ,
    crpd_input_col_end_cfg          ,
    crpd_input_row_end_cfg          ,
    
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
    output  logic           rst                             ;

    output logic            job_start                       ;
    input  logic            job_accept                      ;
    output logic [127:0]    job_parameters                  ;
    input  logic            job_fetch_request               ;
    output logic            job_fetch_ack                   ;
    output logic            job_fetch_complete              ;
    input  logic            job_complete                    ;
    output logic            job_complete_ack                ;

    output logic            cascade_in_valid                ;
    input  logic            cascade_in_ready                ;
    output logic [127:0]    cascade_in_data                 ;

    input  logic            cascade_out_valid               ;
    output logic            cascade_out_ready               ;
    input  logic [127:0]    cascade_out_data                ;

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
    output logic [   7:0]    kernel_full_count_cfg           ;
    output logic [   6:0]    kernel_group_cfg                ;
    output logic [   6:0]    stride_cfg                      ;
	output logic [   4:0]    kernel_size_cfg    		     ;
    output logic [   4:0]    padding_cfg                     ;
    output logic             upsample_cfg                    ;
    output logic [   6:0]    num_kernel_cfg                  ;
    output logic [   9:0]    num_output_rows_cfg             ;
    output logic [   9:0]    num_output_cols_cfg             ;
    output logic [  11:0]    pix_seq_data_full_count_cfg     ;

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
        output kernel_full_count_cfg           ;
        output kernel_group_cfg                ;
        output stride_cfg                      ; 
        output kernel_size_cfg    		       ; 
        output padding_cfg                     ;
        output upsample_cfg                    ;
        output num_kernel_cfg                  ;
        output num_output_rows_cfg             ;
        output num_output_cols_cfg             ;
        output pix_seq_data_full_count_cfg     ;
        output num_expd_input_cols_cfg         ; 
        output num_expd_input_rows_cfg         ;
        output crpd_input_col_start_cfg        ;
        output crpd_input_row_start_cfg        ;
        output crpd_input_col_end_cfg          ;
        output crpd_input_row_end_cfg          ;
	endclocking


    clocking clk_core_cb @(posedge clk_core);
        output cascade_in_valid    ;
        input  cascade_in_ready    ;
        output cascade_in_data     ;

        input  cascade_out_valid   ;
        output cascade_out_ready   ;
        input  cascade_out_data    ;
        
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