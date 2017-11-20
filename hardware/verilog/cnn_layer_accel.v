`timescale 1ns / 1ns
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//    
// Engineer: Ikenna Okafor  
//
// Create Date:  
// Design Name:  
// Module Name:  
// Project Name: 
// Target Devices:  
// Tool versions:
// Description:     Primary Top Level Module 
//
// Dependencies:
//  
// Revision:
//
// Additional Comments:
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel (  
    sap_clk                      ,
    sap_rst                      ,

    vendor_id                    ,
    device_id                    ,
    class_code                   ,
    revision_id                  ,

    master_clk                   ,
    master_rst                   ,
    master_request               ,
    master_request_ack           ,
    master_request_complete      ,
    master_request_option        ,
    master_request_error         ,
    master_request_tag           ,
    master_request_type          ,
    master_request_flow          ,
    master_request_local_address ,
    master_request_length        ,

    master_descriptor_src_rdy    ,
    master_descriptor_dst_rdy    ,
    master_descriptor_tag        ,
    master_descriptor            ,

    master_datain_src_rdy        ,
    master_datain_dst_rdy        ,
    master_datain_option         ,
    master_datain_tag            ,
    master_datain                ,

    master_dataout_src_rdy       ,
    master_dataout_dst_rdy       ,
    master_dataout_option        ,
    master_dataout_tag           ,
    master_dataout               ,

    slave_clk                    ,
    slave_rst                    ,
    slave_burst_start            ,
    slave_burst_length           ,
    slave_burst_rnw              ,
    slave_address                ,
    slave_transaction_id         ,
    slave_transaction_option     ,
    slave_address_valid          ,
    slave_address_ack            ,
    slave_wrreq                  ,
    slave_wrack                  ,
    slave_be                     ,
    slave_datain                 ,
    slave_rdreq                  ,
    slave_rdack                  ,
    slave_dataout                ,

    send_msg_request             ,
    send_msg_ack                 ,
    send_msg_complete            ,
    send_msg_error               ,
    send_msg_src_rdy             ,
    send_msg_dst_rdy             ,
    send_msg_payload             ,

    recv_msg_request             ,
    recv_msg_ack                 ,
    recv_msg_src_rdy             ,
    recv_msg_dst_rdy             ,
    recv_msg_payload             
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "math.vh"
	`include "soc_it_defs.vh"
	`include "cnn_layer_accel_defines.vh"
   

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Inputs / Ouputs
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    input               sap_clk;
    input               sap_rst;

    output      [15:0]  vendor_id;
    output      [15:0]  device_id;
    output      [23:0]  class_code;
    output      [7:0]   revision_id;

    output              master_clk;
    output              master_rst;
    output              master_request;
    input               master_request_ack;
    input               master_request_complete;
    output      [3 :0]  master_request_option;
    input       [6 :0]  master_request_error;
    input       [3  :0] master_request_tag;
    output      [3  :0] master_request_type;
    output      [9  :0] master_request_flow;
    output      [63 :0] master_request_local_address;
    output      [35 :0] master_request_length;
    // SAP Master Descriptor Interface 
    output              master_descriptor_src_rdy;
    input               master_descriptor_dst_rdy;
    input       [3  :0] master_descriptor_tag;
    output      [127:0] master_descriptor;
    // SAP Master Data Interface 
    input               master_datain_src_rdy;
    output              master_datain_dst_rdy;
    input       [3 :0]  master_datain_option;
    input       [3  :0] master_datain_tag;
    input       [127:0] master_datain;

    output              master_dataout_src_rdy;
    input               master_dataout_dst_rdy;
    input       [3 :0]  master_dataout_option;
    input       [3  :0] master_dataout_tag;
    output      [127:0] master_dataout;
    // SAP Slave Interface 
    output              slave_clk;
    output              slave_rst;
    input               slave_burst_start;
    input       [12:0]  slave_burst_length;
    input               slave_burst_rnw;
    input       [63 :0] slave_address;
    input       [3  :0] slave_transaction_id;
    input       [3  :0] slave_transaction_option;
    input               slave_address_valid;
    output              slave_address_ack;
    input       [3  :0] slave_wrreq;
    output              slave_wrack;
    input       [15 :0] slave_be;
    input       [127:0] slave_datain;
    input       [3  :0] slave_rdreq;
    output              slave_rdack;
    output      [127:0] slave_dataout;
    // SAP Message Send Interface (Unused)
    output              send_msg_request;
    input               send_msg_ack;
    input               send_msg_complete;
    input       [1  :0] send_msg_error;
    output              send_msg_src_rdy;
    input               send_msg_dst_rdy;
    output      [127:0] send_msg_payload;
    // SAP Message Recv Interface (Unused)
    input               recv_msg_request;
    output              recv_msg_ack;
    input               recv_msg_src_rdy;
    output              recv_msg_dst_rdy;
    input       [127:0] recv_msg_payload;
    

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Wires / Regs
    //-----------------------------------------------------------------------------------------------------------------------------------------------      
    wire [                      `NUM_LAYER_ENG_IO - 1:0]        layer_eng_io_input_valid	        ;
	wire [                      `NUM_LAYER_ENG_IO - 1:0]	    layer_eng_io_input_accept	        ;
	wire [(`NUM_LAYER_ENG_IO * `PACKET_WIDTH	) - 1:0]	    layer_eng_io_input_data		        ;
	wire [                      `NUM_LAYER_ENG_IO - 1:0]	    layer_eng_io_output_valid	        ;
	wire [                      `NUM_LAYER_ENG_IO - 1:0]	    layer_eng_io_output_accept	        ;
	wire [(`NUM_LAYER_ENG_IO * `PACKET_WIDTH	) - 1:0]	    layer_eng_io_output_data	        ;

    wire [                     `NUM_LAYER_BRIDGE  - 1:0]	    layer_brdg_input_valid		        ;
	wire [                     `NUM_LAYER_BRIDGE  - 1:0]	    layer_brdg_input_accept		        ;
	wire [(`NUM_LAYER_BRIDGE  * `PACKET_WIDTH	) - 1:0]	    layer_brdg_input_data		        ;
	wire [                     `NUM_LAYER_BRIDGE  - 1:0]	    layer_brdg_output_valid		        ;
	wire [                     `NUM_LAYER_BRIDGE  - 1:0]	    layer_brdg_output_accept	        ;
	wire [(`NUM_LAYER_BRIDGE  * `PACKET_WIDTH	) - 1:0]	    layer_brdg_output_data		        ;

    wire [                    `NUM_LAYER_ENG_CTRL - 1:0]         layer_eng_ctrl_input_valid		    ;
	wire [                    `NUM_LAYER_ENG_CTRL - 1:0]         layer_eng_ctrl_input_accept		;
	wire [(`NUM_LAYER_ENG_CTRL * `PACKET_WIDTH	) - 1:0]	     layer_eng_ctrl_input_data		    ;
	wire [                    `NUM_LAYER_ENG_CTRL - 1:0]	     layer_eng_ctrl_output_valid		;
	wire [                    `NUM_LAYER_ENG_CTRL - 1:0]	     layer_eng_ctrl_output_accept	    ;
	wire [(`NUM_LAYER_ENG_CTRL * `PACKET_WIDTH	) - 1:0]	     layer_eng_ctrl_output_data		    ;
    
    
    reg  [      (`NUM_SLAVE_REGS * 128) - 1:0]      slave_register;
    wire [       clog2(`NUM_SLAVE_REGS) - 1:0]      slave_reg_idx;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Module Instaniations / Generate Statements
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    cnn_layer_accel_layer_engine #(
        .C_NUM_LAYER_ENG_IO     ( `NUM_LAYER_ENG_IO      ), 
        .C_NUM_LAYER_ENG_CTRL   ( `NUM_LAYER_ENG_CTRL    ),
        .C_PACKET_WIDTH	        ( `PACKET_WIDTH	         ),
        .C_NUM_LAYER_ENG_PE     ( `NUM_LAYER_ENG_PE      ),
        .C_NUM_PE               ( `NUM_PE                )
    )
    i0_cnn_layer_accel_layer_engine (
        .clk                            ( sap_clk                   ),
        .rst                            ( sap_rst                   ),
        
        .layer_eng_io_input_valid	    ( layer_eng_io_input_valid	        ),
        .layer_eng_io_input_accept	    ( layer_eng_io_input_accept	        ),
        .layer_eng_io_input_data		( layer_eng_io_input_data		    ),
        .layer_eng_io_output_valid	    ( layer_eng_io_output_valid	        ),
        .layer_eng_io_output_accept	    ( layer_eng_io_output_accept	    ),
        .layer_eng_io_output_data	    ( layer_eng_io_output_data	        ),

        .layer_eng_ctrl_input_valid		( layer_eng_ctrl_input_valid	    ),
        .layer_eng_ctrl_input_accept	( layer_eng_ctrl_input_accept	    ),
        .layer_eng_ctrl_input_data		( layer_eng_ctrl_input_data		    ),
        .layer_eng_ctrl_output_valid	( layer_eng_ctrl_output_valid	    ),
        .layer_eng_ctrl_output_accept	( layer_eng_ctrl_output_accept      ),
        .layer_eng_ctrl_output_data		( layer_eng_ctrl_output_data	    )
       
    );
    
    
    layer_engine_docker #(
        .C_NUM_PE 		        ( `NUM_PE                ),	
        .C_PACKET_WIDTH	        ( `PACKET_WIDTH	         ),
        .C_NUM_LAYER_ENG_IO     ( `NUM_LAYER_ENG_IO      ), 
        .C_NUM_LAYER_BRIDGE     ( `NUM_LAYER_BRIDGE      ),
        .C_NUM_LAYER_ENG_CTRL   ( `NUM_LAYER_ENG_CTRL    ),
        .C_NUM_MSG_INTF         ( `NUM_MSG_INTF          )
    )
    i0_layer_engine_docker (
        .clk                            ( sap_clk                               ),
        .rst                            ( sap_rst                               ),
        
        .master_clk                     ( master_clk                        ), 
        .master_rst                     ( master_rst                        ), 
        .master_request                 ( master_request                    ), 
        .master_request_ack             ( master_request_ack                ), 
        .master_request_complete        ( master_request_complete           ), 
        .master_request_option          ( master_request_option             ), 
        .master_request_error           ( master_request_error              ), 
        .master_request_tag             ( master_request_tag                ), 
        .master_request_type            ( master_request_type               ), 
        .master_request_flow            ( master_request_flow               ), 
        .master_request_local_address   ( master_request_local_address      ), 
        .master_request_length          ( master_request_length             ), 

        .master_descriptor_src_rdy      ( master_descriptor_src_rdy         ), 
        .master_descriptor_dst_rdy      ( master_descriptor_dst_rdy         ), 
        .master_descriptor_tag          ( master_descriptor_tag             ), 
        .master_descriptor              ( master_descriptor                 ), 

        .master_datain_src_rdy          ( master_datain_src_rdy             ), 
        .master_datain_dst_rdy          ( master_datain_dst_rdy             ), 
        .master_datain_option           ( master_datain_option              ), 
        .master_datain_tag              ( master_datain_tag                 ), 
        .master_datain                  ( master_datain                     ), 

        .master_dataout_src_rdy         ( master_dataout_src_rdy            ), 
        .master_dataout_dst_rdy         ( master_dataout_dst_rdy            ), 
        .master_dataout_option          ( master_dataout_option             ), 
        .master_dataout_tag             ( master_dataout_tag                ), 
        .master_dataout                 ( master_dataout                    ), 
        
        .send_msg_request               ( send_msg_request      ),
        .send_msg_ack                   ( send_msg_ack          ),
        .send_msg_complete              ( send_msg_complete     ),
        .send_msg_error                 ( send_msg_error        ),
        .send_msg_src_rdy               ( send_msg_src_rdy      ),
        .send_msg_dst_rdy               ( send_msg_dst_rdy      ),
        .send_msg_payload               ( send_msg_payload      ),
        
       .recv_msg_request                ( recv_msg_request  ),
       .recv_msg_ack                    ( recv_msg_ack      ),
       .recv_msg_src_rdy                ( recv_msg_src_rdy  ),
       .recv_msg_dst_rdy                ( recv_msg_dst_rdy  ),
       .recv_msg_payload                ( recv_msg_payload  ),

        .layer_eng_io_input_valid	    ( layer_eng_io_input_valid	        ),
        .layer_eng_io_input_accept	    ( layer_eng_io_input_accept	        ),
        .layer_eng_io_input_data		( layer_eng_io_input_data		    ),
        .layer_eng_io_output_valid	    ( layer_eng_io_output_valid	        ),
        .layer_eng_io_output_accept	    ( layer_eng_io_output_accept	    ),
        .layer_eng_io_output_data	    ( layer_eng_io_output_data	        ),
        
        .layer_brdg_input_valid		    ( layer_brdg_input_valid	        ),
        .layer_brdg_input_accept		( layer_brdg_input_accept	        ),
        .layer_brdg_input_data		    ( layer_brdg_input_data		        ),
        .layer_brdg_output_valid		( layer_brdg_output_valid	        ),
        .layer_brdg_output_accept	    ( layer_brdg_output_accept	        ),
        .layer_brdg_output_data		    ( layer_brdg_output_data	        ),

        .layer_eng_ctrl_input_valid		( layer_eng_ctrl_input_valid	    ),
        .layer_eng_ctrl_input_accept	( layer_eng_ctrl_input_accept	    ),
        .layer_eng_ctrl_input_data		( layer_eng_ctrl_input_data		    ),
        .layer_eng_ctrl_output_valid	( layer_eng_ctrl_output_valid	    ),
        .layer_eng_ctrl_output_accept	( layer_eng_ctrl_output_accept      ),
        .layer_eng_ctrl_output_data		( layer_eng_ctrl_output_data	    )
    );
 

    assign master_clk  = sap_clk;
    assign master_rst  = sap_rst;
    assign slave_clk   = sap_clk;
    assign slave_rst   = sap_rst;
    assign vendor_id   = 16'hFF00;
    assign device_id   = 16'h000A;
    assign revision_id = 8'h1;
    assign class_code  = 24'h120000;
    
    // BEGIN Slave Logic ----------------------------------------------------------------------------------------------------------------------------
    assign slave_rdack			= slave_rdreq[0];
	assign slave_address_ack	= slave_address_valid;
	assign slave_wrack			= slave_wrreq[0];
    assign slave_dataout        = 128'b0;
    assign slave_reg_idx        = slave_address[(`NUM_SLAVE_REGS + 7):7];

    always@(posedge slave_clk) begin
        if(slave_rst) begin
            slave_register <= 128'b0;
        end else begin
            if(slave_address_valid) begin
                slave_register[(slave_reg_idx * 128) +: 128] <= slave_datain;      
            end
        end
    end
    // END Slave Logic ------------------------------------------------------------------------------------------------------------------------------
 
endmodule

