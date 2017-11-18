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
module layer_engine_docker #(
	parameter	C_NUM_PE 		        = 4,
	parameter	C_PACKET_WIDTH	        = 128,
    parameter   C_NUM_LAYER_ENG_IO      = 12,
    parameter   C_NUM_LAYER_BRIDGE      = 1,
    parameter   C_NUM_LAYER_ENG_CTRL    = 1,
    parameter   C_NUM_MSG_INTF          = 1
) (
	clk							,
	rst							,

	master_clk						,
	master_rst						,
	master_request					,
	master_request_ack				,
	master_request_complete			,
	master_request_option			,
	master_request_error			,
	master_request_tag				,
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
	master_datain_option			,
	master_datain_tag				,
	master_datain					,
	
	master_dataout_src_rdy			,
	master_dataout_dst_rdy			,
	master_dataout_option			,
	master_dataout_tag				,
	master_dataout					,
    
   recv_msg_request                , 
   recv_msg_ack                    ,
   recv_msg_src_rdy                ,
   recv_msg_dst_rdy                ,
   recv_msg_payload                ,

   send_msg_request                ,
   send_msg_ack                    ,
   send_msg_complete               ,
   send_msg_error                  ,
   send_msg_src_rdy                ,
   send_msg_dst_rdy                ,
   send_msg_payload                ,
    
	
    layer_eng_io_input_valid	     ,
	layer_eng_io_input_accept	     ,
	layer_eng_io_input_data		     ,
	layer_eng_io_output_valid	     ,
	layer_eng_io_output_accept	     ,
	layer_eng_io_output_data	     ,
    
    layer_brdg_input_valid		     ,
	layer_brdg_input_accept		     ,
	layer_brdg_input_data		     ,
	layer_brdg_output_valid		     ,
	layer_brdg_output_accept	     ,
	layer_brdg_output_data		     ,

    layer_eng_ctrl_input_valid		 ,
	layer_eng_ctrl_input_accept		 ,
	layer_eng_ctrl_input_data		 ,
	layer_eng_ctrl_output_valid		 ,
	layer_eng_ctrl_output_accept	 ,
	layer_eng_ctrl_output_data		 

);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "math.vh"
	`include "soc_it_defs.vh"
	`include "cnn_layer_accel_defines.vh"
 

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------	   
`ifdef SIMULATION
    localparam	[(`NUM_PE_TYPES - 1):0] C_PORT_CONFIGURATION	[(`NUM_ROWS - 1):0][(`NUM_COLS - 1):0][(`NUM_PE - 1):0]	=   
    '{
        '{'{C_PORT_CONFIG_LAYER_ENGINE_IO   , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }, '{C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }   },
        '{'{C_PORT_CONFIG_LAYER_ENGINE_IO   , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }, '{C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }   },
        '{'{C_PORT_CONFIG_LAYER_ENGINE_IO   , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }, '{C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }   },
        '{'{C_PORT_CONFIG_LAYER_ENGINE_IO   , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }, '{C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }   },
        '{'{C_PORT_CONFIG_LAYER_ENGINE_IO   , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }, '{C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }   },
        '{'{C_PORT_CONFIG_LAYER_ENGINE_IO   , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }, '{C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }   },
        '{'{C_PORT_CONFIG_LAYER_ENGINE_IO   , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }, '{C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }   },
        '{'{C_PORT_CONFIG_LAYER_ENGINE_IO   , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }, '{C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }   },
        '{'{C_PORT_CONFIG_DATA_MOVER        , C_PORT_CONFIG_DATA_MOVER      , C_PORT_CONFIG_DATA_MOVER      , C_PORT_CONFIG_MSG_INTF        }, '{C_PORT_CONFIG_DATA_MOVER      , C_PORT_CONFIG_DATA_MOVER      , C_PORT_CONFIG_DATA_MOVER      , C_PORT_CONFIG_DATA_MOVER      }   }

    };
`else
    localparam	[(`NUM_PE_TYPES - 1):0] C_PORT_CONFIGURATION	[(`NUM_ROWS - 1):0][(`NUM_COLS - 1):0][(`NUM_PE - 1):0]	=   
    {
        {{C_PORT_CONFIG_LAYER_ENGINE_IO   , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }, '{C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }   },
        {{C_PORT_CONFIG_LAYER_ENGINE_IO   , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }, '{C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }   },
        {{C_PORT_CONFIG_LAYER_ENGINE_IO   , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }, '{C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }   },
        {{C_PORT_CONFIG_LAYER_ENGINE_IO   , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }, '{C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }   },
        {{C_PORT_CONFIG_LAYER_ENGINE_IO   , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }, '{C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }   },
        {{C_PORT_CONFIG_LAYER_ENGINE_IO   , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }, '{C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }   },
        {{C_PORT_CONFIG_LAYER_ENGINE_IO   , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }, '{C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }   },
        {{C_PORT_CONFIG_LAYER_ENGINE_IO   , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }, '{C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO , C_PORT_CONFIG_LAYER_ENGINE_IO }   },
        {{C_PORT_CONFIG_DATA_MOVER        , C_PORT_CONFIG_DATA_MOVER      , C_PORT_CONFIG_DATA_MOVER      , C_PORT_CONFIG_MSG_INTF        }, '{C_PORT_CONFIG_DATA_MOVER      , C_PORT_CONFIG_DATA_MOVER      , C_PORT_CONFIG_DATA_MOVER      , C_PORT_CONFIG_DATA_MOVER      }   }
    };
`endif	
	//localparam C_NUM_ROWS 				= count_active(C_PORT_CONFIGURATION, C_ROW);                        // fix this function
	//localparam C_NUM_COLS 				= count_active(C_PORT_CONFIGURATION, C_COL);                        // fix this function
    //localparam C_NUM_DATA_MOVERS 		    = count_instances(C_PORT_CONFIGURATION, C_PORT_CONFIG_DATA_MOVER);	// fix this function

    localparam C_NUM_ROWS 				= `NUM_ROWS;
	localparam C_NUM_COLS 				= `NUM_COLS;
    localparam C_NUM_DATA_MOVERS        = `NUM_DATA_MOVERS;
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------	
	input											                clk								    ;
	input											                rst								    ;

	output											                master_clk							;
	output											                master_rst							;
	output 											                master_request						;
	input											                master_request_ack					;
	input											                master_request_complete				;
	output		[3	:0]								                master_request_option				;	
	input		[6	:0]								                master_request_error				;
	input		[3  :0]								                master_request_tag					;
	output		[3  :0]								                master_request_type					;
	output		[9  :0]								                master_request_flow					;
	output		[63 :0]								                master_request_local_address		;
	output		[35 :0]								                master_request_length				;
	// SAP Master Descriptor Interface (Unused)             
	output											                master_descriptor_src_rdy			;
	input											                master_descriptor_dst_rdy			;
	input		[3  :0]								                master_descriptor_tag				;
	output		[127:0]								                master_descriptor					;
	// SAP Master Data Interface (Unused                
	input   	   									                master_datain_src_rdy				;
	output											                master_datain_dst_rdy				;
	input		[3	:0]								                master_datain_option				;
	input		[3  :0]								                master_datain_tag					;
	input		[127:0]								                master_datain						;

	output											                master_dataout_src_rdy				;
	input											                master_dataout_dst_rdy				;
	input		[3	:0]								                master_dataout_option				;
	input		[3  :0]								                master_dataout_tag					;
	output		[127:0]								                master_dataout						;
    
    input                                                           recv_msg_request;
    output                                                          recv_msg_ack;
    input                                                           recv_msg_src_rdy;
    output                                                          recv_msg_dst_rdy;
    input       [                             127:0]                recv_msg_payload;

    output                                                          send_msg_request;
    input                                                           send_msg_ack;
    input                                                           send_msg_complete;
    input       [                             1  :0]                send_msg_error;
    output                                                          send_msg_src_rdy;
    input                                                           send_msg_dst_rdy;
    output      [                             127:0]                send_msg_payload;
        
    output	[                   C_NUM_LAYER_ENG_IO - 1:0]           layer_eng_io_input_valid	        ;
	input	[                   C_NUM_LAYER_ENG_IO - 1:0]	        layer_eng_io_input_accept	        ;
	output	[(C_NUM_LAYER_ENG_IO * C_PACKET_WIDTH) - 1:0]	        layer_eng_io_input_data		        ;
	input	[                   C_NUM_LAYER_ENG_IO - 1:0]	        layer_eng_io_output_valid	        ;
	output	[                   C_NUM_LAYER_ENG_IO - 1:0]	        layer_eng_io_output_accept	        ;
	input	[(C_NUM_LAYER_ENG_IO * C_PACKET_WIDTH) - 1:0]	        layer_eng_io_output_data	        ;
    
    output	[                   C_NUM_LAYER_BRIDGE - 1:0]	        layer_brdg_input_valid		        ;
	input	[                   C_NUM_LAYER_BRIDGE - 1:0]	        layer_brdg_input_accept		        ;
	output	[(C_NUM_LAYER_BRIDGE * C_PACKET_WIDTH) - 1:0]	        layer_brdg_input_data		        ;
	input	[                   C_NUM_LAYER_BRIDGE - 1:0]	        layer_brdg_output_valid		        ;
	output	[                   C_NUM_LAYER_BRIDGE - 1:0]	        layer_brdg_output_accept	        ;
	input	[(C_NUM_LAYER_BRIDGE * C_PACKET_WIDTH) - 1:0]	        layer_brdg_output_data		        ;
    
    output	[                   C_NUM_LAYER_ENG_CTRL - 1:0]         layer_eng_ctrl_input_valid		    ;
	input	[                   C_NUM_LAYER_ENG_CTRL - 1:0]         layer_eng_ctrl_input_accept		    ;
	output	[(C_NUM_LAYER_ENG_CTRL * C_PACKET_WIDTH) - 1:0]	        layer_eng_ctrl_input_data		    ;
	input	[                   C_NUM_LAYER_ENG_CTRL - 1:0] 	    layer_eng_ctrl_output_valid		    ;
	output	[                   C_NUM_LAYER_ENG_CTRL - 1:0] 	    layer_eng_ctrl_output_accept	    ;
	input	[(C_NUM_LAYER_ENG_CTRL * C_PACKET_WIDTH) - 1:0]	        layer_eng_ctrl_output_data		    ;

    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Wires
	//-----------------------------------------------------------------------------------------------------------------------------------------------	
	wire	[(C_NUM_ROWS*C_NUM_COLS*C_NUM_PE*1)				-1:0]	pe_input_valid						;
	wire	[(C_NUM_ROWS*C_NUM_COLS*C_NUM_PE*1)				-1:0]	pe_input_accept						;
	wire	[(C_NUM_ROWS*C_NUM_COLS*C_NUM_PE*C_PACKET_WIDTH)-1:0]	pe_input_data						;
	
	wire	[(C_NUM_ROWS*C_NUM_COLS*C_NUM_PE*1)				-1:0]	pe_output_valid						;
	wire	[(C_NUM_ROWS*C_NUM_COLS*C_NUM_PE*1)				-1:0]	pe_output_accept					;
	wire	[(C_NUM_ROWS*C_NUM_COLS*C_NUM_PE*C_PACKET_WIDTH)-1:0]	pe_output_data						;
	
	wire 	[(C_NUM_DATA_MOVERS		)-1	:0]						arb_master_request					;
	wire	[(C_NUM_DATA_MOVERS		)-1	:0]						arb_master_request_ack				;
	wire	[(C_NUM_DATA_MOVERS		)-1	:0]						arb_master_request_complete			;
	wire	[(C_NUM_DATA_MOVERS*7		)-1 :0]						arb_master_request_error			;
	wire	[(C_NUM_DATA_MOVERS*4		)-1 :0]						arb_master_request_tag				;
	wire	[(C_NUM_DATA_MOVERS*4		)-1 :0]						arb_master_request_option			;
	wire	[(C_NUM_DATA_MOVERS*4		)-1 :0]						arb_master_request_type				;
	wire	[(C_NUM_DATA_MOVERS*10	)-1 :0]						arb_master_request_flow				;
	wire	[(C_NUM_DATA_MOVERS*64	)-1 :0]						arb_master_request_local_address	;
	wire	[(C_NUM_DATA_MOVERS*36	)-1 :0]						arb_master_request_length			;

	wire	[(C_NUM_DATA_MOVERS		)-1	:0]						arb_master_descriptor_src_rdy		;
	wire	[(C_NUM_DATA_MOVERS		)-1	:0]						arb_master_descriptor_dst_rdy		;
	wire	[(C_NUM_DATA_MOVERS*4		)-1 :0]						arb_master_descriptor_tag			;
	wire	[(C_NUM_DATA_MOVERS*128	)-1	:0]						arb_master_descriptor				;

	wire    [(C_NUM_DATA_MOVERS		)-1	:0]						arb_master_datain_src_rdy			;
	wire	[(C_NUM_DATA_MOVERS		)-1	:0]						arb_master_datain_dst_rdy			;
	wire	[(C_NUM_DATA_MOVERS*4		)-1 :0]						arb_master_datain_tag				;
	wire	[(C_NUM_DATA_MOVERS*4		)-1 :0]						arb_master_datain_option			;
	wire	[(C_NUM_DATA_MOVERS*128	)-1	:0]						arb_master_datain					;
	
	wire	[(C_NUM_DATA_MOVERS		)-1	:0]						arb_master_dataout_src_rdy			;
	wire	[(C_NUM_DATA_MOVERS		)-1	:0]						arb_master_dataout_dst_rdy			;
	wire	[(C_NUM_DATA_MOVERS*4		)-1 :0]						arb_master_dataout_tag				;
	wire	[(C_NUM_DATA_MOVERS*4		)-1 :0]						arb_master_dataout_option			;
	wire	[(C_NUM_DATA_MOVERS*128	)-1	:0]						arb_master_dataout					;
    
    wire [                   C_NUM_MSG_INTF - 1:0]               msg_intf_input_valid	        ;
	wire [                   C_NUM_MSG_INTF - 1:0]	            msg_intf_input_accept	        ;
	wire [(C_NUM_MSG_INTF * C_PACKET_WIDTH) - 1:0]	            msg_intf_input_data		        ;
	wire [                   C_NUM_MSG_INTF - 1:0]	            msg_intf_output_valid	        ;
	wire [                   C_NUM_MSG_INTF - 1:0]	            msg_intf_output_accept	        ;
	wire [(C_NUM_MSG_INTF * C_PACKET_WIDTH) - 1:0]	            msg_intf_output_data	        ;


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	tile_router_network	#(
		.C_NUM_ROWS 		(C_NUM_ROWS			),
		.C_NUM_COLS 		(C_NUM_COLS			),
		.C_NUM_PE			(C_NUM_PE			),
		.C_PACKET_WIDTH		(C_PACKET_WIDTH		)
	)
	i0_tile_router_network (
		.network_clk		(                   ),
		.network_rst		(rst			),
		
		.pe_clk				( clk			),

		.pe_input_valid		( pe_input_valid		),
		.pe_input_accept	( pe_input_accept	),
		.pe_input_data		( pe_input_data		),

		.pe_output_valid	( pe_output_valid	),
		.pe_output_accept	( pe_output_accept	),
		.pe_output_data		( pe_output_data		)
	);
    
    msg_intf #(
        .C_PACKET_WIDTH ( C_PACKET_WIDTH )
    ) 
    i0_msg_intf (
        .clk                    ( clk),
        .rst                    ( rst),
        
        .recv_msg_request       ( recv_msg_request       ),
        .recv_msg_ack           ( recv_msg_ack           ),
        .recv_msg_src_rdy       ( recv_msg_src_rdy       ),
        .recv_msg_dst_rdy       ( recv_msg_dst_rdy       ),
        .recv_msg_payload       ( recv_msg_payload       ),

        .send_msg_request       ( send_msg_request       ),   
        .send_msg_ack           ( send_msg_ack           ),
        .send_msg_complete      ( send_msg_complete      ),
        .send_msg_error         ( send_msg_error         ),
        .send_msg_src_rdy       ( send_msg_src_rdy       ),
        .send_msg_dst_rdy       ( send_msg_dst_rdy       ),
        .send_msg_payload       ( send_msg_payload       ),

        .msg_intf_input_valid	 (  msg_intf_input_valid	),      
        .msg_intf_input_accept	 (  msg_intf_input_accept	),      
        .msg_intf_input_data	 (  msg_intf_input_data	    ),
        .msg_intf_output_valid	 (  msg_intf_output_valid	),      
        .msg_intf_output_accept	 (  msg_intf_output_accept	),  
        .msg_intf_output_data	 (  msg_intf_output_data	)    
    );
    
	
	genvar r,c,p;	
	generate
		for(r=0; r<C_NUM_ROWS; r=r+1) begin
			for(c=0; c<C_NUM_COLS; c=c+1) begin
				for(p=0; p<C_NUM_PE; p=p+1) begin
					if(C_PORT_CONFIGURATION[r][c][p] == C_PORT_CONFIG_LAYER_ENGINE_IO) begin					
                        assign layer_eng_io_input_valid     [                                     get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_LAYER_ENGINE_IO,r,c,p)]    = pe_input_valid		        [                                                                                           (r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)];
                        assign pe_input_accept	            [                                                                                          (r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)]    = layer_eng_io_input_accept	    [                                      get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_LAYER_ENGINE_IO,r,c,p)];
                        assign layer_eng_io_input_data	    [(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_LAYER_ENGINE_IO,r,c,p) * C_PACKET_WIDTH) +: C_PACKET_WIDTH]    = pe_input_data			        [                                                        (r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p) * C_PACKET_WIDTH +: C_PACKET_WIDTH];                           
                        assign pe_output_valid			    [                                                       (r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p) * 1 +: 1]                              = layer_eng_io_output_valid	    [                                      get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_LAYER_ENGINE_IO,r,c,p)];
                        assign layer_eng_io_output_accept   [                                     get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_LAYER_ENGINE_IO,r,c,p)]    = pe_output_accept	            [                                                                                           (r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)];
                        assign pe_output_data			    [                                                       (r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p) * C_PACKET_WIDTH +: C_PACKET_WIDTH]    = layer_eng_io_output_data	    [(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_LAYER_ENGINE_IO,r,c,p)  * C_PACKET_WIDTH) +: C_PACKET_WIDTH];	
                    end else if(C_PORT_CONFIG_LAYER_BRIDGE) begin
                        //assign layer_brdg_input_valid     [                                                                          j]   = pe_input_valid		        [                                   (r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)];
                        //assign pe_input_accept	          [                                   (r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)]   = layer_brdg_input_accept	    [                                                                          j];
                        //assign layer_brdg_input_data	  [                                     (j * C_PACKET_WIDTH) +: C_PACKET_WIDTH]	  = pe_input_data			    [(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p) * C_PACKET_WIDTH +: C_PACKET_WIDTH];                           
                        //assign pe_output_valid			  [(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p) * C_PACKET_WIDTH +: C_PACKET_WIDTH]   = layer_brdg_output_valid	    [                                                                          j];
                        //assign layer_brdg_output_accept   [                                                                          j]   = pe_output_accept	        [                                   (r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)];
                        //assign pe_output_data			  [(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p) * C_PACKET_WIDTH +: C_PACKET_WIDTH]   = layer_brdg_output_data	    [                                     (j * C_PACKET_WIDTH) +: C_PACKET_WIDTH];
                    end else if (C_PORT_CONFIGURATION[r][c][p] == C_PORT_CONFIG_DATA_MOVER) begin
						ingress_interface
						i0_ingress_interface (
							.clk							(clk																															),
							.rst							(rst																															),

							.master_request					(arb_master_request					[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))]	),
							.master_request_ack				(arb_master_request_ack				[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))]	),
							.master_request_complete		(arb_master_request_complete		[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))]	),
							.master_request_error			(arb_master_request_error			[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))*7 	+: 	(7)	]	),
							.master_request_tag				(arb_master_request_tag				[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))*4 	+: 	(4)	]	),
							.master_request_option			(arb_master_request_option			[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))*4 	+: 	(4)	]	),
							.master_request_type			(arb_master_request_type			[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))*4 	+: 	(4)	]	),
							.master_request_flow			(arb_master_request_flow			[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))*10 	+: 	(10)	]	),
							.master_request_local_address	(arb_master_request_local_address	[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))*64	+:	(64)	]	),
							.master_request_length			(arb_master_request_length			[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))*36	+:	(36)	]	),
							
							.master_descriptor_src_rdy		(arb_master_descriptor_src_rdy		[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))	]	),
							.master_descriptor_dst_rdy		(arb_master_descriptor_dst_rdy		[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))	]	),
							.master_descriptor_tag			(arb_master_descriptor_tag			[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))*4	+:	(4)	]	),
							.master_descriptor				(arb_master_descriptor				[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))*128	+:	(128)	]	),
							
							.master_datain_src_rdy			(arb_master_datain_src_rdy			[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))		]	),
							.master_datain_dst_rdy			(arb_master_datain_dst_rdy			[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))		]	),
							.master_datain_tag				(arb_master_datain_tag				[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))*4	+:	(4)	]	),
							.master_datain_option			(arb_master_datain_option			[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))*6	+:	(6)	]	),
							.master_datain					(arb_master_datain					[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))*128	+:	(128)	]	),
							
							.master_dataout_src_rdy			(arb_master_dataout_src_rdy			[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))	]	),
							.master_dataout_dst_rdy			(arb_master_dataout_dst_rdy			[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))	]	),
							.master_dataout_tag				(arb_master_dataout_tag				[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))*4	+:	(4)	]	),
							.master_dataout_option			(arb_master_dataout_option			[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))*6	+:	(6)	]	),
							.master_dataout					(arb_master_dataout					[get_data_mover_idx(get_instance_index(C_PORT_CONFIGURATION,C_PORT_CONFIG_DATA_MOVER,r,c,p))*128	+:	(128)	]	),
							
							.ext_input_valid				(pe_input_valid						[(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)													]	),
							.ext_input_accept				(pe_input_accept					[(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)													]	),
							.ext_input_payload				(pe_input_data						[(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p) * C_PACKET_WIDTH +: C_PACKET_WIDTH				]	),
			
							.ext_output_valid				(pe_output_valid					[(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)													]	),
							.ext_output_accept				(pe_output_accept					[(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)													]	),
							.ext_output_payload				(pe_output_data						[(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p) * C_PACKET_WIDTH +: C_PACKET_WIDTH				]	)	
						);
					end else if (C_PORT_CONFIGURATION[r][c][p] == C_PORT_CONFIG_CONTROLLER) begin
						assign layer_eng_ctrl_input_valid       [                                                                          0]   = pe_input_valid		        [                                   (r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)];
						assign pe_input_accept	                [                                   (r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)]   = layer_eng_ctrl_input_accept   [                                                                          0];
						assign layer_eng_ctrl_input_data	    [                                     (0 * C_PACKET_WIDTH) +: C_PACKET_WIDTH]   = pe_input_data			        [(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p) * C_PACKET_WIDTH +: C_PACKET_WIDTH];                   
						assign pe_output_valid			        [(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p) * C_PACKET_WIDTH +: C_PACKET_WIDTH]   = layer_eng_ctrl_output_valid   [                                                                          0];
						assign layer_eng_ctrl_output_accept     [                                                                          0]   = pe_output_accept	            [                                   (r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)];
						assign pe_output_data			        [(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p) * C_PACKET_WIDTH +: C_PACKET_WIDTH]   = layer_eng_ctrl_output_data    [                                     (0 * C_PACKET_WIDTH) +: C_PACKET_WIDTH];
					end else if (C_PORT_CONFIGURATION[r][c][p] == C_PORT_CONFIG_MSG_INTF) begin
                        assign msg_intf_input_valid     [                                                                          0]    = pe_input_valid		    [                                   (r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)];
                        assign pe_input_accept	        [                                   (r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)]    = msg_intf_input_accept	[                                                                          0];
                        assign msg_intf_input_data	    [                                     (0 * C_PACKET_WIDTH) +: C_PACKET_WIDTH]    = pe_input_data			[(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p) * C_PACKET_WIDTH +: C_PACKET_WIDTH];                           
                        assign pe_output_valid			[                          (r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p) * 1 +: 1]    = msg_intf_output_valid	[                                                                          0];
                        assign msg_intf_output_accept   [                                                                          0]    = pe_output_accept	        [                                   (r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)];
                        assign pe_output_data			[(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p) * C_PACKET_WIDTH +: C_PACKET_WIDTH]    = msg_intf_output_data	    [                                    (0  * C_PACKET_WIDTH) +: C_PACKET_WIDTH];	
					end else if (C_PORT_CONFIGURATION[r][c][p] == C_PORT_CONFIG_NONE) begin
						assign pe_input_valid													[(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)												]	= 1'b0;
						assign pe_input_data													[(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p) * C_PACKET_WIDTH +: C_PACKET_WIDTH			]	= {C_PACKET_WIDTH{1'b0}};
						assign pe_output_accept													[(r*C_NUM_COLS*C_NUM_PE + c*C_NUM_PE + p)												]	= 1'b0;
					end
				end
			end
		end
	endgenerate

    
	master_if_arbiter_nway #(
		.C_NUM_CLIENTS							(C_NUM_DATA_MOVERS   					)
	)
	i0_master_if_arbiter_nway (
		.clk									(clk								),
		.rst									(rst								),
	
		.master_request							(master_request							),
		.master_request_ack						(master_request_ack						),
		.master_request_complete				(master_request_complete				),
		.master_request_error					(master_request_error					),
		.master_request_tag						(master_request_tag						),
		.master_request_type					(master_request_type					),
		.master_request_option					(master_request_option					),
		.master_request_flow					(master_request_flow					),
		.master_request_local_address			(master_request_local_address			),
		.master_request_length					(master_request_length					),
		
		.master_descriptor_src_rdy				(master_descriptor_src_rdy				),
		.master_descriptor_dst_rdy				(master_descriptor_dst_rdy				),
		.master_descriptor_tag					(master_descriptor_tag					),
		.master_descriptor						(master_descriptor						),
		
		.master_datain_src_rdy					(master_datain_src_rdy					),
		.master_datain_dst_rdy					(master_datain_dst_rdy					),
		.master_datain_tag						(master_datain_tag						),
		.master_datain_option					(master_datain_option					),
		.master_datain							(master_datain							),
		
		.master_dataout_src_rdy					(master_dataout_src_rdy					),
		.master_dataout_dst_rdy					(master_dataout_dst_rdy					),
		.master_dataout_tag						(master_dataout_tag						),
		.master_dataout_option					(master_dataout_option					),
		.master_dataout							(master_dataout							),
		
		.clientX_master_request					(arb_master_request						),
		.clientX_master_request_ack				(arb_master_request_ack					),
		.clientX_master_request_complete		(arb_master_request_complete			),
		.clientX_master_request_error			(arb_master_request_error				),
		.clientX_master_request_tag				(arb_master_request_tag					),
		.clientX_master_request_type			(arb_master_request_type				),
		.clientX_master_request_option			(arb_master_request_option				),
		.clientX_master_request_flow			(arb_master_request_flow				),
		.clientX_master_request_local_address	(arb_master_request_local_address		),
		.clientX_master_request_length			(arb_master_request_length				),
		
		.clientX_master_descriptor_src_rdy		(arb_master_descriptor_src_rdy			),
		.clientX_master_descriptor_dst_rdy		(arb_master_descriptor_dst_rdy			),
		.clientX_master_descriptor_tag			(arb_master_descriptor_tag				),
		.clientX_master_descriptor				(arb_master_descriptor					),
		
		.clientX_master_datain_src_rdy			(arb_master_datain_src_rdy				),
		.clientX_master_datain_dst_rdy			(arb_master_datain_dst_rdy				),
		.clientX_master_datain_tag				(arb_master_datain_tag					),
		.clientX_master_datain_option			(arb_master_datain_option				),
		.clientX_master_datain					(arb_master_datain						),
		
		.clientX_master_dataout_src_rdy			(arb_master_dataout_src_rdy				),
		.clientX_master_dataout_dst_rdy			(arb_master_dataout_dst_rdy				),
		.clientX_master_dataout_tag				(arb_master_dataout_tag					),
		.clientX_master_dataout_option			(arb_master_dataout_option				),
		.clientX_master_dataout					(arb_master_dataout						)
	);

endmodule