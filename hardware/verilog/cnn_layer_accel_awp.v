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
//                          
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_awp (


);

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"
	
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    logic            job_start[`NUM_QUADS - 1:0]            ;
    logic            job_accept[`NUM_QUADS - 1:0]           ;
    logic [127:0]    job_parameters[`NUM_QUADS - 1:0]       ;
    logic            job_fetch_request[`NUM_QUADS - 1:0]    ;
    logic            job_fetch_ack[`NUM_QUADS - 1:0]        ;
    logic            job_fetch_complete[`NUM_QUADS - 1:0]   ;      
    logic            job_complete[`NUM_QUADS - 1:0]         ;
    logic            job_complete_ack[`NUM_QUADS - 1:0]     ;
    logic            pip_primed[`NUM_QUADS - 1:0]           ;
    logic            all_pip_primed_arr[`NUM_QUADS - 1:0]   ;
    logic            all_pip_primed                         ;
    logic            pfb_loaded[`NUM_QUADS - 1:0]           ;
    logic            all_pfb_loaded_arr[`NUM_QUADS - 1:0]   ;
    logic            all_pfb_loaded                         ; 

    logic            cascade_in_valid[`NUM_QUADS - 1:0]     ;
    logic            cascade_in_ready[`NUM_QUADS - 1:0]     ;
    logic [15:0]     cascade_in_data[`NUM_QUADS - 1:0]      ;

    logic            cascade_out_valid[`NUM_QUADS - 1:0]    ;
    logic            cascade_out_ready[`NUM_QUADS - 1:0]    ;
    logic [15:0]     cascade_out_data[`NUM_QUADS - 1:0]    	;

    logic [  3:0]    config_valid[`NUM_QUADS - 1:0]         ;
    logic [  3:0]    config_accept[`NUM_QUADS - 1:0]        ;
    logic [127:0]    config_data[`NUM_QUADS - 1:0]          ;

    logic            weight_valid[`NUM_QUADS - 1:0]         ;
    logic            weight_ready[`NUM_QUADS - 1:0]         ;
    logic [127:0]    weight_data[`NUM_QUADS - 1:0]          ;

    logic            result_valid[`NUM_QUADS - 1:0]         ;
    logic            result_accept[`NUM_QUADS - 1:0]        ;
    logic [15:0]     result_data[`NUM_QUADS - 1:0]          ;

    logic            pixel_valid[`NUM_QUADS - 1:0]          ;
    logic            pixel_ready[`NUM_QUADS - 1:0]          ;
    logic [127:0]    pixel_data[`NUM_QUADS - 1:0]           ;
    
    logic            fifo_empty[`NUM_QUADS - 1:0]           ;
	
	
	genvar gi0;
    integer i0;
    integer i1;


    for(gi0 = 0; gi0 < `NUM_QUADS; gi0 = gi0 + 1) begin: QUAD
        cnn_layer_accel_quad
        i0_cnn_layer_accel_quad (
            .clk_if               ( clk_if                  ),  
            .clk_core             ( clk_core                ),  
            .rst                  ( rst                     ),  

            .job_start            ( job_start[gi0]            ),  
            .job_accept           ( job_accept[gi0]           ),  
            .job_parameters       ( job_parameters[gi0]       ),  
            .job_fetch_request    ( job_fetch_request[gi0]    ),  
            .job_fetch_ack        ( job_fetch_ack[gi0]        ), 
            .job_fetch_complete   ( job_fetch_complete[gi0]   ),
            .job_complete         ( job_complete[gi0]         ),  
            .job_complete_ack     ( job_complete_ack[gi0]     ), 
            .pip_primed           ( pip_primed[gi0]           ),
            .all_pip_primed       ( all_pip_primed_arr[gi0]   ),
            .pfb_loaded           ( pfb_loaded[gi0]           ),
            .all_pfb_loaded       ( all_pfb_loaded_arr[gi0]   ),

            .cascade_in_valid     ( cascade_in_valid[gi0]     ),
            .cascade_in_ready     ( cascade_in_ready[gi0]     ),
            .cascade_in_data      ( cascade_in_data[gi0]      ),

            .cascade_out_valid    ( cascade_out_valid[gi0]    ),
            .cascade_out_ready    ( cascade_out_ready[gi0]    ),
            .cascade_out_data     ( cascade_out_data[gi0]     ),

            .config_valid         ( config_valid[gi0]         ),
            .config_accept        ( config_accept[gi0]        ),
            .config_data          ( config_data[gi0]          ),

            .weight_valid         ( weight_valid[gi0]         ),
            .weight_ready         ( weight_ready[gi0]         ),
            .weight_data          ( weight_data[gi0]          ),

            .result_valid         ( result_valid[gi0]         ),
            .result_accept        ( result_accept[gi0]        ),
            .result_data          ( result_data[gi0]          ),
     
            .pixel_valid          ( pixel_valid[gi0]          ),
            .pixel_ready          ( pixel_ready[gi0]          ),
            .pixel_data           ( pixel_data[gi0]           )
        );
        
        if(gi0 == 0) begin
            assign all_pip_primed_arr[gi0] = all_pip_primed;
            assign all_pfb_loaded_arr[gi0] = all_pfb_loaded;
            assign cascade_in_valid[gi0]   = 1;
            assign cascade_in_data[gi0]    = 0;
        end else begin
            assign all_pip_primed_arr[gi0] = 0;
            assign all_pfb_loaded_arr[gi0] = 0;
        end

        if(gi0 != (`NUM_QUADS - 1)) begin
            fifo_fwft #(
                .C_DATA_WIDTH( `PIXEL_WIDTH ),
                .C_FIFO_DEPTH( 5            )
            ) i0_fifo_fwft (
                .clk            ( clk_core                  ),
                .rst            ( rst                       ),
                .wren           ( cascade_out_valid[gi0]    ),
                .rden           ( cascade_in_ready[gi0 + 1] ),
                .datain         ( cascade_out_data[gi0]     ),
                .dataout        ( cascade_in_data[gi0 + 1]  ),
                .empty          ( fifo_empty[gi0]           ),
                .full           (                           ),
                .almost_full    (                           )
            );
            
            assign cascade_in_valid[gi0 + 1] = !fifo_empty[gi0];
        end
    end
    
    
    // BEGIN Logic ------------------------------------------------------------------------------------------------------------------------------
    always@(*) begin
       for(idx0 = 0; idx0 < `NUM_QUADS; idx0 = idx0 + 1) begin
            all_pip_primed = pip_primed[idx0] && 1;
       end
       for(idx7 = 0; idx7 < `NUM_QUADS; idx7 = idx7 + 1) begin
            all_pfb_loaded = pfb_loaded[idx7] && 1;
       end
    end    
    // END Logic --------------------------------------------------------------------------------------------------------------------------------
	
	
	// BEGIN Logic ------------------------------------------------------------------------------------------------------------------------------
    always@(*) begin

    end    
    // END Logic --------------------------------------------------------------------------------------------------------------------------------

endmodule