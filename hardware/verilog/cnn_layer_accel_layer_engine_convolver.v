`timescale 1ns / 1ps

module layer_engine_convolver
(
	clk                 ,
	rst                 ,
	
	opcode              ,
	opcode_valid        ,
	opcode_accept       ,
	
	datain              ,
	datain_valid        ,
	datain_ready        ,
	
	dataout             ,
	dataout_valid       ,
	dataout_ready       ,
	
	config_address      ,
	config_wren         ,
	config_wrack        ,
	config_rden         ,
	config_rdack        ,
	config_datain       ,
	config_dataout      
);
    
    parameter C_DATAIN_WIDTH    = 128;
    parameter C_DATAOUT_WIDTH   = 128;
	parameter C_OPCODE_WIDTH    = 64;
    
	input									clk;
	input									rst;
	
	input	[C_OPCODE_WIDTH-1:0]        	opcode;
	input									opcode_valid;
	output									opcode_accept;
		
	input	[C_DATAIN_WIDTH-1:0]			datain;
	input									datain_valid;
	output									datain_ready;
	
	output	[C_DATAOUT_WIDTH-1:0]			dataout;
	output									dataout_valid;
	input									dataout_ready;
	
	input	[35:0]							config_address;
	input									config_wren;
	output									config_wrack;
	input									config_rden;
	output									config_rdack;
	input	[127:0]							config_datain;
	output	[127:0]							config_dataout;
    
endmodule