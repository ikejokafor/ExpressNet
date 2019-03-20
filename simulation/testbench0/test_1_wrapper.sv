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
module test_1_wrapper #(
    parameter ROWS              = 20 ,
    parameter COLS              = 20 ,
    parameter DEPTH             = 8  ,
    parameter KERNEL_SIZE       = 3  ,
    parameter NUM_KERNELS       = 5  ,
	parameter STRIDE            = 2  ,
    parameter C_PERIOD_100MHz   = 10 ,
    parameter C_PERIOD_500MHz   = 2 
) (
    input logic clk_100MHz    ,
    input logic clk_500MHz    ,
    input logic rst           
);
  	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"

 
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_LOG2_BRAM_DEPTH        = clog2(`BRAM_DEPTH);
    localparam NUM_KERNEL_3x3_VALUES    = 10;
    localparam NUM_CE_PER_QUAD          = `NUM_AWE * `NUM_CE_PER_AWE;
	localparam OUTPUT_COLS              = (STRIDE==2)?((COLS >> 1) + 2) : COLS ;
	

    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    logic             pixel_valid;
    logic             pixel_ready; 
    logic [127:0]     pixel_data;  

    logic             weight_valid;
    logic             weight_ready;
    logic [127:0]     weight_data;
    
    logic   [3:0]     config_valid; 
    logic  [3:0]      config_accept;    
    logic [127:0]     config_data;
	
	logic             result_valid;
	logic             result_accept;
	logic  [15:0]     result_data ; 
    
    logic            job_start           ;
    logic            job_accept          ;
    logic            job_fetch_request   ;
    logic            job_fetch_ack       ;
    logic            job_fetch_complete  ;
    logic            job_complete        ;
    logic            job_complete_ack    ;  
    genvar           g;
    
    integer fd, fd0;
    logic [`PIXEL_WIDTH - 1:0]    pix_data_sim[0:((ROWS * COLS * DEPTH) - 1)];
    int                           pix_data_sol[0:(DEPTH - 1)][0:((ROWS - 2) - 1)][0:((COLS - 2) - 1)][0:((KERNEL_SIZE * KERNEL_SIZE) - 1)];
    int                           pix_data_result[0:(DEPTH - 1)][0:((ROWS - 2) - 1)][0:((COLS - 2) - 1)][0:((KERNEL_SIZE * KERNEL_SIZE) - 1)];    
	int                           convolution_map_sol[0:(NUM_KERNELS - 1)][0:((ROWS - 2) - 1)][0:((COLS - 2) - 1)];    
	logic [15:0]                  convolution_map_result[0:(NUM_KERNELS - 1)][0:((ROWS +4) )][0:((COLS + 4 ) )];    
    logic [15:0]                  pix_seq_data_sim[0:((512 * 8) - 1)];
    logic [15:0]                  kernel_data_sim[0:((DEPTH * NUM_KERNEL_3x3_VALUES * NUM_KERNELS) - 1)];

    logic [15:0] kernel_group_cfg;  
	logic [15:0] weight;
	logic        ce_mode;
	logic        ce_wht_selector;
	logic        ce_wht_selector_d[`NUM_AWE - 1:0];
	logic        ce_wht_selector_d1[`NUM_AWE - 1:0];
	
    int i;
    int j;
    int k;
    int n;
    int a;
    int b;
    int n0;
    int n1;
    int z;
    int i0;
	int y;
    
    int        ce0_pixel_dataout_valid[`NUM_AWE - 1:0];
    int        ce1_pixel_dataout_valid[`NUM_AWE - 1:0];
    int        ce0_pixel_dataout[`NUM_AWE - 1:0];      
    int        ce1_pixel_dataout[`NUM_AWE - 1:0];  
    int        output_col0[`NUM_AWE - 1:0];
    int        output_row0[`NUM_AWE - 1:0]; 
    int        output_col1[`NUM_AWE - 1:0];
    int        output_row1[`NUM_AWE - 1:0];
    int        cycle_counter0[`NUM_AWE - 1:0];
    int        cycle_counter1[`NUM_AWE - 1:0];

    int        output_conv_row ;
	int        output_conv_col ;
	int        output_conv_depth; 
	
 
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------     
    cnn_layer_accel_quad
    i0_cnn_layer_accel_quad (
        .clk_if               ( clk_100MHz   		),  
        .clk_core             ( clk_500MHz   		),  
        .rst                  ( rst          		),  

        .job_start            ( job_start           ),  
        .job_accept           ( job_accept          ),  
        .job_parameters       (                     ),  
        .job_fetch_request    ( job_fetch_request   ),  
        .job_fetch_ack        ( job_fetch_ack       ), 
        .job_fetch_complete   ( job_fetch_complete  ),
        .job_complete         ( job_complete        ),  
        .job_complete_ack     ( job_complete_ack    ),  

        .cascade_in_data      (						),  
        .cascade_in_valid     (1'b0					),  
        .cascade_in_ready     (						),  

        .cascade_out_data     (						),  
        .cascade_out_valid    (						),  
        .cascade_out_ready    (						),  

        .config_valid         ( config_valid    	),  
        .config_accept        ( config_accept   	),  
        .config_data          ( config_data     	), 

        .weight_valid         ( weight_valid   		),  
        .weight_ready         ( weight_ready  		),  
        .weight_data          ( weight_data    		),       

        .result_valid         (result_valid			),  
        .result_accept        (result_accept		),  
        .result_data          (result_data			),  

        .pixel_valid          ( pixel_valid  		),  
        .pixel_ready          ( pixel_ready  		),  
        .pixel_data           ( pixel_data  		)
    );
    
		assign ce_mode                              = {^i0_cnn_layer_accel_quad.gray_code};
		assign ce_wht_selector                      = {i0_cnn_layer_accel_quad.wht_sequence_selector};
			
		
			
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------  
    generate
        for(g = 0; g < `NUM_AWE; g = g + 1) begin
		
		
            SRL_bit #(
			.C_CLOCK_CYCLES( 7 + g )
			) 
			i0_SRL_bit (
				.clk        ( clk_500MHz            ),
				.rst        ( rst                   ),
				.ce         ( 1'b1                  ),
				.data_in    ( ce_wht_selector  		),
				.data_out   ( ce_wht_selector_d[g]  )
			); 
			
			SRL_bit #(
				.C_CLOCK_CYCLES( 1 )
			) 
			i1_SRL_bit (
				.clk        ( clk_500MHz            ),
				.rst        ( rst                   ),
				.ce         ( 1'b1                  ),
				.data_in    ( ce_wht_selector_d[g] 	),
				.data_out   ( ce_wht_selector_d1[g] )
			); 	

		

            assign ce0_pixel_dataout_valid[g]           = i0_cnn_layer_accel_quad.ce0_pixel_dataout_valid[g];
            assign ce1_pixel_dataout_valid[g]           = i0_cnn_layer_accel_quad.ce1_pixel_dataout_valid[g];  
            assign ce0_pixel_dataout[g]                 = i0_cnn_layer_accel_quad.ce0_pixel_dataout[g];
            assign ce1_pixel_dataout[g]                 = i0_cnn_layer_accel_quad.ce1_pixel_dataout[g];


            // identifies the current row and col being outputted for convolution engine 0
            always@(posedge clk_500MHz) begin
                if(rst) begin
                    output_col0[g]      <= 0;
                    output_row0[g]      <= 0;
                    cycle_counter0[g]   <= 0;
                end else begin
                    if(cycle_counter0[g] == `CYCLE_COUNT) begin
                        cycle_counter0[g] <= 0;
                    end else if(ce0_pixel_dataout_valid[g]) begin
                        cycle_counter0[g] <= cycle_counter0[g] + 1;
                    end 
                    if(cycle_counter0[g] == `CYCLE_COUNT) begin
                        if(output_col0[g] > (COLS +2 )) begin
                            output_col0[g]  <= 0;
                            if(i0_cnn_layer_accel_quad.last_kernel[NUM_CE_PER_QUAD - 1]) begin
                                output_row0[g]  <= output_row0[g] + STRIDE;
                            end
                        end else if(ce0_pixel_dataout_valid[g]) begin
                            output_col0[g]  <= output_col0[g] + STRIDE;
                        end
                    end
                end
            end
            
            // identifies the current row and col being outputted for convolution engine 1
            always@(posedge clk_500MHz) begin
                if(rst) begin
                    output_col1[g]      <= 0;
                    output_row1[g]      <= 0;
                    cycle_counter1[g]   <= 0;
                end else begin
                    if(cycle_counter1[g] == 4) begin
                        cycle_counter1[g] <= 0;
                    end else if(ce1_pixel_dataout_valid[g]) begin
                        cycle_counter1[g] <= cycle_counter1[g] + 1;
                    end 
                    if(cycle_counter1[g] == 4) begin
                        if(output_col1[g] > (COLS +2 )) begin
                            output_col1[g]  <= 0;
                            if(i0_cnn_layer_accel_quad.last_kernel[NUM_CE_PER_QUAD - 1]) begin
                                output_row1[g]  <= output_row1[g] + STRIDE;
                            end
                        end else if(ce1_pixel_dataout_valid[g]) begin
                            output_col1[g]  <= output_col1[g] + STRIDE;
                        end
                    end
                end
            end
            
            always@(posedge clk_500MHz) begin
                if(ce0_pixel_dataout_valid[g]) begin
                    case(ce_mode)
						1'b1 :begin 
							if(output_row0[g]  < COLS - 2 && output_col0[g]  < ROWS - 2) begin
								case(cycle_counter0[g])
									3'b000 : begin 
									    if (ce_wht_selector_d[g]) begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][1] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][0] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][0] <= 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][1] <= 1;
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][1]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],1);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][0]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],0);
												$stop;
											end	
										end 
										else begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][0] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][0] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][0] <= 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][0] <= 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][0]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],0);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][0]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],0);
												$stop;
												$stop;
											end	
										
										end 
									end 
									3'b001 : begin 
									    if (ce_wht_selector_d[g]) begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][2] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][2] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][2] <= 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][2] <= 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][2]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],2);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][2]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],2);
												$stop;
												$stop;
											end	
										end 
										else begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][2] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][1] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][1] <= 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][2] <= 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][2]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],2);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][1]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],1);
												$stop;
												$stop;
											end	
										
										end 
									end 
									3'b010 : begin 
									    if (ce_wht_selector_d[g]) begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][6] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][3] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][3] <= 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][6] <= 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][6]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],6);
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][3]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],3);
												$stop;
												$stop;
											end	
										end 
										else begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][6] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][3] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][3] <= 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][6] <= 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][6]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],6);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][3]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],3);
												$stop;
											end	
										
										end 
									end 
									3'b011 : begin 
									    if (ce_wht_selector_d[g]) begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][7] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][4] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][4] <= 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][7] <= 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][7]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],7);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][4]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],4);
												$stop;
											end	
										end 
										else begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][7] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][4] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][4] <= 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][7] <= 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][7]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],7);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][4]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],4);
												$stop;
											end	
										
										end 
									end 
									3'b100 : begin 
									    if (ce_wht_selector_d[g]) begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][8] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][5] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][5] <= 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][8] <= 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][8]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],8);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][5]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],5);
												$stop;
											end	
										end 
										else begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][8] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][5] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][5] <= 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][8] <= 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][8]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],8);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][5]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],5);
												$stop;
											end	
										
										end 
									end 
								endcase	
														
							end
						end
						1'b0 :begin 
							if(output_row0[g]  < COLS - 2 && output_col0[g]  < ROWS - 2) begin
								case(cycle_counter0[g])
									3'b000 : begin 
									    if (ce_wht_selector_d[g]) begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][1] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][0] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][0] = 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][1] = 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][1]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],1);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][0]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],0);
												$stop;
											end	
										end 
										else begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][0] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][0] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][0] = 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][0] = 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][0]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],1);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][0]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],0);
												$stop;
											end	
										
										end 
									end 
									3'b001 : begin 
									    if (ce_wht_selector_d[g]) begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][2] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][2] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][2] = 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][2] = 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][2]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],2);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][2]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],2);
												$stop;
											end	
										end 
										else begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][2] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][1] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][1] = 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][2] = 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][1]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],1);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][2]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],2);
												$stop;
											end	
										
										end 
									end 
									3'b010 : begin 
									    if (ce_wht_selector_d[g]) begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][3] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][6] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][3] = 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][6] = 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][3]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],3);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][6]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],6);
												$stop;
											end	
										end 
										else begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][3] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][6] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][3] = 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][6] = 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][3]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],3);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][6]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],6);
												$stop;
											end	
										
										end 
									end 
									3'b011 : begin 
									    if (ce_wht_selector_d[g]) begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][4] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][7] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][4] = 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][7] = 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][4]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],4);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][7]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],7);
												$stop;
											end	
										end 
										else begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][4] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][7] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][4] = 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][7] = 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][4]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],4);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][7]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],7);
												$stop;
											end	
										
										end 
									end 
									3'b100 : begin 
									    if (ce_wht_selector_d[g]) begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][5] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][8] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][5] = 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][8] = 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][5]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],5);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][8]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],8);
												$stop;
											end	
										end 
										else begin 
											if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][5] == ce0_pixel_dataout[g][31:16] 
											&& pix_data_sol[g * 2][output_row0[g]][output_col0[g]][8] == ce0_pixel_dataout[g][15:0]) begin
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][5] = 1;
												pix_data_result[g * 2][output_row0[g] ][output_col0[g]][8] = 1;
												
											end
											else begin 
												$display("AWE %d CONV 0 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][5]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],5);
												$display("AWE %d CONV 0 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2][output_row0[g]][output_col0[g]][8]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],8);
												$stop;
											end	
										
										end 
									end 
								endcase	
														
							end
						end
						endcase
						                   
                    end
                end
         
            
          /*  always@(posedge clk_500MHz) begin
                if(ce0_pixel_dataout_valid[g]) begin
                    for(i0 = 0; i0 < (KERNEL_SIZE * KERNEL_SIZE); i0++) begin
                        if(output_row1[g]  < COLS - 2 && output_col1[g]  < ROWS - 2) begin
                            if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][i0] == ce1_pixel_dataout[g][31:16] 
                                || pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][i0] == ce1_pixel_dataout[g][15:0]) begin
                                pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][i0] = 1;
                            end
                        end
                    end
                end
            end
        */


		always@(posedge clk_500MHz) begin
            if(ce1_pixel_dataout_valid[g]) begin
                case(ce_mode)
					1'b1 :begin 
						if(output_row1[g]  < COLS - 2 && output_col1[g]  < ROWS - 2) begin
							case(cycle_counter1[g])
								3'b000 : begin 
								    if (ce_wht_selector_d1[g]) begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][1] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][0] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][0] <= 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][1] <= 1;
											
										end
										else begin 
	
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][1]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],1);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][0]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],0);
											$stop;
										end	
									end 
									else begin 
										if(pix_data_sol[g * 2 +1][output_row1[g]][output_col1[g]][0] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 +1][output_row1[g]][output_col1[g]][0] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][0] <= 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][0] <= 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][0]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],0);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][0]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],0);
											$stop;
											$stop;
										end	
									
									end 
								end 
								3'b001 : begin 
								    if (ce_wht_selector_d1[g]) begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][2] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][2] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][2] <= 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][2] <= 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][2]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],2);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][2]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],2);
											$stop;
											$stop;
										end	
									end 
									else begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][2] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][1] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][1] <= 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][2] <= 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][2]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],2);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][1]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],1);
											$stop;
											$stop;
										end	
									
									end 
								end 
								3'b010 : begin 
								    if (ce_wht_selector_d1[g]) begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][6] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][3] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][3] <= 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][6] <= 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][6]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],6);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][3]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],3);
											$stop;
										end	
									end 
									else begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][6] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][3] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][3] <= 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][6] <= 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][6]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],6);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][3]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],3);
											$stop;
										end	
									
									end 
								end 
								3'b011 : begin 
								    if (ce_wht_selector_d1[g]) begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][7] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][4] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][4] <= 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][7] <= 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][7]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],7);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][4]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],4);
											$stop;
										end	
									end 
									else begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][7] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][4] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][4] <= 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][7] <= 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][7]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],7);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][4]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],4);
											$stop;
										end	
									
									end 
								end 
								3'b100 : begin 
								    if (ce_wht_selector_d1[g]) begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][8] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][5] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][5] <= 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][8] <= 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][8]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],8);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][5]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],5);
											$stop;
										end	
									end 
									else begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][8] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][5] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][5] <= 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][8] <= 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][8]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],8);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][5]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],5);
											$stop;
										end	
									
									end 
								end 
							endcase	
													
						end
					end
					1'b0 :begin 
						if(output_row1[g]  < COLS - 2 && output_col1[g]  < ROWS - 2) begin
							case(cycle_counter1[g])
								3'b000 : begin 
								    if (ce_wht_selector_d1[g]) begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][1] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][0] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][0] = 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][1] = 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][1]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],1);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][0]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],0);
											$stop;
										end	
									end 
									else begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][0] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][0] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][0] = 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][0] = 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][0]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],0);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][0]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],0);
											$stop;
										end	
									
									end 
								end 
								3'b001 : begin 
								    if (ce_wht_selector_d1[g]) begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][2] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][2] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][2] = 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][2] = 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][2]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],2);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][2]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],2);
											$stop;
										end	
									end 
									else begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][2] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][1] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][1] = 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][2] = 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][2]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],2);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][1]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],1);
											$stop;
										end	
									
									end 
								end 
								3'b010 : begin 
								    if (ce_wht_selector_d1[g]) begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][3] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][6] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][3] = 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][6] = 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][3]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],3);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][6]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],6);
											$stop;
										end	
									end 
									else begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][3] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][6] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 +1][output_row1[g] ][output_col1[g]][3] = 1;
											pix_data_result[g * 2 +1][output_row1[g] ][output_col1[g]][6] = 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][3]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],3);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][6]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],6);
											$stop;
										end	
									
									end 
								end 
								3'b011 : begin 
								    if (ce_wht_selector_d1[g]) begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][4] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][7] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][4] = 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][7] = 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][3]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],7);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][6]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],4);
											$stop;
										end	
									end 
									else begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][4] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][7] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 +1 ][output_row1[g] ][output_col1[g]][4] = 1;
											pix_data_result[g * 2 +1 ][output_row1[g] ][output_col1[g]][7] = 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][4]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],4);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][7]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],7);
											$stop;
										end	
									
									end 
								end 
								3'b100 : begin 
								    if (ce_wht_selector_d1[g]) begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][5] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][8] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][5] = 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][8] = 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][5]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],5);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][8]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],8);
											$stop;
										end	
									end 
									else begin 
										if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][5] == ce1_pixel_dataout[g][31:16] 
										&& pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][8] == ce1_pixel_dataout[g][15:0]) begin
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][5] = 1;
											pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][8] = 1;
											
										end
										else begin 
											$display("AWE %d CONV 1 UPPER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][5]  ,ce0_pixel_dataout[g][31:16],output_row0[g],output_col0[g],5);
											$display("AWE %d CONV 1 LOWER DATA MISMATCH: EXPECTED DATA %d  SIMULATION DATA %d index %d\t%d\t%d", g,pix_data_sol[g * 2 + 1][output_row0[g]][output_col0[g]][8]  ,ce0_pixel_dataout[g][15:0],output_row0[g],output_col0[g],8);
											$stop;
										end	
									
									end 
								end 
							endcase	
													
						end
					end
					endcase
					                   
                end
            end		
        end    
    endgenerate
 	// END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    // BEGIN LOGIC --------------------------------------------------------------------------------------------------------------------------------------
	//checking convolution values 
		always @(posedge clk_500MHz) begin 
	        if(rst) begin
			    output_conv_depth <= 0;
				output_conv_col <= 0;
				output_conv_row <= 0;
			end else begin 
				if(result_valid) begin 
					convolution_map_result[output_conv_depth][output_conv_row][output_conv_col] <= result_data ;
					if(output_conv_col > COLS + 2 ) begin 
						output_conv_col <= 0;
						if (output_conv_depth == NUM_KERNELS -1 )begin
							output_conv_depth <= 0;
							if(output_conv_row == ROWS -1)  
								output_conv_row <= 0;		
							else
								output_conv_row <= output_conv_row + STRIDE;	
						end else begin 
							output_conv_depth <= output_conv_depth + 1;
						end
					end else begin 
						output_conv_col <= output_conv_col + STRIDE;
					end
				end 
			end 	
		end
	  
	
	
	//END ---------------------------------------------------------------------------------------------------------------------------------------------------
	
    initial begin
        wait(!rst);	
    
        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
        // Set config Regs
        i0_cnn_layer_accel_quad.pix_seq_data_full_count_cfg                                 = (`WINDOW_3x3_NUM_CYCLES * COLS ) ;                                       
        i0_cnn_layer_accel_quad.kernel_full_count_cfg                                       = 10;
        i0_cnn_layer_accel_quad.num_input_rows_cfg                                          = ROWS - 1;
        i0_cnn_layer_accel_quad.num_input_cols_cfg                                          = COLS - 1;
        i0_cnn_layer_accel_quad.pfb_full_count_cfg                                          = COLS;
		i0_cnn_layer_accel_quad.convolution_stride_cfg                                      = STRIDE;
		i0_cnn_layer_accel_quad.kernel_size_cfg    		                                    = KERNEL_SIZE;
        i0_cnn_layer_accel_quad.num_kernel_cfg                                              = NUM_KERNELS; 
        i0_cnn_layer_accel_quad.padding_cfg                                                 = PADDING;
        i0_cnn_layer_accel_quad.num_output_rows_cfg            = ((ROWS - KERNEL_SIZE + (2 * PADDING)) / STRIDE);
        i0_cnn_layer_accel_quad.num_output_cols_cfg            = (COLS - 1) >> 1 - 1;      
        pixel_valid                                                                         = 0;
        job_start                                                                           = 0;
        job_fetch_ack                                                                       = 0;
        job_complete_ack                                                                    = 0;
        job_fetch_complete                                                                  = 0;                                        
        config_data                                                                         = 0;
        config_valid                                                                        = 0;
        weight_valid                                                                        = 0;
 	    // END logic ------------------------------------------------------------------------------------------------------------------------------------
       
        
        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
        // generate sim data and print input map
        fd = $fopen("map.txt", "w");
        for(k = 0; k < DEPTH; k = k + 1) begin
            for(i = 0; i < ROWS; i = i + 1) begin
                for(j = 0; j < COLS; j = j + 1) begin
                    pix_data_sim[(k * ROWS + i) * COLS + j] = $urandom_range(1, 10/*65535*/);
                    $fwrite(fd, "%d ", pix_data_sim[(k * ROWS + i) * COLS + j]);
                end
                $fwrite(fd, "\n");
            end
            $fwrite(fd, "\n");
            $fwrite(fd, "\n");
        end
        $fclose(fd);
 	    // END logic ------------------------------------------------------------------------------------------------------------------------------------
        
 
        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
        // create solution for sim data
		fd0 = $fopen("map_windows.txt", "w");
        for(k = 0; k < DEPTH; k = k + 1) begin
            for(i = 0; i < (ROWS - 2); i = i + 1 ) begin
                for(j = 0; j < (COLS - 2); j = j + 1) begin
                    a = i;
                    z = 0;
					$fwrite(fd0, "index depth : %d \t row :  %d \t col : %d \t \n", k , i , j);
                    for(n0 = 0; n0 < KERNEL_SIZE; n0 = n0 + 1) begin
                        b = j;
                        for(n1 = 0; n1 < KERNEL_SIZE; n1 = n1 + 1) begin
                            pix_data_sol[k][i][j][z] = pix_data_sim[(k * ROWS + a) * COLS + b];
							$fwrite(fd0, "%d ", pix_data_sol[k][i][j][z]);
                            pix_data_result[k][i][j][z] = 0;
                            b++;
                            z++;
                        end
                        a++;
                    end
					$fwrite(fd0, "\n");
                end
            end
        end
		$fclose(fd0);
 	    // END logic ------------------------------------------------------------------------------------------------------------------------------------
        

        // BEGIN logic ---------------------------------------------------------------------------------------------------------------------------------- 
        // create kernel sim data
        fd = $fopen("kernel.txt", "w");
        for(k = 0; k < NUM_KERNELS; k = k + 1) begin
		    for(i = 0; i < DEPTH; i = i + 1) begin
                for(j = 0; j < NUM_KERNEL_3x3_VALUES; j = j + 1) begin
				    if (j != NUM_KERNEL_3x3_VALUES -1 )
						kernel_data_sim[(k * DEPTH + i) * NUM_KERNEL_3x3_VALUES + j] =  $urandom_range(1,100);
					else
						kernel_data_sim[(k * DEPTH + i) * NUM_KERNEL_3x3_VALUES + j] =  0;
                    $fwrite(fd, "%d ", kernel_data_sim[(k * DEPTH + i) * NUM_KERNEL_3x3_VALUES + j]);
                end
                $fwrite(fd, "\n");
            end
            $fwrite(fd, "\n");
            $fwrite(fd, "\n");
        end
        $fclose(fd);
 	    // END logic ------------------------------------------------------------------------------------------------------------------------------------
       
	   //BEGIN logic ------------------------------------------------------------------------------------------------------------------------------------
	   //create convolution maps 
        fd = $fopen("convolution.txt", "w");
		for (y =0 ; y < NUM_KERNELS ; y = y + 1) begin
            for(i = 0; i < (ROWS - 2); i = i + 1) begin
                for(j = 0; j < (COLS - 2); j = j + 1) begin
					convolution_map_sol [y][i][j] = 0;
					for(k = 0; k < DEPTH; k = k + 1) begin
						for (z = 0 ; z < NUM_KERNEL_3x3_VALUES -1 ; z = z+1 ) begin 
							convolution_map_sol [y][i][j] = convolution_map_sol [y][i][j] + pix_data_sol[k][i][j][z] * kernel_data_sim[(y * DEPTH + k) * NUM_KERNEL_3x3_VALUES + z] ;
							
						end
					end
					$fwrite(fd, "%d ", convolution_map_sol[y][i][j]);
				end
				 $fwrite(fd, "\n");
			end
			 $fwrite(fd, "\n");
            $fwrite(fd, "\n");
		end		
		$fclose(fd);			   
	   
	   // END logic --------------------------------------------------------------------------------------------------------------------------------------
	   
		// Sequence for a regular 3x3 convolution with stride 1
        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
        // RM = Row matriculate
        // RST = Reset MACC reg
        // P = parity bit
        //                            RM   RST    P
        /*pix_seq_data_sim[0] = {3'b0, 1'b0, 1'b1, 1'b1, 10'd0  };
        pix_seq_data_sim[1] = {3'b0, 1'b0, 1'b0, 1'b0, 10'd2  };
        pix_seq_data_sim[2] = {3'b0, 1'b0, 1'b0, 1'b0, 10'd512};
        pix_seq_data_sim[3] = {3'b0, 1'b0, 1'b0, 1'b0, 10'd513};
        pix_seq_data_sim[4] = {3'b0, 1'b1, 1'b0, 1'b0, 10'd514};
    
        j = 0;
        fd = $fopen("seq.txt", "w");
        $fwrite(fd, "%d\t%d\t%d\t%d\t%d\n", pix_seq_data_sim[0][9:0], pix_seq_data_sim[1][9:0], pix_seq_data_sim[2][9:0], pix_seq_data_sim[3][9:0], pix_seq_data_sim[4][9:0]);       
        for(i = 5; i < (512 * 5); i = i + 5) begin            
            if((j % 2) == 0) begin
                pix_seq_data_sim[i    ] = {3'b0, 1'b0, 1'b1, 1'b0, pix_seq_data_sim[i - 5][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
                pix_seq_data_sim[i + 1] = {3'b0, 1'b0, 1'b0, 1'b1, pix_seq_data_sim[i - 4][`PIX_SEQ_DATA_SEQ_FIELD]};
            end else begin           
                pix_seq_data_sim[i    ] = {3'b0, 1'b0, 1'b1, 1'b1, pix_seq_data_sim[i - 5][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
                pix_seq_data_sim[i + 1] = {3'b0, 1'b0, 1'b0, 1'b0, pix_seq_data_sim[i - 4][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2};
            end
            pix_seq_data_sim[i + 2] = {3'b0, 1'b0, 1'b0, 1'b0, pix_seq_data_sim[i - 3][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
            pix_seq_data_sim[i + 3] = {3'b0, 1'b0, 1'b0, 1'b0, pix_seq_data_sim[i - 2][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
            pix_seq_data_sim[i + 4] = {3'b0, 1'b1, 1'b0, 1'b0, pix_seq_data_sim[i - 1][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
            j = (j + 1) % 2;
            $fwrite(fd, "%d\t%d\t%d\t%d\t%d\n", pix_seq_data_sim[i][9:0], pix_seq_data_sim[i + 1][9:0], pix_seq_data_sim[i + 2][9:0], pix_seq_data_sim[i + 3][9:0], pix_seq_data_sim[i + 4][9:0]);
        end
        while(i < (512 * 8)) begin
            pix_seq_data_sim[i] = 0;
            i = i + 1;
        end
        $fclose(fd);*/
 	    // END logic ------------------------------------------------------------------------------------------------------------------------------------

       // Sequence for a  3x3 convolution with stride 2
       // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
        // RM = Row matriculate
        // RST = Reset MACC reg
        // P = parity bit
        //                            RM   RST    P
        pix_seq_data_sim[0] = {3'b0, 1'b0, 1'b1, 1'b1, 10'd0  };
        pix_seq_data_sim[1] = {3'b0, 1'b0, 1'b0, 1'b0, 10'd2  };
        pix_seq_data_sim[2] = {3'b1, 1'b0, 1'b0, 1'b0, 10'd512};
        pix_seq_data_sim[3] = {3'b1, 1'b1, 1'b0, 1'b0, 10'd513};
        pix_seq_data_sim[4] = {3'b0, 1'b1, 1'b0, 1'b0, 10'd514};
    
        j = 0;
        fd = $fopen("seq.txt", "w");
        $fwrite(fd, "%d\t%d\t%d\t%d\t%d\n", pix_seq_data_sim[0][9:0], pix_seq_data_sim[1][9:0], pix_seq_data_sim[2][9:0], pix_seq_data_sim[3][9:0], pix_seq_data_sim[4][9:0]);       
        for(i = 5; i < (10 * 5); i = i + 5) begin            
            
            pix_seq_data_sim[i    ] = {3'b0, 1'b0, 1'b1, 1'b1, pix_seq_data_sim[i - 5][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2};
            pix_seq_data_sim[i + 1] = {3'b0, 1'b0, 1'b0, 1'b0, pix_seq_data_sim[i - 4][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2};
            pix_seq_data_sim[i + 2] = {3'b1, 1'b0, 1'b0, 1'b0, pix_seq_data_sim[i - 3][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2};
            pix_seq_data_sim[i + 3] = {3'b1, 1'b1, 1'b0, 1'b0, pix_seq_data_sim[i - 2][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2};
            pix_seq_data_sim[i + 4] = {3'b0, 1'b1, 1'b0, 1'b0, pix_seq_data_sim[i - 1][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2};
            j = (j + 1) % 2;
            $fwrite(fd, "%d\t%d\t%d\t%d\t%d\n", pix_seq_data_sim[i][9:0], pix_seq_data_sim[i + 1][9:0], pix_seq_data_sim[i + 2][9:0], pix_seq_data_sim[i + 3][9:0], pix_seq_data_sim[i + 4][9:0]);
        end
        while(i < (512 * 8)) begin
            pix_seq_data_sim[i] = 0;
            i = i + 1;
        end
        $fclose(fd);
 	    // END logic ------------------------------------------------------------------------------------------------------------------------------------
 
 
 
 
        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
        // send pixel sequence configuration data down for input maps
        i = 1;
        @(posedge clk_100MHz);
        config_data[127:112]    = pix_seq_data_sim[(0 * 8) + 7]; 
        config_data[111:96]     = pix_seq_data_sim[(0 * 8) + 6];     
        config_data[95:80]      = pix_seq_data_sim[(0 * 8) + 5];     
        config_data[79:64]      = pix_seq_data_sim[(0 * 8) + 4];     
        config_data[63:48]      = pix_seq_data_sim[(0 * 8) + 3];     
        config_data[47:32]      = pix_seq_data_sim[(0 * 8) + 2];     
        config_data[31:16]      = pix_seq_data_sim[(0 * 8) + 1];     
        config_data[15:0]       = pix_seq_data_sim[(0 * 8) + 0];
        config_valid[0]         = 1;
        while(i < 512) begin
            @(posedge clk_100MHz);
            if(config_accept[0]) begin
                config_data[127:112]    = pix_seq_data_sim[(i * 8) + 7]; 
                config_data[111:96]     = pix_seq_data_sim[(i * 8) + 6];     
                config_data[95:80]      = pix_seq_data_sim[(i * 8) + 5];     
                config_data[79:64]      = pix_seq_data_sim[(i * 8) + 4];     
                config_data[63:48]      = pix_seq_data_sim[(i * 8) + 3];     
                config_data[47:32]      = pix_seq_data_sim[(i * 8) + 2];     
                config_data[31:16]      = pix_seq_data_sim[(i * 8) + 1];     
                config_data[15:0]       = pix_seq_data_sim[(i * 8) + 0];
                i = i + 1;
            end
        end
        @(posedge clk_100MHz);
        config_valid[0]                = 0;
  	    // END logic ------------------------------------------------------------------------------------------------------------------------------------
       
  
        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
        // send configuration data down for kernels
        @(posedge clk_500MHz);
        config_valid[1]         = 1;        
        config_data[127:112]    = NUM_KERNELS - 1;
        config_data[111:96]     = NUM_KERNELS - 1;
        config_data[95:80]      = NUM_KERNELS - 1;
        config_data[79:64]      = NUM_KERNELS - 1;
        config_data[63:48]      = NUM_KERNELS - 1;
        config_data[47:32]      = NUM_KERNELS - 1;
        config_data[31:16]      = NUM_KERNELS - 1;
        config_data[15:0]       = NUM_KERNELS - 1;
		while(1) begin
            @(posedge clk_500MHz);
            if(config_accept[1]) begin
                break;
            end
        end
        @(posedge clk_500MHz);
        config_valid[1]         = 0;
        config_data[127:112]    = 0;
        config_data[111:96]     = 0;
        config_data[95:80]      = 0;
        config_data[79:64]      = 0;
        config_data[63:48]      = 0;
        config_data[47:32]      = 0;
        config_data[31:16]      = 0;
        config_data[15:0]       = 0;
        
        // send kernel data down
        i = 1;
        j = 0;
        @(posedge clk_500MHz);
        weight_data[127:112]                        = kernel_data_sim[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (7 * NUM_KERNEL_3x3_VALUES) + 0]; 
        weight_data[111:96]                         = kernel_data_sim[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (6 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[95:80]                          = kernel_data_sim[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (5 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[79:64]                          = kernel_data_sim[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (4 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[63:48]                          = kernel_data_sim[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (3 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[47:32]                          = kernel_data_sim[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (2 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[31:16]                          = kernel_data_sim[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (1 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[15:0]                           = kernel_data_sim[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (0 * NUM_KERNEL_3x3_VALUES) + 0];
        weight_valid                                = 1;      
        kernel_group_cfg                            = 0;
        config_data                                 = 0;
        while(j < NUM_KERNELS) begin
            while(i < NUM_KERNEL_3x3_VALUES) begin
                @(posedge clk_500MHz);
                if(weight_ready) begin
                    weight_data[127:112]    = kernel_data_sim[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (7 * NUM_KERNEL_3x3_VALUES) + i]; 
                    weight_data[111:96]     = kernel_data_sim[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (6 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[95:80]      = kernel_data_sim[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (5 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[79:64]      = kernel_data_sim[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (4 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[63:48]      = kernel_data_sim[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (3 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[47:32]      = kernel_data_sim[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (2 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[31:16]      = kernel_data_sim[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (1 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[15:0]       = kernel_data_sim[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (0 * NUM_KERNEL_3x3_VALUES) + i];
                    i = i + 1;
                end
            end
            kernel_group_cfg = kernel_group_cfg + 1;
            config_data =   {   
                                kernel_group_cfg,
                                kernel_group_cfg,
                                kernel_group_cfg,
                                kernel_group_cfg,
                                kernel_group_cfg,
                                kernel_group_cfg,
                                kernel_group_cfg,
                                kernel_group_cfg
                            };
            i = 0;
            j = j + 1;
        end
        @(posedge clk_500MHz);
        weight_valid                        = 0;  
  	    // END logic ------------------------------------------------------------------------------------------------------------------------------------

  
        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
        // start processing
        @(posedge clk_100MHz);
        job_start = 1;
        while(1) begin
            @(posedge clk_100MHz);
            if(job_accept) begin
                break;
            end
        end
        @(posedge clk_100MHz);
        job_start = 0; 

        
        i = 0; 
        j = 0;
        while(i < (ROWS * COLS) ) begin
            @(posedge clk_100MHz);
            if(job_fetch_request) begin
                job_fetch_ack = 1;                
                @(posedge clk_100MHz);
                job_fetch_ack = 0;
                pixel_valid  = 1;
                pixel_data[127:112]     = pix_data_sim[(7 * (ROWS * COLS)) + i];
                pixel_data[111:96]      = pix_data_sim[(6 * (ROWS * COLS)) + i];          
                pixel_data[95:80]       = pix_data_sim[(5 * (ROWS * COLS)) + i];           
                pixel_data[79:64]       = pix_data_sim[(4 * (ROWS * COLS)) + i];           
                pixel_data[63:48]       = pix_data_sim[(3 * (ROWS * COLS)) + i];           
                pixel_data[47:32]       = pix_data_sim[(2 * (ROWS * COLS)) + i];            
                pixel_data[31:16]       = pix_data_sim[(1 * (ROWS * COLS)) + i];           
                pixel_data[15:0]        = pix_data_sim[(0 * (ROWS * COLS)) + i];
                j                       = i + 1;
                n                       = 0;
                while(n < COLS ) begin
                    @(posedge clk_100MHz);
                    if(pixel_ready) begin
                        pixel_data[127:112]  = pix_data_sim[(7 * (ROWS * COLS)) + j];
                        pixel_data[111:96]   = pix_data_sim[(6 * (ROWS * COLS)) + j];          
                        pixel_data[95:80]    = pix_data_sim[(5 * (ROWS * COLS)) + j];           
                        pixel_data[79:64]    = pix_data_sim[(4 * (ROWS * COLS)) + j];           
                        pixel_data[63:48]    = pix_data_sim[(3 * (ROWS * COLS)) + j];           
                        pixel_data[47:32]    = pix_data_sim[(2 * (ROWS * COLS)) + j];            
                        pixel_data[31:16]    = pix_data_sim[(1 * (ROWS * COLS)) + j];           
                        pixel_data[15:0]     = pix_data_sim[(0 * (ROWS * COLS)) + j];
                        j                   = j + 1;
                        n                   = n + 1;
                    end
                end
                job_fetch_complete = 1;
                pixel_valid = 0;
                @(posedge clk_100MHz);
                job_fetch_complete = 0;
                i = i + COLS;
            end
        end 
  	    // END logic ------------------------------------------------------------------------------------------------------------------------------------

        
        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------            
        while(1) begin
            @(posedge clk_100MHz);
            if(job_complete) begin
                job_complete_ack = 1;
                break;
            end
        end
        @(posedge clk_100MHz);
        job_complete_ack = 0; 
   	    // END logic ------------------------------------------------------------------------------------------------------------------------------------
       

        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
        for(i = 0; i < DEPTH; i++) begin
            for(a = 0; a < (ROWS - 2); a = a + STRIDE ) begin
                for(b = 0; b < (COLS - 2);b= b+ STRIDE) begin
                    for(n = 0; n < (KERNEL_SIZE * KERNEL_SIZE); n++) begin
                        if(!pix_data_result[i][a][b][n]) begin
                            $display("Failed at: %d %d %d %d", i, a, b, n);
							$stop;
                        end
                    end
                end
            end
        end
        
        $display("Passed Kernal Test");
       
  	    // END logic ------------------------------------------------------------------------------------------------------------------------------------        
		
		   // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
        for(i = 0; i < NUM_KERNELS; i++) begin
            for(a = 0; a < (ROWS - 2); a= a + STRIDE) begin
                for(b = 0; b < (COLS - 2); b = b + STRIDE) begin
                    if(convolution_map_result[i][a][b] != convolution_map_sol[i][a][b] ) begin
                        $display("Failed at: %d %d %d Expected value : %d : Actual Value : %d", i, a, b, convolution_map_sol[i][a][b],convolution_map_result[i][a][b] );
						$stop;
                    end
                end
            end
        end
        
        $display("Passed Convolution Test");
        $stop;
  	    // END logic ------------------------------------------------------------------------------------------------------------------------------------        
    end
    
   
endmodule