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
// Additional Comments:     Scenario 1 Checks the convolution output
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


module cnl_sc1_testbench;
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    `include "cnl_sc1_verif_defs.svh"
    `include "cnn_layer_accel_defs.vh"
    `include "cnn_layer_accel_verif_defs.svh"
    `include "cnl_sc1_generator.sv"
    `include "cnl_sc1_environment.sv"
    `include "cnn_layer_accel_quad_intf.sv"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    parameter C_PERIOD_100MHz = 10;    
    parameter C_PERIOD_500MHz = 2; 
    parameter C_NUM_RAND_TESTS = 0;
    

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Module Connection Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    logic            clk_core                                ;
    logic            rst                                     ;



	//-----------------------------------------------------------------------------------------------------------------------------------------------
	// Verification Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------  

    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	// Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    clock_gen #(
        .C_PERIOD(C_PERIOD_500MHz)
    )
    i1_clock_gen(
        .clk_out(clk_core)
    );
    
    
    cnn_layer_accel_FAS
    i0_cnn_layer_accel_FAS (
        .clk_core                   ( clk_core                  ),  
        .rst                        ( rst                       ),
        .start_FAS                  ( start_FAS                 ),
        .start_FAS_ack              ( start_FAS_ack             ),
        .cfg_data                   ( cfg_data                  ),
        .sys_mem_read_req           ( sys_mem_read_req          ),
        .sys_mem_read_req_ack       ( sys_mem_read_req_ack      ),
        .sys_mem_read_in_prog       ( sys_mem_read_in_prog      ),
        .sys_mem_read_cmpl          ( sys_mem_read_cmpl         ),
        .sys_mem_write_req          ( sys_mem_write_req         ),
        .sys_mem_write_req_ack      ( sys_mem_write_req_ack     ),
        .sys_mem_write_in_prog      ( sys_mem_write_in_prog     ),
        .sys_mem_write_cmpl         ( sys_mem_write_cmpl        ),
        .trans_fifo_wren            ( trans_fifo_wren           ),
        .convMap_bram_wren          ( convMap_bram_wren         ),
        .resdMap_bram_wren          ( resdMap_bram_wren         ),
        .partMap_bram_wren          ( partMap_bram_wren         ),
        .prevMap_fifo_wren          ( prevMap_fifo_wren         ),
        .krnl1x1_bram_wren          ( krnl1x1_bram_wren         ),
        .krnl1x1Bias_bram_wren      ( krnl1x1Bias_bram_wren     ),
        .trans_fifo_datain          ( trans_fifo_datain         ),
        .convMap_bram_datain        ( convMap_bram_datain       ),
        .resdMap_bram_datain        ( resdMap_bram_datain       ),
        .partMap_bram_datain        ( partMap_bram_datain       ),
        .prevMap_fifo_datain        ( prevMap_fifo_datain       ),
        .krnl1x1_bram_datain        ( krnl1x1_bram_datain       ),
        .krnl1x1Bias_bram_datain    ( krnl1x1Bias_bram_datain   ),
        .outBuf_fifo_rden           ( outBuf_fifo_rden          ),
        .outBuf_fifo_dout           ( outBuf_fifo_dout          ),
        .AWP_complete               ( AWP_complete              ),
        .send_FAS_complete          ( send_FAS_complete         ),
        .FAS_complete_ack           ( FAS_complete_ack          )
    );
 
    
    initial begin
        
    end
    

endmodule
    