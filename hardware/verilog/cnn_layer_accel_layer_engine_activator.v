`timescale 1ns / 1ps

module layer_engine_activator
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
	dataout_ready       
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
    
endmodule