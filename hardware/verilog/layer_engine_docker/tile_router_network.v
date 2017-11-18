
module tile_router_network (
	network_clk			,
	network_rst			,
	
	pe_clk				,
	
	pe_input_valid		,
	pe_input_accept		,
	pe_input_data		,
	
	pe_output_valid		,
	pe_output_accept	,
	pe_output_data
);
	
`include "tile_router_v1_00_a_defines.vh"

	parameter	C_NUM_ROWS 		= 4;
	parameter	C_NUM_COLS 		= 4;
	parameter 	C_NUM_PE		= 4;
	parameter 	C_PACKET_WIDTH	= 66;
	
	input															network_clk;
	input															network_rst;
	input															pe_clk;
	
	input	[(C_NUM_ROWS*C_NUM_COLS*C_NUM_PE*1)				-1:0]	pe_input_valid;
	output	[(C_NUM_ROWS*C_NUM_COLS*C_NUM_PE*1)				-1:0]	pe_input_accept;
	input	[(C_NUM_ROWS*C_NUM_COLS*C_NUM_PE*C_PACKET_WIDTH)-1:0]	pe_input_data;
	
	output	[(C_NUM_ROWS*C_NUM_COLS*C_NUM_PE*1)				-1:0]	pe_output_valid;
	input	[(C_NUM_ROWS*C_NUM_COLS*C_NUM_PE*1)				-1:0]	pe_output_accept;
	output	[(C_NUM_ROWS*C_NUM_COLS*C_NUM_PE*C_PACKET_WIDTH)-1:0]	pe_output_data;
	
	
	localparam C_NUM_CARDINAL_PORTS		= 4;
	localparam C_COL_DATA_WIDTH_BITS	= C_NUM_CARDINAL_PORTS * C_PACKET_WIDTH;
	localparam C_COL_CNTL_WIDTH_BITS	= C_NUM_CARDINAL_PORTS * 1;
		
	localparam C_ROW_DATA_WIDTH_BITS 	= C_NUM_COLS * C_COL_DATA_WIDTH_BITS;
	localparam C_ROW_CNTL_WIDTH_BITS 	= C_NUM_COLS * C_COL_CNTL_WIDTH_BITS;
		
	localparam C_PORT_TYPE_EAST			= `PORT_TYPE_EAST  - `PORT_TYPE_EAST;
	localparam C_PORT_TYPE_WEST			= `PORT_TYPE_WEST  - `PORT_TYPE_EAST;
	localparam C_PORT_TYPE_NORTH		= `PORT_TYPE_NORTH - `PORT_TYPE_EAST;
	localparam C_PORT_TYPE_SOUTH		= `PORT_TYPE_SOUTH - `PORT_TYPE_EAST;
		
	wire	[0:(C_NUM_ROWS * C_NUM_COLS * C_NUM_CARDINAL_PORTS*1)				-1]		cardinal_input_valid;
	wire	[0:(C_NUM_ROWS * C_NUM_COLS * C_NUM_CARDINAL_PORTS*1)				-1]		cardinal_input_accept;
	wire	[0:(C_NUM_ROWS * C_NUM_COLS * C_NUM_CARDINAL_PORTS*C_PACKET_WIDTH)	-1]		cardinal_input_payload;
	
	wire	[0:(C_NUM_ROWS * C_NUM_COLS * C_NUM_CARDINAL_PORTS*1)				-1]		cardinal_output_valid;
	wire	[0:(C_NUM_ROWS * C_NUM_COLS * C_NUM_CARDINAL_PORTS*1)				-1]		cardinal_output_accept;
	wire	[0:(C_NUM_ROWS * C_NUM_COLS * C_NUM_CARDINAL_PORTS*C_PACKET_WIDTH)	-1]		cardinal_output_payload;
	
	
	genvar r,c,p;
	
	generate
		for (r=0; r<C_NUM_ROWS; r++)
		begin
			for (c=0; c<C_NUM_COLS; c++)
			begin
				
				tile_router_v1_00_a
				#(
					.C_ADDRESS_Y	( r              ),
					.C_ADDRESS_X	( c              ),
                    .C_PACKET_WIDTH ( C_PACKET_WIDTH )
				)
				tile (
					.clk			(network_clk),
					.rst			(network_rst),
					
					.input_valid	({
										cardinal_input_valid	[(r*C_ROW_CNTL_WIDTH_BITS + c*C_COL_CNTL_WIDTH_BITS) +: C_COL_CNTL_WIDTH_BITS],
										pe_input_valid			[(r*C_ROW_CNTL_WIDTH_BITS + c*C_COL_CNTL_WIDTH_BITS) +: C_COL_CNTL_WIDTH_BITS]
									}),
									
					.input_accept	({
										cardinal_input_accept	[(r*C_ROW_CNTL_WIDTH_BITS + c*C_COL_CNTL_WIDTH_BITS) +: C_COL_CNTL_WIDTH_BITS],
										pe_input_accept			[(r*C_ROW_CNTL_WIDTH_BITS + c*C_COL_CNTL_WIDTH_BITS) +: C_COL_CNTL_WIDTH_BITS]
									}),
									
					.input_payload	({
										cardinal_input_payload	[(r*C_ROW_DATA_WIDTH_BITS + c*C_COL_DATA_WIDTH_BITS) +: C_COL_DATA_WIDTH_BITS],
										pe_input_data			[(r*C_ROW_DATA_WIDTH_BITS + c*C_COL_DATA_WIDTH_BITS) +: C_COL_DATA_WIDTH_BITS]
									}),
						
					.output_valid	({
										cardinal_output_valid	[(r*C_ROW_CNTL_WIDTH_BITS + c*C_COL_CNTL_WIDTH_BITS) +: C_COL_CNTL_WIDTH_BITS],
										pe_output_valid			[(r*C_ROW_CNTL_WIDTH_BITS + c*C_COL_CNTL_WIDTH_BITS) +: C_COL_CNTL_WIDTH_BITS]
									}),
									
					.output_accept	({
										cardinal_output_accept	[(r*C_ROW_CNTL_WIDTH_BITS + c*C_COL_CNTL_WIDTH_BITS) +: C_COL_CNTL_WIDTH_BITS],
										pe_output_accept		[(r*C_ROW_CNTL_WIDTH_BITS + c*C_COL_CNTL_WIDTH_BITS) +: C_COL_CNTL_WIDTH_BITS]
									}),
										
					.output_payload	({
										cardinal_output_payload	[(r*C_ROW_DATA_WIDTH_BITS + c*C_COL_DATA_WIDTH_BITS) +: C_COL_DATA_WIDTH_BITS],
										pe_output_data			[(r*C_ROW_DATA_WIDTH_BITS + c*C_COL_DATA_WIDTH_BITS) +: C_COL_DATA_WIDTH_BITS]
									})
				);
				
				assign cardinal_input_valid		[(r*C_ROW_CNTL_WIDTH_BITS + ((c+1)%C_NUM_COLS)*C_COL_CNTL_WIDTH_BITS + C_PORT_TYPE_WEST)] 									= cardinal_output_valid 	[(r*C_ROW_CNTL_WIDTH_BITS +                  c*C_COL_CNTL_WIDTH_BITS + C_PORT_TYPE_EAST)];
				assign cardinal_input_payload	[(r*C_ROW_DATA_WIDTH_BITS + ((c+1)%C_NUM_COLS)*C_COL_DATA_WIDTH_BITS + C_PORT_TYPE_WEST*C_PACKET_WIDTH) +: C_PACKET_WIDTH] 	= cardinal_output_payload	[(r*C_ROW_DATA_WIDTH_BITS +                  c*C_COL_DATA_WIDTH_BITS + C_PORT_TYPE_EAST*C_PACKET_WIDTH) +: C_PACKET_WIDTH];
				assign cardinal_output_accept	[(r*C_ROW_CNTL_WIDTH_BITS +                  c*C_COL_CNTL_WIDTH_BITS + C_PORT_TYPE_EAST)]									= cardinal_input_accept		[(r*C_ROW_CNTL_WIDTH_BITS + ((c+1)%C_NUM_COLS)*C_COL_CNTL_WIDTH_BITS + C_PORT_TYPE_WEST)];
									
				assign cardinal_input_valid		[(r*C_ROW_CNTL_WIDTH_BITS +                  c*C_COL_CNTL_WIDTH_BITS + C_PORT_TYPE_EAST)] 									= cardinal_output_valid 	[(r*C_ROW_CNTL_WIDTH_BITS + ((c+1)%C_NUM_COLS)*C_COL_CNTL_WIDTH_BITS + C_PORT_TYPE_WEST)];
				assign cardinal_input_payload	[(r*C_ROW_DATA_WIDTH_BITS +                  c*C_COL_DATA_WIDTH_BITS + C_PORT_TYPE_EAST*C_PACKET_WIDTH) +: C_PACKET_WIDTH] 	= cardinal_output_payload	[(r*C_ROW_DATA_WIDTH_BITS + ((c+1)%C_NUM_COLS)*C_COL_DATA_WIDTH_BITS + C_PORT_TYPE_WEST*C_PACKET_WIDTH) +: C_PACKET_WIDTH];
				assign cardinal_output_accept	[(r*C_ROW_CNTL_WIDTH_BITS + ((c+1)%C_NUM_COLS)*C_COL_CNTL_WIDTH_BITS + C_PORT_TYPE_WEST)]									= cardinal_input_accept		[(r*C_ROW_CNTL_WIDTH_BITS +                  c*C_COL_CNTL_WIDTH_BITS + C_PORT_TYPE_EAST)];
				
				assign cardinal_input_valid		[(((r+1)%C_NUM_ROWS)*C_ROW_CNTL_WIDTH_BITS + c*C_COL_CNTL_WIDTH_BITS + C_PORT_TYPE_SOUTH)] 									= cardinal_output_valid 	[(                 r*C_ROW_CNTL_WIDTH_BITS + c*C_COL_CNTL_WIDTH_BITS + C_PORT_TYPE_NORTH)];
				assign cardinal_input_payload	[(((r+1)%C_NUM_ROWS)*C_ROW_DATA_WIDTH_BITS + c*C_COL_DATA_WIDTH_BITS + C_PORT_TYPE_SOUTH*C_PACKET_WIDTH) +: C_PACKET_WIDTH] = cardinal_output_payload	[(                 r*C_ROW_DATA_WIDTH_BITS + c*C_COL_DATA_WIDTH_BITS + C_PORT_TYPE_NORTH*C_PACKET_WIDTH) +: C_PACKET_WIDTH];
				assign cardinal_output_accept	[(                 r*C_ROW_CNTL_WIDTH_BITS + c*C_COL_CNTL_WIDTH_BITS + C_PORT_TYPE_NORTH)]									= cardinal_input_accept		[(((r+1)%C_NUM_ROWS)*C_ROW_CNTL_WIDTH_BITS + c*C_COL_CNTL_WIDTH_BITS + C_PORT_TYPE_SOUTH)];
									
				assign cardinal_input_valid		[(                 r*C_ROW_CNTL_WIDTH_BITS + c*C_COL_CNTL_WIDTH_BITS + C_PORT_TYPE_NORTH)] 									= cardinal_output_valid 	[(((r+1)%C_NUM_ROWS)*C_ROW_CNTL_WIDTH_BITS + c*C_COL_CNTL_WIDTH_BITS + C_PORT_TYPE_SOUTH)];
				assign cardinal_input_payload	[(                 r*C_ROW_DATA_WIDTH_BITS + c*C_COL_DATA_WIDTH_BITS + C_PORT_TYPE_NORTH*C_PACKET_WIDTH) +: C_PACKET_WIDTH] = cardinal_output_payload	[(((r+1)%C_NUM_ROWS)*C_ROW_DATA_WIDTH_BITS + c*C_COL_DATA_WIDTH_BITS + C_PORT_TYPE_SOUTH*C_PACKET_WIDTH) +: C_PACKET_WIDTH];
				assign cardinal_output_accept	[(((r+1)%C_NUM_ROWS)*C_ROW_CNTL_WIDTH_BITS + c*C_COL_CNTL_WIDTH_BITS + C_PORT_TYPE_SOUTH)]									= cardinal_input_accept		[(                 r*C_ROW_CNTL_WIDTH_BITS + c*C_COL_CNTL_WIDTH_BITS + C_PORT_TYPE_NORTH)];
				
			end
		end
	endgenerate

endmodule