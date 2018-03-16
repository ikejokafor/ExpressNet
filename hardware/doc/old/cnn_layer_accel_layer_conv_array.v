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
module cnn_layer_accel_layer_conv_array #(
    parameter C_MAX_WINDOW_SIZE     = 3,
    parameter C_IMG_DATA_WIDTH      = 18,
    parameter C_FILTER_DATA_WIDTH   = 18,
    parameter C_CONV_RESULT_WIDTH   = 16
) (
    clk,
    rst,
    count_init,
    pipeline_active,
    i_img_datain,
    img_datain_valid,
    i_filter_datain,
    i_filter_init,
    dataout,
    dataout_valid
);
  	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defines.vh"
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_NUM_DSPS                   = ceil(real'((C_MAX_WINDOW_SIZE * C_MAX_WINDOW_SIZE) / `CLOCK_FACTOR));
    localparam C_IMG_DATAIN_WIDTH           = C_IMG_DATA_WIDTH * C_NUM_DSPS;
    localparam C_FILTER_DATAIN_WIDTH        = C_FILTER_DATA_WIDTH * C_NUM_DSPS;
    localparam C_I_DSP_OUTPUT_WIDTH         = `DSP_OUTPUT_WIDTH * C_NUM_DSPS;
    localparam C_FILTER_BANK_WIDTH          = C_NUM_DSPS * C_FILTER_DATA_WIDTH;
    localparam C_I_DSP_FILTER_DATAIN_WIDTH  = C_NUM_DSPS * C_FILTER_DATA_WIDTH;
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Inputs / Outputs
	//-----------------------------------------------------------------------------------------------------------------------------------------------   
    input                                   clk;
    input                                   rst;
    input                                   count_init;
    input                                   pipeline_active;
    input   [    C_IMG_DATAIN_WIDTH - 1:0]  i_img_datain;
    input                                   img_datain_valid;
    input   [ C_FILTER_DATAIN_WIDTH - 1:0]  i_filter_datain;
    input   [            C_NUM_DSPS - 1:0]  i_filter_init;
    output  [  C_I_DSP_OUTPUT_WIDTH - 1:0]  dataout;
    output                                  dataout_valid;

    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Wires / Regs
	//----------------------------------------------------------------------------------------------------------------------------------------------- 
    wire    [        C_I_DSP_OUTPUT_WIDTH - 1:0]    i_dsp_out;                    
    reg     [         C_FILTER_BANK_WIDTH - 1:0]    i_filter_bank[C_NUM_DSPS - 1:0];
    reg     [ C_I_DSP_FILTER_DATAIN_WIDTH - 1:0]    i_dsp_filter_datain;
    reg     [                              15:0]    down_counter;

    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    SRL_bit #(
        .C_CLOCK_CYCLES( 4 )
    ) 
    i0_SRL_bit (
        .clk        ( clk                                   ),
        .rst        ( rst                                   ),
        .ce         ( 1'b1                                  ),
        .data_in    ( img_datain_valid && pipeline_active   ),
        .data_out   ( accum                                 )
    );

    
    SRL_bit #(
        .C_CLOCK_CYCLES( 5 )
    ) 
    i1_SRL_bit (
        .clk        ( clk                                                           ),
        .rst        ( rst                                                           ),
        .ce         ( 1'b1                                                          ),
        .data_in    ( img_datain_valid && pipeline_active && (down_counter == 0)    ),
        .data_out   ( dataout_valid                                                 )
    );
 
    generate
        for(genvar i = 0; i < C_NUM_DSPS; i++) begin
            if(i == 0) begin
                cnn_layer_accel_macc_DSP  #(
                   .C_DSP_INPUT_WIDTH  ( `DSP_INPUT_WIDTH   ),
                   .C_INPUT_DELAY      ( i + 1              ),
                   .C_IS_ACCUM         ( 0                  ),
                   .C_DSP_OUTPUT_WIDTH ( `DSP_OUTPUT_WIDTH )
                )
                i0_cnn_layer_accel_macc_DSP (
                    .clk        ( clk                                                                       ),
                    .rst        ( rst                                                                       ),
                    .accum      ( 1'b0                                                                      ),
                    .accum_rst  ( 1'b0                                                                      ),
                    .a          ( i_img_datain[i * C_IMG_DATA_WIDTH +: C_IMG_DATA_WIDTH]                    ),
                    .b          ( i_dsp_filter_datain[(i * C_FILTER_DATA_WIDTH) +: C_FILTER_DATA_WIDTH]     ),
                    .pcin       ( 48'b0                                                                     ),
                    .pout       ( i_dsp_out[i * `DSP_OUTPUT_WIDTH +: `DSP_OUTPUT_WIDTH]                     )
                ); 
            end else if(i == (C_NUM_DSPS - 1))begin
                cnn_layer_accel_macc_DSP  #(
                   .C_DSP_INPUT_WIDTH  ( `DSP_INPUT_WIDTH   ),
                   .C_INPUT_DELAY      ( i + 1              ),
                   .C_IS_ACCUM         ( 1                  ),
                   .C_DSP_OUTPUT_WIDTH ( `DSP_OUTPUT_WIDTH  )
                ) 
                i0_cnn_layer_accel_macc_DSP (
                    .clk        ( clk                                                                       ),
                    .rst        ( rst                                                                       ),
                    .accum      ( accum                                                                     ),
                    .accum_rst  ( dataout_valid                                                             ),
                    .a          ( i_img_datain[i * C_IMG_DATA_WIDTH +: C_IMG_DATA_WIDTH]                    ),
                    .b          ( i_dsp_filter_datain[(i * C_FILTER_DATA_WIDTH) +: C_FILTER_DATA_WIDTH]     ),
                    .pcin       ( i_dsp_out[(i - 1) * `DSP_OUTPUT_WIDTH +: `DSP_OUTPUT_WIDTH]               ),
                    .pout       ( i_dsp_out[i * `DSP_OUTPUT_WIDTH +: `DSP_OUTPUT_WIDTH]                     )
                );
            end else begin
                cnn_layer_accel_macc_DSP  #(
                   .C_DSP_INPUT_WIDTH  ( `DSP_INPUT_WIDTH   ),
                   .C_INPUT_DELAY      ( i + 1              ),
                   .C_IS_ACCUM         ( 0                  ),
                   .C_DSP_OUTPUT_WIDTH ( `DSP_OUTPUT_WIDTH  )
                )
                i0_cnn_layer_accel_macc_DSP (
                    .clk        ( clk                                                                       ),
                    .rst        ( rst                                                                       ),
                    .accum      ( 1'b0                                                                      ),
                    .accum_rst  ( 1'b0                                                                      ),
                    .a          ( i_img_datain[i * C_IMG_DATA_WIDTH +: C_IMG_DATA_WIDTH]                    ),
                    .b          ( i_dsp_filter_datain[(i * C_FILTER_DATA_WIDTH) +: C_FILTER_DATA_WIDTH]     ),
                    .pcin       ( i_dsp_out[(i - 1) * `DSP_OUTPUT_WIDTH +: `DSP_OUTPUT_WIDTH]               ),
                    .pout       ( i_dsp_out[i * `DSP_OUTPUT_WIDTH +: `DSP_OUTPUT_WIDTH]                     )
                ); 
            end
            
            assign i_dsp_filter_datain[(i * C_FILTER_DATA_WIDTH) +: C_FILTER_DATA_WIDTH] = i_filter_bank[i][(down_counter * C_FILTER_DATA_WIDTH) +: C_FILTER_DATA_WIDTH];  

            always@(posedge clk) begin
                if(i_filter_init[i]) begin
                    i_filter_bank[i][(0 * C_FILTER_DATA_WIDTH) +: C_FILTER_DATA_WIDTH] <= i_filter_datain[(i * C_FILTER_DATA_WIDTH) +: C_FILTER_DATA_WIDTH];
                    for(int filt_bank_idx = 1; filt_bank_idx < C_NUM_DSPS; filt_bank_idx = filt_bank_idx + 1) begin
                        i_filter_bank[i][(filt_bank_idx * C_FILTER_DATA_WIDTH) +: C_FILTER_DATA_WIDTH] <= i_filter_bank[i][((filt_bank_idx - 1) * C_FILTER_DATA_WIDTH) +: C_FILTER_DATA_WIDTH];
                    end 
                end
            end
            
        end
    endgenerate
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign dataout = i_dsp_out[(C_NUM_DSPS - 1) * `DSP_OUTPUT_WIDTH +: `DSP_OUTPUT_WIDTH];
    
    always@(posedge clk) begin
        if(rst) begin
            down_counter <= 2;
        end else begin 
            if(count_init) begin
                down_counter <= 2;
            end else if(img_datain_valid && pipeline_active) begin
                if(down_counter == 0) begin
                    down_counter <= 2;
                end else begin
                    down_counter <= down_counter - 1;
                end
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------ 

endmodule