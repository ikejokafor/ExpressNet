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
// Additional Comments:    input dimensions is regular map dimensions plus padded size
//                         
//                         
//                         
//                         
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_octo_bram_ctrl #(
    parameter C_NUM_AWE     = 1,
    parameter C_BRAM_DEPTH  = 1024
) (
    clk,       
    rst,    
    datain_valid,
    pixel_datain_tag,
    pixel_datain_rdy,
    pixel_dataout_valid,
    seq_wrAddr,  
    seq_rdAddr,  
    seq_wren,    
    seq_rden,
    seq_datain_tag,
    seq_datain_rdy,
    seq_count,
    seq_count_rst,        
    seq_count_set,        
    seq_count_set_value, 
    new_map,
    state,  
    input_row_d,
    input_col,
    input_col_d,
    num_input_cols,
    row_matric,
    gray_code,
    cycle_counter,
    pfb_count,     
    pfb_wren, 
    pfb_rden,
    pfb_rden_d,
    row_matric_done
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
    localparam C_LOG2_SEQ_DATA_DEPTH    = clog2((C_BRAM_DEPTH / 2) * 5);

    localparam ST_IDLE                  = 7'b0000001;  
    localparam ST_LOAD_SEQUENCER        = 7'b0000010;
    localparam ST_AWE_CE_PRIM_BUFFER_0  = 7'b0000100;
    localparam ST_AWE_CE_PRIM_BUFFER_1  = 7'b0001000;
    localparam ST_LOAD_PFB              = 7'b0010000;
    localparam ST_AWE_CE_ACTIVE         = 7'b0100000;
    localparam ST_FIN_ROW_MATRIC        = 7'b1000000;
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------   
    input                                       clk;       
    input                                       rst;   
    input                                       datain_valid;
    input                                       pixel_datain_tag;
    output reg                                  pixel_datain_rdy;
    output                                      pixel_dataout_valid;
    output reg [C_LOG2_SEQ_DATA_DEPTH - 1:0]    seq_wrAddr;  
    output reg [C_LOG2_SEQ_DATA_DEPTH - 1:0]    seq_rdAddr;  
    output reg                                  seq_wren;    
    output reg                                  seq_rden;    
    input                                       seq_datain_tag;
    output reg                                  seq_datain_rdy;
    input      [   C_LOG2_SEQ_DATA_DEPTH:0]     seq_count;
    output reg                                  seq_count_rst;        
    output reg                                  seq_count_set;        
    output     [   C_LOG2_SEQ_DATA_DEPTH:0]     seq_count_set_value;     
    input                                       new_map;
    output reg [                       6:0]     state;  
    output     [   C_LOG2_BRAM_DEPTH - 2:0]     input_row_d;
    output reg [   C_LOG2_BRAM_DEPTH - 2:0]     input_col;
    output     [   C_LOG2_BRAM_DEPTH - 2:0]     input_col_d;
    output     [   C_LOG2_BRAM_DEPTH - 2:0]     num_input_cols; 
    input      [                      17:0]     pfb_count; 
    output reg                                  pfb_wren;    
    output reg                                  pfb_rden; 
    output                                      pfb_rden_d;
    input                                       row_matric;
    output     [                       1:0]     gray_code;
    output reg [                       5:0]     cycle_counter;
    output                                      row_matric_done;
	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Wires / Regs / Integers
	//-----------------------------------------------------------------------------------------------------------------------------------------------        
    wire                                    row_matric;
    wire                                    start_count_delay;
    reg     [                       1:0]    gc;
    reg     [   C_LOG2_BRAM_DEPTH - 2:0]    input_row;
    reg     [   C_LOG2_BRAM_DEPTH - 2:0]    output_col;   
    reg     [   C_LOG2_BRAM_DEPTH - 2:0]    output_row;
    reg     [                       8:0]    row_matric_count;
    reg                                     pixel_dataout_valid_r;
    reg     [   C_LOG2_BRAM_DEPTH - 2:0]    num_input_rows_cfg;
    reg     [   C_LOG2_BRAM_DEPTH - 2:0]    num_input_cols_cfg; 
    reg     [   C_LOG2_BRAM_DEPTH - 2:0]    num_output_rows_cfg;
    reg     [   C_LOG2_BRAM_DEPTH - 2:0]    num_output_cols_cfg; 
    reg     [   C_LOG2_SEQ_DATA_DEPTH:0]    seq_full_count_cfg;
    reg     [                       8:0]    row_matric_done_count_cfg;
    
	
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    SRL_bit #(
        .C_CLOCK_CYCLES( 2 )    // three cycle delay for fifo_fwft
    ) 
    i0_SRL_bit (
        .clk        ( clk           ),
        .rst        ( rst           ),
        .ce         ( 1'b1          ),
        .data_in    ( pfb_rden      ),
        .data_out   ( pfb_rden_d    )
    );
 
 
    SRL_bus #(
        .C_CLOCK_CYCLES ( 2                         ),
        .C_DATA_WIDTH   ( (C_LOG2_BRAM_DEPTH - 1)   )
    ) 
    i0_SRL_bus (
        .clk        ( clk           ),
        .rst        ( rst           ),
        .ce         ( 1'b1          ),
        .data_in    ( input_col     ),
        .data_out   ( input_col_d   )
    );
    
    
    SRL_bus #(
        .C_CLOCK_CYCLES ( 2                         ),
        .C_DATA_WIDTH   ( (C_LOG2_BRAM_DEPTH - 1)   )
    ) 
    i1_SRL_bus (
        .clk        ( clk           ),
        .rst        ( rst           ),
        .ce         ( 1'b1          ),
        .data_in    ( input_row     ),
        .data_out   ( input_row_d   )
    );

    
    SRL_bit #(
        .C_CLOCK_CYCLES( 2 )
    ) 
    i3_SRL_bit (
        .clk        ( clk                   ),
        .rst        ( rst                   ),
        .ce         ( 1'b1                  ),
        .data_in    ( seq_rden              ),
        .data_out   ( start_count_delay     )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES( 2 )
    ) 
    i1_SRL_bit (
        .clk        ( clk                       ),
        .rst        ( rst                       ),
        .ce         ( 1'b1                      ),
        .data_in    ( pixel_dataout_valid_r     ),
        .data_out   ( pixel_dataout_valid       )
    );


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------            
    always@(posedge clk) begin
        if(rst) begin
            cycle_counter <= 0;
        end else begin
            if(state == ST_AWE_CE_ACTIVE && start_count_delay) begin
                cycle_counter <= cycle_counter + 1;
                if(cycle_counter == 4) begin
                    cycle_counter <= 0;
                end
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------            
    assign num_input_cols   = num_input_cols_cfg;
    
    always@(posedge clk) begin
        if(rst) begin
            input_row <= 0;
            input_col <= 0;
        end else begin
            if(input_col == num_input_cols_cfg) begin
                input_col  <= 0;
                input_row  <= input_row + 1;
            end else if((state == ST_AWE_CE_PRIM_BUFFER_0 || state == ST_LOAD_PFB) && datain_valid && pixel_datain_tag && pixel_datain_rdy) begin
                input_col  <= input_col + 1;
            end
        end
    end
    
    always@(posedge clk) begin
        if(rst) begin
            output_row <= 0;
            output_col <= 0;
        end else begin
            if(output_col == num_output_cols_cfg && row_matric) begin
                output_col  <= 0;
                output_row  <= output_row + 1;
            end else if(row_matric) begin
                output_col  <= output_col + 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------        
    assign gray_code = {gc[1], ^gc[1:0]};
    
    always@(posedge clk) begin
        if(rst) begin
            gc <= 0;
        end else begin
            if(state == ST_FIN_ROW_MATRIC && row_matric_count == row_matric_done_count_cfg) begin
                gc <= gc + 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
  

    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------          
    assign row_matric_done      = (row_matric_count == row_matric_done_count_cfg);
    assign seq_count_set_value  = seq_full_count_cfg;
    
    always@(posedge clk) begin
        if(rst) begin
            pfb_wren                <= 0;  
            pfb_rden                <= 0;
            seq_wren                <= 0;
            seq_rden                <= 0;
            seq_datain_rdy          <= 0;
            seq_count_rst           <= 0;
            seq_count_set           <= 0;
            pixel_datain_rdy        <= 0;
            seq_wrAddr              <= 0; 
            seq_rdAddr              <= 0;
            pixel_dataout_valid_r   <= 0;
            row_matric_count        <= 0;
            state                   <= ST_IDLE;
        end else begin
            pfb_wren                <= 0;
            pfb_rden                <= 0;
            seq_wren                <= 0;
            seq_rden                <= 0;
            seq_datain_rdy          <= 0;           
            seq_count_rst           <= 0;
            seq_count_set           <= 0;
            pixel_datain_rdy        <= 0;
            pixel_dataout_valid_r   <= 0;
            case(state)           
                ST_IDLE: begin
                    if(new_map) begin
                        state <= ST_LOAD_SEQUENCER;
                    end
                end
                ST_LOAD_SEQUENCER: begin
                    if(datain_valid && seq_datain_tag) begin
                        seq_datain_rdy  <= 1;
                        seq_wren        <= 1; 
                    end
                    if(seq_wren) begin
                        seq_wrAddr <= seq_wrAddr + 1;
                    end
                    if(seq_count == seq_full_count_cfg) begin
                        seq_datain_rdy  <= 0;
                        seq_wren        <= 0;
                        state           <= ST_AWE_CE_PRIM_BUFFER_0;
                    end
                end
                ST_AWE_CE_PRIM_BUFFER_0: begin
                    if(datain_valid && pixel_datain_tag) begin
                        pixel_datain_rdy    <= 1;
                        pfb_wren            <= 1;
                        pfb_rden            <= 1;
                    end
                    if(input_row == 2 && input_col == num_input_cols_cfg) begin
                        pfb_wren            <= 0;
                        pixel_datain_rdy    <= 0;
                        state               <= ST_AWE_CE_PRIM_BUFFER_1;
                    end
                end
                ST_AWE_CE_PRIM_BUFFER_1: begin
                    if(input_row_d == 2 && input_col_d == num_input_cols_cfg) begin 
                        state <= ST_LOAD_PFB;
                    end
                end
                ST_LOAD_PFB: begin
                    if(datain_valid && pixel_datain_tag) begin
                        pixel_datain_rdy    <= 1;
                        pfb_wren            <= 1;
                    end
                    if(pfb_count == num_input_cols_cfg) begin
                        pixel_datain_rdy    <= 0;
                        pfb_wren            <= 0;
                        state               <= ST_AWE_CE_ACTIVE;
                    end
                end
                ST_AWE_CE_ACTIVE: begin
                    if(seq_count > 2) begin
                        seq_rden     <= 1;
                        seq_rdAddr   <= seq_rdAddr + 1;
                    end else begin
                        seq_rden     <= 0;
                        seq_rdAddr   <= 0;
                    end
                    if(row_matric) begin
                        pfb_rden <= 1;
                    end
                    pixel_dataout_valid_r   <= 1;
                    if(output_col == num_output_cols_cfg && row_matric) begin
                        pixel_dataout_valid_r   <= 0;
                        if(output_row == num_output_rows_cfg) begin
                            seq_count_rst   <= 1;
                            state           <= ST_IDLE;
                        end else begin
                            seq_count_set   <= 1;
                            state           <= ST_FIN_ROW_MATRIC;
                        end
                    end
                end
                ST_FIN_ROW_MATRIC: begin
                    pfb_rden            <= 1;
                    row_matric_count    <= row_matric_count + 1;
                    if(row_matric_count == row_matric_done_count_cfg) begin
                        pfb_rden            <= 0;
                        row_matric_count    <= 0;
                        if(output_row == num_output_rows_cfg) begin
                            state <= ST_AWE_CE_ACTIVE;
                        end else begin
                            state <= ST_LOAD_PFB;
                        end
                    end
                end
            endcase
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
	// DEBUG ----------------------------------------------------------------------------------------------------------------------------------------

`ifdef SIMULATION
    string state_s;
    always@(state) begin 
        case(state) 
                ST_IDLE:                    state_s = "ST_IDLE";              
                ST_LOAD_SEQUENCER:          state_s = "ST_LOAD_SEQUENCER";     
                ST_AWE_CE_PRIM_BUFFER_0:    state_s = "ST_AWE_CE_PRIM_BUFFER_0";
                ST_AWE_CE_PRIM_BUFFER_1:    state_s = "ST_AWE_CE_PRIM_BUFFER_1";
                ST_LOAD_PFB:                state_s = "ST_LOAD_PFB";           
                ST_AWE_CE_ACTIVE:           state_s = "ST_AWE_CE_ACTIVE";
                ST_FIN_ROW_MATRIC:          state_s = "ST_FIN_ROW_MATRIC";
        endcase
    end
`endif	
	
endmodule