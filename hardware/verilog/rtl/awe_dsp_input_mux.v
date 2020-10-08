module awe_dsp_input_mux
(
	clk,
	rst,
	
	mode,
	
	datain_0,
	datain_1,
	datain_2,
	datain_3,
	
	dataout

);
 `include "awe.vh"
 
	parameter C_DATA_WIDTH   = 18;

	input						clk;
	input						rst;
	
	input [1:0]					mode;
	
	input [C_DATA_WIDTH-1:0]	datain_0;
	input [C_DATA_WIDTH-1:0]	datain_1;
	input [C_DATA_WIDTH-1:0]	datain_2;
	input [C_DATA_WIDTH-1:0]	datain_3;
	
	output reg [C_DATA_WIDTH-1:0]	dataout;



	always @(*)
	begin
		case(mode)
			2'b00:dataout = datain_0;
			2'b01:dataout = datain_1;
			2'b10:dataout = datain_2;
			2'b11:dataout = datain_3;
		endcase
	end	
	
	endmodule
	