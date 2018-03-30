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
//                          
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_quad (
    clk_if                  ,
    clk_core                ,
    rst                     ,

    job_start               ,    // Asserted by main SM to request a new convolution/pool operation
    job_accept              ,    // Asserted by quad to accept the job request
    job_parameters          ,    // Parameters associated with operation being requested
    job_fetch_request       ,    // Asserted by quad to notify main SM to fetch another row of data
    job_fetch_ack           ,    // Asserted by main SM to acknowledge the row fetch request
    job_fetch_complete      ,
    job_complete            ,    // Asserted by quad to signify completion of the operation
    job_complete_ack        ,    // Asserted by main SM to acknowledge completion

    cascade_in_data         ,
    cascade_in_valid        ,
    cascade_in_ready        ,

    cascade_out_data        ,
    cascade_out_valid       ,
    cascade_out_ready       ,

    config_valid            ,
    config_accept           ,
    config_data             ,

    result_valid            ,
    result_accept           ,
    result_data             ,
    
    pixel_valid             ,
    pixel_ready             ,
    pixel_data  
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_LOG2_BRAM_DEPTH        = clog2(`BRAM_DEPTH);
    localparam C_PIXEL_DATAOUT_WIDTH    = `NUM_AWE * `NUM_CE_PER_AWE * `PIXEL_WIDTH;
    localparam C_NUM_CE                 = `NUM_CE_PER_AWE * `NUM_AWE;
    localparam C_PIXEL_DOUT_WIDTH       = C_NUM_CE * `PIXEL_WIDTH;
    localparam C_PFB_DOUT_WIDTH         = C_NUM_CE * `PIXEL_WIDTH;
    localparam C_CE_START_WIDTH         = `NUM_AWE * `NUM_CE_PER_AWE;
    localparam C_PFB_COUNT_WIDTH        = C_NUM_CE * 10;
    localparam CE_CYCLE_COUNTER_WIDTH   = `NUM_AWE * 6;
    localparam C_WHT_DOUT_WIDTH         = C_NUM_CE * `WEIGHT_WIDTH;
    localparam C_WHT_SEQ_BRAM_ADDR      = clog2(5); 

    localparam ST_IDLE                  = 6'b000001;  
    localparam ST_AWE_CE_PRIM_BUFFER    = 6'b000010;
    localparam ST_WAIT_PFB_LOAD         = 6'b000100;
    localparam ST_AWE_CE_ACTIVE         = 6'b001000;
    localparam ST_FIN_ROW_MATRIC        = 6'b010000;
    localparam ST_JOB_DONE              = 6'b100000;
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input               clk_if              ;
    input               clk_core            ;
    input               rst                 ;
    
    input               job_start           ;
    output              job_accept          ;
    input   [127:0]     job_parameters      ;
    output              job_fetch_request   ;
    input               job_fetch_ack       ;
    input               job_fetch_complete  ;
    output              job_complete        ;
    input               job_complete_ack    ;
    
    input               cascade_in_valid    ;
    output              cascade_in_ready    ;
    input   [127:0]     cascade_in_data     ;
    
    output              cascade_out_valid   ;
    input               cascade_out_ready   ;
    output  [127:0]     cascade_out_data    ;
    
    input   [3:0]       config_valid        ;
    output reg  [3:0]   config_accept       ;
    input   [127:0]     config_data         ;
    
    output              result_valid        ;
    input               result_accept       ;
    output  [127:0]     result_data         ;

    input               pixel_valid         ;
    output reg          pixel_ready         ;
    input [127:0]       pixel_data          ;
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------      
    wire                                    job_fetch_in_progress       ;
    wire                                    row_matric                  ;
    wire    [                        1:0]   gray_code                   ;

    wire    [C_PIXEL_DATAOUT_WIDTH - 1:0]   ce0_pixel_dataout           ;
    wire    [C_PIXEL_DATAOUT_WIDTH - 1:0]   ce1_pixel_dataout           ;

    wire                                    pfb_wren                    ;
    wire                                    pfb_rden                    ;
    wire                                    pfb_rden_d                  ;
    wire    [     C_PFB_DOUT_WIDTH - 1:0]   pfb_dataout                 ;
    wire    [             C_NUM_CE - 1:0]   pfb_empty                   ;
    reg     [                        8:0]   pfb_count                   ;

    wire    [                        5:0]   state                       ; 
    wire    [     C_CE_START_WIDTH - 1:0]   ce_execute                  ;
    wire    [    C_LOG2_BRAM_DEPTH - 2:0]   input_row                   ;
    wire    [    C_LOG2_BRAM_DEPTH - 2:0]   input_col                   ;
    wire    [    C_LOG2_BRAM_DEPTH - 2:0]   row_matric_wrAddr           ;
    genvar                                  i                           ;
    genvar                                  j                           ;

    reg     [                        8:0]   num_input_cols_cfg          ;
    reg     [                        8:0]   num_input_rows_cfg          ;
    reg     [                        8:0]   pfb_full_count_cfg          ;
    reg     [                       15:0]   num_kernels_cfg             ;
    reg     [                       15:0]   kernel_size_cfg             ;
    reg     [                       15:0]   kernel_offset_cfg           ;

    reg                                     last_kernel                 ;

    wire                                    pix_seq_bram_rden           ;
    reg     [                        8:0]   pix_seq_bram_wrAddr         ;
    wire    [                       11:0]   pix_seq_bram_rdAddr         ;
    wire    [                       15:0]   pix_seq_bram_dout           ;

    reg                                     config_wren                 ;      
    reg                                     weight_wren                 ;
    
    wire   [              `NUM_AWE - 1:0]   ce0_pixel_dataout_valid     ;
    wire   [              `NUM_AWE - 1:0]   ce1_pixel_dataout_valid     ;
    
    // reg    [      C_LOG2_BRAM_DEPTH - 1:0]  wht_bram_wrAddr             ;
    // reg    [      C_LOG2_BRAM_DEPTH - 1:0]  wht_bram_rdAddr             ;
    // reg                                     wht_bram_rden               ; 
    // wire   [       C_WHT_DOUT_WIDTH - 1:0]  wht_bram_dataout            ;
    // 
    // 
    // reg    [    C_WHT_SEQ_BRAM_ADDR - 1:0]  wht_seq_bram_wrAddr         ;
    // reg    [    C_WHT_SEQ_BRAM_ADDR - 1:0]  wht_seq_bram_rdAddr         ;
    // reg                                     wht_seq_bram_rden           ; 
    // wire   [   C_WHT_SEQ_DOUT_WIDTH - 1:0]  wht_seq_bram_dataout        ;
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    // Sequence BRAM Specs
    // Write Width: 128 bits
    // Write Depth: 512
    // Read Width:  16 bits
    // Read Depth:  4096
    pixel_sequence_data_bram
    i0_pixel_sequence_data_bram (
        .clka     ( clk_if                              ),
        .wea      ( config_accept[0] && config_valid    ),
        .addra    ( pix_seq_bram_wrAddr                 ),    
        .dina     ( config_data                         ),
        .clkb     ( clk_core                            ),
        .enb      ( pix_seq_bram_rden                   ),
        .addrb    ( pix_seq_bram_rdAddr                 ),
        .doutb    ( pix_seq_bram_dout                   )
    );
    
    
    generate
        for(i = 0; i < `NUM_AWE; i = i + 1) begin
            for(j = 0; j < `NUM_CE_PER_AWE; j = j + 1) begin
                // Prefetch Buffer FIFO Specs
                // Write Width: 16 bits
                // Write Depth: 512
                // Read Width:  16 bits
                // Read Depth:  512                
                prefetch_buffer_fifo
                i0_prefetch_buffer_fifo (
                  .wr_clk           ( clk_if                                                                        ),
                  .rd_clk           ( clk_core                                                                      ),
                  .din              ( pixel_data[(((i * `NUM_CE_PER_AWE) + j) * `PIXEL_WIDTH) +: `PIXEL_WIDTH]      ),
                  .wr_en            ( pfb_wren                                                                      ),
                  .rd_en            ( pfb_rden                                                                      ),
                  .dout             ( pfb_dataout[(((i * `NUM_CE_PER_AWE) + j) * `PIXEL_WIDTH) +: `PIXEL_WIDTH]     ),
                  .full             (                                                                               ),
                  .empty            ( pfb_empty[(((i * `NUM_CE_PER_AWE) + j) * 1) +: 1]                             ),
                  .valid            (                                                                               ),
                  .rd_data_count    (                                                                               )
                );
                
                
               // xilinx_simple_dual_port_2_clock_ram #(
               //     .C_RAM_WIDTH    ( `WEIGHT_WIDTH      ),      
               //     .C_RAM_DEPTH    ( `BRAM_DEPTH        )
               // ) 
               // weight_table (
               //     .wrAddr             ( wht_bram_wrAddr                                                                   ),  
               //     .rdAddr             ( wht_bram_rdAddr                                                                   ),
               //     .datain             ( config_data[(((i * `NUM_CE_PER_AWE) + j) * `PIXEL_WIDTH) +: `PIXEL_WIDTH]         ),
               //     .clk_wr             ( clk_if                                                                            ),
               //     .clk_rd             ( clk_core                                                                          ),    
               //     .wren               ( config_accept[1] && config_valid                                                  ),
               //     .rden               ( wht_bram_rden                                                                     ),
               //     .dataout            ( wht_bram_dataout[(((i * `NUM_CE_PER_AWE) + j) * `PIXEL_WIDTH) +: `PIXEL_WIDTH]    )
               // );               
            end

            
            cnn_layer_accel_awe_rowbuffers #(
                .C_CE0_ROW_MATRIC_DELAY     ( (i * `NUM_CE_PER_AWE + 1)        ),      
                .C_CE1_ROW_MATRIC_DELAY     ( (i * `NUM_CE_PER_AWE + 2)        ),
                .C_SEQ_DATAIN_DELAY         ( (i * 2)                           )
            ) 
            i0_cnn_layer_accel_awe_rowbuffers (
                .clk                        ( clk_core                                                                                          ),
                .rst                        ( rst                                                                                               ),
                .input_row                  ( input_row                                                                                         ),
                .input_col                  ( input_col                                                                                         ),
                .num_input_cols             ( num_input_cols_cfg                                                                                ),
                .state                      ( state                                                                                             ),
                .gray_code                  ( gray_code                                                                                         ),
                .pix_seq_datain             ( pix_seq_bram_dout                                                                                 ),              
                .pfb_rden                   ( pfb_rden                                                                                          ),
                .last_kernel                ( last_kernel                                                                                       ),
                .row_matric                 ( pix_seq_bram_dout[`PIX_SEQ_DATA_ROW_MATRIC_FIELD]                                                 ),
                .ce0_pixel_datain           ( pfb_dataout[(((i * `NUM_CE_PER_AWE) + 0) * `PIXEL_WIDTH) +: `PIXEL_WIDTH]                         ),
                .ce1_pixel_datain           ( pfb_dataout[(((i * `NUM_CE_PER_AWE) + 1) * `PIXEL_WIDTH) +: `PIXEL_WIDTH]                         ),
                .ce0_execute                ( ce_execute[(((i * `NUM_CE_PER_AWE) + 0) * 1) +: 1]                                                ),
                .ce1_execute                ( ce_execute[(((i * `NUM_CE_PER_AWE) + 1) * 1) +: 1]                                                ),
                .ce0_pixel_dataout          ( ce0_pixel_dataout[(i * (`PIXEL_WIDTH * `NUM_CE_PER_AWE)) +: `PIXEL_WIDTH * `NUM_CE_PER_AWE]       ),
                .ce1_pixel_dataout          ( ce1_pixel_dataout[(i * (`PIXEL_WIDTH * `NUM_CE_PER_AWE)) +: `PIXEL_WIDTH * `NUM_CE_PER_AWE]       ),
                .row_matric_wrAddr          ( row_matric_wrAddr                                                                                 ),
                .ce0_pixel_dataout_valid    ( ce0_pixel_dataout_valid[i +: 1]                                                                   ),
                .ce1_pixel_dataout_valid    ( ce1_pixel_dataout_valid[i +: 1]                                                                   )        
            );
        end
    endgenerate
    
    
    cnn_layer_accel_quad_bram_ctrl
    i0_cnn_layer_accel_quad_bram_ctrl (
        .clk                        ( clk_core                                              ),
        .rst                        ( rst                                                   ),
        .job_start                  ( job_start                                             ),
        .job_accept                 ( job_accept                                            ),
        .job_fetch_request          ( job_fetch_request                                     ),
        .job_fetch_in_progress      ( job_fetch_in_progress                                 ),
        .job_fetch_ack              ( job_fetch_ack                                         ),
        .job_fetch_complete         ( job_fetch_complete                                    ),
        .job_complete               ( job_complete                                          ),
        .job_complete_ack           ( job_complete_ack                                      ),
        .state                      ( state                                                 ),
        .input_row                  ( input_row                                             ),
        .input_col                  ( input_col                                             ),
        .num_input_cols             ( num_input_cols_cfg                                    ),
        .num_input_rows             ( num_input_rows_cfg                                    ),
        .row_matric                 ( pix_seq_bram_dout[`PIX_SEQ_DATA_ROW_MATRIC_FIELD]     ),
        .gray_code                  ( gray_code                                             ),
        .pfb_empty                  ( pfb_empty[0 +: 1]                                     ),
        .pfb_rden                   ( pfb_rden                                              ),
        .pfb_full_count             ( pfb_full_count_cfg                                    ),
        .row_matric_wrAddr          ( row_matric_wrAddr                                     ),
        .ce_execute                 ( ce_execute                                            ),
        .pix_seq_bram_rden          ( pix_seq_bram_rden                                     ),
        .pix_seq_bram_rdAddr        ( pix_seq_bram_rdAddr                                   ),
        .last_kernel                ( last_kernel                                           )
    );

   
    // BEGIN Network Output Data Logic --------------------------------------------------------------------------------------------------------------
    assign pixel_ready  = pixel_valid && job_fetch_in_progress;
    assign pfb_wren     = pixel_valid && pixel_ready;

    always@(posedge clk_if) begin
        if(rst) begin
            config_accept           <= 0;
            pix_seq_bram_wrAddr     <= 0;
        end else begin
            config_accept    <= 0;
            // Pixel Sequence Data
            if(config_valid[0]) begin
                config_accept[0]   <= 1;
            end
            if(config_accept[0] && config_valid[0]) begin
                pix_seq_bram_wrAddr <= pix_seq_bram_wrAddr + 1;
            end
            //// Weight Sequence Data
            //if(config_valid[1]) begin
            //    config_accept[1]   <= 1;
            //end
            //if(config_accept[1] && config_valid[1]) begin
            //    wht_seq_bram_wrAddr <= wht_seq_bram_wrAddr + 1;
            //end
        end
    end
    // END Network Output Data Logic ----------------------------------------------------------------------------------------------------------------


`ifdef SIMULATION
    string state_s;
    always@(state) begin 
        case(state) 
                ST_IDLE:                    state_s = "ST_IDLE";              
                ST_AWE_CE_PRIM_BUFFER:      state_s = "ST_AWE_CE_PRIM_BUFFER";
                ST_WAIT_PFB_LOAD:           state_s = "ST_WAIT_PFB_LOAD";           
                ST_AWE_CE_ACTIVE:           state_s = "ST_AWE_CE_ACTIVE";
                ST_FIN_ROW_MATRIC:          state_s = "ST_FIN_ROW_MATRIC";
                ST_JOB_DONE:                state_s = "ST_JOB_DONE";
        endcase
    end
`endif
    
endmodule
