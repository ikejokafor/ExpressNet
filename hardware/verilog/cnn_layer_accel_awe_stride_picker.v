`timescale 1ns / 1ns
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company:			Microsystems Design Lab (MDL)
//					The Pennsylvania State University
// Engineer: 		Esakkimuthu Geethanjali
//
// Create Date:		10/15/2015
// Design Name: 	Parallel integral image 
// Module Name:     
// Project Name:	Future Store Analytics
// Target Devices: 	
// Tool versions:
// Description:		
//
// Dependencies:
//
// Revision:
// Revision 1.0 - File Created
//
// Additional Comments:
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_awe_stride_picker (
    clk                , 
    rst                ,
    config_valid       ,
    stride_size        ,
    datain             ,
    datain_valid       ,
    dataout            ,
    dataout_valid
)
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"
	
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	localparam C_STRIDE_COUNTER_WIDTH = clog2(`MAX_STRIDE);
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------	
	input 	logic												clk                 ;
	input	logic												rst                 ;
	input 	logic												config_valid        ;
	input   logic [C_STRIDE_COUNTER_WIDTH - 1:0]                stride_size         ;
	input   logic [          C_DATA_WIDTH - 1:0]                datain	            ;
	input	logic												datain_valid        ;
	output	logic [          C_DATA_WIDTH - 1:0]				dataout             ;
	output	logic												dataout_valid       ;
	

 	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
	logic 	[C_STRIDE_COUNTER_WIDTH-1:0]    stride_length;
	logic   [C_STRIDE_COUNTER_WIDTH-1:0]	running_count;
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------            	
    assign dataout = (dataout_valid) ? datain: 0;
    
	always @(posedge clk) begin 	
		if(rst) begin
			running_count	 <= 0;
		end else begin
            dataout_valid    <= 0;
            if(config_valid) begin 
                stride_length <= stride_size;
                running_count <= stride_size;
            end
            if(datain_valid && (running_count == stride_length)) begin 
                running_count <= 0;
                dataout_valid <= 1'b1;
            end else if(datain_valid) begin
                running_count <= running_count + 1;
            end 	
		end
	end 
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

endmodule 