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
module cnn_layer_accel_quad_bram_ctrl #(
    parameter C_NUM_NETWORK_IF  = 1,
    parameter C_PAYLOAD_WIDTH   = 128,
    parameter C_NUM_AWE         = 4,
    parameter C_NUM_CE_PER_AWE  = 2,
    parameter C_BRAM_DEPTH      = 1024,
    parameter C_SEQ_DATA_WIDTH  = 16
) (
    clk_500MHz                  ,
    accel_rst                   ,
    num_input_cols              ,
    num_input_rows              ,
    num_input_depth             ,
    start                       ,
    state                       ,
    input_row                   ,
    input_col                   ,
    row_matric                  ,
    gray_code                   ,
    cycle_counter               ,
    pfb_empty                   ,
    pfb_count                   ,
    pfb_rden                    ,
    pfb_dataout_valid           ,
    pfb_full_count              ,
    wrAddr                      ,
    ce_start                    ,
    seq_rden                    ,
    last_kernel                 ,
    next_row                    ,
    pixel_dataout_valid         
);


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------     
    localparam ST_IDLE_0                = 4'b0001;  
    localparam ST_AWE_CE_PRIM_BUFFER    = 4'b0010;
    localparam ST_WAIT_PFB_LOAD         = 4'b0100;
    localparam ST_AWE_CE_ACTIVE         = 4'b1000;
 
    localparam ST_IDLE_1                = 2'b01;
    localparam ST_ROW_REQUEST           = 2'b10;

    localparam C_LOG2_BRAM_DEPTH        = clog2(C_BRAM_DEPTH);
    localparam C_LOG2_SEQ_DATA_DEPTH    = clog2((C_BRAM_DEPTH / 2) * 5);
    localparam C_CE_START_WIDTH         = C_NUM_AWE * C_NUM_CE_PER_AWE;
    localparam C_NET_PYLD_WIDTH         = C_NUM_NETWORK_IF * C_PAYLOAD_WIDTH;
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------   
    input                                   clk_500MHz;       
    input                                   accel_rst;   
    input      [C_LOG2_BRAM_DEPTH - 2:0]    num_input_cols;
    input      [C_LOG2_BRAM_DEPTH - 2:0]    num_input_rows;
    input      [C_LOG2_BRAM_DEPTH - 2:0]    num_input_depth;
    input                                   start;
    output reg [                    3:0]    state;   
    output reg [C_LOG2_BRAM_DEPTH - 2:0]    input_row;
    output reg [C_LOG2_BRAM_DEPTH - 2:0]    input_col;
    input                                   pfb_empty;
    input      [                    9:0]    pfb_count; 
    output reg                              pfb_rden;
    input                                   pfb_dataout_valid;
    input      [                    8:0]    pfb_full_count;
    input                                   row_matric;
    output     [                    1:0]    gray_code;
    output reg [                    5:0]    cycle_counter;
    output reg [C_LOG2_BRAM_DEPTH - 2:0]    wrAddr;
    output reg [ C_CE_START_WIDTH - 1:0]    ce_start;
    input                                   seq_rden;
    input                                   last_kernel;
    input                                   next_row;
    output                                  pixel_dataout_valid;  
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Wires / Regs / Integers
	//-----------------------------------------------------------------------------------------------------------------------------------------------        
    reg     [                     3:0]      state_0;  
    reg     [                     1:0]      state_1;
    reg     [ C_LOG2_BRAM_DEPTH - 2:0]      input_depth;   
    reg     [ C_LOG2_BRAM_DEPTH - 2:0]      output_depth; 
    reg     [ C_LOG2_BRAM_DEPTH - 2:0]      output_row;
    reg     [ C_LOG2_BRAM_DEPTH - 2:0]      output_col;
    wire    [ C_LOG2_BRAM_DEPTH - 2:0]      num_output_depth;
    wire    [ C_LOG2_BRAM_DEPTH - 2:0]      num_output_rows;
    wire    [ C_LOG2_BRAM_DEPTH - 2:0]      num_output_cols;
    reg     [                     3:0]      prev_state;
    reg                                     row_request;
    wire                                    cycle_count_inc;
    reg     [                     1:0]      gc;
    reg                                     pixel_dataout_valid_r;
    reg                                     row_request_in_progress;
    integer                                 idx0;
    integer                                 idx1;
    
	
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------    
    SRL_bit #(
        .C_CLOCK_CYCLES( 2 )
    ) 
    i3_SRL_bit (
        .clk        ( clk_500MHz            ),
        .rst        ( accel_rst             ),
        .ce         ( 1'b1                  ),
        .data_in    ( seq_rden              ),
        .data_out   ( cycle_count_inc       )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES( 3 )
    ) 
    i1_SRL_bit (
        .clk        ( clk_500MHz                ),
        .rst        ( accel_rst                 ),
        .ce         ( 1'b1                      ),
        .data_in    ( pixel_dataout_valid_r     ),
        .data_out   ( pixel_dataout_valid       )
    );
  

    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------            
    always@(posedge clk_500MHz) begin
        if(accel_rst) begin
            cycle_counter <= 0;
        end else begin
            if(state_0 == ST_AWE_CE_ACTIVE && cycle_count_inc) begin
                cycle_counter <= cycle_counter + 1;
                if(cycle_counter == 4) begin
                    cycle_counter <= 0;
                end
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    assign num_output_depth     = num_input_depth;
    assign num_output_rows      = num_input_rows; 
    assign num_output_cols      = num_input_cols;
    
    always@(posedge clk_500MHz) begin
        if(accel_rst) begin
            input_row   <= 0;
            input_col   <= 0;
            input_depth <= 0;
        end else begin
            if(input_depth == num_input_depth) begin
                input_depth <= 0;
            end else if(input_row == num_input_rows) begin
                input_row   <= 0;
                input_depth <= input_depth + 1;
            end if(input_col == num_input_cols) begin
                input_col  <= 0;
                input_row  <= input_row + 1;
            end else if(pfb_rden) begin
                input_col  <= input_col + 1;
            end
        end
    end
    
    always@(posedge clk_500MHz) begin
        if(accel_rst) begin
            output_row   <= 0;
            output_col   <= 0;
            output_depth <= 0;
        end else begin
            if(output_depth == num_output_depth) begin
                output_depth <= 0;
            end else if(input_row == num_input_rows) begin
                output_row    <= 0;
                output_depth  <= output_depth + 1;
            end if(input_col == num_input_cols) begin
                input_col  <= 0;
                output_row   <= output_row + 1;
            end else if(next_row) begin
                output_col  <= output_col + 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------        
    assign gray_code = {gc[1], ^gc[1:0]};
    
    always@(posedge clk_500MHz) begin
        if(accel_rst) begin
            gc <= 0;
        end else begin
            if(next_row) begin
                gc <= gc + 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_500MHz) begin
        if(accel_rst) begin
            ce_start[0] <= 0;
            for(idx0 = 1; idx0 < C_CE_START_WIDTH; idx0 = idx0 + 1) begin
                ce_start[idx0] <= 0;
            end
        end else begin
            ce_start[0] = (state_0 == ST_AWE_CE_ACTIVE);
            for(idx1 = 1; idx1 < C_CE_START_WIDTH; idx1 = idx1 + 1) begin
                ce_start[idx1] <= ce_start[idx1 - 1];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk_500MHz) begin
        if(accel_rst) begin
            row_request_in_progress <= 0;
            state_1                 <= ST_IDLE_1;
        end else begin
            case(state_1)
                ST_IDLE_1: begin
                    if(row_request) begin
                        row_request_in_progress <= 1;
                        state_1                 <= ST_ROW_REQUEST;
                    end
                end
                ST_ROW_REQUEST: begin
                    if(pfb_count == pfb_full_count) begin
                        state_1 <= ST_IDLE_1;
                    end
                end
            endcase
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    assign state = state_0;  
    
    always@(posedge clk_500MHz) begin
        if(accel_rst) begin
            pfb_rden                <= 0;
            pixel_dataout_valid_r   <= 0;
            wrAddr                  <= 0;
            row_request             <= 0;
            state_0                 <= ST_IDLE_0;
        end else begin
            pfb_rden                <= 0;
            pixel_dataout_valid_r   <= 0;
            row_request             <= 0;
            case(state_0)           
                ST_IDLE_0: begin
                    if(start) begin
                        state_0 <= ST_AWE_CE_PRIM_BUFFER;
                    end
                end
                ST_WAIT_PFB_LOAD: begin
                    if(!row_request_in_progress) begin
                        row_request <= 1;
                    end
                    if(pfb_count == pfb_full_count) begin
                        state_0 <= prev_state;
                    end
                end
                ST_AWE_CE_PRIM_BUFFER: begin
                    if(pfb_empty) begin
                        prev_state  <= state_0;
                        state_0     <= ST_WAIT_PFB_LOAD;
                    end else begin
                        if(pfb_count == 1 && pfb_rden) begin
                            pfb_rden <= 0;
                        end else if(pfb_dataout_valid) begin
                            pfb_rden <= 1;
                        end else begin
                            pfb_rden <= 0;
                        end
                        if(input_row == 2 && input_col == num_input_cols) begin
                            state_0  <= ST_AWE_CE_ACTIVE;
                        end
                    end
                end
                ST_AWE_CE_ACTIVE: begin
                    pixel_dataout_valid_r   <= 1;
                    // overlap pfb load with execution
                    if(pfb_count != num_input_cols && !row_request_in_progress) begin
                        row_request <= 1;
                    end
                    // overlap row matric with execution
                    if(row_matric && last_kernel) begin
                        wrAddr     <= wrAddr + 1;
                        pfb_rden   <= 1;
                    end
                    if(output_col == num_input_cols) begin
                        pixel_dataout_valid_r   <= 0;
                        if(input_depth == num_input_depth) begin
                            state_0             <= ST_IDLE_0;
                        end else begin
                            if(pfb_count != num_input_cols) begin
                                prev_state      <= state_0;
                                state_0         <= ST_WAIT_PFB_LOAD;
                            end
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
    string state_0_s;
    always@(state_0) begin 
        case(state_0) 
                ST_IDLE_0:                  state_0_s = "ST_IDLE_0";              
                ST_AWE_CE_PRIM_BUFFER:      state_0_s = "ST_AWE_CE_PRIM_BUFFER";
                ST_WAIT_PFB_LOAD:           state_0_s = "ST_WAIT_PFB_LOAD";           
                ST_AWE_CE_ACTIVE:           state_0_s = "ST_AWE_CE_ACTIVE";
        endcase
    end
`endif	


`ifdef SIMULATION
    string state_1_s;
    always@(state_1) begin 
        case(state_1) 
                ST_IDLE_1:           state_1_s = "ST_IDLE_1";              
                ST_ROW_REQUEST:      state_1_s = "ST_ROW_REQUEST";
        endcase
    end
`endif
	
endmodule