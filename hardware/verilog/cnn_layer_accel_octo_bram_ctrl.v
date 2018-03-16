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
module cnn_layer_accel_octo_bram_ctrl #(
    parameter C_NUM_AWE     = 1,
    parameter C_BRAM_DEPTH  = 1024
) (
    clk,       
    rst,    
    datain_valid,
    pixel_datain_tag,
    pixel_datain_rdy,
    seq_datain_tag,
    seq_datain_rdy,
    new_map,
    state,  
    row,
    row_d,
    col,
    col_d,
    numRows,
    numCols,
    seq_count,            
    pfb_count,             
    row_Matric,
    gray_code,
    pfb_wren, 
    pfb_rden,
    pfb_rden_d,
    seq_wrAddr,  
    seq_rdAddr,  
    seq_wren,    
    seq_rden      
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

    localparam ST_IDLE                  = 6'b000001;  
    localparam ST_LOAD_SEQUENCER        = 6'b000010;
    localparam ST_AWE_CE_PRIM_BUFFER_0  = 6'b000100;
    localparam ST_AWE_CE_PRIM_BUFFER_1  = 6'b001000;
    localparam ST_LOAD_PFB              = 6'b010000;
    localparam ST_AWE_CE_ACTIVE         = 6'b100000;
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------   
    input                                       clk;       
    input                                       rst;   
    input                                       datain_valid;
    input                                       pixel_datain_tag;
    output reg                                  pixel_datain_rdy;
    input                                       seq_datain_tag;
    output reg                                  seq_datain_rdy;
    input                                       new_map;
    output reg [                       5:0]     state;  
    output reg [   C_LOG2_BRAM_DEPTH - 2:0]     row;
    output     [   C_LOG2_BRAM_DEPTH - 2:0]     row_d;
    output reg [   C_LOG2_BRAM_DEPTH - 2:0]     col;
    output     [   C_LOG2_BRAM_DEPTH - 2:0]     col_d;
    output     [   C_LOG2_BRAM_DEPTH - 2:0]     numRows;
    output     [   C_LOG2_BRAM_DEPTH - 2:0]     numCols; 
    input      [   C_LOG2_SEQ_DATA_DEPTH:0]     seq_count;            
    input      [                      17:0]     pfb_count; 
    input                                       row_Matric;
    output     [                       1:0]     gray_code;
    output reg                                  pfb_wren;    
    output reg                                  pfb_rden; 
    output                                      pfb_rden_d;
    output reg [C_LOG2_SEQ_DATA_DEPTH - 1:0]    seq_wrAddr;  
    output reg [C_LOG2_SEQ_DATA_DEPTH - 1:0]    seq_rdAddr;  
    output reg                                  seq_wren;    
    output reg                                  seq_rden;
	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Wires / Regs / Integers
	//-----------------------------------------------------------------------------------------------------------------------------------------------        
    wire    [   C_LOG2_BRAM_DEPTH - 2:0]    row_d_w;
    wire    [   C_LOG2_BRAM_DEPTH - 2:0]    col_d_w;
    reg     [                       1:0]    gc;
    reg     [   C_LOG2_BRAM_DEPTH - 2:0]    numRows_r;
    reg     [   C_LOG2_BRAM_DEPTH - 2:0]    numCols_r; 
    reg     [   C_LOG2_SEQ_DATA_DEPTH:0]    seq_full_count;
    
	
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
        .C_CLOCK_CYCLES ( 2                         ),    // two cycle delay for fifo_fwft
        .C_DATA_WIDTH   ( (C_LOG2_BRAM_DEPTH - 1)   )
    ) 
    i0_SRL_bus (
        .clk        ( clk           ),
        .rst        ( rst           ),
        .ce         ( 1'b1          ),
        .data_in    ( col           ),
        .data_out   ( col_d_w       )
    );
    
    
    SRL_bus #(
        .C_CLOCK_CYCLES ( 2                         ),    // two cycle delay for fifo_fwft
        .C_DATA_WIDTH   ( (C_LOG2_BRAM_DEPTH - 1)   )
    ) 
    i1_SRL_bus (
        .clk        ( clk           ),
        .rst        ( rst           ),
        .ce         ( 1'b1          ),
        .data_in    ( row           ),
        .data_out   ( row_d_w       )
    );
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------            
    assign numRows = numRows_r;
    assign numCols = numCols_r;
    
    always@(posedge clk) begin
        if(rst) begin
            row <= 0;
            col <= 0;
        end else begin
            if(col == numCols_r) begin
                col  <= 0;
                row  <= row + 1;
            end else if(row_Matric || ((state == ST_AWE_CE_PRIM_BUFFER_0 || state == ST_LOAD_PFB) && datain_valid && pixel_datain_tag) && pixel_datain_rdy) begin
                col  <= col + 1;
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
            if(state == ST_AWE_CE_ACTIVE && col == numCols_r) begin
                gc <= gc + 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
  

    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------         
    assign col_d = col_d_w;
    assign row_d = row_d_w;
    
    always@(posedge clk) begin
        if(rst) begin
            pfb_wren            <= 0;  
            pfb_rden            <= 0;
            seq_wren            <= 0;
            seq_rden            <= 0;
            seq_datain_rdy      <= 0;
            pixel_datain_rdy    <= 0;
            seq_wrAddr          <= 0; 
            seq_rdAddr          <= 0;
            state               <= ST_IDLE;
        end else begin
            pfb_wren            <= 0;
            pfb_rden            <= 0;
            seq_wren            <= 0;
            seq_rden            <= 0;
            seq_datain_rdy      <= 0;
            pixel_datain_rdy    <= 0;
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
                    if(seq_count == seq_full_count) begin
                        seq_datain_rdy  <= 0;
                        state           <= ST_AWE_CE_PRIM_BUFFER_0;
                    end
                end
                ST_AWE_CE_PRIM_BUFFER_0: begin
                    if(datain_valid && pixel_datain_tag) begin
                        pixel_datain_rdy    <= 1;
                        pfb_wren            <= 1;
                        pfb_rden            <= 1;
                    end
                    if(row == 2 && col == numCols_r) begin
                        pfb_wren            <= 0;
                        pixel_datain_rdy    <= 0;
                        state               <= ST_AWE_CE_PRIM_BUFFER_1;
                    end
                end
                ST_AWE_CE_PRIM_BUFFER_1: begin
                    if(row_d_w == 2 && col_d_w == numCols_r) begin 
                        state <= ST_LOAD_PFB;
                    end
                end
                ST_LOAD_PFB: begin
                    if(datain_valid && pixel_datain_tag) begin
                        pixel_datain_rdy    <= 1;
                        pfb_wren            <= 1;
                    end
                    if(pfb_count == numCols_r) begin
                        pixel_datain_rdy    <= 0;
                        pfb_wren            <= 0;
                        state <= ST_AWE_CE_ACTIVE;
                    end
                end
                ST_AWE_CE_ACTIVE: begin
                    seq_rden <= 1;
                    if(row_Matric) begin
                        pfb_rden         <= 1;
                        pixel_datain_rdy <= 1;
                    end
                    if(row == numRows_r) begin
                        state <= ST_IDLE;
                    end else if(col == numCols) begin
                        state <= ST_LOAD_PFB;
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
        endcase
    end
`endif	
	
endmodule