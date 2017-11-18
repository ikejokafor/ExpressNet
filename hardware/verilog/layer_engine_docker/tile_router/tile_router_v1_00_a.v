`timescale 1ns / 1ns

module tile_router_v1_00_a (
	clk,
	rst,
	
	input_valid,
	input_accept,
	input_payload,
		
	output_valid,
	output_accept,
	output_payload
);
`include "math.vh"
`include "tile_router_v1_00_a_defines.vh"

	parameter 	C_NUM_INPUTS 		= 8;
	parameter 	C_NUM_OUTPUTS 		= 8;
	parameter 	C_ADDRESS_X			= 6'b000000;
	parameter 	C_ADDRESS_Y			= 6'b000000;
    parameter   C_PACKET_WIDTH      = 66;
	localparam 	C_LOG2_NUM_OUTPUTS 	= clog2(C_NUM_OUTPUTS);
	
	input														clk						;
	input														rst						;
	
	input	[C_NUM_INPUTS-1:0]									input_valid				;
	output	[C_NUM_INPUTS-1:0]									input_accept			;
	input	[(C_PACKET_WIDTH*C_NUM_INPUTS)-1:0]					input_payload			;
	
	output	[C_NUM_OUTPUTS-1:0]									output_valid			;
	input	[C_NUM_OUTPUTS-1:0]									output_accept			;
	output	[(C_PACKET_WIDTH*C_NUM_OUTPUTS)-1:0]				output_payload			;

	wire	[(C_NUM_OUTPUTS*C_NUM_INPUTS)-1:0]					output_clientX_valid	;
	wire	[(C_NUM_OUTPUTS*C_NUM_INPUTS)-1:0]					output_clientX_accept	;
	wire	[(C_NUM_OUTPUTS*C_NUM_INPUTS*C_PACKET_WIDTH)-1:0]	output_clientX_payload	;
	
	genvar i,o;
	
	generate
		for (o=0; o<C_NUM_OUTPUTS; o=o+1)
		begin : LBL_OUTPUTS
			tile_router_v1_00_a_output_port
			#(
				.C_NUM_CLIENTS			( C_NUM_INPUTS      ),
                .C_PACKET_WIDTH         ( C_PACKET_WIDTH    )
			)
			i_output_port
			(
				.clk					(clk																	 						),
				.rst					(rst																	 						),
	
				.output_valid			(output_valid					[o																]),
				.output_accept			(output_accept					[o																]),
				.output_payload			(output_payload					[o*C_PACKET_WIDTH 				+: C_PACKET_WIDTH				]),
	
				.clientX_valid			(output_clientX_valid			[o*C_NUM_INPUTS					+: C_NUM_INPUTS					]),
				.clientX_accept			(output_clientX_accept			[o*C_NUM_INPUTS					+: C_NUM_INPUTS					]),
				.clientX_payload		(output_clientX_payload			[o*C_NUM_INPUTS*C_PACKET_WIDTH	+: C_NUM_INPUTS*C_PACKET_WIDTH	])
			);
		
		end
	endgenerate
	
	wire	[(C_NUM_INPUTS*C_NUM_OUTPUTS)-1:0]					input_clientX_valid		;
	wire	[(C_NUM_INPUTS*C_NUM_OUTPUTS)-1:0]					input_clientX_accept	;
	wire	[(C_NUM_INPUTS*C_NUM_OUTPUTS*C_PACKET_WIDTH)-1:0]	input_clientX_payload	;
	
	generate
		for (i=0; i<C_NUM_INPUTS; i=i+1)
		begin : LBL_INPUTS
			tile_router_v1_00_a_input_port
			#(
				.C_NUM_CLIENTS			(C_NUM_OUTPUTS),
                .C_PACKET_WIDTH         ( C_PACKET_WIDTH    ),

				.C_ADDRESS_X			(C_ADDRESS_X),
				.C_ADDRESS_Y			(C_ADDRESS_Y),
				.C_PORT_TYPE 			(i)
			)
			i_input_port
			(
				.clk					(clk																			 						),
				.rst					(rst																			 						),
	
				.input_valid			(input_valid					[i																		]),
				.input_accept			(input_accept					[i																		]),
				.input_payload			(input_payload					[i*C_PACKET_WIDTH 					+: 	C_PACKET_WIDTH					]),
	
				.clientX_valid			(input_clientX_valid			[i*C_NUM_OUTPUTS					+:	C_NUM_OUTPUTS					]),
				.clientX_accept			(input_clientX_accept			[i*C_NUM_OUTPUTS					+:	C_NUM_OUTPUTS					]),
				.clientX_payload		(input_clientX_payload			[i*C_NUM_OUTPUTS*C_PACKET_WIDTH 	+: 	C_NUM_OUTPUTS*C_PACKET_WIDTH	])
			);
		end
	endgenerate
	
	genvar i_idx, o_idx;
	generate
		for (o_idx=0; o_idx<C_NUM_OUTPUTS; o_idx=o_idx+1)
		begin : LBL_OUTPUT_CONNECTIONS
			for (i_idx=0; i_idx<C_NUM_INPUTS; i_idx=i_idx+1)
			begin : LBL_INPUT_CONNECTIONS
				assign output_clientX_valid		[ (o_idx*C_NUM_INPUTS)	+ i_idx										]	= input_clientX_valid		[ (i_idx*C_NUM_OUTPUTS) + o_idx										];
				assign output_clientX_payload	[((o_idx*C_NUM_INPUTS)	+ i_idx)*C_PACKET_WIDTH +: C_PACKET_WIDTH	]	= input_clientX_payload		[((i_idx*C_NUM_OUTPUTS) + o_idx)*C_PACKET_WIDTH +: C_PACKET_WIDTH	];
				assign input_clientX_accept		[ (i_idx*C_NUM_OUTPUTS) + o_idx										]	= output_clientX_accept		[ (o_idx*C_NUM_INPUTS)	+ i_idx										];
			end
		end
	endgenerate
	
endmodule
