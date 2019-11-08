
module ingress_interface_packetizer
(
	clk,
	rst,

	mode,
	option,
	
	ingress_valid,
	ingress_ready,
	ingress_data,
	
	egress_valid,
	egress_ready,
	egress_data
);

`include "cnn_layer_accel_defines.vh"

parameter C_PACKET_PAYLOAD_WIDTH 	= 128;
parameter C_PACKET_HEADER_WIDTH 	= 16;
parameter C_PACKET_WIDTH 			= C_PACKET_PAYLOAD_WIDTH + C_PACKET_HEADER_WIDTH;

	input 										clk;
	input										rst;
	
	input		[1:0]							mode;
	input		[7:0]							option;
	
	input										ingress_valid;
	output										ingress_ready;
	input		[C_PACKET_PAYLOAD_WIDTH-1:0]	ingress_data;
	
	output										egress_valid;
	input										egress_ready;
	output	reg	[C_PACKET_WIDTH-1:0]			egress_data;
	
	wire		[11:0]							destination_address_yx_pe;
	reg											skid_occupied;
	
	assign destination_address_yx_pe = (mode == `PACKETIZER_MODE_ROUTE_MATCH) ? {4'b0,ingress_data[`MATCH_MODEL_ID_HIGH -: 6]} : {4'b0,option[5:0]};
	
	always @(posedge clk)
	begin
		if (rst)
		begin
			egress_data		<= {C_PACKET_WIDTH{1'b0}};
			skid_occupied 	<= 1'b0;
		end
		else
		begin
			case ({skid_occupied,egress_ready,ingress_valid})
				3'b001 :
					begin
						egress_data[`PACKET_PAYLOAD_FIELD]		<= ingress_data;
						egress_data[`PACKET_HEADER_DEST_FIELD] 	<= destination_address_yx_pe;
						skid_occupied 							<= 1'b1;
					end
				3'b011 :
					begin
						egress_data[`PACKET_PAYLOAD_FIELD]		<= ingress_data;
						egress_data[`PACKET_HEADER_DEST_FIELD] 	<= destination_address_yx_pe;
						skid_occupied							<= 1'b1;
					end
				3'b110 :
					begin
						skid_occupied							<= 1'b0;
					end
				3'b111 :
					begin
						egress_data[`PACKET_PAYLOAD_FIELD]		<= ingress_data;
						egress_data[`PACKET_HEADER_DEST_FIELD] 	<= destination_address_yx_pe;
						skid_occupied							<= 1'b1;
					end
				default :
					begin
						egress_data								<= egress_data;
						skid_occupied							<= skid_occupied;
					end
			endcase
		end
	end
	
	assign egress_valid 	= skid_occupied;
	assign ingress_ready 	= ~skid_occupied | (skid_occupied & egress_ready);
endmodule
