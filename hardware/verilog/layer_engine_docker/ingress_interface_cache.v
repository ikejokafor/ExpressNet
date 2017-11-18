
module ingress_interface_cache
(
	clk,
	rst,
	
	command_request,
	command_info,
	command_accept,
	command_complete,
	
	ingress_valid,
	ingress_ready,
	ingress_data,
	
	egress_valid,
	egress_ready,
	egress_data
);
	`include "math.vh"
	`include "cnn_layer_accel_defines.vh"
	
	parameter 	C_CACHE_SIZE			= 4096;
	parameter 	C_PACKET_WIDTH 			= 66;
	
	localparam 	C_COMMAND_INFO_WIDTH 	= `MATCH_CACHE_COMMAND_INFO_WIDTH;
	
	input 									clk						;
	input									rst						;
	
	input									command_request			;
	input		[C_COMMAND_INFO_WIDTH-1:0] 	command_info			;
	output	reg								command_accept			;
	output	reg								command_complete		;
	
	input									ingress_valid			;
	output	reg								ingress_ready			;
	input		[C_PACKET_WIDTH-1:0]		ingress_data			;
	
	output	reg								egress_valid			;
	input									egress_ready			;
	output	reg	[C_PACKET_WIDTH-1:0]		egress_data				;

	localparam	ST_IDLE 			= 8'b00000001;
	localparam	ST_INIT_READ 		= 8'b00000010;
	localparam	ST_READ 			= 8'b00000100;
	localparam	ST_INIT_LOAD 		= 8'b00001000;
	localparam	ST_LOAD 			= 8'b00010000;
	localparam	ST_BYPASS			= 8'b00100000;
	localparam	ST_BYPASS_AND_CACHE	= 8'b01000000;
	localparam	ST_CLEAR 			= 8'b10000000;
	
	localparam	C_LOG2_CACHE_SIZE = clog2(C_CACHE_SIZE);
	
	reg		[C_LOG2_CACHE_SIZE-1:0]			write_index				;
	reg										write_enable			;
	wire	[C_LOG2_CACHE_SIZE-1:0]			read_index				;
	reg		[C_LOG2_CACHE_SIZE-1:0]			read_index_r			;
	reg		[C_LOG2_CACHE_SIZE-1:0]			read_index_plus_one		;
	reg		[C_LOG2_CACHE_SIZE-1:0]			match_cache_occupancy	;
	reg		[C_LOG2_CACHE_SIZE-1:0]			match_cache_load_count	;
	
	reg		[C_PACKET_WIDTH-1:0]			match_cache		[C_CACHE_SIZE-1:0];
	reg		[C_PACKET_WIDTH-1:0]			match_cache_dataout		;
	
	reg		[7:0]							state;
	
	
	assign read_index 	= (egress_valid & egress_ready & (state == ST_READ)) ? read_index_plus_one : read_index_r;
		
	always @(posedge clk)
	begin
		match_cache_dataout <= match_cache[read_index];
	end
	
	always @(posedge clk)
	begin
		if (write_enable)
			match_cache[write_index] <= ingress_data;
	end
	
	always @*
	begin
		egress_valid 	= 1'b0;
		egress_data		= {C_PACKET_WIDTH{1'b0}};
		ingress_ready 	= 1'b0;
		write_enable	= 1'b0;
				
		case (state)
			ST_BYPASS,
			ST_BYPASS_AND_CACHE :
				begin
					egress_valid 	= ingress_valid;
					egress_data		= ingress_data;
					ingress_ready 	= egress_ready;
				end
			ST_READ :
				begin
					egress_valid	= 1'b1;	
					egress_data		= match_cache_dataout;
				end
			ST_LOAD :
				begin
					write_enable	= (ingress_valid & ingress_ready);
					ingress_ready	= 1'b1;
				end
		endcase
	end
	
	always @(posedge clk)
	begin
		if (rst)
		begin
			command_complete		<= 1'b0;
			command_accept			<= 1'b0;
			read_index_r			<= {C_LOG2_CACHE_SIZE{1'b0}};
			read_index_plus_one		<= {C_LOG2_CACHE_SIZE{1'b0}} | 1'b1;
			write_index				<= {C_LOG2_CACHE_SIZE{1'b0}};
			match_cache_load_count	<= {C_LOG2_CACHE_SIZE{1'b0}};
			match_cache_occupancy	<= {C_LOG2_CACHE_SIZE{1'b0}};
			state 					<= ST_IDLE;
		end
		else
		begin
			command_accept		<= 1'b0;
			command_complete 	<= 1'b0;
			case (state)
				ST_IDLE :
					begin
						if (command_request & ~command_complete)
						begin
							case (command_info[`MATCH_CACHE_COMMAND_INFO_TYPE_FIELD])
								`MATCH_CACHE_COMMAND_TYPE_READ 	:	
									begin
										command_accept			<= 1'b1;
										state					<= ST_INIT_READ;
									end
								`MATCH_CACHE_COMMAND_TYPE_BYPASS :
									begin
										command_accept			<= 1'b1;
										match_cache_load_count	<= command_info[`MATCH_CACHE_COMMAND_INFO_LOAD_COUNT_FIELD];
										state					<= ST_BYPASS;
									end
								`MATCH_CACHE_COMMAND_TYPE_BYPASS_AND_CACHE :
									begin
										command_accept			<= 1'b1;
										match_cache_load_count	<= command_info[`MATCH_CACHE_COMMAND_INFO_LOAD_COUNT_FIELD];
										state					<= ST_BYPASS_AND_CACHE;
									end
								`MATCH_CACHE_COMMAND_TYPE_LOAD 	:
									begin
										command_accept			<= 1'b1;
										match_cache_load_count	<= command_info[`MATCH_CACHE_COMMAND_INFO_LOAD_COUNT_FIELD];
										state					<= ST_INIT_LOAD;
									end
								`MATCH_CACHE_COMMAND_TYPE_CLEAR	:
									begin
										command_accept			<= 1'b1;
										state					<= ST_CLEAR;
									end
								default :
									begin
										command_complete 		<= 1'b1;
										state					<= ST_IDLE;
									end
							endcase
						end
					end
				ST_INIT_READ :
					begin
						if (match_cache_occupancy == {C_LOG2_CACHE_SIZE{1'b0}})
						begin
							command_complete		<= 1'b1;
							state 					<= ST_IDLE;
						end
						else
						begin
							read_index_r			<= {C_LOG2_CACHE_SIZE{1'b0}};
							read_index_plus_one		<= {C_LOG2_CACHE_SIZE{1'b0}} | 1'b1;
							//Allow a cycle for read_index = 0 to update the output reg of the cache
							state					<= (read_index_r == 0) ? ST_READ : ST_INIT_READ; 
						end
					end
				ST_READ :
					begin
						if (egress_valid & egress_ready)
						begin
							read_index_r			<= read_index_r + 1;
							read_index_plus_one		<= read_index_plus_one + 1;
							
							if (read_index_plus_one == match_cache_occupancy)
							begin
								command_complete	<= 1'b1;
								state 				<= ST_IDLE;
							end
						end
					end
				ST_INIT_LOAD :
					begin
						if (match_cache_load_count == {C_LOG2_CACHE_SIZE{1'b0}})
						begin
							command_complete			<= 1'b1;
							state						<= ST_IDLE;
						end
						else
						begin
							write_index					<= match_cache_occupancy;
							state						<= ST_LOAD;
						end
					end
				ST_LOAD :	
					begin
						if (ingress_valid & ingress_ready)
						begin
							write_index					<= write_index + 1;
							match_cache_load_count		<= match_cache_load_count - 1;
							
							if (match_cache_load_count == ({C_LOG2_CACHE_SIZE{1'b0}} | 1'b1))
							begin
								match_cache_occupancy	<= match_cache_occupancy + match_cache_load_count;
								command_complete		<= 1'b1;
								state					<= ST_IDLE;
							end
						end
					end
				ST_BYPASS :
					begin
						if (ingress_valid & ingress_ready)
						begin
							match_cache_load_count		<= match_cache_load_count - 1;
							
							if (match_cache_load_count == ({C_LOG2_CACHE_SIZE{1'b0}} | 1'b1))
							begin
								command_complete		<= 1'b1;
								state					<= ST_IDLE;
							end
						end
					end
				ST_BYPASS_AND_CACHE :	
					begin
						if (ingress_valid & ingress_ready)
						begin
							write_index					<= write_index + 1;
							match_cache_load_count		<= match_cache_load_count - 1;
							
							if (match_cache_load_count == ({C_LOG2_CACHE_SIZE{1'b0}} | 1'b1))
							begin
								match_cache_occupancy	<= match_cache_occupancy + match_cache_load_count;
								command_complete		<= 1'b1;
								state					<= ST_IDLE;
							end
						end
					end
				ST_CLEAR :
					begin
						write_index						<= {C_LOG2_CACHE_SIZE{1'b0}};
						match_cache_occupancy			<= {C_LOG2_CACHE_SIZE{1'b0}};
						command_complete				<= 1'b1;
						state							<= ST_IDLE;
					end
			endcase
		end
	end
endmodule