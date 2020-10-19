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
    clk_core                    ,             
    clk_intf                    ,
    rst                         ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    trans_in_fifo_din_vld       ,
    trans_in_fifo_din_rdy       ,
    trans_in_fifo_din           ,
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    trans_eg_fifo_dout_vld      ,
    trans_eg_fifo_dout_rdy      ,
    trans_eg_fifo_dout
);

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_QUAD_defs.vh"
    `include "cnn_layer_accel_trans_fifo.svh"
	
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
 	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------   
	localparam C_TRANS_IN_FIFO_WR_WTH               = `TRANS_IN_FIFO_META_WIDTH + `TRANS_IN_FIFO_PYLD_WIDTH;
    localparam C_TRANS_IN_FIFO_RD_WTH               = `TRANS_IN_FIFO_META_WIDTH + `TRANS_IN_FIFO_PYLD_WIDTH;
    localparam C_TRANS_EG_FIFO_WR_WTH               = `TRANS_EG_FIFO_META_WIDTH + `TRANS_EG_FIFO_PYLD_WIDTH;
    localparam C_TRANS_EG_FIFO_RD_WTH               = `TRANS_EG_FIFO_META_WIDTH + `TRANS_EG_FIFO_PYLD_WIDTH;
    

    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input logic                                       clk_core                    ,             
    input logic                                       clk_intf                    ,
    input logic                                       rst                         ,
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------    
    input  logic                                      trans_in_fifo_din_vld       ;      
    output logic                                      trans_in_fifo_din_rdy       ;      
    input  logic [     C_TRANS_IN_FIFO_WR_WTH - 1:0]  trans_in_fifo_din           ;      
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    output logic                                      trans_eg_fifo_dout_vld      ;
    input  logic                                      trans_eg_fifo_dout_rdy      ;
    output logic [     C_TRANS_IN_FIFO_RD_WTH - 1:0]  trans_eg_fifo_dout          ;


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------   
    logic                                       AWP_rdy_n                               ;
    logic                                       AWP_intf_rdy_n                          ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    logic                                       job_start[`NUM_QUADS - 1:0]             ;
    logic                                       job_accept[`NUM_QUADS - 1:0]            ;
    logic [127:0]                               job_parameters[`NUM_QUADS - 1:0]        ;
    logic                                       job_fetch_request[`NUM_QUADS - 1:0]     ;
    logic                                       job_fetch_ack[`NUM_QUADS - 1:0]         ;
    logic                                       job_fetch_complete[`NUM_QUADS - 1:0]    ;      
    logic                                       job_complete[`NUM_QUADS - 1:0]          ;
    logic                                       job_complete_ack[`NUM_QUADS - 1:0]      ;
    logic                                       pip_primed[`NUM_QUADS - 1:0]            ;
    logic                                       all_pip_primed_arr[`NUM_QUADS - 1:0]    ;
    logic                                       all_pip_primed                          ;
    logic                                       pfb_loaded[`NUM_QUADS - 1:0]            ;
    logic                                       all_pfb_loaded_arr[`NUM_QUADS - 1:0]    ;
    logic                                       all_pfb_loaded                          ; 
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                       cascade_in_valid[`NUM_QUADS - 1:0]      ;
    logic                                       cascade_in_ready[`NUM_QUADS - 1:0]      ;
    logic [15:0]                                cascade_in_data[`NUM_QUADS - 1:0]       ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                       cascade_out_valid[`NUM_QUADS - 1:0]     ;
    logic                                       cascade_out_ready[`NUM_QUADS - 1:0]     ;
    logic [15:0]                                cascade_out_data[`NUM_QUADS - 1:0]      ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [  3:0]                               config_valid[`NUM_QUADS - 1:0]          ;
    logic [  3:0]                               config_accept[`NUM_QUADS - 1:0]         ;
    logic [127:0]                               config_data[`NUM_QUADS - 1:0]           ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                       weight_valid[`NUM_QUADS - 1:0]          ;
    logic                                       weight_ready[`NUM_QUADS - 1:0]          ;
    logic [127:0]                               weight_data[`NUM_QUADS - 1:0]           ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                       result_valid[`NUM_QUADS - 1:0]          ;
    logic                                       result_accept[`NUM_QUADS - 1:0]         ;
    logic [15:0]                                result_data[`NUM_QUADS - 1:0]           ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                       pixel_valid[`NUM_QUADS - 1:0]           ;
    logic                                       pixel_ready[`NUM_QUADS - 1:0]           ;
    logic [127:0]                               pixel_data[`NUM_QUADS - 1:0]            ;
    // BEGIN ---------------------------------------------------------------------------------------------------------------------------------------- 
    logic                                       fifo_empty[`NUM_QUADS - 1:0]            ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                       trans_in_fifo_wren                      ;
    logic                                       trans_in_fifo_wren_r                    ;
    logic                                       trans_in_fifo_rden                      ;
    logic [   C_TRANS_IN_FIFO_RD_WTH - 1:0]	    trans_in_fifo_dout					    ; 
	logic                                       trans_in_fifo_vld                       ;
    logic                                       trans_in_fifo_empty                     ;
    logic                                       trans_in_fifo_wr_rst_busy               ;
    logic                                       trans_in_fifo_rd_rst_busy               ;
	logic [`TRANS_IN_FIFO_META_WIDTH - 1:0]     trans_in_meta						    ; 
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                       trans_eg_fifo_wren                      ;
    logic                                       trans_eg_fifo_rden                      ;
    logic [   C_TRANS_IN_FIFO_WR_WTH - 1:0]     trans_eg_fifo_din                       ;
    logic                                       trans_eg_fifo_vld                       ;
    logic                                       trans_eg_fifo_empty                     ;
    logic                                       trans_eg_fifo_wr_rst_busy               ;
    logic                                       trans_eg_fifo_rd_rst_busy     	        ;
	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    cnn_layer_accel_trans_in_fifo
    i0_cnn_layer_accel_trans_in_fifo (
        .rst           ( rst                            ),
        .wr_clk        ( clk_intf                       ),
        .rd_clk        ( clk_FAS                        ),
        .din           ( trans_in_fifo_din              ),
        .wr_en         ( trans_in_fifo_wren             ),
        .rd_en         ( trans_in_fifo_rden             ),
        .dout          ( trans_in_fifo_dout             ),
        .full          (                                ),
        .empty         ( trans_in_fifo_empty            ),
        .valid         ( trans_in_fifo_vld              ),
        .wr_rst_busy   ( trans_in_fifo_wr_rst_busy      ),
        .rd_rst_busy   ( trans_in_fifo_rd_rst_busy		)
    );
    
    
    cnn_layer_accel_trans_eg_fifo
    i0_cnn_layer_accel_trans_eg_fifo (
        .rst           ( rst                            ),
        .wr_clk        ( clk_FAS                        ),
        .rd_clk        ( clk_intf                       ),
        .din           ( trans_eg_fifo_din              ),
        .wr_en         ( trans_eg_fifo_wren             ),
        .rd_en         ( trans_eg_fifo_rden             ),
        .dout          ( trans_eg_fifo_dout             ),
        .full          (                                ),
        .empty         ( trans_eg_fifo_empty            ),
        .valid         ( trans_eg_fifo_vld              ),
        .wr_rst_busy   ( trans_eg_fifo_wr_rst_busy      ),
        .rd_rst_busy   ( trans_eg_fifo_rd_rst_busy      )
    );  


    genvar gi0;
    for(gi0 = 0; gi0 < `NUM_QUADS; gi0 = gi0 + 1) begin: QUAD
        cnn_layer_accel_quad
        i0_cnn_layer_accel_quad (
            .clk_if               ( clk_intf                ),  
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
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(*) begin
        if(trans_in_fifo_rd_rst_busy
            && trans_eg_fifo_wr_rst_busy)
        begin
            AWP_rdy_n = 1;
        end else begin
            AWP_rdy_n = 0;
        end
    end
    
    always@(*) begin
        if(trans_in_fifo_wr_rst_busy
            && trans_eg_fifo_rd_rst_busy)
        begin
            AWP_intf_rdy_n = 1;
        end else begin
            AWP_intf_rdy_n = 0;
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    
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
    always@(posedge clk_intf) begin
        
    end    
    // END Logic --------------------------------------------------------------------------------------------------------------------------------

endmodule