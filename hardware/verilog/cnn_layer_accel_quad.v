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
module cnn_layer_accel_quad #(
    parameter C_PIXEL_WIDTH     = 16        ,
    parameter C_NUM_AWE         = 4         ,
    parameter C_NUM_CE_PER_AWE  = 2         ,
    parameter C_BRAM_DEPTH      = 1024      ,
    parameter C_SEQ_DATA_WIDTH  = 16
) (
    clk_if                  ,
    clk_core                ,
    rst                     ,

    job_start               ,    // Asserted by main SM to request a new convolution/pool operation
    job_accept              ,    // Asserted by quad to accept the job request
    job_accept_ack          ,
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
    localparam C_LOG2_BRAM_DEPTH        = clog2(C_BRAM_DEPTH);
    localparam C_PIXEL_DATAOUT_WIDTH    = C_NUM_AWE * C_PIXEL_WIDTH;
    localparam C_NUM_PFB                = C_NUM_CE_PER_AWE * C_NUM_AWE;
    localparam C_PIXEL_DOUT_WIDTH       = C_NUM_PFB * C_PIXEL_WIDTH;
    localparam C_PFB_DOUT_WIDTH         = C_NUM_PFB * C_PIXEL_WIDTH;
    localparam C_CE_START_WIDTH         = C_NUM_AWE * C_NUM_CE_PER_AWE;
    localparam C_PFB_COUNT_WIDTH        = C_NUM_PFB * 10;

    localparam ST_IDLE_0                = 5'b00001;  
    localparam ST_AWE_CE_PRIM_BUFFER    = 5'b00010;
    localparam ST_WAIT_PFB_LOAD         = 5'b00100;
    localparam ST_AWE_CE_ACTIVE         = 5'b01000;
    localparam ST_JOB_DONE              = 5'b10000;
 
    localparam ST_IDLE_1                = 2'b01;
    localparam ST_ROW_REQUEST           = 2'b10;
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input               clk_if              ;
    input               clk_core            ;
    input               rst                 ;
    
    input               job_start           ;
    output              job_accept          ;
    input               job_accept_ack      ;
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
    wire                                    row_matric                  ;
    wire    [                        1:0]   gray_code                   ;

    wire    [C_PIXEL_DATAOUT_WIDTH - 1:0]   ce0_pixel_dataout           ;
    wire    [C_PIXEL_DATAOUT_WIDTH - 1:0]   ce1_pixel_dataout           ;

    wire                                    pfb_wren                    ;
    wire                                    pfb_rden                    ;
    wire                                    pfb_rden_d                  ;
    wire    [     C_PFB_DOUT_WIDTH - 1:0]   pfb_dataout                 ;
    wire    [            C_NUM_PFB - 1:0]   pfb_empty                   ;
    reg     [                        8:0]   pfb_count                   ;

    wire    [                        5:0]   cycle_counter               ;
    wire    [                        4:0]   state_0                     ;
    wire    [                        1:0]   state_1                     ;
    wire    [     C_CE_START_WIDTH - 1:0]   ce_start                    ;
    wire    [    C_LOG2_BRAM_DEPTH - 2:0]   input_row                   ;
    wire    [    C_LOG2_BRAM_DEPTH - 2:0]   input_col                   ;
    wire    [    C_LOG2_BRAM_DEPTH - 2:0]   wrAddr                      ;
    genvar                                  i                           ;
    genvar                                  j                           ;

    reg     [          8:0]                 num_input_cols_cfg          ;
    reg     [          8:0]                 num_input_rows_cfg          ;
    reg     [          8:0]                 pfb_full_count_cfg          ;
    reg     [         15:0]                 num_kernels_cfg             ;
    reg     [         15:0]                 kernel_size_cfg             ;

    reg                                     last_kernel                 ;
    reg                                     next_row                    ;

    reg [ 8:0]                              seq_wrAddr                  ;
    wire                                    seq_rden                    ;
    reg [11:0]                              seq_rdAddr                  ;
    wire [15:0]                             seq_dataout                 ; 

    reg                                     config_wren                 ;      
    reg                                     weight_wren                 ;
    
    wire   [ C_NUM_AWE - 1:0]               ce0_pixel_dataout_valid     ;
    wire   [ C_NUM_AWE - 1:0]               ce1_pixel_dataout_valid     ;
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    // Sequence BRAM Specs
    // Write Width: 128 bits
    // Write Depth: 512
    // Read Width:  16 bits
    // Read Depth:  4096
    sequence_data_bram
    i0_sequence_data_bram (
        .clka     ( clk_if                              ),
        .wea      ( config_accept[0] && config_valid    ),
        .addra    ( seq_wrAddr                          ),    
        .dina     ( config_data                         ),
        .clkb     ( clk_core                            ),
        .enb      ( seq_rden                            ),
        .addrb    ( seq_rdAddr                          ),
        .doutb    ( seq_dataout                         )
    );
    
    
    generate
        for(i = 0; i < C_NUM_AWE; i = i + 1) begin
            for(j = 0; j < C_NUM_CE_PER_AWE; j = j + 1) begin
                // Prefetch Buffer FIFO Specs
                // Write Width: 16 bits
                // Write Depth: 512
                // Read Width:  16 bits
                // Read Depth:  512                
                prefetch_buffer_fifo
                i0_prefetch_buffer_fifo (
                  .wr_clk           ( clk_if                                                                        ),
                  .rd_clk           ( clk_core                                                                      ),
                  .din              ( pixel_data[(((i * C_NUM_CE_PER_AWE) + j) * C_PIXEL_WIDTH) +: C_PIXEL_WIDTH]   ),
                  .wr_en            ( pfb_wren                                                                      ),
                  .rd_en            ( pfb_rden                                                                      ),
                  .dout             ( pfb_dataout[(((i * C_NUM_CE_PER_AWE) + j) * C_PIXEL_WIDTH) +: C_PIXEL_WIDTH]  ),
                  .full             (                                                                               ),
                  .empty            ( pfb_empty[(((i * C_NUM_CE_PER_AWE) + j) * 1) +: 1]                            ),
                  .valid            (                                                                               ),
                  .rd_data_count    (                                                                               )
                );
            end

            
            cnn_layer_accel_awe_rowbuffers #(
                .C_PIXEL_WIDTH              ( C_PIXEL_WIDTH                     ),
                .C_BRAM_DEPTH               ( C_BRAM_DEPTH                      ),
                .C_SEQ_DATA_WIDTH           ( C_SEQ_DATA_WIDTH                  ),
                .C_CE0_ROW_MATRIC_DELAY     ( (i * C_NUM_CE_PER_AWE + 1)        ),      
                .C_CE1_ROW_MATRIC_DELAY     ( (i * C_NUM_CE_PER_AWE + 2)        ) 
            ) 
            i0_cnn_layer_accel_awe_rowbuffers (
                .clk                        ( clk_core                                                                          ),
                .rst                        ( rst                                                                               ),
                .input_row                  ( input_row                                                                         ),
                .input_col                  ( input_col                                                                         ),
                .num_input_cols             ( num_input_cols_cfg                                                                ),
                .state                      ( state_0                                                                           ),
                .gray_code                  ( gray_code                                                                         ),
                .seq_datain                 ( seq_dataout                                                                       ),              
                .pfb_rden                   ( pfb_rden                                                                          ),
                .last_kernel                ( last_kernel                                                                       ),
                .row_matric                 ( seq_dataout[`SEQ_DATA_ROW_MATRIC_FIELD]                                           ),
                .ce0_pixel_datain           ( pfb_dataout[(((i * C_NUM_CE_PER_AWE) + 0) * C_PIXEL_WIDTH) +: C_PIXEL_WIDTH]      ),
                .ce1_pixel_datain           ( pfb_dataout[(((i * C_NUM_CE_PER_AWE) + 1) * C_PIXEL_WIDTH) +: C_PIXEL_WIDTH]      ),
                .ce0_start                  ( ce_start[(((i * C_NUM_CE_PER_AWE) + 0) * 1) +: 1]                                 ),
                .ce1_start                  ( ce_start[(((i * C_NUM_CE_PER_AWE) + 1) * 1) +: 1]                                 ),
                .ce0_pixel_dataout          ( ce0_pixel_dataout[(i * C_PIXEL_WIDTH) +: C_PIXEL_WIDTH]                           ),
                .ce1_pixel_dataout          ( ce1_pixel_dataout[(i * C_PIXEL_WIDTH) +: C_PIXEL_WIDTH]                           ),
                .wrAddr                     ( wrAddr                                                                            ),
                .ce0_pixel_dataout_valid    ( ce0_pixel_dataout_valid[i +: 1]                                                   ),
                .ce1_pixel_dataout_valid    ( ce1_pixel_dataout_valid[i +: 1]                                                   )        
            );
        end
    endgenerate
    
    
    cnn_layer_accel_quad_bram_ctrl #(       
        .C_NUM_AWE          ( C_NUM_AWE         ),
        .C_NUM_CE_PER_AWE   ( C_NUM_CE_PER_AWE  ),
        .C_BRAM_DEPTH       ( C_BRAM_DEPTH      ),    
        .C_SEQ_DATA_WIDTH   ( C_SEQ_DATA_WIDTH  )  
    )
    i0_cnn_layer_accel_quad_bram_ctrl (
        .clk                    ( clk_core                                  ),
        .rst                    ( rst                                       ),
        .job_start              ( job_start                                 ),
        .job_accept             ( job_accept                                ),
        .job_fetch_request      ( job_fetch_request                         ),
        .job_fetch_ack          ( job_fetch_ack                             ),
        .job_fetch_complete     ( job_fetch_complete                        ),
        .job_complete           ( job_complete                              ),
        .job_complete_ack       ( job_complete_ack                          ),
        .state_0                ( state_0                                   ),
        .state_1                ( state_1                                   ),
        .input_row              ( input_row                                 ),
        .input_col              ( input_col                                 ),
        .num_input_cols         ( num_input_cols_cfg                        ),
        .num_input_rows         ( num_input_rows_cfg                        ),
        .row_matric             ( seq_dataout[`SEQ_DATA_ROW_MATRIC_FIELD]   ),
        .gray_code              ( gray_code                                 ),
        .pfb_empty              ( pfb_empty[0 +: 1]                         ),
        .pfb_rden               ( pfb_rden                                  ),
        .pfb_full_count         ( pfb_full_count_cfg                        ),
        .wrAddr                 ( wrAddr                                    ),
        .ce_start               ( ce_start                                  ),
        .seq_rden               ( seq_rden                                  ),
        .last_kernel            ( last_kernel                               ),
        .next_row               ( next_row                                  ),
        .pixel_valid            ( pixel_valid                               ),
        .pixel_ready            ( pixel_ready                               )
    );

   
    // BEGIN Network Output Data Logic --------------------------------------------------------------------------------------------------------------
    assign pixel_ready  = pixel_valid && (state_1 == ST_ROW_REQUEST);
    assign pfb_wren     = pixel_valid && pixel_ready;

    always@(posedge clk_if) begin
        if(rst) begin
            config_accept   <= 0;
            seq_wrAddr      <= 0;
        end else begin
            config_accept    <= 0;
            if(config_valid) begin
                config_accept[0]   <= 1;
            end
            if(config_accept[0] && config_valid) begin
                seq_wrAddr <= seq_wrAddr + 1;
            end
        end
    end
   
    always@(posedge clk_core) begin
        if(rst) begin
            seq_rdAddr <= 0;
        end else begin
            if(seq_rden) begin
                seq_rdAddr <= seq_rdAddr + 1;
            end           
        end
    end
    // END Network Output Data Logic ----------------------------------------------------------------------------------------------------------------


`ifdef SIMULATION
    string state_0_s;
    always@(state_0) begin 
        case(state_0) 
            ST_IDLE_0:                  state_0_s = "ST_IDLE_0";              
            ST_AWE_CE_PRIM_BUFFER:      state_0_s = "ST_AWE_CE_PRIM_BUFFER";
            ST_WAIT_PFB_LOAD:           state_0_s = "ST_WAIT_PFB_LOAD";           
            ST_AWE_CE_ACTIVE:           state_0_s = "ST_AWE_CE_ACTIVE";
            ST_JOB_DONE:                state_0_s = "ST_JOB_DONE";
        endcase
    end
    
    string state_1_s;
    always@(state_1) begin
        case(state_1)
            ST_IDLE_1:                  state_1_s = "ST_IDLE_1";             
            ST_ROW_REQUEST:             state_1_s = "ST_ROW_REQUEST";
        endcase
	end
`endif
    
endmodule
