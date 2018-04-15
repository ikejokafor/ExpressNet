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
    
    weight_valid            ,
    weight_ready            ,
    weight_data             ,

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
    localparam C_NUM_CE                 = `NUM_CE_PER_AWE * `NUM_AWE;    
    localparam C_PIXEL_DATAOUT_WIDTH    = `NUM_AWE * `NUM_CE_PER_AWE * `PIXEL_WIDTH;
    localparam C_PIXEL_DATAIN_WIDTH     = `NUM_AWE * `PIXEL_WIDTH;
    localparam C_PFB_DOUT_WIDTH         = C_NUM_CE * `PIXEL_WIDTH;
    localparam CE_CYCLE_COUNTER_WIDTH   = `NUM_AWE * 6;
    localparam C_WHT_DOUT_WIDTH         = C_NUM_CE * `WEIGHT_WIDTH * `NUM_DSP_PER_ENG;
    localparam C_CE_CYCLE_CNT_WIDTH     = C_NUM_CE * 3;
    localparam C_WHT_TBL_ADDR_WIDTH     = C_NUM_CE * 4;
    localparam C_RELU_WIDTH             = C_NUM_CE * `PIXEL_WIDTH;

    localparam ST_IDLE                  = 5'b00001;  
    localparam ST_AWE_CE_PRIM_BUFFER    = 5'b00010;
    localparam ST_WAIT_PFB_LOAD         = 5'b00100;
    localparam ST_AWE_CE_ACTIVE         = 5'b01000;
    localparam ST_JOB_DONE              = 5'b10000;
   
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
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
    
    input               weight_valid        ;
    output reg          weight_ready        ;
    input [127:0]       weight_data         ;
    
    output              result_valid        ;
    input               result_accept       ;
    output  [127:0]     result_data         ;

    input               pixel_valid         ;
    output reg          pixel_ready         ;
    input [127:0]       pixel_data          ;
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------      
    wire                                    job_fetch_in_progress           ;
    wire                                    job_accept_w                    ;
    reg     [4:0]                           job_accept_r                    ;

    wire    [                        1:0]   gray_code                       ;

    wire    [C_PIXEL_DATAOUT_WIDTH - 1:0]   ce0_pixel_dataout               ;
    wire    [C_PIXEL_DATAOUT_WIDTH - 1:0]   ce1_pixel_dataout               ;
    wire    [ C_PIXEL_DATAIN_WIDTH - 1:0]   ce0_pixel_datain                ;
    wire    [ C_PIXEL_DATAIN_WIDTH - 1:0]   ce1_pixel_datain                ;
    
    
    wire                                    pfb_wren                        ;
    wire                                    pfb_rden                        ;
    wire    [     C_PFB_DOUT_WIDTH - 1:0]   pfb_dataout                     ;
    wire    [             C_NUM_CE - 1:0]   pfb_empty                       ;
    reg     [                        8:0]   pfb_count                       ;

    wire    [             C_NUM_CE - 1:0]   ce_execute                      ;
    wire    [ C_CE_CYCLE_CNT_WIDTH - 1:0]   ce_cycle_counter                ;
    wire    [    C_LOG2_BRAM_DEPTH - 2:0]   input_row                       ;
    wire    [    C_LOG2_BRAM_DEPTH - 2:0]   input_col                       ;
    wire    [    C_LOG2_BRAM_DEPTH - 2:0]   row_matric_wrAddr               ;
    genvar                                  i                               ;
    genvar                                  j                               ;

    reg     [                        8:0]   num_input_cols_cfg              ;
    reg     [                        8:0]   num_input_rows_cfg              ;
    reg     [                        8:0]   pfb_full_count_cfg              ; 
    reg     [                        7:0]   kernel_full_count_cfg           ;
    reg     [                        6:0]   kernel_group_cfg                ;
    reg                                     relu_config                     ;
    
    wire                                    pix_seq_bram_rden               ;
    reg     [                        8:0]   pix_seq_bram_wrAddr             ;
    wire    [                       11:0]   pix_seq_bram_rdAddr             ;
    wire    [                       15:0]   pix_seq_bram_dout               ;

    reg                                     kernel_config_valid             ;
    reg                                     config_mode                     ;      
    
    wire   [                         2:0]   cycle_counter                   ;
    wire   [              `NUM_AWE - 1:0]   ce0_pixel_dataout_valid         ;
    wire   [              `NUM_AWE - 1:0]   ce1_pixel_dataout_valid         ;
    
    wire   [              C_NUM_CE - 1:0]   next_kernel                     ;  
    wire   [              C_NUM_CE - 1:0]   last_kernel                     ;
    
    wire   [                         3:0]   quad_wht_ctrl_state             ;
    wire   [                         4:0]   state                           ;
  
    wire   [                         3:0]   ce0_wht_seq_addr                ;
    wire   [                         3:0]   ce1_wht_seq_addr                ;
    wire   [      C_WHT_DOUT_WIDTH - 1:0]   wht_table_dout                  ;
    wire   [              C_NUM_CE - 1:0]   wht_table_dout_valid            ;
    wire                                    wht_config_wren                 ;
    wire   [          C_RELU_WIDTH - 1:0]   relu_out                        ;
    integer                                 idx                             ;


    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    pixel_sequence_data_bram
    i0_pixel_sequence_data_bram (
        .clka     ( clk_if                              ),
        .wea      ( config_accept[0] && config_valid[0] ),
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
                prefetch_buffer_fifo
                i0_prefetch_buffer_fifo (
                  .wr_clk           ( clk_if                                                                        ),
                  .rd_clk           ( clk_core                                                                      ),
                  .din              ( pixel_data[(((i * `NUM_CE_PER_AWE) + j) * `PIXEL_WIDTH) +: `PIXEL_WIDTH]      ),
                  .wr_en            ( pfb_wren                                                                      ),
                  .rd_en            ( pfb_rden                                                                      ),
                  .dout             ( pfb_dataout[(((i * `NUM_CE_PER_AWE) + j) * `PIXEL_WIDTH) +: `PIXEL_WIDTH]     ),
                  .full             (                                                                               ),
                  .empty            ( pfb_empty[(((i * `NUM_CE_PER_AWE) + j) * 1) +: 1]                             )
                );
                

                cnn_layer_accel_weight_table_top #(
                    .C_CE_WHT_SEQ_ADDR_DELAY   ( ((i * `NUM_CE_PER_AWE + j) + 3) )
                )
                i0_cnn_layer_accel_weight_table_top (
                    .clk                        ( clk_core                                                                                                      ),
                    .rst                        ( rst                                                                                                           ),
                    .config_mode                ( config_mode                                                                                                   ),
                    .job_accept                 ( job_accept_w                                                                                                  ),
                    .next_kernel                ( next_kernel[(((i * `NUM_CE_PER_AWE) + j) * 1) +: 1]                                                           ),
                    .last_kernel                ( last_kernel[(((i * `NUM_CE_PER_AWE) + j) * 1) +: 1]                                                           ),
                    .kernel_config_valid        ( config_valid[1]                                                                                               ),
                    .kernel_full_count          ( config_data[(((i * `NUM_CE_PER_AWE) + j) * 16) +: 16]                                                         ), 
                    .wht_config_wren            ( wht_config_wren                                                                                               ),
                    .wht_config_data            ( weight_data[(((i * `NUM_CE_PER_AWE) + j) * `WEIGHT_WIDTH) +: `WEIGHT_WIDTH]                                   ),
                    .ce0_wht_seq_addr           ( ce0_wht_seq_addr                                                                                              ),
                    .ce1_wht_seq_addr           ( ce1_wht_seq_addr                                                                                              ),
                    .ce_execute                 ( ce_execute[(((i * `NUM_CE_PER_AWE) + j) * 1) +: 1]                                                            ),
                    .ce_cycle_counter           ( ce_cycle_counter[(((i * `NUM_CE_PER_AWE) + j) * 3) +: 3]                                                      ),
                    .ce0_wht_table_dout         ( wht_table_dout[((((i * `NUM_CE_PER_AWE) + j) * `NUM_DSP_PER_ENG + 0) * `WEIGHT_WIDTH) +: `WEIGHT_WIDTH]       ),
                    .ce1_wht_table_dout         ( wht_table_dout[((((i * `NUM_CE_PER_AWE) + j) * `NUM_DSP_PER_ENG + 1) * `WEIGHT_WIDTH) +: `WEIGHT_WIDTH]       ),
                    .ce_wht_table_dout_valid    ( wht_table_dout_valid[(((i * `NUM_CE_PER_AWE) + j) * 1) +: 1]                                                  )
                );   

                assign relu_out[(((i * `NUM_CE_PER_AWE) + j) * `PIXEL_WIDTH) +: `PIXEL_WIDTH] 
                    = pfb_dataout[((((i * `NUM_CE_PER_AWE) + j) * `PIXEL_WIDTH) + (`PIXEL_WIDTH - 1)) +: 1] ? {`PIXEL_WIDTH{1'b0}} : pfb_dataout[(((i * `NUM_CE_PER_AWE) + 0) * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end

            
            cnn_layer_accel_awe_rowbuffers #(
                .C_SEQ_DATAIN_DELAY             ( (i * 2)                          ),
                .C_CE0_ROW_MATRIC_DELAY         ( (i * `NUM_CE_PER_AWE + 3)        ),      
                .C_CE1_ROW_MATRIC_DELAY         ( (i * `NUM_CE_PER_AWE + 4)        ),
                .C_CE0_ROW_MAT_WR_ADDR_DELAY    ( (i * `NUM_CE_PER_AWE + 4)        ),
                .C_CE1_ROW_MAT_WR_ADDR_DELAY    ( (i * `NUM_CE_PER_AWE + 5)        ),
                .C_CE0_ROW_MAT_PX_DIN_DELAY     ( (i * `NUM_CE_PER_AWE + 2)        ), 
                .C_CE1_ROW_MAT_PX_DIN_DELAY     ( (i * `NUM_CE_PER_AWE + 3)        )       
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
                .last_kernel                ( last_kernel[(C_NUM_CE - 1) +: 1]                                                                  ),
                .row_matric                 ( pix_seq_bram_dout[`PIX_SEQ_DATA_ROW_MATRIC_FIELD]                                                 ),
                .ce0_pixel_datain           ( ce0_pixel_datain[(i * `PIXEL_WIDTH) +: `PIXEL_WIDTH]                                              ),
                .ce1_pixel_datain           ( ce1_pixel_datain[(i * `PIXEL_WIDTH) +: `PIXEL_WIDTH]                                              ),
                .ce0_execute                ( ce_execute[(((i * `NUM_CE_PER_AWE) + 0) * 1) +: 1]                                                ),
                .ce1_execute                ( ce_execute[(((i * `NUM_CE_PER_AWE) + 1) * 1) +: 1]                                                ),
                .ce0_pixel_dataout          ( ce0_pixel_dataout[(i * (`PIXEL_WIDTH * `NUM_CE_PER_AWE)) +: (`PIXEL_WIDTH * `NUM_CE_PER_AWE)]     ),
                .ce1_pixel_dataout          ( ce1_pixel_dataout[(i * (`PIXEL_WIDTH * `NUM_CE_PER_AWE)) +: (`PIXEL_WIDTH * `NUM_CE_PER_AWE)]     ),
                .ce0_cycle_counter          ( ce_cycle_counter[(((i * `NUM_CE_PER_AWE) + 0) * 3) +: 3]                                          ),
                .ce1_cycle_counter          ( ce_cycle_counter[(((i * `NUM_CE_PER_AWE) + 1) * 3) +: 3]                                          ),                               
                .row_matric_wrAddr          ( row_matric_wrAddr                                                                                 ),
                .ce0_pixel_dataout_valid    ( ce0_pixel_dataout_valid[i +: 1]                                                                   ),
                .ce1_pixel_dataout_valid    ( ce1_pixel_dataout_valid[i +: 1]                                                                   )        
            );
           
          
            assign ce0_pixel_datain[(i * `PIXEL_WIDTH) +: `PIXEL_WIDTH] 
                = (relu_config) ? relu_out[(((i * `NUM_CE_PER_AWE) + 0) * `PIXEL_WIDTH) +: `PIXEL_WIDTH] : pfb_dataout[(((i * `NUM_CE_PER_AWE) + 0) * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            assign ce1_pixel_datain[(i * `PIXEL_WIDTH) +: `PIXEL_WIDTH] 
                = (relu_config) ? relu_out[(((i * `NUM_CE_PER_AWE) + 1) * `PIXEL_WIDTH) +: `PIXEL_WIDTH] : pfb_dataout[(((i * `NUM_CE_PER_AWE) + 1) * `PIXEL_WIDTH) +: `PIXEL_WIDTH];

        end
    endgenerate
    
    
    cnn_layer_accel_quad_bram_ctrl
    i0_cnn_layer_accel_quad_bram_ctrl (
        .clk                        ( clk_core                                              ),
        .rst                        ( rst                                                   ),
        .job_start                  ( job_start                                             ),
        .job_accept                 ( job_accept_w                                          ),
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
        .cycle_counter              ( cycle_counter                                         ),
        .pix_seq_bram_rden          ( pix_seq_bram_rden                                     ),
        .pix_seq_bram_rdAddr        ( pix_seq_bram_rdAddr                                   ),
        .next_kernel                ( next_kernel                                           ),
        .last_kernel                ( last_kernel[(C_NUM_CE - 1) +: 1]                      )
    );
    
    
    cnn_layer_accel_weight_sequence_table0
    i0_cnn_layer_accel_weight_sequence_table0 (
        .clk                ( clk_core              ),
        .rst                ( rst                   ),
        .gray_code          ( gray_code             ),
        .seq_data_addr      ( cycle_counter         ),
        .wht_data_addr      ( ce0_wht_seq_addr      )
    );

    
    cnn_layer_accel_weight_sequence_table1
    i0_cnn_layer_accel_weight_sequence_table1 (
        .clk                ( clk_core              ),
        .rst                ( rst                   ),
        .gray_code          ( gray_code             ),
        .seq_data_addr      ( cycle_counter         ),
        .wht_data_addr      ( ce1_wht_seq_addr      )
    );

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    assign wht_config_wren  = weight_ready && weight_valid;
    assign weight_ready     = weight_valid;
    assign config_mode      = state[0];
    
    always@(posedge clk_core) begin
        if(rst) begin
            num_input_cols_cfg      <= 0;
            num_input_rows_cfg      <= 0;
            pfb_full_count_cfg      <= 0;
            kernel_full_count_cfg   <= 0;
            kernel_group_cfg        <= 0;
            relu_config             <= 0;
            config_accept[1]        <= 0;
        end else begin
            config_accept[1]        <= 0;
            if(config_valid[1]) begin
                config_accept[1]    <= 1;
            end
        end
    end
    // END Logic ------------------------------------------------------------------------------------------------------------------------------------

 
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------     
    assign job_accept = |job_accept_r;

    always@(*) begin
        job_accept_r[0] = job_accept_w;
    end
    
    always@(posedge clk_core) begin
        if(rst) begin
            for(idx = 1; idx < 5; idx = idx + 1) begin
                job_accept_r[idx] <= 0;
            end              
        end else begin
            for(idx = 1; idx < 5; idx = idx + 1) begin
                job_accept_r[idx] <= job_accept_r[idx - 1];
            end
        end
    end
    // END Logic ------------------------------------------------------------------------------------------------------------------------------------
    
  
    // BEGIN Network Output Data Logic --------------------------------------------------------------------------------------------------------------
    assign pixel_ready  = pixel_valid && job_fetch_in_progress;
    assign pfb_wren     = pixel_valid && pixel_ready;

    always@(posedge clk_if) begin
        if(rst) begin
            config_accept[0]            <= 0;
            pix_seq_bram_wrAddr         <= 0;
        end else begin
            config_accept[0]            <= 0;           
            // Pixel Sequence Data
            if(config_valid[0]) begin
                config_accept[0]   <= 1;
            end
            if(config_accept[0] && config_valid[0]) begin
                pix_seq_bram_wrAddr <= pix_seq_bram_wrAddr + 1;
            end
            
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
            ST_JOB_DONE:                state_s = "ST_JOB_DONE";
        endcase
    end
`endif
    
endmodule
