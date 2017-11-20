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
module msg_intf #(
    C_PACKET_WIDTH      = 16'd66
) (
    clk                     ,
    rst                     ,
    
    send_msg_request  ,
    send_msg_ack      ,
    send_msg_complete ,
    send_msg_error    ,
    send_msg_src_rdy  ,
    send_msg_dst_rdy  ,
    send_msg_payload  ,

    recv_msg_request  ,
    recv_msg_ack      ,
    recv_msg_src_rdy  ,
    recv_msg_dst_rdy  ,
    recv_msg_payload  ,
    
    msg_intf_input_valid	,
    msg_intf_input_accept   ,
    msg_intf_input_data	    ,
    msg_intf_output_valid	,
    msg_intf_output_accept  ,
    msg_intf_output_data	
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "math.vh"
	`include "soc_it_defs.vh"
	`include "cnn_layer_accel_defines.vh"
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------    
    localparam ST_IDLE               = 5'b00001;
    localparam ST_LOAD_MESSAGE       = 5'b00010;
    localparam ST_DECODE_MESSAGE     = 5'b00100;
    localparam ST_SEND_MESSAGE       = 5'b01000;
    localparam ST_SEND_COMPLETION    = 5'b10000;
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Inputs / Ouputs
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    input                                               clk;
    input                                               rst;
    
    input                                               recv_msg_request;
    output                                              recv_msg_ack;
    input                                               recv_msg_src_rdy;
    output                                              recv_msg_dst_rdy;
    input       [                             127:0]    recv_msg_payload;

    output                                              send_msg_request;
    input                                               send_msg_ack;
    input                                               send_msg_complete;
    input       [                             1  :0]    send_msg_error;
    output                                              send_msg_src_rdy;
    input                                               send_msg_dst_rdy;
    output      [                             127:0]    send_msg_payload;
    
    input                                               msg_intf_input_valid;	
    output                                              msg_intf_input_accept;	
    input   [C_PACKET_WIDTH - 1:0]	                    msg_intf_input_data;	
    output  	                                        msg_intf_output_valid;	
    input   	                                        msg_intf_output_accept;
    output  [C_PACKET_WIDTH - 1:0]	                    msg_intf_output_data;	
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Wires / Regs 
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    reg                                                     msg_intf_output_valid_r;
   
    reg  [                                         7:0]     completion_type;
    reg  [                                         9:0]     completion_length;
    reg  [                                        15:0]     completion_target;
    reg  [                                         9:0]     completion_id;
    reg  [                                         6:0]     completion_error;
    wire                                                    completion_valid;
    wire                                                    completion_complete;
    reg  [                                       127:0]     completion_data;
    wire                                                    completion_data_valid;
    wire                                                    completion_data_ready; 
 
    reg  [                   4                    :0]       state;
    
    reg			[1:0]									    packetizer_mode;		
	reg			[7:0]									    packetizer_option;		
	wire												    packetizer_ingress_valid;
	wire												    packetizer_ingress_ready;
	wire		[127:0]									    packetizer_ingress_data;
	wire												    packetizer_egress_valid;
	wire												    packetizer_egress_ready;
	wire		[C_PACKET_WIDTH-1:0]					    packetizer_egress_data;	
    
    
    wire [                                         7:0]     command_type;
    wire [                                         9:0]     command_length;
    wire [                                        15:0]     command_initiator;
    wire                                                    command_valid;
    reg                                                     command_data_advance;
    wire [                                         9:0]     command_id;
    wire [                                       127:0]     command_data;
    wire                                                    command_data_valid;
    wire                                                    command_data_ready;
    
    reg [                                       127:0]    msg_intf_output_data_r;
    
    reg  [                 (`NUM_FLITS * 128) - 1:0]     command_data_buffer;
    reg  [                                        15:0]     load_message_counter;    
    integer                                                 idx0;
    integer                                                 idx1;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Module Instantiations / Generate Statements
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
    
    
    sap_send_message_queue
    i0_send_message_queue (
        .clk                ( clk                   ),
        .rst                ( rst                   ),

        .send_msg_request   ( send_msg_request      ),
        .send_msg_ack       ( send_msg_ack          ),
        .send_msg_complete  ( send_msg_complete     ),
        .send_msg_error     ( send_msg_error        ),
        .send_msg_src_rdy   ( send_msg_src_rdy      ),
        .send_msg_dst_rdy   ( send_msg_dst_rdy      ),
        .send_msg_payload   ( send_msg_payload      ),

        .request_type       ( completion_type       ),
        .request_length     ( completion_length     ),
        .request_target     ( completion_target     ),
        .request_valid      ( completion_valid      ),
        .request_complete   ( completion_complete   ),
        .request_id         ( completion_id         ),
        .request_error      ( completion_error      ),
        .request_data       ( completion_data       ),
        .request_data_valid ( completion_data_valid ),
        .request_data_ready ( completion_data_ready )
    );
    
    
    sap_receive_message_queue
    i0_receive_message_queue (
        .clk                ( clk                  ),
        .rst                ( rst                  ),

        .recv_msg_request   ( recv_msg_request     ),
        .recv_msg_ack       ( recv_msg_ack         ),
        .recv_msg_complete  (                      ),
        .recv_msg_error     (                      ),
        .recv_msg_src_rdy   ( recv_msg_src_rdy     ),
        .recv_msg_dst_rdy   ( recv_msg_dst_rdy     ),
        .recv_msg_payload   ( recv_msg_payload     ),

        .request_type       ( command_type         ),
        .request_length     ( command_length       ),
        .request_initiator  ( command_initiator    ),
        .request_valid      ( command_valid        ),
        .request_advance    ( command_data_advance ),
        .request_id         ( command_id           ),
        .request_data       ( command_data         ),
        .request_data_valid ( command_data_valid   ),
        .request_data_ready ( command_data_ready   )
    );
    
    
    // BEGIN Get Command Data logic -----------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin
            for(idx0 = 0; idx0 < `NUM_FLITS; idx0 = idx0 + 1) begin
                command_data_buffer[(idx0 * 128) +: 128] <= 0;
            end
            load_message_counter  <= 0;     
        end else begin
            if(state == ST_LOAD_MESSAGE) begin
                load_message_counter      <= load_message_counter + 1;      
                for(idx1 = 1; idx1 < (`NUM_FLITS + 1); idx1 = idx1 + 1) begin
                    if(idx1 == load_message_counter) begin
                        command_data_buffer[((idx1 - 1) * 128) +: 128] <= command_data;
                    end
                end
                if(load_message_counter == `NUM_FLITS) begin
                    load_message_counter <= 0;
                end
            end
        end
    end
    // END Get Command Data logic -------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN Msg Intf Logic -------------------------------------------------------------------------------------------------------------------------
    assign msg_intf_output_valid = msg_intf_output_valid_r;
    assign msg_intf_output_data = msg_intf_output_data_r;
    assign command_data_ready   = (state == ST_IDLE) && command_valid;  
    
    always@(posedge clk) begin
        if(rst) begin
            command_data_advance        <= 0;
            completion_type             <= `SAP_MSG_TYPE_EXECUTE_COMPLETE;
            completion_length           <= 32;
            completion_target           <= 16'h0;
            completion_id               <= 0;
            completion_data             <= 128'h0;
            packetizer_mode				<= `PACKETIZER_MODE_ROUTE_MATCH;
			packetizer_option			<= 8'b0;
            msg_intf_output_valid_r     <= 0;
            msg_intf_output_data_r      <= 0;
            state                       <= ST_IDLE;
        end else begin
            command_data_advance        <= 0;
            completion_type             <= `SAP_MSG_TYPE_EXECUTE_COMPLETE;
            completion_length           <= 32;
            completion_target           <= command_initiator;
			packetizer_mode				<= `PACKETIZER_MODE_ROUTE_MATCH;
			packetizer_option			<= 8'b0;
            completion_id               <= command_id;
            msg_intf_output_data_r      <= 0;
            msg_intf_output_valid_r     <= 0;
            case(state)
                ST_IDLE: begin          
                    if(command_data_valid) begin
                        if(command_type == `SAP_MSG_TYPE_EXECUTE_REQUEST) begin
                            command_data_advance     <= 1'b1;
                            state                    <= ST_LOAD_MESSAGE;
                        end else begin
                            completion_error         <= `NIF_ERRCODE_UNSUPPORTED_CMD;
                            completion_data          <= 128'h1;
                            state                    <= ST_SEND_COMPLETION;
                        end
                    end
                end
                ST_LOAD_MESSAGE: begin  
                    if(load_message_counter != `NUM_FLITS) begin
                        command_data_advance        <= 1'b1;
                        state                       <= ST_LOAD_MESSAGE;
                    end else begin
                        state                       <= ST_DECODE_MESSAGE;
                    end
                end
                ST_DECODE_MESSAGE: begin  
                    state <= ST_SEND_MESSAGE;
                end
                ST_SEND_MESSAGE: begin  
                    msg_intf_output_valid_r <= 1;
                    msg_intf_output_data_r    <= command_data_buffer;
                    if(msg_intf_output_accept) begin
                        state   <= ST_IDLE;
                    end
                end
                ST_SEND_COMPLETION: begin
                
                end
                default: begin
                
                end
            endcase
        end
    end
    // END Msg Intf Logic ---------------------------------------------------------------------------------------------------------------------------

`ifdef SIMULATION
    string state_s;
    always@(state) begin 
        case(state) 
            ST_IDLE              : state_s = "ST_IDLE";
            ST_LOAD_MESSAGE      : state_s = "ST_LOAD_MESSAGE";
            ST_DECODE_MESSAGE    : state_s = "ST_DECODE_MESSAGE";
            ST_SEND_MESSAGE      : state_s = "ST_SEND_MESSAGE";
            ST_SEND_COMPLETION   : state_s = "ST_SEND_COMPLETION";
        endcase
    end
`endif
 
endmodule