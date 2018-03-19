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

    localparam ST_IDLE                  = 6'b000001;  
    localparam ST_LOAD_SEQUENCER        = 6'b000010;
    localparam ST_AWE_CE_PRIM_BUFFER    = 6'b000100;
    localparam ST_LOAD_PFB              = 6'b001000;
    localparam ST_AWE_CE_ACTIVE         = 6'b010000;
    localparam ST_FIN_ROW_MATRIC        = 6'b100000;
    
    
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
    wire    [                           1:0]    gray_code;
    
    wire    [   C_LOG2_SEQ_DATA_DEPTH - 1:0]    seq_wrAddr;
    wire    [   C_LOG2_SEQ_DATA_DEPTH - 1:0]    seq_rdAddr;
    wire                                        seq_wren;
    wire                                        seq_rden;
    wire    [        C_SEQ_DATA_WIDTH - 1:0]    seq_dataout;
    wire    [       C_LOG2_SEQ_DATA_DEPTH:0]    seq_count;
    wire                                        seq_count_rst;          
    wire                                        seq_count_set;          
    wire    [       C_LOG2_SEQ_DATA_DEPTH:0]    seq_count_set_value;    
    

    wire    [   C_PIXEL_DATAOUT_WIDTH - 1:0]    pixel_dataout;
    wire                                        pixel_dataout_valid;
 
    wire                                        pfb_wren;     
    wire                                        pfb_rden;
    wire    [           C_PIXEL_WIDTH - 1:0]    pfb_dataout;
    wire                                        pfb_dataout_valid;
    wire    [                          17:0]    pfb_count;
    
    wire    [                           5:0]    cycle_counter;
    reg                                         new_map;
    wire    [                           6:0]    state;
    wire    [       C_LOG2_BRAM_DEPTH - 2:0]    input_row_d; 
    wire    [       C_LOG2_BRAM_DEPTH - 2:0]    input_col;
    wire    [       C_LOG2_BRAM_DEPTH - 2:0]    input_col_d;  
    wire    [       C_LOG2_BRAM_DEPTH - 2:0]    num_input_cols;
    wire                                        row_matric_done; 
    wire    [       C_LOG2_BRAM_DEPTH - 2:0]    wrAddr;
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
        .wrAddr             ( seq_wrAddr                        ),   
        .rdAddr             ( seq_rdAddr                        ),
        .datain             ( datain[C_SEQ_DATA_WIDTH - 1:0]    ),
        .clk                ( clk                               ),
        .rst                ( rst                               ),
        .wren               ( seq_wren                          ),
        .rden               ( seq_rden                          ),
        .dataout            ( seq_dataout                       ),
        .count              ( seq_count                         ),
        .count_rst          ( seq_count_rst                     ),
        .count_set          ( seq_count_set                     ),
        .count_set_value    ( seq_count_set_value               ),         
        .full               (                                   )        
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
                .input_row_d                ( input_row_d               ),
                .input_col                  ( input_col                 ),
                .input_col_d                ( input_col_d               ),
                .num_input_cols             ( num_input_cols            ),
                .state                      ( state                     ),
                .gray_code                  ( gray_code                 ),
                .seq_datain                 ( seq_dataout               ),
                .row_matric                 ( row_matric                ),
                .pfb_rden                   ( pfb_rden                  ),
                .cycle_counter              ( cycle_counter             ),
                .pixel_datain               ( pfb_dataout               ),
                .pixel_datain_valid         ( pixel_datain_tag          ),
                .pixel_dataout              ( pixel_dataout             ),
                .row_matric_done            ( row_matric_done           ),
                .wrAddr                     ( wrAddr                    )
            );

            
            fifo_fwft_prog_full_count_mod #(
                .C_DATA_WIDTH ( C_PIXEL_WIDTH       ), 
                .C_FIFO_DEPTH ( C_BRAM_DEPTH / 2    )
            ) 
            preftechBuffer (
                .clk            ( clk                   ),
                .rst            ( rst                   ),
                .wren           ( pfb_wren              ),
                .rden           ( pfb_rden              ),
                .datain         ( datain                ),
                .dataout        ( pfb_dataout           ),
                .dataout_valid  ( pfb_dataout_valid     ),
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
        .pixel_dataout_valid    ( pixel_dataout_valid   ), 
        .seq_wrAddr             ( seq_wrAddr            ),   
        .seq_rdAddr             ( seq_rdAddr            ),
        .seq_wren               ( seq_wren              ),
        .seq_rden               ( seq_rden              ),         
        .seq_datain_tag         ( seq_datain_tag        ),
        .seq_datain_rdy         ( seq_datain_rdy        ),
        .seq_count              ( seq_count             ), 
        .seq_count_rst          ( seq_count_rst         ),
        .seq_count_set          ( seq_count_set         ),
        .seq_count_set_value    ( seq_count_set_value   ), 
        .new_map                ( new_map               ),
        .state                  ( state                 ),
        .input_row_d            ( input_row_d           ),
        .input_col              ( input_col             ),
        .input_col_d            ( input_col_d           ),
        .num_input_cols         ( num_input_cols        ),   
        .row_matric             ( row_matric            ),
        .gray_code              ( gray_code             ),
        .cycle_counter          ( cycle_counter         ),
        .pfb_count              ( pfb_count             ),                    
        .pfb_wren               ( pfb_wren              ),
        .pfb_rden               ( pfb_rden              ),
        .pfb_dataout_valid      ( pfb_dataout_valid     ),
        .row_matric_done        ( row_matric_done       ),
        .wrAddr                 ( wrAddr                )
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

 
`ifdef SIMULATION
    string state_s;
    always@(state) begin 
        case(state) 
                ST_IDLE:                    state_s = "ST_IDLE";              
                ST_LOAD_SEQUENCER:          state_s = "ST_LOAD_SEQUENCER";     
                ST_AWE_CE_PRIM_BUFFER:      state_s = "ST_AWE_CE_PRIM_BUFFER";
                ST_LOAD_PFB:                state_s = "ST_LOAD_PFB";           
                ST_AWE_CE_ACTIVE:           state_s = "ST_AWE_CE_ACTIVE";
                ST_FIN_ROW_MATRIC:          state_s = "ST_FIN_ROW_MATRIC";
        endcase
    end
`endif	
    
endmodule
