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
// Additional Comments:     /* this module infers block ram */
//                          Dual Port Block RAM (True Dual Port, Two R/W Ports)
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_awe_weight_table
(
	clka		,
	dina		,
	addra		,
	wea			,
	douta		,

	clkb		,
	dinb		,
	addrb		,
	web			,
	doutb		
);

parameter WIDTH		= 32;
parameter N_DEPTH	= 256;
parameter W_DEPTH	= 8;
//Changed by geetha
//parameter FILENAME	= "../verilog/gauss_ram_init_file.dat";
//parameter FILENAME	= "guassian_weights_bin.dat";

input					clka	;
input [WIDTH-1  :0]		dina	;
input [W_DEPTH-1:0]		addra	;
input					wea		;
output reg [WIDTH-1:0]	douta	;

input					clkb	;
input [WIDTH-1  :0]		dinb	;
input [W_DEPTH-1:0]		addrb	;
input					web		;
output reg [WIDTH-1:0]	doutb	;

/* synthesis syn_ramstyle="block_ram" */
reg [WIDTH-1:0] ram [0:N_DEPTH-1];

//initial
//	$readmemb(FILENAME, ram);

always @(posedge clka) begin
    if (wea)
		ram[addra] <= dina;
	douta <= ram[addra];
end

always @(posedge clkb)
begin
    if (web)
		ram[addrb] <= dinb;
	doutb <= ram[addrb];
end

endmodule
