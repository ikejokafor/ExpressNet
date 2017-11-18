`timescale 1ns / 1ns

module tile_router_v1_00_a_output_port
(
	clk,
	rst,
	
	output_valid,
	output_accept,
	output_payload,
	
	clientX_valid,
	clientX_accept,
	clientX_payload
);

`include "math.vh"
`include "tile_router_v1_00_a_defines.vh"

parameter C_NUM_CLIENTS = 8;
parameter C_PACKET_WIDTH = `PACKET_WIDTH;
	input													clk						;
	input													rst						;
	
	output													output_valid			;
	input													output_accept			;
	output			[C_PACKET_WIDTH-1:0]					output_payload			;
	
	input			[C_NUM_CLIENTS-1:0]						clientX_valid			;
	output			[C_NUM_CLIENTS-1:0]						clientX_accept			;
	input			[(C_PACKET_WIDTH*C_NUM_CLIENTS)-1:0]	clientX_payload			;

	wire			[C_NUM_CLIENTS-1:0]						arbiter_request			;
	wire			[C_NUM_CLIENTS-1:0]						arbiter_request_accept	;
	wire													arbiter_select_valid	;
	wire													arbiter_enable			;
	wire			[clog2(C_NUM_CLIENTS)-1:0]				arbiter_select			;
	wire			[C_NUM_CLIENTS-1:0]						arbiter_select_oh		;
	
	reg														output_fifo_wren		;
	wire													output_fifo_rden		;
	reg				[C_PACKET_WIDTH-1:0]					output_fifo_datain		;
	wire			[C_PACKET_WIDTH-1:0]					output_fifo_dataout		;
	wire													output_fifo_empty		;
	wire													output_fifo_full		;
	wire													output_fifo_prog_full	;
	reg														output_fifo_available	;
	
	reg				[C_NUM_CLIENTS-1:0]						clientX_valid_r			;
	reg				[(C_PACKET_WIDTH*C_NUM_CLIENTS)-1:0]	clientX_payload_r		;
	
	assign output_valid			= ~output_fifo_empty;
	assign output_payload		= output_fifo_dataout;
	assign output_fifo_rden		= ({output_valid,output_accept} === 2'b11)? 1'b1 :1'b0;
	
	always @(posedge clk)
	begin
		clientX_valid_r 	<= clientX_valid;
		clientX_payload_r 	<= clientX_payload;
	end
	
	always @(posedge clk)
	begin
		if (rst)
		begin
			output_fifo_datain		<= {C_PACKET_WIDTH{1'b0}};
			output_fifo_wren		<= 1'b0;
		end
		else
		begin
			output_fifo_datain 		<= clientX_payload_r[C_PACKET_WIDTH*arbiter_select +: C_PACKET_WIDTH];
			output_fifo_wren 		<= arbiter_select_valid & clientX_valid_r[arbiter_select];
		end
	end
	
	fifo_fwft_prog_full
	#(
		.C_DATA_WIDTH			(C_PACKET_WIDTH),
		.C_FIFO_DEPTH			(10),
		.C_PROG_FULL_THRESHOLD	(5)
	)
	i_output_fifo
	(
		.clk			(clk),
		.rst			(rst),
		.wren			(output_fifo_wren),
		.rden			(output_fifo_rden),
		.datain			(output_fifo_datain),
		.dataout 		(output_fifo_dataout),
		.empty			(output_fifo_empty),
		.full			(output_fifo_full),
		.prog_full		(output_fifo_prog_full)
	);

	always @(posedge clk)
	begin
		output_fifo_available <= ~output_fifo_prog_full;
	end
	
	assign arbiter_enable 	= 1'b1;//output_fifo_available;
		
	assign arbiter_request 	= clientX_valid & {C_NUM_CLIENTS{output_fifo_available}};
	assign clientX_accept	= arbiter_request_accept ;
	
	tile_router_v1_00_a_output_arbiter
	i_tile_router_v1_00_a_output_arbiter
	(
		.clk				(clk					),
		.rst				(rst					),
		.enable				(arbiter_enable			),
		.requests			(arbiter_request		),
		.requests_accept	(arbiter_request_accept	),
		.select_valid		(arbiter_select_valid	),
		.select				(arbiter_select			),
		.select_oh			(arbiter_select_oh		)
	);
endmodule