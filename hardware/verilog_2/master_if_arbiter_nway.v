`timescale 1ns / 1ns

module master_if_arbiter_nway
(
	clk										,
	rst										,

	master_request							,
	master_request_ack						,
	master_request_complete					,
	master_request_error					,
	master_request_tag						,
	master_request_option					,
	master_request_type						,
	master_request_flow						,
	master_request_local_address			,
	master_request_length					,
	
	master_descriptor_src_rdy				,
	master_descriptor_dst_rdy				,
	master_descriptor_tag					,
	master_descriptor						,
	
	master_datain_src_rdy					,
	master_datain_dst_rdy					,
	master_datain_tag						,
	master_datain_option					,
	master_datain							,
	
	master_dataout_src_rdy					,
	master_dataout_dst_rdy					,
	master_dataout_tag						,
	master_dataout_option					,
	master_dataout							,
	
	clientX_master_request					,
	clientX_master_request_ack				,
	clientX_master_request_complete			,
	clientX_master_request_error			,
	clientX_master_request_tag				,
	clientX_master_request_option			,
	clientX_master_request_type				,
	clientX_master_request_flow				,
	clientX_master_request_local_address	,
	clientX_master_request_length			,
	
	clientX_master_descriptor_src_rdy		,
	clientX_master_descriptor_dst_rdy		,
	clientX_master_descriptor_tag			,
	clientX_master_descriptor				,
	
	clientX_master_datain_src_rdy			,
	clientX_master_datain_dst_rdy			,
	clientX_master_datain_tag				,
	clientX_master_datain_option			,
	clientX_master_datain					,
	
	clientX_master_dataout_src_rdy			,
	clientX_master_dataout_dst_rdy			,
	clientX_master_dataout_tag				,
	clientX_master_dataout_option			,
	clientX_master_dataout					
);

	parameter C_NUM_CLIENTS = 8;
	localparam C_NUM_CLIENTS_FIXED = C_NUM_CLIENTS;
	
	
	input											clk										;
	input											rst										;
// SAP Master Command Interface (Unused)
	output 											master_request							;
	input											master_request_ack						;
	input											master_request_complete					;
	input	[6	:0]									master_request_error					;
	input	[3  :0]									master_request_tag						;
	output	[3  :0]									master_request_type						;
	output	[3  :0]									master_request_option					;
	output	[9  :0]									master_request_flow						;
	output	[63 :0]									master_request_local_address			;
	output	[35 :0]									master_request_length					;
	// SAP Master Descriptor Interface (Unused)
	output											master_descriptor_src_rdy				;
	input											master_descriptor_dst_rdy				;
	input	[3  :0]									master_descriptor_tag					;
	output	[127:0]									master_descriptor						;
	// SAP Master Data Interface (Unused
	input      										master_datain_src_rdy					;
	output											master_datain_dst_rdy					;
	input	[3  :0]									master_datain_tag						;
	input	[3  :0]									master_datain_option					;
	input	[127:0]									master_datain							;
	
	output											master_dataout_src_rdy					;
	input											master_dataout_dst_rdy					;
	input	[3  :0]									master_dataout_tag						;
	input	[3  :0]									master_dataout_option					;
	output	[127:0]									master_dataout							;
	
	
	input 		[C_NUM_CLIENTS_FIXED		-1:0]	clientX_master_request					;
	output		[C_NUM_CLIENTS_FIXED		-1:0]	clientX_master_request_ack				;
	output		[C_NUM_CLIENTS_FIXED		-1:0]	clientX_master_request_complete			;
	output		[(C_NUM_CLIENTS_FIXED*7	)	-1:0]	clientX_master_request_error			;
	output		[(C_NUM_CLIENTS_FIXED*4	)	-1:0]	clientX_master_request_tag				;
	input		[(C_NUM_CLIENTS_FIXED*4	)	-1:0]	clientX_master_request_type				;
	input		[(C_NUM_CLIENTS_FIXED*4	)	-1:0]	clientX_master_request_option			;
	input		[(C_NUM_CLIENTS_FIXED*10)	-1:0]	clientX_master_request_flow				;
	input		[(C_NUM_CLIENTS_FIXED*64)	-1:0]	clientX_master_request_local_address	;
	input		[(C_NUM_CLIENTS_FIXED*36)	-1:0]	clientX_master_request_length			;
	// SAP Master Descriptor Interface (Unused)
	input		[C_NUM_CLIENTS_FIXED		-1:0]	clientX_master_descriptor_src_rdy		;
	output		[C_NUM_CLIENTS_FIXED		-1:0]	clientX_master_descriptor_dst_rdy		;
	output		[(C_NUM_CLIENTS_FIXED*4)	-1:0]	clientX_master_descriptor_tag			;
	input		[(C_NUM_CLIENTS_FIXED*128)	-1:0]	clientX_master_descriptor				;
	// SAP Master Data Interface (Unused
	output  	[C_NUM_CLIENTS_FIXED		-1:0]	clientX_master_datain_src_rdy			;
	input		[C_NUM_CLIENTS_FIXED		-1:0]	clientX_master_datain_dst_rdy			;
	output		[(C_NUM_CLIENTS_FIXED*4)	-1:0]	clientX_master_datain_tag				;
	output		[(C_NUM_CLIENTS_FIXED*4)	-1:0]	clientX_master_datain_option			;
	output		[(C_NUM_CLIENTS_FIXED*128)	-1:0]	clientX_master_datain					;
	
	input		[C_NUM_CLIENTS_FIXED		-1:0]	clientX_master_dataout_src_rdy			;
	output		[C_NUM_CLIENTS_FIXED		-1:0]	clientX_master_dataout_dst_rdy			;
	output		[(C_NUM_CLIENTS_FIXED*4)	-1:0]	clientX_master_dataout_tag				;
	output		[(C_NUM_CLIENTS_FIXED*4)	-1:0]	clientX_master_dataout_option			;
	input		[(C_NUM_CLIENTS_FIXED*128)	-1:0]	clientX_master_dataout					;
	
	`include "math.vh"
	
	localparam C_LOG2_NUM_CLIENTS_FIXED = clog2(C_NUM_CLIENTS_FIXED);
	
	reg		[C_NUM_CLIENTS_FIXED		-1:0]		tag_to_client_lookaside_oh		[15:0];
	reg		[C_LOG2_NUM_CLIENTS_FIXED   -1:0]		tag_to_client_lookaside			[15:0];
	wire	[C_NUM_CLIENTS_FIXED		-1:0]		request;
	wire											grant_release;
	wire											grant_valid;
	wire	[C_LOG2_NUM_CLIENTS_FIXED	-1:0]		grant;
	wire	[C_NUM_CLIENTS_FIXED		-1:0]		grant_oh;
		
	integer i;
	
	always @(posedge clk)
	begin
		if (rst)
		begin
			for(i=0; i<16; i=i+1)
			begin
				tag_to_client_lookaside_oh[i] 	<= {C_NUM_CLIENTS_FIXED{1'b0}};
				tag_to_client_lookaside[i] 		<= {C_NUM_CLIENTS_FIXED{1'b0}};
			end
		end
		else
		begin
			if (master_request & master_request_ack & (master_request_tag != 0))
			begin
				tag_to_client_lookaside_oh[master_request_tag] 	<= grant_oh[C_NUM_CLIENTS_FIXED-1:0];
				tag_to_client_lookaside[master_request_tag] 	<= grant[C_LOG2_NUM_CLIENTS_FIXED-1:0];
			end
		end
	end
	   
    arbitration_nway_single_cycle #(
        .C_NUM_REQUESTORS(C_NUM_CLIENTS_FIXED)
    ) arbiter (
        .clk            ( clk           ),
        .rst            ( rst           ),
        .requests       ( request       ),
        .grant_release  ( grant_release ),
        .grant_valid    ( grant_valid   ),
        .grant          ( grant         ),
        .grant_oh       ( grant_oh      )
    );
        
	genvar r;
	generate
		for (r=0; r<C_NUM_CLIENTS_FIXED; r=r+1)
		begin : LBL_REQUEST_GEN
			if (r < C_NUM_CLIENTS_FIXED)
			begin
				assign request[r] = (grant_oh[r] & (master_request_ack | (master_request_complete & (master_request_tag == 0)))) ? 1'b0 : clientX_master_request[r];
			end
			else
			begin
				assign request[r] = 1'b0;
			end
		end
	endgenerate
	
	assign grant_release 						= master_request_ack | (master_request_complete & (master_request_tag == 0));
	
	assign master_request 						= clientX_master_request[grant] & grant_valid;
	assign master_request_type					= clientX_master_request_type[grant*4 +: 4];
	assign master_request_option				= clientX_master_request_option[grant*4 +: 4];
	assign master_request_flow					= clientX_master_request_flow[grant*10 +: 10];
	assign master_request_local_address			= clientX_master_request_local_address[grant*64 +: 64];
	assign master_request_length				= clientX_master_request_length[grant*36 +: 36];
	
	assign clientX_master_request_ack 			= {{C_NUM_CLIENTS_FIXED-1{1'b0}},master_request_ack} << grant;
	assign clientX_master_request_complete 		= (master_request_tag == 0) ? {{C_NUM_CLIENTS_FIXED-1{1'b0}},master_request_complete} << grant : {{C_NUM_CLIENTS_FIXED-1{1'b0}},master_request_complete} << tag_to_client_lookaside[master_request_tag];
	assign clientX_master_request_error 		= {C_NUM_CLIENTS_FIXED{master_request_error}};
	assign clientX_master_request_tag 			= {C_NUM_CLIENTS_FIXED{master_request_tag}};

	assign clientX_master_datain 				= {C_NUM_CLIENTS_FIXED{master_datain}};
	assign clientX_master_datain_src_rdy 		= tag_to_client_lookaside_oh[master_datain_tag] & {C_NUM_CLIENTS_FIXED{master_datain_src_rdy}};
	assign clientX_master_datain_tag			= {C_NUM_CLIENTS_FIXED{master_datain_tag}};
	assign clientX_master_datain_option			= {C_NUM_CLIENTS_FIXED{master_datain_option}};
	assign master_datain_dst_rdy				= clientX_master_datain_dst_rdy[tag_to_client_lookaside[master_datain_tag]];
	
	assign clientX_master_dataout_dst_rdy		= tag_to_client_lookaside_oh[master_dataout_tag] & {C_NUM_CLIENTS_FIXED{master_dataout_dst_rdy}};
	assign master_dataout						= clientX_master_dataout[tag_to_client_lookaside[master_dataout_tag]*128 +: 128];
	assign clientX_master_dataout_tag			= {C_NUM_CLIENTS_FIXED{master_dataout_tag}};
	assign clientX_master_dataout_option		= {C_NUM_CLIENTS_FIXED{master_dataout_option}};
	assign master_dataout_src_rdy				= clientX_master_dataout_src_rdy[tag_to_client_lookaside[master_dataout_tag]];
	
	assign clientX_master_descriptor_dst_rdy	= tag_to_client_lookaside_oh[master_descriptor_tag] & {C_NUM_CLIENTS_FIXED{master_descriptor_dst_rdy}};
	assign master_descriptor					= clientX_master_descriptor[tag_to_client_lookaside[master_descriptor_tag]*128 +: 128];
	assign clientX_master_descriptor_tag		= {C_NUM_CLIENTS_FIXED{master_descriptor_tag}};
	assign master_descriptor_src_rdy			= clientX_master_descriptor_src_rdy[tag_to_client_lookaside[master_descriptor_tag]];						
	
	
endmodule

