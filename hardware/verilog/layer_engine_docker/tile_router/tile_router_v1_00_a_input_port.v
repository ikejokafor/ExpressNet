`timescale 1ns / 1ns

module tile_router_v1_00_a_input_port
(
	clk,
	rst,
	
	input_valid,
	input_accept,
	input_payload,
	
	clientX_valid,
	clientX_accept,
	clientX_payload
);

`include "math.vh"
`include "tile_router_v1_00_a_defines.vh"

	parameter C_NUM_CLIENTS 		= 2;
	parameter C_ADDRESS_X			= 0;
	parameter C_ADDRESS_Y			= 0;
	parameter C_PORT_TYPE 			= `PORT_TYPE_EAST;
	
	localparam C_LOG2_NUM_CLIENTS 	= clog2(C_NUM_CLIENTS);
	parameter C_PACKET_WIDTH		= 66;
	
	input													clk						;
	input													rst						;
	
	input													input_valid				;
	output	reg												input_accept			;
	input			[C_PACKET_WIDTH-1:0]					input_payload			;
	
	output			[C_NUM_CLIENTS-1:0]						clientX_valid			;
	input			[C_NUM_CLIENTS-1:0]						clientX_accept			;
	output			[(C_PACKET_WIDTH*C_NUM_CLIENTS)-1:0]	clientX_payload			;
	
	reg	[C_PACKET_WIDTH-1:0]		input_reg[1:0];
	reg	[C_PACKET_WIDTH-1:0]		input_payload_t;
	reg								input_reg_valid;
	reg	[7:0]						input_reg_routed = 8'b0000_0000;
	reg	[7:0]						route_reg;
	reg								route_reg_valid;
	wire							client_accepted;
	
	always @*
	begin
		input_payload_t = input_payload;
		if (C_PORT_TYPE == `PORT_TYPE_PE0 || C_PORT_TYPE == `PORT_TYPE_PE1 || C_PORT_TYPE == `PORT_TYPE_PE2 || C_PORT_TYPE == `PORT_TYPE_PE3)
		begin
			input_payload_t[`SRC_DST_PE_FIELD] = C_PORT_TYPE;
		end
	end
	
	generate
	// Routing is dependent on the type of port that the packet is being injected on (EAST,WEST,NORTH,SOUTH,PE0,PE1,PE2,PE3)
	// WESTWARD  BOUND TRAFFIC (i.e being routed by the  east input port) can either (1) continue westward,  (2) become northward bound, or (3) terminate at SRC_DST_PE
	// EASTWARD  BOUND TRAFFIC (i.e being routed by the  west input port) can either (1) continue eastward,  (2) become southward bound, or (3) terminate at SRC_DST_PE
	// SOUTHWARD BOUND TRAFFIC (i.e being routed by the north input port) can either (1) continue southward, (2) become  eastward bound, or (3) terminate at SRC_DST_PE
	// NORTHWARD BOUND TRAFFIC (i.e being routed by the south input port) can either (1) continue northward, (2) become  westward bound, or (3) terminate at SRC_DST_PE
	// PE0 ORIGINATING TRAFFIC can either (1) become northward, (2) become westward,  or (3) terminate back at PE0
	// PE1 ORIGINATING TRAFFIC can either (1) become southward, (2) become eastward,  or (3) terminate back at PE1
	// PE2 ORIGINATING TRAFFIC can either (1) become westward,  (2) become northward, or (3) terminate back at PE2
	// PE3 ORIGINATING TRAFFIC can either (1) become eastward,  (2) become southward, or (3) terminate back at PE3
		if (C_PORT_TYPE == `PORT_TYPE_EAST)
		begin : LBL_EAST_PORT
			always @*
			begin
				if ((input_reg[0][`DST_ADDRESS_X_FIELD] == C_ADDRESS_X) && (input_reg[0][`DST_ADDRESS_Y_FIELD] == C_ADDRESS_Y))
				begin
					input_reg_routed <= 8'b1 << input_reg[0][`SRC_DST_PE_FIELD] ;
				end
				else 
				if ((input_reg[0][`DST_ADDRESS_X_FIELD] == C_ADDRESS_X) && (input_reg[0][`DST_ADDRESS_Y_FIELD] != C_ADDRESS_Y))
				begin
					input_reg_routed <= `ROUTE_VECTOR_NORTH;
				end
				else
				if ((input_reg[0][`DST_ADDRESS_X_FIELD] != C_ADDRESS_X) && (input_reg[0][`DST_ADDRESS_Y_FIELD] == C_ADDRESS_Y))
				begin
					input_reg_routed <= `ROUTE_VECTOR_WEST;
				end
				else
				begin
					input_reg_routed <= `ROUTE_VECTOR_WEST;
				end
			end
		end
		else
		if (C_PORT_TYPE == `PORT_TYPE_WEST)
		begin : LBL_WEST_PORT
			always @*
			begin
				if ((input_reg[0][`DST_ADDRESS_X_FIELD] == C_ADDRESS_X) && (input_reg[0][`DST_ADDRESS_Y_FIELD] == C_ADDRESS_Y))
				begin
					input_reg_routed <= 8'b1 << input_reg[0][`SRC_DST_PE_FIELD] ;
				end
				else 
				if ((input_reg[0][`DST_ADDRESS_X_FIELD] == C_ADDRESS_X) && (input_reg[0][`DST_ADDRESS_Y_FIELD] != C_ADDRESS_Y))
				begin
					input_reg_routed <= `ROUTE_VECTOR_SOUTH;
				end
				else
				if ((input_reg[0][`DST_ADDRESS_X_FIELD] != C_ADDRESS_X) && (input_reg[0][`DST_ADDRESS_Y_FIELD] == C_ADDRESS_Y))
				begin
					input_reg_routed <= `ROUTE_VECTOR_EAST;
				end
				else
				begin
					input_reg_routed <= `ROUTE_VECTOR_EAST;
				end
			end
		end
		else
		if (C_PORT_TYPE == `PORT_TYPE_NORTH)
		begin : LBL_NORTH_PORT
			always @*
			begin
				if ((input_reg[0][`DST_ADDRESS_Y_FIELD] == C_ADDRESS_Y) && (input_reg[0][`DST_ADDRESS_X_FIELD] == C_ADDRESS_X))
				begin
					input_reg_routed <= 8'b1 << input_reg[0][`SRC_DST_PE_FIELD];
				end
				else 
				if ((input_reg[0][`DST_ADDRESS_Y_FIELD] == C_ADDRESS_Y) && (input_reg[0][`DST_ADDRESS_X_FIELD] != C_ADDRESS_X))
				begin
					input_reg_routed <= `ROUTE_VECTOR_EAST;
				end
				else
				if ((input_reg[0][`DST_ADDRESS_Y_FIELD] != C_ADDRESS_Y) && (input_reg[0][`DST_ADDRESS_X_FIELD] == C_ADDRESS_X))
				begin
					input_reg_routed <= `ROUTE_VECTOR_SOUTH;
				end
				else
				begin
					input_reg_routed <= `ROUTE_VECTOR_SOUTH;
				end
			end
		end
		else
		if (C_PORT_TYPE == `PORT_TYPE_SOUTH)
		begin : LBL_SOUTH_PORT
			always @*
			begin
				if ((input_reg[0][`DST_ADDRESS_Y_FIELD] == C_ADDRESS_Y) && (input_reg[0][`DST_ADDRESS_X_FIELD] == C_ADDRESS_X))
				begin
					input_reg_routed <= 8'b1 << input_reg[0][`SRC_DST_PE_FIELD];
				end
				else 
				if ((input_reg[0][`DST_ADDRESS_Y_FIELD] == C_ADDRESS_Y) && (input_reg[0][`DST_ADDRESS_X_FIELD] != C_ADDRESS_X))
				begin
					input_reg_routed <= `ROUTE_VECTOR_WEST;
				end
				else
				if ((input_reg[0][`DST_ADDRESS_Y_FIELD] != C_ADDRESS_Y) && (input_reg[0][`DST_ADDRESS_X_FIELD] == C_ADDRESS_X))
				begin
					input_reg_routed <= `ROUTE_VECTOR_NORTH;
				end
				else
				begin
					input_reg_routed <= `ROUTE_VECTOR_NORTH;
				end
			end
		end
		else
		if (C_PORT_TYPE == `PORT_TYPE_PE0)
		begin : LBL_PE0_PORT
			always @*
			begin
				if ((input_reg[0][`DST_ADDRESS_X_FIELD] == C_ADDRESS_X) && (input_reg[0][`DST_ADDRESS_Y_FIELD] == C_ADDRESS_Y))
				begin
					input_reg_routed <= 8'b1 << input_reg[0][`SRC_DST_PE_FIELD];
				end
				else 
				if ((input_reg[0][`DST_ADDRESS_X_FIELD] == C_ADDRESS_X) && (input_reg[0][`DST_ADDRESS_Y_FIELD] != C_ADDRESS_Y))
				begin
					input_reg_routed <= `ROUTE_VECTOR_NORTH;
				end
				else
				if ((input_reg[0][`DST_ADDRESS_X_FIELD] != C_ADDRESS_X) && (input_reg[0][`DST_ADDRESS_Y_FIELD] == C_ADDRESS_Y))
				begin
					input_reg_routed <= `ROUTE_VECTOR_WEST;
				end
				else
				begin
					input_reg_routed <= `ROUTE_VECTOR_WEST;
				end
			end
		end
		else
		if (C_PORT_TYPE == `PORT_TYPE_PE1)
		begin : LBL_PE1_PORT
			always @*
			begin
				if ((input_reg[0][`DST_ADDRESS_X_FIELD] == C_ADDRESS_X) && (input_reg[0][`DST_ADDRESS_Y_FIELD] == C_ADDRESS_Y))
				begin
					input_reg_routed <= 8'b1 << input_reg[0][`SRC_DST_PE_FIELD];
				end
				else 
				if ((input_reg[0][`DST_ADDRESS_X_FIELD] == C_ADDRESS_X) && (input_reg[0][`DST_ADDRESS_Y_FIELD] != C_ADDRESS_Y))
				begin
					input_reg_routed <= `ROUTE_VECTOR_SOUTH;
				end
				else
				if ((input_reg[0][`DST_ADDRESS_X_FIELD] != C_ADDRESS_X) && (input_reg[0][`DST_ADDRESS_Y_FIELD] == C_ADDRESS_Y))
				begin
					input_reg_routed <= `ROUTE_VECTOR_EAST;
				end
				else
				begin
					input_reg_routed <= `ROUTE_VECTOR_EAST;
				end
			end
		end
		else
		if (C_PORT_TYPE == `PORT_TYPE_PE2)
		begin : LBL_PE2_PORT
			always @*
			begin
				if ((input_reg[0][`DST_ADDRESS_Y_FIELD] == C_ADDRESS_Y) && (input_reg[0][`DST_ADDRESS_X_FIELD] == C_ADDRESS_X))
				begin
					input_reg_routed <= 8'b1 << input_reg[0][`SRC_DST_PE_FIELD];
				end
				else 
				if ((input_reg[0][`DST_ADDRESS_Y_FIELD] == C_ADDRESS_Y) && (input_reg[0][`DST_ADDRESS_X_FIELD] != C_ADDRESS_X))
				begin
					input_reg_routed <= `ROUTE_VECTOR_EAST;
				end
				else
				if ((input_reg[0][`DST_ADDRESS_Y_FIELD] != C_ADDRESS_Y) && (input_reg[0][`DST_ADDRESS_X_FIELD] == C_ADDRESS_X))
				begin
					input_reg_routed <= `ROUTE_VECTOR_SOUTH;
				end
				else
				begin
					input_reg_routed <= `ROUTE_VECTOR_SOUTH;
				end
			end
		end
		else
		if (C_PORT_TYPE == `PORT_TYPE_PE3)
		begin : LBL_PE3_PORT
			always @*
			begin
				if ((input_reg[0][`DST_ADDRESS_Y_FIELD] == C_ADDRESS_Y) && (input_reg[0][`DST_ADDRESS_X_FIELD] == C_ADDRESS_X))
				begin
					input_reg_routed <= 8'b1 << input_reg[0][`SRC_DST_PE_FIELD];
				end
				else 
				if ((input_reg[0][`DST_ADDRESS_Y_FIELD] == C_ADDRESS_Y) && (input_reg[0][`DST_ADDRESS_X_FIELD] != C_ADDRESS_X))
				begin
					input_reg_routed <= `ROUTE_VECTOR_WEST;
				end
				else
				if ((input_reg[0][`DST_ADDRESS_Y_FIELD] != C_ADDRESS_Y) && (input_reg[0][`DST_ADDRESS_X_FIELD] == C_ADDRESS_X))
				begin
					input_reg_routed <= `ROUTE_VECTOR_NORTH;
				end
				else
				begin
					input_reg_routed <= `ROUTE_VECTOR_NORTH;
				end
			end
		end
	endgenerate
	
	always @*
	begin
		case ({input_valid,client_accepted,input_reg_valid,route_reg_valid})
			4'b0000 : begin input_accept <= 1'b0; end
			4'b0001 : begin input_accept <= 1'b0; end
			4'b0010 : begin input_accept <= 1'b0; end
			4'b0011 : begin input_accept <= 1'b0; end
			4'b0100 : begin input_accept <= 1'b0; end
			4'b0101 : begin input_accept <= 1'b0; end
			4'b0110 : begin input_accept <= 1'b0; end
			4'b0111 : begin input_accept <= 1'b0; end
			4'b1000 : begin input_accept <= 1'b1; end
			4'b1001 : begin input_accept <= 1'b1; end
			4'b1010 : begin input_accept <= 1'b1; end
			4'b1011 : begin input_accept <= 1'b0; end
			4'b1100 : begin input_accept <= 1'b1; end
			4'b1101 : begin input_accept <= 1'b1; end
			4'b1110 : begin input_accept <= 1'b1; end
			4'b1111 : begin input_accept <= 1'b1; end
			default : begin input_accept <= 1'b0; end
		endcase
	end
	
	always @(posedge clk)
	begin
		if (rst)
		begin
			input_reg[0]		<= {C_PACKET_WIDTH{1'b0}};
			input_reg[1]		<= {C_PACKET_WIDTH{1'b0}};
			input_reg_valid 	<= 1'b0;
			route_reg			<= 8'b0;
			route_reg_valid		<= 1'b0;
		end
		else
		begin
			case ({input_valid,client_accepted,input_reg_valid,route_reg_valid})
				4'b0000 : begin input_reg[0] <= 64'b0; 				input_reg_valid <= 1'b0; end
				4'b0001 : begin input_reg[0] <= 64'b0; 				input_reg_valid <= 1'b0; end
				4'b0010 : begin input_reg[0] <= 64'b0; 				input_reg_valid <= 1'b0; end
				4'b0011 : begin input_reg[0] <= input_reg[0];		input_reg_valid <= 1'b1; end
				4'b0100 : begin input_reg[0] <= 64'b0; 				input_reg_valid <= 1'b0; end
				4'b0101 : begin input_reg[0] <= 64'b0; 				input_reg_valid <= 1'b0; end
				4'b0110 : begin input_reg[0] <= 64'b0; 				input_reg_valid <= 1'b0; end
				4'b0111 : begin input_reg[0] <= 64'b0; 				input_reg_valid <= 1'b0; end
				4'b1000 : begin input_reg[0] <= input_payload_t; 	input_reg_valid <= 1'b1; end
				4'b1001 : begin input_reg[0] <= input_payload_t; 	input_reg_valid <= 1'b1; end
				4'b1010 : begin input_reg[0] <= input_payload_t; 	input_reg_valid <= 1'b1; end
				4'b1011 : begin input_reg[0] <= input_reg[0];		input_reg_valid <= 1'b1; end
				4'b1100 : begin input_reg[0] <= input_payload_t; 	input_reg_valid <= 1'b1; end
				4'b1101 : begin input_reg[0] <= input_payload_t; 	input_reg_valid <= 1'b1; end
				4'b1110 : begin input_reg[0] <= input_payload_t; 	input_reg_valid <= 1'b1; end
				4'b1111 : begin input_reg[0] <= input_payload_t; 	input_reg_valid <= 1'b1; end
			endcase
			
			case ({input_valid,client_accepted,input_reg_valid,route_reg_valid})
				4'b0000 : begin input_reg[1] <= input_reg[1]; 	end
				4'b0001 : begin input_reg[1] <= input_reg[1]; 	end
				4'b0010 : begin input_reg[1] <= input_reg[0]; 	end
				4'b0011 : begin input_reg[1] <= input_reg[1]; 	end
				4'b0100 : begin input_reg[1] <= input_reg[1];	end
				4'b0101 : begin input_reg[1] <= input_reg[1]; 	end
				4'b0110 : begin input_reg[1] <= input_reg[0]; 	end
				4'b0111 : begin input_reg[1] <= input_reg[0]; 	end
				4'b1000 : begin input_reg[1] <= input_reg[1]; 	end
				4'b1001 : begin input_reg[1] <= input_reg[1]; 	end
				4'b1010 : begin input_reg[1] <= input_reg[0]; 	end
				4'b1011 : begin input_reg[1] <= input_reg[1]; 	end
				4'b1100 : begin input_reg[1] <= input_reg[1]; 	end
				4'b1101 : begin input_reg[1] <= input_reg[1]; 	end
				4'b1110 : begin input_reg[1] <= input_reg[0]; 	end
				4'b1111 : begin input_reg[1] <= input_reg[0]; 	end
			endcase
			
			case ({input_valid,client_accepted,input_reg_valid,route_reg_valid})
				4'b0000 : begin route_reg <= 8'b0; 				route_reg_valid <= 1'b0; end
				4'b0001 : begin route_reg <= route_reg; 		route_reg_valid <= 1'b1; end
				4'b0010 : begin route_reg <= input_reg_routed; 	route_reg_valid <= 1'b1; end
				4'b0011 : begin route_reg <= route_reg; 		route_reg_valid <= 1'b1; end
				4'b0100 : begin route_reg <= 8'b0; 				route_reg_valid <= 1'b0; end
				4'b0101 : begin route_reg <= 8'b0; 				route_reg_valid <= 1'b0; end
				4'b0110 : begin route_reg <= input_reg_routed; 	route_reg_valid <= 1'b1; end
				4'b0111 : begin route_reg <= input_reg_routed; 	route_reg_valid <= 1'b1; end
				4'b1000 : begin route_reg <= 8'b0; 				route_reg_valid <= 1'b0; end
				4'b1001 : begin route_reg <= route_reg; 		route_reg_valid <= 1'b1; end
				4'b1010 : begin route_reg <= input_reg_routed; 	route_reg_valid <= 1'b1; end
				4'b1011 : begin route_reg <= route_reg; 		route_reg_valid <= 1'b1; end
				4'b1100 : begin route_reg <= 8'b0; 				route_reg_valid <= 1'b0; end
				4'b1101 : begin route_reg <= 8'b0; 				route_reg_valid <= 1'b0; end
				4'b1110 : begin route_reg <= input_reg_routed; 	route_reg_valid <= 1'b1; end
				4'b1111 : begin route_reg <= input_reg_routed; 	route_reg_valid <= 1'b1; end
			endcase
		end
	end
	
	assign clientX_valid = route_reg[C_NUM_CLIENTS-1:0];
	assign clientX_payload = {C_NUM_CLIENTS{input_reg[1]}};
	assign client_accepted = |(clientX_accept & clientX_valid);
	
endmodule