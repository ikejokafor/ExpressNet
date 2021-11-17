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
// Description:                 array of sum vectors needed to reuse entire depth of convMap for multiple 1x1 kernels. this occurs when you must
//                                  sum with partial maps or resd maps before you convolve with 1x1 kernel.
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
module cnn_layer_accel_FAS_vec_add (
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
	rst						,
	clk_FAS                 ,
	process_cmpl            ,
	FAS_intf_rdy_n          ,
	FAS_rdy_n               ,
	krnl1x1_dpth_end_cfg	,
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
	convMap_fifo_dout		,
	partMap_fifo_dout       ,
	resdMap_fifo_dout       ,
	prevMap_fifo_dout       ,
	conv1x1_dwc_fifo_dout	,
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
	vector_add_pm			,
	vector_add_rm0          ,
	vector_add_rm1          ,
	vector_add_rm_conv  	,
	vector_add_pv			,
	pipe_enable				,
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    vec_add_pm_sum      	, 
	vec_add_rm0_sum			,
    vec_add_rm1_sum	  		,
 	vec_add_rm_conv_sum		,	
	vec_add_pv_sum		
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "utilities.svh"
	`include "cnn_layer_accel_FAS.svh"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_VEC_ADD_WIDTH          = `VECTOR_ADD_SIMD * `PIXEL_WIDTH;	
    localparam C_VEC_SUM_ARR_SZ         = `MAX_1X1_KRNL_DEPTH / `VECTOR_ADD_SIMD;
    localparam C_VEC_SUM_ARR_ADDR_WTH	= $clog2(C_VEC_SUM_ARR_SZ);


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
	input  logic 									rst															;
	input  logic 									clk_FAS                 									;
	input  logic 									process_cmpl	          									;
	input  logic 									FAS_intf_rdy_n          									;
	input  logic 									FAS_rdy_n               									;
	input  logic [						     15:0]	krnl1x1_dpth_end_cfg										;
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
	input  logic [     `CONVMAP_FIFO_RD_WTH - 1:0]	convMap_fifo_dout											;
	input  logic [     `PARTMAP_FIFO_RD_WTH - 1:0]	partMap_fifo_dout       									;
	input  logic [     `RESDMAP_FIFO_RD_WTH - 1:0]	resdMap_fifo_dout       									;
	input  logic [     `PREVMAP_FIFO_RD_WTH - 1:0]	prevMap_fifo_dout	    									;
	input  logic [ `CONV1X1_DWC_FIFO_RD_WTH - 1:0]	conv1x1_dwc_fifo_dout										;
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
	input  logic 									vector_add_pm												;
	input  logic 									vector_add_rm0          									;
	input  logic 									vector_add_rm1          									;
	input  logic 									vector_add_rm_conv  										;
	input  logic 									vector_add_pv    											;
	input  logic 									pipe_enable             									;
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    output logic [      C_VEC_ADD_WIDTH - 1:0]   	vec_add_pm_sum      										;	 
	output logic [      C_VEC_ADD_WIDTH - 1:0]		vec_add_rm0_sum												;
    output logic [      C_VEC_ADD_WIDTH - 1:0]   	vec_add_rm1_sum	  											;
 	output logic [      C_VEC_ADD_WIDTH - 1:0]   	vec_add_rm_conv_sum											;		
	output logic [      C_VEC_ADD_WIDTH - 1:0]		vec_add_pv_sum												;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                           vector_add_pm_d         									;
    logic                                           vector_add_rm0_d        									;
    logic                                           vector_add_rm1_d        									;
    logic                                           vector_add_rm_conv_d    									;
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
	logic [	             C_VEC_ADD_WIDTH - 1:0]     vec_add_pm_sum_arr              [C_VEC_SUM_ARR_SZ - 1:0]    ;
	logic [	             C_VEC_ADD_WIDTH - 1:0]     vec_add_rm0_sum_arr             [C_VEC_SUM_ARR_SZ - 1:0]    ;
    logic [	             C_VEC_ADD_WIDTH - 1:0]     vec_add_rm1_sum_arr             [C_VEC_SUM_ARR_SZ - 1:0]    ;
	logic [	             C_VEC_ADD_WIDTH - 1:0]     vec_add_rm_conv_sum_arr			[C_VEC_SUM_ARR_SZ - 1:0]    ;
	logic [	             C_VEC_ADD_WIDTH - 1:0]     vec_add_pv_sum_arr              [C_VEC_SUM_ARR_SZ - 1:0]	;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [              C_VEC_ADD_WIDTH - 1:0]     vec_add_pm_sum_r                                            ;   
	logic [              C_VEC_ADD_WIDTH - 1:0]		vec_add_rm0_sum_r											;	
    logic [              C_VEC_ADD_WIDTH - 1:0]     vec_add_rm1_sum_r	                						;   	
 	logic [              C_VEC_ADD_WIDTH - 1:0]     vec_add_rm_conv_sum_r		       							;   	
	logic [              C_VEC_ADD_WIDTH - 1:0]     vec_add_pv_sum_r                                            ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
	logic [       C_VEC_SUM_ARR_ADDR_WTH - 1:0]   	vec_add_pm_sum_arr_addr                                     ; 
    logic [       C_VEC_SUM_ARR_ADDR_WTH - 1:0]   	vec_add_rm0_sum_arr_addr                                    ;
    logic [       C_VEC_SUM_ARR_ADDR_WTH - 1:0]   	vec_add_rm1_sum_arr_addr                                    ;
    logic [       C_VEC_SUM_ARR_ADDR_WTH - 1:0]   	vec_add_rm_conv_sum_arr_addr                                ;
    logic [       C_VEC_SUM_ARR_ADDR_WTH - 1:0]   	vec_add_pv_sum_arr_addr                                     ;


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
	assign vec_add_pm_sum 		= vec_add_pm_sum_arr[vec_add_pm_sum_arr_addr];
	assign vec_add_rm0_sum 		= vec_add_rm0_sum_arr[vec_add_rm0_sum_arr_addr];
	assign vec_add_rm1_sum 		= vec_add_rm1_sum_arr[vec_add_rm1_sum_arr_addr];
	assign vec_add_rm_conv_sum 	= vec_add_rm_conv_sum_arr[vec_add_rm_conv_sum_arr_addr];		
	assign vec_add_pv_sum 		= vec_add_pv_sum_arr[vec_add_pv_sum_arr_addr];

	integer i0, i1, i2, i3, i4;  
	always@(*) begin
        // - - - - - - - - - - - - - -
        if(vector_add_pm) begin
            for(i0 = 0; i0 < `VECTOR_ADD_SIMD; i0 = i0 + 1) begin
				vec_add_pm_sum_arr[vec_add_pm_sum_arr_addr][(i0 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] =
					convMap_fifo_dout[(i0 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] +
					partMap_fifo_dout[(i0 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
        // - - - - - - - - - - - - - -
        if(vector_add_rm0) begin
            for(i1 = 0; i1 < `VECTOR_ADD_SIMD; i1 = i1 + 1) begin
				vec_add_rm0_sum_arr[vec_add_rm0_sum_arr_addr][(i1 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] =
					convMap_fifo_dout[(i1 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] +
					resdMap_fifo_dout[(i1 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
        // - - - - - - - - - - - - - -
        if(vector_add_rm1) begin
            for(i2 = 0; i2 < `VECTOR_ADD_SIMD; i2 = i2 + 1) begin
				vec_add_rm1_sum_arr[vec_add_rm1_sum_arr_addr][i2 * `PIXEL_WIDTH +: `PIXEL_WIDTH] = 
					vec_add_pm_sum_arr[vec_add_pm_sum_arr_addr][(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] +
					resdMap_fifo_dout[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
        // - - - - - - - - - - - - - -
        if(vector_add_rm_conv) begin
            for(i3 = 0; i3 < `VECTOR_ADD_SIMD; i3 = i3 + 1) begin
                vec_add_rm_conv_sum_arr[vec_add_rm_conv_sum_arr_addr][i3 * `PIXEL_WIDTH +: `PIXEL_WIDTH] = 
					conv1x1_dwc_fifo_dout[(i3 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] +
					resdMap_fifo_dout[(i3 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
        // - - - - - - - - - - - - - -
        if(vector_add_pv) begin
            for(i4 = 0; i4 < `VECTOR_ADD_SIMD; i4 = i4 + 1) begin
                vec_add_pv_sum_arr[vec_add_pv_sum_arr_addr][i4 * `PIXEL_WIDTH +: `PIXEL_WIDTH] = 
					conv1x1_dwc_fifo_dout[(i4 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] +
					prevMap_fifo_dout[(i4 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
        // - - - - - - - - - - - - - -
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
 

    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst || FAS_rdy_n || process_cmpl) begin
            vec_add_pm_sum_arr_addr         <= 0;
            vec_add_rm0_sum_arr_addr        <= 0;
            vec_add_rm1_sum_arr_addr        <= 0;
            vec_add_rm_conv_sum_arr_addr    <= 0;
            vec_add_pv_sum_arr_addr         <= 0;
        end else begin
            // - - - - - - - - - - - - - -
            if(vector_add_pm && pipe_enable && vec_add_pm_sum_arr_addr == krnl1x1_dpth_end_cfg) begin
                vec_add_pm_sum_arr_addr <= 0;
            end else if(pipe_enable) begin
                vec_add_pm_sum_arr_addr <= vec_add_pm_sum_arr_addr + 1;
            end
            // - - - - - - - - - - - - - -
            if(vector_add_rm0 && pipe_enable && vec_add_rm0_sum_arr_addr == krnl1x1_dpth_end_cfg) begin
                vec_add_rm0_sum_arr_addr <= 0;
            end else if(pipe_enable) begin
                vec_add_rm0_sum_arr_addr <= vec_add_rm0_sum_arr_addr + 1;
            end
            // - - - - - - - - - - - - - -
            if(vector_add_rm1 && pipe_enable && vec_add_rm1_sum_arr_addr == krnl1x1_dpth_end_cfg) begin
                vec_add_rm1_sum_arr_addr <= 0;
            end else if(pipe_enable) begin
                vec_add_rm1_sum_arr_addr <= vec_add_rm1_sum_arr_addr + 1;
            end
            // - - - - - - - - - - - - - -
            if(vector_add_rm_conv && vec_add_rm_conv_sum_arr_addr == krnl1x1_dpth_end_cfg) begin
                vec_add_rm_conv_sum_arr_addr <= 0;
            end else if(pipe_enable) begin
                vec_add_rm_conv_sum_arr_addr <= vec_add_rm_conv_sum_arr_addr + 1;
            end
            // - - - - - - - - - - - - - -
            if(vector_add_pv && vec_add_pv_sum_arr_addr == krnl1x1_dpth_end_cfg) begin
                vec_add_pv_sum_arr_addr <= 0;
            end else if(pipe_enable) begin
                vec_add_pv_sum_arr_addr <= vec_add_pv_sum_arr_addr + 1;
            end
            // - - - - - - - - - - - - - -
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


endmodule