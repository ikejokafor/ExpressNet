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
    parameter C_NUM_AWE         = 4,
    parameter C_NUM_CE_PER_AWE  = 2,
    parameter C_BRAM_DEPTH      = 1024
) (
    clk_500MHz,       
    accel_rst,    
    pixel_datain_valid,
    num_input_cols,
    num_input_rows,
    start,
    state,  
    input_row_d,
    input_col,
    input_col_d,
    row_matric,
    gray_code,
    cycle_counter,
    pfb_empty,
    pfb_count,     
    pfb_wren, 
    pfb_rden,
    row_matric_done,
    wrAddr,
    ce_start,
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
    localparam C_LOG2_BRAM_DEPTH        = clog2(C_BRAM_DEPTH);
    localparam C_LOG2_SEQ_DATA_DEPTH    = clog2((C_BRAM_DEPTH / 2) * 5);
    localparam C_CE_START_WIDTH         = C_NUM_AWE * C_NUM_CE_PER_AWE;

    localparam ST_IDLE_0                = 4'b0001;  
    localparam ST_AWE_CE_PRIM_BUFFER    = 4'b0010;
    localparam ST_WAIT_PFB_LOAD         = 4'b0100;
    localparam ST_AWE_CE_ACTIVE         = 4'b1000;
 
    localparam ST_IDLE_1                = 2'b01;
    localparam ST_ROW_REQUEST           = 2'b10;


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------   
    input                                       clk_500MHz;       
    input                                       rst;   
    output                                      pixel_datain_valid;  
    input      [   C_LOG2_BRAM_DEPTH - 2:0]     num_input_cols;
    input      [   C_LOG2_BRAM_DEPTH - 2:0]     num_input_rows;
    
    input                                       start;
    output reg [                       3:0]     state;   
    output reg [   C_LOG2_BRAM_DEPTH - 2:0]     input_row;
    output reg [   C_LOG2_BRAM_DEPTH - 2:0]     input_col;
    input                                       pfb_empty;
    input      [                      17:0]     pfb_count; 
    output reg                                  pfb_wren;    
    output reg                                  pfb_rden;
    input                                       pfb_dataout_valid;
    input                                       row_matric;
    output     [                       1:0]     gray_code;
    output reg [                       5:0]     cycle_counter;
    output                                      row_matric_done;
    output reg [   C_LOG2_BRAM_DEPTH - 2:0]     wrAddr;
    output reg [    C_CE_START_WIDTH - 1:0]     ce_start;
    output                                      pixel_dataout_valid;
	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Wires / Regs / Integers
	//-----------------------------------------------------------------------------------------------------------------------------------------------        
    reg     [                       3:0]    prev_state;  
    reg     [                       1:0]    state_1;  
    wire                                    row_matric;
    wire                                    cycle_count_inc;
    reg     [                       1:0]    gc;
    reg     [   C_LOG2_BRAM_DEPTH - 2:0]    input_row;
    reg     [                       8:0]    row_matric_count;
    reg                                     pixel_dataout_valid_r;
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
        .rst        ( rst                   ),
        .ce         ( 1'b1                  ),
        .data_in    ( seq_rden              ),
        .data_out   ( cycle_count_inc       )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES( 3 )
    ) 
    i1_SRL_bit (
        .clk        ( clk_500MHz                ),
        .rst        ( rst                       ),
        .ce         ( 1'b1                      ),
        .data_in    ( pixel_dataout_valid_r     ),
        .data_out   ( pixel_dataout_valid       )
    );
  

    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------            
    always@(posedge clk_500MHz) begin
        if(rst) begin
            cycle_counter <= 0;
        end else begin
            if(state == ST_AWE_CE_ACTIVE && cycle_count_inc) begin
                cycle_counter <= cycle_counter + 1;
                if(cycle_counter == 4) begin
                    cycle_counter <= 0;
                end
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk_500MHz) begin
        if(accel_rst) begin
            input_row   <= 0;
            input_col   <= 0;
            depth       <= 0;
        end else begin
            if(depth == input_depth) begin
                depth <= 0;
            end else if(input_row == num_input_rows) begin
                input_row   <= 0;
                depth       <= depth + 1;
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
            output_row <= 0;
            output_col <= 0;
        end else begin
            if(output_col == num_input_cols) begin
                output_col  <= 0;
                output_row  <= output_row + 1;
            end else if() begin
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
            if(state == ST_FIN_ROW_MATRIC && row_matric_count == num_input_cols) begin
                gc <= gc + 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_500MHz) begin
        if(accel_rst) begin
            ce_start[((0 * (C_NUM_AWE * C_NUM_CE_PER_AWE)) * 1) +: 1] <= 0;
            for(idx0 = 1; idx0 < (C_NUM_AWE * C_NUM_CE_PER_AWE); idx0 = idx0 + 1) begin
                ce_start[((idx0 * (C_NUM_AWE * C_NUM_CE_PER_AWE)) * 1) +: 1] <= 0;
            end
        end else begin
            ce_start[((idx1 * (C_NUM_AWE * C_NUM_CE_PER_AWE)) * 1) +: 1] = (state == ST_AWE_CE_ACTIVE);
            for(idx1 = 1; idx1 < (C_NUM_AWE * C_NUM_CE_PER_AWE); idx1 = idx1 + 1) begin
                ce_start[((idx1 * (C_NUM_AWE * C_NUM_CE_PER_AWE)) * 1) +: 1]
                    <= ce_start[(((idx1 - 1) * (C_NUM_AWE * C_NUM_CE_PER_AWE)) * 1) +: 1];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    always@(posedge clk_500MHz) begin
        if(accel_rst) begin
            pfb_wren                <= 0;
            row_request_in_progress <= 0;
            state_1                 <= ST_IDLE_1;
        end else begin
            pfb_wren                <= 0;
            case(state_1)
                ST_IDLE_1: begin
                    if(row_request) begin
                        row_request_in_progress <= 1;
                        state_1                 <= ST_ROW_REQUEST;
                    end
                end
                ST_ROW_REQUEST: begin
                    if(pfb_count == num_input_cols) begin
                        state_1 <= ST_IDLE_1;
                    end
                end
            endcase
        end
    end
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk_500MHz) begin
        if(accel_rst) begin
            pfb_rden                <= 0;
            pixel_dataout_valid_r   <= 0;
            row_matric_count        <= 0;
            wrAddr                  <= 0;
            job_done                <= 0;
            row_request             <= 0;
            state_0                 <= ST_IDLE_0;
        end else begin
            pfb_rden                <= 0;
            pixel_dataout_valid_r   <= 0;
            job_done                <= 0;
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
                    if(pfb_count == num_input_cols) begin
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
                    if(row_matric) begin
                        wrAddr     <= wrAddr + 1;
                        pfb_rden   <= 1;
                    end
                    if(output_col == num_input_cols) begin
                        pixel_dataout_valid_r   <= 0;
                        if(depth == input_depth) begin
                            job_done            <= 1;
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
                ST_IDLE_0:           state_1_s = "ST_IDLE_0";              
                ST_ROW_REQUEST:      state_1_s = "ST_ROW_REQUEST";
        endcase
    end
`endif
	
endmodule