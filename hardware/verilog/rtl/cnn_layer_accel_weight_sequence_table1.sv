`timescale 1ns / 1ps
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_weight_sequence_table1 (
    clk                 ,             
    rst                 ,
    gray_code           ,
	sequence_selector   ,
    seq_data_addr       ,
    wht_data_addr
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.svh"
    `include "cnn_layer_accel.svh"	
	`include "cnn_layer_accel_QUAD.svh"
	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------	
	localparam C_CLG2_ROW_BUF_BRAM_DEPTH = clog2(`ROW_BUF_BRAM_DEPTH);
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input  logic          clk             	;
    input  logic          rst             	;
    input  logic [1:0]    gray_code       	;
	input  logic          sequence_selector	;
    input  logic [2:0]    seq_data_addr   	;
    output logic [3:0]    wht_data_addr   	;
	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    logic [3:0] sequence_data0[4:0];
    logic [3:0] sequence_data1[4:0];
    logic [3:0] sequence_data2[4:0];
    logic [3:0] sequence_data3[4:0];
	
	
	// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin
            sequence_data0[3'd0] <= 4'd1;
            sequence_data0[3'd1] <= 4'd9;
            sequence_data0[3'd2] <= 4'd3;
            sequence_data0[3'd3] <= 4'd4;
            sequence_data0[3'd4] <= 4'd5;
            
            sequence_data1[3'd0] <= 4'd9;
            sequence_data1[3'd1] <= 4'd2;
            sequence_data1[3'd2] <= 4'd3;
            sequence_data1[3'd3] <= 4'd4;
            sequence_data1[3'd4] <= 4'd5;
            
            sequence_data2[3'd0] <= 4'd1;
            sequence_data2[3'd1] <= 4'd9;
            sequence_data2[3'd2] <= 4'd6;
            sequence_data2[3'd3] <= 4'd7;
            sequence_data2[3'd4] <= 4'd8;
            
            sequence_data3[3'd0] <= 4'd9;
            sequence_data3[3'd1] <= 4'd2;
            sequence_data3[3'd2] <= 4'd6;
            sequence_data3[3'd3] <= 4'd7;
            sequence_data3[3'd4] <= 4'd8;                       
        end else begin
            if(((gray_code == 2'b00) || (gray_code == 2'b11)) & sequence_selector) begin
                wht_data_addr <= sequence_data0[seq_data_addr];
            end else if(((gray_code == 2'b00) || (gray_code == 2'b11)) & !sequence_selector)begin
                wht_data_addr <= sequence_data1[seq_data_addr];
            end else if(((gray_code == 2'b01) || (gray_code == 2'b10)) & sequence_selector)begin
                wht_data_addr <= sequence_data2[seq_data_addr];
            end else if(((gray_code == 2'b01) || (gray_code == 2'b10)) & !sequence_selector)begin
                wht_data_addr <= sequence_data3[seq_data_addr];
            end
        end    
    end    
	// END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
	// DEBUG ----------------------------------------------------------------------------------------------------------------------------------------

	
	
endmodule