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
    parameter C_NUM_AWE         = 4,
    parameter C_NUM_CE_PER_AWE  = 2,
    parameter C_PIXEL_WIDTH     = 18,
    parameter C_BRAM_DEPTH      = 1024,
    parameter C_SEQ_DATA_WIDTH  = 16
) (
    network_clk,
    network_rst,
    clk_500MHz,
    accel_rst,
    pixel_datain_valid,
    weight_wren,       
    config_wren,       
    datain,
    seq_rden,
    seq_datain,
    dataout_valid,
    dataout
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
    localparam C_PIXEL_DATAOUT_WIDTH    = C_NUM_AWE * C_PIXEL_WIDTH * `DSP_PER_AWE;
    localparam C_SEQ_DATA_DEPTH         = ((C_BRAM_DEPTH / 2) * 5);
    localparam C_LOG2_SEQ_DATA_DEPTH    = clog2((C_BRAM_DEPTH / 2) * 5);
    localparam C_NUM_PFB                = C_NUM_CE_PER_AWE * C_NUM_AWE;
    localparam C_PIXEL_DOUT_WIDTH       = C_NUM_PFB * C_PIXEL_WIDTH;
    localparam C_PFB_DOUT_WIDTH         = C_NUM_PFB * C_PIXEL_WIDTH;
    localparam C_CE_START_WIDTH         = C_NUM_AWE * C_NUM_CE_PER_AWE;
    localparam C_PFB_COUNT_WIDTH        = C_NUM_PFB * 9;

    localparam ST_IDLE_0                = 4'b0001;  
    localparam ST_AWE_CE_PRIM_BUFFER    = 4'b0010;
    localparam ST_WAIT_PFB_LOAD         = 4'b0100;
    localparam ST_AWE_CE_ACTIVE         = 4'b1000;
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input                               network_clk;
    input                               network_rst;
    input                               clk_500MHz;
    input                               accel_rst;
    input                               pixel_datain_valid;
    input                               weight_wren;      
    input                               config_wren;       
    input   [   `PACKET_WIDTH - 1:0]    datain;
    output                              seq_rden;
    input   [C_SEQ_DATA_WIDTH - 1:0]    seq_datain;
    output                              dataout_valid;
    output                              dataout;


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Wires / Regs / Integers
	//-----------------------------------------------------------------------------------------------------------------------------------------------    
    wire                                     row_matric;
    wire    [                        1:0]    gray_code;

    wire    [C_PIXEL_DATAOUT_WIDTH - 1:0]    pixel_dataout;
    wire                                     pixel_dataout_valid;
 
    wire                                     pfb_wren;     
    wire                                     pfb_rden;
    wire    [     C_PFB_DOUT_WIDTH - 1:0]    pfb_dataout;

    wire    [   C_PIXEL_DOUT_WIDTH - 1:0]    pixel_dataout;
    wire    [            C_NUM_PFB - 1:0]    pfb_dataout_valid;
    wire    [            C_NUM_PFB - 1:0]    pfb_empty;
    wire    [    C_PFB_COUNT_WIDTH - 1:0]    pfb_count;
    wire                                     pixel_dataout_valid;

    wire    [                        5:0]    cycle_counter;
    reg                                      start;
    wire    [                        3:0]    state;
    wire    [     C_CE_START_WIDTH - 1:0]    ce_start;
    wire    [    C_LOG2_BRAM_DEPTH - 2:0]    input_row; 
    wire    [    C_LOG2_BRAM_DEPTH - 2:0]    input_col; 
    wire    [    C_LOG2_BRAM_DEPTH - 2:0]    wrAddr;
    genvar                                   i;
    genvar                                   j;

    reg     [         15:0]                  num_input_cols_cfg;  
    reg     [         15:0]                  num_input_rows_cfg;  
    reg     [         15:0]                  input_depth_cfg;     
    reg     [         15:0]                  num_kernels_cfg;     
    reg     [         15:0]                  kernel_size_cfg;     
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------    
    generate
        for(i = 0; i < C_NUM_AWE; i = i + 1) begin
            for(j = 0; j < C_NUM_CE_PER_AWE; j = j + 1) begin
                // Prefetch Buffer FIFO Specs
                // Write Width: 16 bits
                // Write Depth: 512
                // Read Width:  16 bits
                // Read Depth:  512                
                xilinx_async_fwft_fifo_count
                i0_preftechBuffer (
                  .rst              ( accel_rst                                                                     ),
                  .wr_clk           ( network_clk                                                                   ),
                  .rd_clk           ( clk_500MHz                                                                    ),
                  .din              ( datain[(((i * C_NUM_CE_PER_AWE) + j) * C_PIXEL_WIDTH) +: C_PIXEL_WIDTH]       ),
                  .wr_en            ( pfb_wren                                                                      ),
                  .rd_en            ( pfb_rden                                                                      ),
                  .dout             ( pfb_dataout[(((i * C_NUM_CE_PER_AWE) + j) * C_PIXEL_WIDTH) +: C_PIXEL_WIDTH]  ),
                  .full             (                                                                               ),
                  .empty            ( pfb_empty[(((i * C_NUM_CE_PER_AWE) + j) * 1) +: 1]                            ),
                  .valid            ( pfb_dataout_valid[(((i * C_NUM_CE_PER_AWE) + j) * 1) +: 1]                    ),
                  .rd_data_count    ( pfb_count[(((i * C_NUM_CE_PER_AWE) + j) * 9) +: 9]                            )
                );
            end

            
            cnn_layer_accel_awe_rowbuffers #(
               .C_PIXEL_WIDTH  ( C_PIXEL_WIDTH  ),
               .C_BRAM_DEPTH   ( C_BRAM_DEPTH   )
            ) 
            i0_cnn_layer_accel_awe_rowbuffers (
                .clk_500MHz                 ( clk_500MHz                                                                        ),
                .accel_rst                  ( accel_rst                                                                         ),
                .input_row                  ( input_row                                                                         ),
                .input_col                  ( input_col                                                                         ),
                .num_input_cols             ( num_input_cols_cfg                                                                ),
                .state                      ( state                                                                             ),
                .gray_code                  ( gray_code                                                                         ),
                .seq_datain                 ( seq_dataout                                                                       ),
                .row_matric                 ( row_matric                                                                        ),
                .pfb_rden                   ( pfb_rden                                                                          ),
                .cycle_counter              ( cycle_counter                                                                     ),
                .pixel_datain_ce0           ( pfb_dataout[(((i * C_NUM_CE_PER_AWE) + 0) * C_PIXEL_WIDTH) +: C_PIXEL_WIDTH]      ),
                .pixel_datain_ce1           ( pfb_dataout[(((i * C_NUM_CE_PER_AWE) + 1) * C_PIXEL_WIDTH) +: C_PIXEL_WIDTH]      ),
                .ce0_start                  ( ce_start[(((i * C_NUM_CE_PER_AWE) + 0) * 1) +: 1]                                 ),
                .ce1_start                  ( ce_start[(((i * C_NUM_CE_PER_AWE) + 1) * 1) +: 1]                                 ),
                .ce0_pixel_dataout          ( pixel_dataout[(((i * C_NUM_CE_PER_AWE) + 0) * C_PIXEL_WIDTH) +: C_PIXEL_WIDTH]    ),
                .ce1_pixel_dataout          ( pixel_dataout[(((i * C_NUM_CE_PER_AWE) + 1) * C_PIXEL_WIDTH) +: C_PIXEL_WIDTH]    ),
                .wrAddr                     ( wrAddr                                                                            )
            );
        end
    endgenerate
    
    
    cnn_layer_accel_octo_bram_ctrl #(
        .C_NUM_AWE          ( C_NUM_AWE     ),
        .C_NUM_CE_PER_AWE   (
        .C_BRAM_DEPTH       ( C_BRAM_DEPTH  )
    )
    i0_cnn_layer_accel_octo_bram_ctrl (
        .clk_500MHz             ( clk_500MHz                                ),
        .accel_rst              ( accel_rst                                 ),
        .pixel_datain_valid     ( pixel_datain_valid                        ),
        .start                  ( start                                     ),
        .state                  ( state                                     ),
        .input_row              ( input_row                                 ),
        .input_col              ( input_col                                 ),
        .num_input_cols         ( num_input_cols_cfg                        ),
        .num_input_rows         ( num_input_rows_cfg                        ),
        .input_depth            ( input_depth_cfg                           ),
        .row_matric             ( row_matric                                ),
        .gray_code              ( gray_code                                 ),
        .cycle_counter          ( cycle_counter                             ),
        .pfb_empty              ( pfb_empty[(0 * C_NUM_PFB) +: 1]           ),
        .pfb_count              ( pfb_count[(0 * C_NUM_PFB) +: 18]          ),                    
        .pfb_wren               ( pfb_wren                                  ),
        .pfb_rden               ( pfb_rden                                  ),
        .pfb_dataout_valid      ( pfb_dataout_valid[(0 * C_NUM_PFB) +: 1]   ),
        .wrAddr                 ( wrAddr                                    ),
        .ce_start               ( ce_start                                  ),
        .pixel_dataout_valid    ( pixel_dataout_valid                       )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES( 2 )
    ) 
    i1_SRL_bit (
        .clk        ( clk_500MHz                                ),
        .rst        ( accel_rst                                 ),
        .ce         ( 1'b1                                      ),
        .data_in    ( seq_dataout[`SEQ_DATA_ROW_MATRIC_FIELD]   ),
        .data_out   ( row_matric                                )
    );    


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign seq_rden = (state == ST_AWE_CE_ACTIVE);
  
    //always@(*) begin
    //    if(config_wren) begin
    //        num_input_cols_cfg  = datain[];  
    //        num_input_rows_cfg  = datain[];
    //        input_depth_cfg     = datain[];
    //        num_kernels_cfg     = datain[];
    //        kernel_size_cfg     = datain[];
    //    end
    //    start    = datain[];
    //end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


`ifdef SIMULATION
    string state_s;
    always@(state) begin 
        case(state) 
                ST_IDLE_0:                  state_s = "ST_IDLE";              
                ST_AWE_CE_PRIM_BUFFER:      state_s = "ST_AWE_CE_PRIM_BUFFER";
                ST_WAIT_PFB_LOAD:           state_s = "ST_LOAD_PFB";           
                ST_AWE_CE_ACTIVE:           state_s = "ST_AWE_CE_ACTIVE";
        endcase
    end
`endif
    
endmodule
