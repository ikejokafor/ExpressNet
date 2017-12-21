`timescale 1ns / 1ns
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
//                
//                
//
// Dependencies:  
//                
//                
//                
//   
// Revision:
//
// Additional Comments:
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module testbench_0;
  	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defines.vh"

    
    parameter C_PERIOD = 10;    
    reg rst;
    wire clk;
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_MAX_WINDOW_SIZE            = 3;
    localparam C_IMG_DATA_WIDTH             = 18;
    localparam C_FILTER_DATA_WIDTH          = 18;
    localparam C_CONV_RESULT_WIDTH          = 16; 
    localparam C_IMG_DATAIN_WIDTH           = C_IMG_DATA_WIDTH * C_MAX_WINDOW_SIZE;
    localparam C_FILTER_DATAIN_WIDTH          = C_FILTER_DATA_WIDTH * C_MAX_WINDOW_SIZE;
    localparam C_I_DSP_OUTPUT_WIDTH         = `DSP_OUTPUT_WIDTH * C_MAX_WINDOW_SIZE;
    localparam C_FILTER_BANK_WIDTH          = C_MAX_WINDOW_SIZE * C_FILTER_DATA_WIDTH;
    localparam C_I_DSP_FILTER_DATAIN_WIDTH  = C_MAX_WINDOW_SIZE * C_FILTER_DATA_WIDTH;
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Wires / Regs
	//-----------------------------------------------------------------------------------------------------------------------------------------------   
    reg                                   count_init;
    reg   [ C_IMG_DATAIN_WIDTH - 1:0]     i_img_datain;
    reg                                   img_datain_valid;
    reg   [C_FILTER_DATAIN_WIDTH - 1:0]   i_filter_datain;
    reg   [  C_MAX_WINDOW_SIZE - 1:0]     i_filter_init;
    wire  [C_I_DSP_OUTPUT_WIDTH - 1:0]    dataout;
    wire                                  dataout_valid;

    
    clock_gen #(
        .C_PERIOD_BY_2(C_PERIOD / 2)
    ) 
    i0_clock_gen (
        .clk_out(clk)
    );
    
    
    cnn_layer_accel_layer_conv_array
    i0_cnn_layer_accel_layer_conv_array (
        .clk                    ( clk                   ),
        .rst                    ( rst                   ),
        .count_init             ( count_init            ),
        .pipeline_active        ( 1'b1                  ),
        .i_img_datain           ( i_img_datain          ),
        .img_datain_valid       ( img_datain_valid      ),
        .i_filter_datain        ( i_filter_datain       ),
        .i_filter_init          ( i_filter_init         ),
        .dataout                ( dataout               ),
        .dataout_valid          ( dataout_valid         )
    );

    
    initial begin
        rst = 1;
        count_init = 0;
        img_datain_valid = 0;
        i_filter_init = 3'b0;
        #(C_PERIOD * 10) rst = 0;
        
        #(C_PERIOD)
        @(posedge clk);
        count_init = 1;
        @(posedge clk);
        count_init = 0;
        
        i_filter_datain[(0 * C_FILTER_DATA_WIDTH) +: C_FILTER_DATA_WIDTH] = $urandom_range(1, 10);
        i_filter_datain[(1 * C_FILTER_DATA_WIDTH) +: C_FILTER_DATA_WIDTH] = $urandom_range(1, 10);
        i_filter_datain[(2 * C_FILTER_DATA_WIDTH) +: C_FILTER_DATA_WIDTH] = $urandom_range(1, 10);
        i_filter_init = 3'b111;
        for(int i = 0; i < (C_MAX_WINDOW_SIZE - 1); i = i + 1) begin
            @(posedge clk);
            i_filter_datain[(0 * C_FILTER_DATA_WIDTH) +: C_FILTER_DATA_WIDTH] = $urandom_range(1, 10);
            i_filter_datain[(1 * C_FILTER_DATA_WIDTH) +: C_FILTER_DATA_WIDTH] = $urandom_range(1, 10);
            i_filter_datain[(2 * C_FILTER_DATA_WIDTH) +: C_FILTER_DATA_WIDTH] = $urandom_range(1, 10);
        end
        @(posedge clk);
        i_filter_init = 3'b000;
        
        i_img_datain[(0 * C_IMG_DATA_WIDTH) +: C_IMG_DATA_WIDTH] = $urandom_range(1, 10);
        i_img_datain[(1 * C_IMG_DATA_WIDTH) +: C_IMG_DATA_WIDTH] = $urandom_range(1, 10);
        i_img_datain[(2 * C_IMG_DATA_WIDTH) +: C_IMG_DATA_WIDTH] = $urandom_range(1, 10);
        img_datain_valid = 1;
        for(int i = 0; i >= 0; i++) begin
            @(posedge clk);
            i_img_datain[(0 * C_IMG_DATA_WIDTH) +: C_IMG_DATA_WIDTH] = $urandom_range(0, 10);
            i_img_datain[(1 * C_IMG_DATA_WIDTH) +: C_IMG_DATA_WIDTH] = $urandom_range(0, 10);
            i_img_datain[(2 * C_IMG_DATA_WIDTH) +: C_IMG_DATA_WIDTH] = $urandom_range(0, 10);
            
            if(i == 30) begin
                $stop;
            end
        end
        @(posedge clk);
        img_datain_valid = 0;
        
        #(C_PERIOD * 30) $stop;
    end
    
endmodule