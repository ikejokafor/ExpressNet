`timescale 1ns / 1ns

module ingress_interface #(
    parameter	C_PACKET_WIDTH		= 144
) (
	clk								,
	rst								,
	
	master_request					,
	master_request_ack				,
	master_request_complete			,
	master_request_error			,
	master_request_tag				,
	master_request_option			,
	master_request_type				,
	master_request_flow				,
	master_request_local_address	,
	master_request_length			,
	
	master_descriptor_src_rdy		,
	master_descriptor_dst_rdy		,
	master_descriptor_tag			,
	master_descriptor				,
	
	master_datain_src_rdy			,
	master_datain_dst_rdy			,
	master_datain_tag				,
	master_datain_option			,
	master_datain					,
	
	master_dataout_src_rdy			,
	master_dataout_dst_rdy			,
	master_dataout_tag				,
	master_dataout_option			,
	master_dataout					,
	
	ext_input_valid					,
	ext_input_accept				,
	ext_input_payload				,

	ext_output_valid				,
	ext_output_accept				,
	ext_output_payload					
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "soc_it_defs.vh"
    `include "cnn_layer_accel_defines.vh"
    

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Local parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam ST_IDLE 				= 3'b001;
	localparam ST_DECODE_COMMAND 	= 3'b010;
	localparam ST_WAIT_DONE 		= 3'b100;
    
 
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Inputs / Ouputs
    //-----------------------------------------------------------------------------------------------------------------------------------------------  
	input											clk								;
	input											rst								;
	// SAP Master Command Interface (Unused)
	output 								master_request					;
	input								master_request_ack				;
	input								master_request_complete			;
	input			[7	-1:0]					master_request_error			;
	input			[4	-1:0]					master_request_tag				;
	output			[4	-1:0]					master_request_option			;
	output			[4	-1:0]					master_request_type				;
	output			[10	-1:0]					master_request_flow				;
	output			[64	-1:0]					master_request_local_address	;
	output			[36	-1:0]					master_request_length			;
	// SAP Master Descriptor Interface (Unused)
	output							master_descriptor_src_rdy		;
	input							master_descriptor_dst_rdy		;
	input			[4  -1:0]					master_descriptor_tag			;
	output			[128-1:0]					master_descriptor				;
	// SAP Master Data Interface (Unused
	input      						master_datain_src_rdy			;
	output							master_datain_dst_rdy			;
	input			[4	-1:0]					master_datain_tag				;
	input			[4	-1:0]					master_datain_option			;
	input			[128-1:0]					master_datain					;
	
	output								master_dataout_src_rdy			;
	input								master_dataout_dst_rdy			;
	input			[4	-1:0]					master_dataout_tag				;
	input			[4	-1:0]					master_dataout_option			;
	output			[128-1:0]					master_dataout					;
	
	input											ext_input_valid					;
	output											ext_input_accept				;
	input		[C_PACKET_WIDTH-1:0]				ext_input_payload				;
	
	output											ext_output_valid				;
	input											ext_output_accept				;
	output		[C_PACKET_WIDTH-1:0]				ext_output_payload				;
	
	
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Wires / Regs
    //-----------------------------------------------------------------------------------------------------------------------------------------------	
	reg			[2:0]									state									;
	

    reg            ingress_transactor_request;
    wire            ingress_transaction_request_complete; 
    wire            ingress_transactor_request_busy;    
    reg            ingress_use_provided_param;             
    reg   [35:0]   ingress_provided_parameters_length;     
    reg   [3:0]    ingress_provided_request_type_r;        
    reg   [63:0]   ingress_provided_parameters_address;     
    
    
    
    reg													cache_command_request		;
	reg			[`MATCH_CACHE_COMMAND_INFO_WIDTH-1:0] 	cache_command_info			;
	wire												cache_command_accept		;
	wire												cache_command_complete		;
	wire												cache_ingress_valid			;
	wire												cache_ingress_ready			;
	wire		[C_PACKET_WIDTH-1:0]					cache_ingress_data			;
	wire												cache_egress_valid			;
	wire												cache_egress_ready			;
	wire		[C_PACKET_WIDTH-1:0]					cache_egress_data			;
    
    
    
    
	
	wire		[127:0]									command									;
	reg			[127:0]									command_r								;
	wire												command_valid							;
	reg													command_accept							;
	
	reg			[127:0]									response								;
	reg													response_valid							;
	wire												response_accept							;
	
	reg			[1:0]									packetizer_mode							;
	reg			[7:0]									packetizer_option						;
	wire												packetizer_ingress_valid				;
	wire												packetizer_ingress_ready				;
	wire		[127:0]									packetizer_ingress_data					;
	wire												packetizer_egress_valid					;
	wire												packetizer_egress_ready					;
	wire		[C_PACKET_WIDTH-1:0]					packetizer_egress_data					;

    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Module Instaniations
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	ingress_interface_packetizer
	i0_ingress_interface_packetizer	(
		.clk			(clk						),
		.rst			(rst						),
		
		.mode			(packetizer_mode			),
		.option			(packetizer_option			),
		
		.ingress_valid	(packetizer_ingress_valid	),
		.ingress_ready	(packetizer_ingress_ready	),
		.ingress_data	(packetizer_ingress_data	),
		
		.egress_valid	(packetizer_egress_valid	),
		.egress_ready	(packetizer_egress_ready	),
		.egress_data	(packetizer_egress_data		)
	);
    
    
    ingress_interface_cache #(
		.C_CACHE_SIZE						(4096							),
		.C_PACKET_WIDTH						(C_PACKET_WIDTH					)
	)
	i0_ingress_interface_cache (                                             
		.clk								(clk							),
		.rst								(rst							),

		.command_request					(cache_command_request			),
		.command_info						(cache_command_info				),
		.command_accept						(cache_command_accept			),
		.command_complete					(cache_command_complete			),

		.ingress_valid						(cache_ingress_valid			),
		.ingress_ready						(cache_ingress_ready			),
		.ingress_data						(cache_ingress_data				),

		.egress_valid						(cache_egress_valid				),
		.egress_ready						(cache_egress_ready				),
		.egress_data						(cache_egress_data				)
	);
    

    master_transactor
    i0_master_transactor (                                                     
        .master_clk                          ( clk								),
        .master_rst                          ( rst								),
        .master_request                      ( master_request					),
        .master_request_ack                  ( master_request_ack				),
        .master_request_complete             ( master_request_complete			),
        .master_request_option               ( master_request_option			),
        .master_request_error                ( master_request_error				),
        .master_request_tag                  ( master_request_tag				),
        .master_request_type                 ( master_request_type				),
        .master_request_flow                 ( master_request_flow				),
        .master_request_local_address        ( master_request_local_address		),
        .master_request_length               ( master_request_length			),
        .master_descriptor_src_rdy           ( master_descriptor_src_rdy	    ),
        .master_descriptor_dst_rdy           ( master_descriptor_dst_rdy	    ),
        .master_descriptor_tag               ( master_descriptor_tag		    ),
        .master_descriptor                   ( master_descriptor			    ),
        .master_datain_src_rdy               ( master_dataout_src_rdy	        ),
        .master_datain_dst_rdy               ( master_dataout_dst_rdy	        ),
        .master_datain_tag                   ( master_datain_tag                ),
        .master_dataout_src_rdy              ( master_dataout_src_rdy           ),
        .master_dataout_dst_rdy              ( master_dataout_dst_rdy           ),
        .master_dataout_tag                  ( master_dataout_tag               ),
        .initialize                          (                ),
        .intiialize_request_type             (),
        .initialize_address                  (),
        .initialize_length                   (),
        .initialize_complete                 (),
        .transactor_request                  (),
        .transactor_enable                   (),
        .transactor_request_option           (),
        .transactor_request_busy             ( ingress_transactor_request_busy ),
        .transactor_active                   (),
        .transaction_request_complete        (ingress_transaction_request_complete),
        .transactor_param_complete           (),
        .transactor_reset                    (),
        .use_provided_param                  ( ingress_use_provided_param            ),
        .provided_parameters_length          ( ingress_provided_parameters_length    ),
        .provided_request_option             (                                       ),
        .provided_request_type_r             ( ingress_provided_request_type_r       ),
        .provided_parameters_address         ( ingress_provided_parameters_address   )
    );
    

	assign command											= (state == ST_IDLE) 		? ext_input_payload				[127:0]			: 128'b0;
	assign command_valid 									= (state == ST_IDLE) 		? ext_input_valid								: 1'b0;
	assign ext_input_accept									= (state == ST_WAIT_DONE) 	? master_dataout_dst_rdy		 			: command_accept;
	assign master_dataout_src_rdy 							= (state == ST_WAIT_DONE) 	? ext_input_valid 								: 1'b0;
	assign master_dataout						= (state == ST_WAIT_DONE)	? ext_input_payload								: 128'b0;
	
	assign ext_output_payload								= (state == ST_WAIT_DONE)	? packetizer_egress_data						: response;
	assign ext_output_valid									= (state == ST_WAIT_DONE)	? packetizer_egress_valid						: response_valid;
	assign packetizer_egress_ready							= (state == ST_WAIT_DONE)	? ext_output_accept								: 1'b0;
	assign response_accept									= (state == ST_WAIT_DONE)	? 1'b0 											: ext_output_accept;
	
	assign cache_ingress_data							    = (state == ST_WAIT_DONE)	? master_datain					: 128'b0;
	assign cache_ingress_valid						        = (state == ST_WAIT_DONE)	? master_datain_src_rdy							: 1'b0;
	assign master_datain_dst_rdy						= (state == ST_WAIT_DONE)	? cache_ingress_ready						: 1'b0;
	
	assign packetizer_ingress_data							= (state == ST_WAIT_DONE)	? cache_egress_data						: 128'b0;
	assign packetizer_ingress_valid							= (state == ST_WAIT_DONE)	? cache_egress_valid			 			: 1'b0;
	assign cache_egress_ready							    = (state == ST_WAIT_DONE)	? packetizer_ingress_ready						: 1'b0;
	
	always@(posedge clk) begin
		if (rst) begin
            ingress_transactor_request          <= 0;
            ingress_use_provided_param          <= 0;  
            ingress_provided_parameters_length  <= 0;  
            ingress_provided_request_type_r     <= 0;  
            ingress_provided_parameters_address <= 0;  
            
			cache_command_request		<= 1'b0;
			cache_command_info		<= {`MATCH_CACHE_COMMAND_INFO_WIDTH{1'b0}};
		
			response						<= 128'b0;
			response_valid					<= 1'b0;
			command_accept					<= 1'b0;
			command_r						<= 128'b0;
			
			packetizer_mode					<= `PACKETIZER_MODE_ROUTE_MATCH;
			packetizer_option				<= 8'b0;
			
			state 							<= ST_IDLE;
		end else begin
            ingress_transactor_request          <= 0;
            ingress_use_provided_param          <= 0;  
            ingress_provided_parameters_length  <= 0;  
            ingress_provided_request_type_r     <= 0;  
            ingress_provided_parameters_address <= 0;  
			case (state)
				ST_IDLE: begin
                    command_accept 		<= command_valid;
                    if (command_valid & command_accept) begin
                        command_accept	<= 1'b0;
                        command_r		<= command;
                        state			<= ST_DECODE_COMMAND;
                    end
                end
				ST_DECODE_COMMAND: begin
                    if(!ingress_transactor_request_busy) begin
                        ingress_transactor_request              <= 1;
                        ingress_use_provided_param              <= 1;
                        ingress_provided_parameters_length      <= command_r[63:28];
                        ingress_provided_request_type_r         <= `NIF_MASTER_CMD_RDREQ;
                        ingress_provided_parameters_address     <= command_r[127:64];
                        packetizer_mode					        <= `PACKETIZER_MODE_ROUTE_MATCH;
                        packetizer_option				        <= 8'b0;                               
                        state                                   <= ST_WAIT_DONE;
                    end
                end
				ST_WAIT_DONE: begin
                    if(ingress_transaction_request_complete) begin
                        state 				<= ST_IDLE;
                    end
                end
			endcase
		end
	end
	
endmodule