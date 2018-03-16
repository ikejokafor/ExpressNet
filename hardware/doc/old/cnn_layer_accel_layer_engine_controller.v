`timescale 1ns / 1ps

module layer_engine_controller
(
    clk             ,
	rst             ,
	
	msg_in_valid    ,
	msg_in_accept   ,
	msg_in_payload  ,
	
	msg_out_valid   ,
	msg_out_accept  ,
	msg_out_payload ,
    
    opcode          ,
    opcode_valid    ,
    opcode_accept   ,
    
    config_address  ,
    config_wren     ,
    config_wrack    ,
    config_rden     ,
    config_rdack    ,
    config_datain   ,
    config_dataout  
);

    parameter C_DATA_WIDTH          = 128;
    parameter C_NUM_OPCODE_PORTS    = 4;
    parameter C_OPCODE_WIDTH        = 64;
    
    input						                        clk				;
	input						                        rst				;
	
	input	                	                        msg_in_valid	;
	output	                	                        msg_in_accept	;
	input	[C_DATA_WIDTH-1:0]	                        msg_in_payload	;
	
	output	    				                        msg_out_valid	;
	input	    				                        msg_out_accept	;
	output	[C_DATA_WIDTH-1:0]	                        msg_out_payload	;
    
    output	[(C_NUM_OPCODE_PORTS*C_OPCODE_WIDTH)-1:0]   opcode          ;
	output	[ C_NUM_OPCODE_PORTS-1:0]				    opcode_valid    ;
	input	[ C_NUM_OPCODE_PORTS-1:0]				    opcode_accept   ;
    
    output  [15:0]                                      config_address  ;
    output                                              config_wren     ;
    input                                               config_wrack    ;
    output                                              config_rden     ;
    input                                               config_rdack    ;
    output  [127:0]                                     config_datain   ;
    input   [127:0]                                     config_dataout  ;
    
endmodule