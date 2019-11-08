`timescale 1ns / 1ps

module row_buffer
(
	rst,
    initialize,
	clk,
	delay,
	datain,
	datain_valid,
	window,
	window_valid,
	dataout,
	dataout_valid
);
`include "math.vh"
	
	parameter	C_HAS_DELAY_LINE		= 1;
	parameter	C_NUM_OUTPUT_REGISTERS	= 5;
	parameter 	C_MAX_DELAY 			= 1024;
	parameter	C_PTR_WIDTH 			= clog2(C_MAX_DELAY);
	parameter	C_DATAIN_WIDTH 			= 32;
	parameter	C_DATAOUT_WIDTH			= C_NUM_OUTPUT_REGISTERS * C_DATAIN_WIDTH;
	
	input										rst;
    input                                       initialize;
	input										clk;
	input		[C_PTR_WIDTH-1:0]				delay;
	input		[C_DATAIN_WIDTH-1:0]			datain;
	input										datain_valid;
	output	reg	[C_DATAOUT_WIDTH-1:0]			window;
	output	reg	[C_NUM_OUTPUT_REGISTERS-1:0]	window_valid;
	output		[C_DATAIN_WIDTH-1:0]			dataout;
	output										dataout_valid;
	
	integer i;
	
	always @(posedge clk)
	begin
		if (rst || initialize)
		begin
			window_valid <= {C_NUM_OUTPUT_REGISTERS{1'b0}};
		end
		else
		begin
			if (datain_valid)
			begin
				window_valid[0] <= datain_valid;
				window[0*C_DATAIN_WIDTH +: C_DATAIN_WIDTH] <= datain;
				for (i = 1; i < C_NUM_OUTPUT_REGISTERS; i = i + 1)
				begin
					window_valid[i] <= window_valid[i-1];
					window[i*C_DATAIN_WIDTH +: C_DATAIN_WIDTH] <= window[(i-1)*C_DATAIN_WIDTH +: C_DATAIN_WIDTH];
				end
			end
		end
	end
	
	reg	[C_PTR_WIDTH-1:0]	delay_minus_num_output_registers;
	
	always @(posedge clk)
	begin
		delay_minus_num_output_registers <= delay-C_NUM_OUTPUT_REGISTERS;
	end
	
	generate
		if (C_HAS_DELAY_LINE == 1)
		begin
			delay_line
			#(
				.C_MAX_DELAY 	(C_MAX_DELAY),
				.C_DWIDTH 		(C_DATAIN_WIDTH)
			)
			i_delay_line
			(
				.rst			(rst																			),
				.clk			(clk																			),
				.delay			(delay_minus_num_output_registers												),
				.datain			(window			[(C_NUM_OUTPUT_REGISTERS-1)*C_DATAIN_WIDTH +: C_DATAIN_WIDTH]	),
				.wr_en			(window_valid	[C_NUM_OUTPUT_REGISTERS-1]	& datain_valid						),
				.dataout		(dataout																		),
				.dataout_valid	(dataout_valid																	)
			);
		end
		else
		begin
			assign dataout = {C_DATAIN_WIDTH{1'b0}};
			assign dataout_valid = 1'b0;
		end
	endgenerate
		
endmodule
