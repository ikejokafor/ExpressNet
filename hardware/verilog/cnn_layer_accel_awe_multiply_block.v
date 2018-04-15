`timescale 1ns / 1ns
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company:       Microsystems Design Lab (MDL)
//             The Pennsylvania State University
// Engineer:      Esakkimuthu Geethanjali
//
// Create Date:      10/15/2015
// Design Name:   Extract descriptor 
// Module Name:     
// Project Name:  Future Store Analytics
// Target Devices:   
// Tool versions:
// Description:      
//
// Dependencies:
//
// Revision:
// Revision 1.0 - File Created
//
// Additional Comments:
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_awe_multiply_block #(
	parameter C_WINDOW_SIZE_COUNTER = 4
) (
	rst						,
	clk						, 
	new_map				    ,

	cascade_datain			,
	cascade_carryin			,
	cascade_multisignin		,
	cascade_datain_valid	,

	pixel_valid_upper		,
	pixel_datain_upper		,

	pixel_valid_lower		,
	pixel_datain_lower 		,

	weight_valid			,
	weight					,

	dataout_valid			,
	dataout_p				,
	dataout_c				,

	cascade_dataout			,
	cascade_carryout		,
	cascade_multsignout		,
	cascade_dataout_valid
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	localparam   ST_IDLE          = 2'b00;
	localparam   ST_MACC          = 2'b01;

	localparam   C_MULTIPLIER_DELAY = 4;


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	input                 									rst;
	input 													clk; 
	input                                                   new_map;
	
	
	input     [(C_P_OUTPUT_WIDTH-1):0]                      cascade_datain;
	input     												cascade_carryin;
	input     												cascade_multisignin;
	input 													cascade_datain_valid;
	
	input 													pixel_valid_upper;
	input      [C_DATAIN_WIDTH-1:0]                         pixel_datain_upper;
	
	input 													pixel_valid_lower;
	input	   [C_DATAIN_WIDTH-1:0]							pixel_datain_lower ;
	
	input	   [C_WEIGHT_WIDTH_IN-1:0] 						weight;
	input													weight_valid;
	
	output 		reg											dataout_valid;
	output     [(C_P_OUTPUT_WIDTH-1):0]      				dataout_p;
	output 													dataout_c;
	
	output     [(C_P_OUTPUT_WIDTH-1):0]      				cascade_dataout;
	output 													cascade_carryout;
	output 													cascade_multsignout;
	output													cascade_dataout_valid;
	
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------	
	wire         start_new_macc  ;          
	
	wire        [(C_P_OUTPUT_WIDTH-1):0]					cas_datain ;
	wire													cas_carryin;
	
	wire       	[(C_A_INPUT_WIDTH-1):0]   					A1;
	wire        [(C_B_INPUT_WIDTH-1):0]						B1;
	
	wire       	[(C_A_INPUT_WIDTH-1):0]						A2;
	wire        [(C_B_INPUT_WIDTH-1):0]						B2;
	
	wire        [(C_P_OUTPUT_WIDTH-1):0]					P1 ;
	wire													C1;
	
	wire        [(C_P_OUTPUT_WIDTH-1):0]					P1_IN ;
	wire													C1_IN;
	wire 													MULTISIGN_IN;
	
	wire        [(C_P_OUTPUT_WIDTH-1):0]				    P2 ;
	wire													C2;
	
	
	reg 		[2:0]										count;
	reg         [C_WINDOW_SIZE_COUNTER:0]					preg_rst;
	reg         [1:0]										state;
	
	wire        [8:0]                                       opmode_0;
	wire        [8:0]                                       opmode_1;
	
	wire 													dataout_valid_w;
	
	wire 										 			carrycascade_out_0;
	wire 										 			multsign_out_0;
	wire 		[C_P_OUTPUT_WIDTH-1:0]						pc_out_0;
	
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------    
    awe_macc  macc0
	(
		.rst							(rst),
		.start_new_macc					(start_new_macc),
		.opmode							(opmode_0),
		.CE								(1'b1),
		.CLK							(clk),
		
		.C_IN							(1'b0),
		.P_IN							(48'b0),
		.MULTSIGNIN						(1'b0),
		
		.A								(A1),
		.B								(B1),
		.P								(P1),
		.C_OUT							(C1),
	
		.CARRYCASCOUT					(carrycascade_out_0),
		.MULTSIGNOUT					(multsign_out_0),
		.PCOUT							(pc_out_0)
	
	);
	
	
	awe_macc  macc1
	(
		.rst							(rst),
		.start_new_macc					(start_new_macc),
		.opmode							(opmode_1),
		.CE								(1'b1),
		.CLK							(clk),
		
		.C_IN							(C1_IN),
		.P_IN							(P1_IN),
		.MULTSIGNIN						(MULTISIGN_IN),
		
		.A								(A2),
		.B								(B2),
		.P								(P2),
		.C_OUT							(C2) ,   
		
		.CARRYCASCOUT					(cascade_carryout),
		.MULTSIGNOUT					(cascade_multsignout),
		.PCOUT							(cascade_dataout)
		
	);

	
	// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------	
	assign  opmode_0 = (preg_rst[C_WINDOW_SIZE_COUNTER-3])?9'b010000101:
					   (preg_rst[C_WINDOW_SIZE_COUNTER-2])?9'b010000000:
					   (preg_rst[C_WINDOW_SIZE_COUNTER-1])?9'b010000000:
					   (preg_rst[C_WINDOW_SIZE_COUNTER])?9'b000000101:
						9'b010000101;
						
						
						
						
	assign  opmode_1 =  (preg_rst[C_WINDOW_SIZE_COUNTER-3])?9'b010000000:
						(preg_rst[C_WINDOW_SIZE_COUNTER-2])?9'b010010000:
						(preg_rst[C_WINDOW_SIZE_COUNTER-1])?9'b010010000:
						(preg_rst[C_WINDOW_SIZE_COUNTER])?9'b000000101:
						 9'b010000101; 
						 
		 
						 

	assign  start_new_macc  = preg_rst[C_WINDOW_SIZE_COUNTER-2] | preg_rst[C_WINDOW_SIZE_COUNTER-1]|preg_rst[C_WINDOW_SIZE_COUNTER];
	

	
	
	assign A1 = (pixel_valid_upper && weight_valid)? pixel_datain_upper:0;
	assign B1 = (pixel_valid_upper && weight_valid)? weight[C_WEIGHT_WIDTH-1:0]:0;
	
	
	assign A2 = (pixel_valid_lower && weight_valid)? pixel_datain_lower:0;
	assign B2 = (pixel_valid_lower && weight_valid)? weight[C_WEIGHT_WIDTH_IN-1:C_WEIGHT_WIDTH]:0;
	
	assign dataout_valid_w		  = preg_rst[C_WINDOW_SIZE_COUNTER];
    assign dataout_p              = P2;
    assign dataout_c			  = C2; 

	
    assign P1_IN  = (preg_rst[C_WINDOW_SIZE_COUNTER-1])? pc_out_0:
			 cascade_datain_valid? cascade_datain:0;
			 
	assign C1_IN  = (preg_rst[C_WINDOW_SIZE_COUNTER-1])? 0:
			 cascade_datain_valid?0 :0;
			 
	assign MULTISIGN_IN = (preg_rst[C_WINDOW_SIZE_COUNTER-1])?multsign_out_0:
			 (cascade_datain_valid)? cascade_multisignin:	0;		 
		
	assign cascade_dataout_valid = dataout_valid;
	
	

	always @(posedge clk)
	begin 
		if(rst | new_map)
		begin 
			state 		<=   ST_IDLE;
			count 		<= 0;	
			preg_rst	<= 0;
		end 
		else
		begin
			case(state)
				ST_IDLE:
				begin
					if(pixel_valid_upper && pixel_valid_lower && weight_valid)
						begin 
							count 			<= count +1;
							if(count == C_MULTIPLIER_DELAY-1)
							begin 
								state  		<= ST_MACC;
								count 		<= 0;
								preg_rst[0] <=1'b1;
							end	
						
						end 
				end
				ST_MACC:
				begin
					if (count <= C_WINDOW_SIZE_COUNTER)
					begin 	
						if(pixel_valid_upper && pixel_valid_lower && weight_valid)
						begin 
							count 		<= count +1;
							preg_rst 	<= preg_rst << 1;
						end
					end		
					else
					begin 
					    count       	<= 0;
						preg_rst[0] 	<= 1'b1;
						preg_rst[C_WINDOW_SIZE_COUNTER] <= 1'b0;
						
						
					end 	
					
				end	
			endcase
		end 	
	end
	
	always @(posedge clk)
	begin
	if(rst)	
		dataout_valid <= 0;
	else	
		dataout_valid <= dataout_valid_w;
	end
	// END logic ------------------------------------------------------------------------------------------------------------------------------------

endmodule