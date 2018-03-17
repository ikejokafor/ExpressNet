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
// Additional Comments:     Each BRAM is 18x1024 bits, 
//                          rmp => row matriculation pointer
//                          irp => incoming row pointer
//                          ce  => convolution engine
//                          awe => adaptive window engine
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_octo #(
    parameter C_NUM_AWE         = 1,
    parameter C_PIXEL_WIDTH     = 18,
    parameter C_BRAM_DEPTH      = 1024,
    parameter C_SEQ_DATA_WIDTH  = 13
) (
    clk,
    rst,
    pixel_datain_tag,
    pixel_datain_rdy,
    seq_datain_tag,
    seq_datain_rdy,
    datain,
    datain_valid
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
    localparam C_PIXEL_DATAOUT_WIDTH    = C_PIXEL_WIDTH * 4;
    localparam C_SEQ_DATA_DEPTH         = ((C_BRAM_DEPTH / 2) * 5);
    localparam C_LOG2_SEQ_DATA_DEPTH    = clog2((C_BRAM_DEPTH / 2) * 5);
    
    localparam ST_AWE_CE_PRIM_BUFFER_0  = 6'b000100;
    localparam ST_AWE_CE_PRIM_BUFFER_1  = 6'b001000;

    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input                               clk;
    input                               rst;
    input                               pixel_datain_tag;
    output                              pixel_datain_rdy;
    input                               seq_datain_tag;
    output                              seq_datain_rdy;
    input   [C_PIXEL_WIDTH - 1:0]       datain;
    input                               datain_valid;


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Wires / Regs / Integers
	//-----------------------------------------------------------------------------------------------------------------------------------------------    
    wire                                        row_matric;
    
    wire    [   C_LOG2_SEQ_DATA_DEPTH - 1:0]    bram_ctrl_seq_wrAddr;
    wire    [   C_LOG2_SEQ_DATA_DEPTH - 1:0]    bram_ctrl_seq_rdAddr;
    wire                                        bram_ctrl_seq_wren;
    wire                                        bram_ctrL_seq_rden;
    wire    [                           1:0]    bram_ctrl_gray_code;
    wire    [        C_SEQ_DATA_WIDTH - 1:0]    seq_dataout;
    wire    [       C_LOG2_SEQ_DATA_DEPTH:0]    seq_count;   

    wire    [   C_PIXEL_DATAOUT_WIDTH - 1:0]    pixel_dataout;
    wire                                        pixel_dataout_valid;
 
    wire                                        bram_ctrl_pfb_wren;     
    wire                                        bram_ctrl_pfb_rden;
    wire                                        bram_ctrl_pfb_rden_d;
    wire    [           C_PIXEL_WIDTH - 1:0]    pfb_dataout;
    wire                                        pfb_rden;
    wire    [                          17:0]    pfb_count;

    wire    [                           5:0]    cycle_counter;
    reg                                         new_map;
    wire    [                           5:0]    bram_ctrl_state;
    wire    [       C_LOG2_BRAM_DEPTH - 2:0]    bram_ctrl_row;
    wire    [       C_LOG2_BRAM_DEPTH - 2:0]    bram_ctrl_row_d; 
    wire    [       C_LOG2_BRAM_DEPTH - 2:0]    bram_ctrl_col;
    wire    [       C_LOG2_BRAM_DEPTH - 2:0]    bram_ctrl_col_d;  
    wire    [       C_LOG2_BRAM_DEPTH - 2:0]    bram_ctrl_numRows;        
    wire    [       C_LOG2_BRAM_DEPTH - 2:0]    bram_ctrl_numCols;
    genvar                                      i;
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    xilinx_dual_port_1_clock_ram #(
        .C_RAM_WIDTH    ( C_SEQ_DATA_WIDTH      ),      
        .C_RAM_DEPTH    ( C_SEQ_DATA_DEPTH      ),
        .C_SEQ_ACCESS   ( 1                     )
    ) 
    sequencer (
        .wrAddr     ( bram_ctrl_seq_wrAddr              ),   
        .rdAddr     ( bram_ctrl_seq_rdAddr              ),
        .datain     ( datain[C_SEQ_DATA_WIDTH - 1:0]    ),
        .clk        ( clk                               ),
        .rst        ( rst                               ),
        .wren       ( bram_ctrl_seq_wren                ),
        .rden       ( bram_ctrL_seq_rden                ),
        .dataout    ( seq_dataout                       ),
        .count      ( seq_count                         ),
        .full       (                                   )        
    );
    

    generate
        for(i = 0; i < C_NUM_AWE; i = i + 1) begin
            cnn_layer_accel_awe_rowbuffers #(
               .C_PIXEL_WIDTH  ( C_PIXEL_WIDTH  ),
               .C_BRAM_DEPTH   ( C_BRAM_DEPTH   )
            ) 
            i0_cnn_layer_accel_awe_rowbuffers (
                .clk                        ( clk                       ),
                .rst                        ( rst                       ),
                .row                        ( bram_ctrl_row             ),
                .row_d                      ( bram_ctrl_row_d           ),
                .col                        ( bram_ctrl_col             ),
                .col_d                      ( bram_ctrl_col_d           ),
                .numRows                    ( bram_ctrl_numRows         ),
                .numCols                    ( bram_ctrl_numCols         ),
                .state                      ( bram_ctrl_state           ),
                .gray_code                  ( bram_ctrl_gray_code       ),
                .seq_datain                 ( seq_dataout               ),
                .row_matric                 ( row_matric                ),
                .pfb_rden                   ( bram_ctrl_pfb_rden_d      ),
                .cycle_counter              ( cycle_counter             ),
                .pixel_datain               ( pfb_dataout               ),
                .pixel_datain_valid         ( pixel_datain_tag          ),
                .pixel_dataout              ( pixel_dataout             ),
                .pixel_dataout_valid        ( pixel_dataout_valid       )  
            );

            
            fifo_fwft_prog_full_count #(
                .C_DATA_WIDTH ( C_PIXEL_WIDTH       ), 
                .C_FIFO_DEPTH ( C_BRAM_DEPTH / 2    )
            ) 
            preftechBuffer (
                .clk            ( clk                   ),
                .rst            ( rst                   ),
                .wren           ( bram_ctrl_pfb_wren    ),
                .rden           ( pfb_rden              ),
                .datain         ( datain                ),
                .dataout        ( pfb_dataout           ),
                .empty          (                       ),
                .full           (                       ),
                .prog_full      (                       ),
                .count          ( pfb_count             )
            );
        end
    endgenerate
    
    
    cnn_layer_accel_octo_bram_ctrl #(
        .C_NUM_AWE      ( C_NUM_AWE     ),
        .C_BRAM_DEPTH   ( C_BRAM_DEPTH  )
    )
    i0_cnn_layer_accel_octo_bram_ctrl (
        .clk                    ( clk                   ),
        .rst                    ( rst                   ),
        .datain_valid           ( datain_valid          ),
        .pixel_datain_tag       ( pixel_datain_tag      ),
        .pixel_datain_rdy       ( pixel_datain_rdy      ), 
        .seq_datain_tag         ( seq_datain_tag        ),
        .seq_datain_rdy         ( seq_datain_rdy        ),
        .new_map                ( new_map               ),
        .state                  ( bram_ctrl_state       ),
        .row                    ( bram_ctrl_row         ),
        .row_d                  ( bram_ctrl_row_d       ),
        .col                    ( bram_ctrl_col         ),
        .col_d                  ( bram_ctrl_col_d       ),
        .numRows                ( bram_ctrl_numRows     ),
        .numCols                ( bram_ctrl_numCols     ),   
        .seq_count              ( seq_count             ),         
        .pfb_count              ( pfb_count             ),            
        .row_matric             ( row_matric            ),
        .gray_code              ( bram_ctrl_gray_code   ),
        .cycle_counter          ( cycle_counter         ),
        .pfb_wren               ( bram_ctrl_pfb_wren    ),
        .pfb_rden               ( bram_ctrl_pfb_rden    ),
        .pfb_rden_d             ( bram_ctrl_pfb_rden_d  ),
        .seq_wrAddr             ( bram_ctrl_seq_wrAddr  ),   
        .seq_rdAddr             ( bram_ctrl_seq_rdAddr  ),
        .seq_wren               ( bram_ctrl_seq_wren    ),
        .seq_rden               ( bram_ctrL_seq_rden    )    
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES( 2 )
    ) 
    i1_SRL_bit (
        .clk        ( clk                                       ),
        .rst        ( rst                                       ),
        .ce         ( 1'b1                                      ),
        .data_in    ( seq_dataout[`SEQ_DATA_ROW_MATRIC_FIELD]   ),
        .data_out   ( row_matric                                )
    );    
 
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------         
    assign pfb_rden = (bram_ctrl_state == ST_AWE_CE_PRIM_BUFFER_0 || bram_ctrl_state == ST_AWE_CE_PRIM_BUFFER_1) ? bram_ctrl_pfb_rden_d : bram_ctrl_pfb_rden;
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

    
endmodule
