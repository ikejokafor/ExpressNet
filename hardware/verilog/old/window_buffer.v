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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module window_buffer #(
	parameter C_KERNEL_WIDTH 			= 5,
	parameter C_KERNEL_HEIGHT 			= 5,
	parameter C_DATAIN_WIDTH 			= 16,
	parameter C_MAX_WINDOW_WIDTH 		= 1024
) (
	rst,
    initialize,
	clk,
	width,
	datain,
	datain_valid,
	window,
	window_valid
);
 	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------	
	localparam C_DATAOUT_WIDTH 			= C_KERNEL_WIDTH * C_KERNEL_HEIGHT * C_DATAIN_WIDTH;	
    localparam C_LOG_MAX_WINDOW_WIDTH 	= clog2(C_MAX_WINDOW_WIDTH);


    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Inputs / Outputs
	//----------------------------------------------------------------------------------------------------------------------------------------------- 	
	input													rst;
    input                                                   initialize;
	input													clk;
	input		[C_LOG_MAX_WINDOW_WIDTH-1:0]				width;
	input		[C_DATAIN_WIDTH-1:0]						datain;
	input													datain_valid;
	output		[C_DATAOUT_WIDTH-1:0]						window;
	output		[(C_KERNEL_WIDTH*C_KERNEL_HEIGHT)-1:0]		window_valid;

	
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Wires / Regs
	//----------------------------------------------------------------------------------------------------------------------------------------------- 		
	wire		[(C_KERNEL_HEIGHT*C_DATAIN_WIDTH)-1:0]		row_buffer_datain;
	wire		[C_KERNEL_HEIGHT-1:0]						row_buffer_datain_valid;
	
	wire		[((C_KERNEL_HEIGHT-1)*C_DATAIN_WIDTH)-1:0]	row_buffer_dataout;
	wire		[(C_KERNEL_HEIGHT-1)-1:0]					row_buffer_dataout_valid;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Instaniations
	//----------------------------------------------------------------------------------------------------------------------------------------------- 		
	genvar r;	
	generate
		assign row_buffer_datain		[0*C_DATAIN_WIDTH +: C_DATAIN_WIDTH] = datain;
		assign row_buffer_datain_valid	[0] = datain_valid;
			
		for (r = 0; r < C_KERNEL_HEIGHT-1; r = r + 1)
		begin : LBL_N_MINUS_ONE_ROWS
			row_buffer
			#(
				.C_HAS_DELAY_LINE		(1),
				.C_NUM_OUTPUT_REGISTERS	(C_KERNEL_WIDTH),
				.C_MAX_DELAY 			(C_MAX_WINDOW_WIDTH),
				.C_DATAIN_WIDTH 		(C_DATAIN_WIDTH)
			)
			i_row_buffer
			(
				.rst					(rst),
                .initialize             (initialize),
				.clk					(clk),
				.delay					(width),
				.datain					(row_buffer_datain			[r*C_DATAIN_WIDTH +: C_DATAIN_WIDTH]),
				.datain_valid			(row_buffer_datain_valid	[r] /*& datain_valid*/),
				.window					(window						[r*C_KERNEL_WIDTH*C_DATAIN_WIDTH +: C_KERNEL_WIDTH*C_DATAIN_WIDTH]),
				.window_valid			(window_valid				[r*C_KERNEL_WIDTH +: C_KERNEL_WIDTH]),
				.dataout				(row_buffer_dataout			[r*C_DATAIN_WIDTH +: C_DATAIN_WIDTH]),
				.dataout_valid			(row_buffer_dataout_valid	[r])
			);
			
			assign row_buffer_datain		[(r+1)*C_DATAIN_WIDTH +: C_DATAIN_WIDTH] = row_buffer_dataout[r*C_DATAIN_WIDTH +: C_DATAIN_WIDTH];
			assign row_buffer_datain_valid	[r+1] = row_buffer_dataout_valid[r];
		end
		
		row_buffer
		#(
			.C_HAS_DELAY_LINE		(0),
			.C_NUM_OUTPUT_REGISTERS	(C_KERNEL_WIDTH),
			.C_MAX_DELAY 			(C_MAX_WINDOW_WIDTH),
			.C_DATAIN_WIDTH 		(C_DATAIN_WIDTH)
		)
		i_row_buffer_last
		(
			.rst					(rst),
			.clk					(clk),
            .initialize             (initialize),
			.delay					(width),
			.datain					(row_buffer_datain			[(C_KERNEL_HEIGHT-1)*C_DATAIN_WIDTH +: C_DATAIN_WIDTH]),
			.datain_valid			(row_buffer_datain_valid	[(C_KERNEL_HEIGHT-1)] /*& datain_valid*/),
			.window					(window						[(C_KERNEL_HEIGHT-1)*C_KERNEL_WIDTH*C_DATAIN_WIDTH +: C_KERNEL_WIDTH*C_DATAIN_WIDTH]),
			.window_valid			(window_valid				[(C_KERNEL_HEIGHT-1)*C_KERNEL_WIDTH +: C_KERNEL_WIDTH]),
			.dataout				(),
			.dataout_valid			()
		);
	endgenerate
	
	
	
endmodule
