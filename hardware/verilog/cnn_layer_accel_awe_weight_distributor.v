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
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_awe_weight_distributor
(
  rst,
  clk,
  clk_5x,
  
  write_weights_valid,
  weight_input,
    
  config_valid,
  config_packet,
  
  weight_request_upper_valid, 
  weight_upper_output,
  weight_upper_valid,
  
  weight_request_lower_valid, 
  weight_lower_output,
  weight_lower_valid


);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"


	parameter 	C_NO_OF_KERNALS 					= 10;
	parameter 	C_KERNAL_SIZE         				= 10;
	parameter 	C_FLAG_WEIGHT_ORDER  				= 1'b1;   // C_FLAG_WEIGHT_ORDER = 1 finish the entire row before moving on to next kernal
															// C_FLAG_WEIGHT_ORDER = Iterate through all the kernals before moving on to the next image pixel
	parameter 	C_WIGHT_TABLE_SIZE    				= 1024;
	parameter 	C_WEIGHT_TABLE_ADDRESS_WIDTH		= 10;
											
	
	localparam 	C_WEIGHT_TABLE_SIZE_BY_2 			= C_WIGHT_TABLE_SIZE >> 1 ;
	
	
	
	
	localparam   ST_IDLE        			       	=    3'b000 	;
	localparam   ST_FILL_WEIGHT_TABLE	           	=	 3'b001	;
	localparam   ST_READ_WEIGHTS_WAIT	           	=    3'b010	;
	localparam   ST_READ_WEIGHTS_FIRST_ALL_INPUTS  	= 	 3'b011	;
	localparam   ST_READ_WEIGHTS_FIRST_ALL_KERNALS 	= 	 3'b100	;




	input									write_weights_valid ;
	input   [(2*C_WEIGHT_WIDTH)-1:0]		weight_input		;
	
	input 									weight_request_upper_valid;
	input 									weight_request_lower_valid;
	
	output	[((2*C_WEIGHT_WIDTH)-1):0]		weight_upper_output		;
	output	reg								weight_upper_valid		;
	
	output  [((2*C_WEIGHT_WIDTH-1)):0]		weight_lower_output		;
	output	reg						    	weight_lower_valid		;
	
	input									config_valid		;
	input   [C_PACKET_WIDTH-1:0]			config_packet		;
	
	input 									rst					;
	input									clk					;
	input									clk_5x				;
	

//internal register state
	reg   [2                    			:0 ]   					state			;
	reg   [C_NO_OF_KERNALS-1				:0 ]					no_of_kernals	;
	reg   [C_KERNAL_SIZE-1  				:0 ]    				size_of_kernal  ;
	reg   [10				  				:0 ]    				input_map_size  ;
	
	reg   [C_NO_OF_KERNALS-1				:0 ]					count_weight_kernal;
	reg   [C_KERNAL_SIZE-1  				:0 ]    				count_weight  ;
	reg   [10								:0 ]					count_input_map;
	reg   [1                                :0 ]					count_startup;
	
	
	reg   [C_WEIGHT_TABLE_ADDRESS_WIDTH-1	:0 ]    				address_port_a;
	reg   [C_WEIGHT_TABLE_ADDRESS_WIDTH-1	:0 ]    				address_port_b;
	
	reg   [((2*C_WEIGHT_WIDTH)-1)           :0 ]				    din_port_a;
	reg   [((2*C_WEIGHT_WIDTH)-1)           :0 ]    				din_port_b;
	
	wire  [((2*C_WEIGHT_WIDTH)-1)   	    :0 ]				    dout_port_a;
	wire  [((2*C_WEIGHT_WIDTH)-1) 	     	:0 ]    				dout_port_b;
	
	reg 															wea;
	reg																web;
	
	reg   [C_WEIGHT_TABLE_ADDRESS_WIDTH-1	:0 ]    				start_address_current_kernal_port_a;
	reg   [C_WEIGHT_TABLE_ADDRESS_WIDTH-1	:0 ]    				start_address_current_kernal_port_b;
	
	
	reg 															upper_weight_table_done;
	

	always @(posedge clk_5x)
	begin 
		if(rst)
		begin 
			state <= ST_IDLE;
			count_startup <=0;
		end 
		else
		begin
			case(state)
			ST_IDLE:
				begin
					if(config_valid == 1'b1)
					begin 
						no_of_kernals  				<= config_packet[3:0];
						size_of_kernal 				<= config_packet[7:4];
						input_map_size 				<= config_packet[15:8];
						
						count_weight 				<= 	0;
						count_weight_kernal 		<=	0;
						
						address_port_a 				<= 	0;
						address_port_b 				<= 	1;
						
						state = ST_FILL_WEIGHT_TABLE;
					end 
				
				end 
			ST_FILL_WEIGHT_TABLE:
				begin 
				   
					if(count_weight_kernal <= no_of_kernals)
					begin 
						if(count_weight <= size_of_kernal)
						begin
						
							if(write_weights_valid == 1'b1)
							begin								
									
									din_port_a 		<= weight_input;
									din_port_b 		<= weight_input; // needs to be changed
									
									wea           	<=  1'b1;
									web           	<=  1'b1;
									
									address_port_a 	<= address_port_a + 2;
									address_port_b 	<= address_port_b + 2;
									
									if(count_weight == size_of_kernal)
									begin
										count_weight <= 0;
										count_weight_kernal <= count_weight_kernal + 1;
									end	
									else
										count_weight  <= count_weight + 1;
							end 
						end
					end 	
					else
					begin
					    if(upper_weight_table_done)
						begin 
							state 									<= 	ST_READ_WEIGHTS_WAIT;
							
							wea 									<=  1'b0;
							web 									<=  1'b0;
							address_port_a 							<= 	0;
							address_port_b    						<= 	C_WEIGHT_TABLE_SIZE_BY_2;
							
							start_address_current_kernal_port_a 	<= 	0;
							start_address_current_kernal_port_b  	<= 	C_WEIGHT_TABLE_SIZE_BY_2;
							
							count_weight      						<= 	0;
							count_weight_kernal 					<= 	0;
							count_input_map                         <=  0;
						end 
						else
						begin 
							upper_weight_table_done 				<= 1'b1;
							count_weight      						<= 	0;
							count_weight_kernal 					<= 	0;
							count_input_map                         <=  0;
							address_port_a 							<= 	C_WEIGHT_TABLE_SIZE_BY_2;
							address_port_b    						<= 	C_WEIGHT_TABLE_SIZE_BY_2 + 1;
						
						end 
						
					end 
				
				end
			ST_READ_WEIGHTS_WAIT:
			begin 
			
				if(weight_request_upper_valid || weight_request_lower_valid)
				begin 
				    if (C_FLAG_WEIGHT_ORDER == 1'b1)
						state <= ST_READ_WEIGHTS_FIRST_ALL_KERNALS;
					else
						state <= ST_READ_WEIGHTS_FIRST_ALL_INPUTS;	
				end
				
			end 
			ST_READ_WEIGHTS_FIRST_ALL_INPUTS:
			begin

				if(count_weight == size_of_kernal)
				begin 
					count_weight <= 0;
					
					if(count_input_map == input_map_size)
					begin
						
						start_address_current_kernal_port_a <= address_port_a;
						start_address_current_kernal_port_b <= address_port_b;
						count_input_map 					<= 0;
	                    count_weight_kernal                 <= count_weight_kernal + 1;						
					end 
					else
					begin 
						address_port_a 		<= start_address_current_kernal_port_a;
						address_port_b   	<= start_address_current_kernal_port_b;
						count_input_map   	<= count_input_map + 1;
					
					end 
						
				end	
				else
				begin
					if(count_weight_kernal == no_of_kernals )
					begin
						count_weight              <= 0;
						address_port_a            <= 0;
						address_port_b            <= 0;
						weight_upper_valid	      <= 0;
						weight_lower_valid  	  <= 0;
						state                     <= ST_IDLE;
					end 
					else
					begin 
						count_weight							<= count_weight + 1;
						if(weight_request_lower_valid)
						begin 
							address_port_a 							<= address_port_a + 1;
							if(count_startup < 2'b10)
							begin 
								weight_lower_valid   				<= 1'b0;
								count_startup                       <= count_startup +1 ;   
							end 	
							else
								weight_lower_valid   					<= 1'b1;	
						end 	
						else
						begin 
							address_port_a 							<= address_port_a;
							weight_lower_valid 						<= 1'b0;	
						
						end 
						if(weight_request_upper_valid)	
						begin 
							address_port_b 							<= address_port_b + 1;
							if(count_startup < 2'b10)
							begin 
								weight_upper_valid   				<= 1'b0;
							end 	
							else
								weight_upper_valid   					<= 1'b1;	
						end 
						else
						begin 
							address_port_b 							<= address_port_b;
							weight_upper_valid	 					<= 1'b0;
						end	
						
					end 	
							  
				end	
			
			end 
		ST_READ_WEIGHTS_FIRST_ALL_KERNALS:
			begin
			    
				if(count_weight == size_of_kernal)
				begin 
					count_weight <= 0;
					if(count_weight_kernal == no_of_kernals)
					begin
						start_address_current_kernal_port_a <= 0;
						start_address_current_kernal_port_b <= C_WEIGHT_TABLE_SIZE_BY_2;
						count_weight_kernal <= 0;	
						count_input_map     <= count_input_map + 1;
					end 
					else
					begin 
						count_weight_kernal   <= count_weight_kernal + 1;
					end 
						
				end	
				else
				begin
				    if(count_input_map == input_map_size)
					begin 
						count_weight              <= 0;
						address_port_a            <= 0;
						address_port_b            <= 0;
						weight_upper_valid        <= 0;
						weight_lower_valid        <= 0;
						state                     <= ST_IDLE;
					
					end 
					else
					begin 
						count_weight							<= count_weight + 1;
						if(weight_request_lower_valid)
						begin 
							address_port_a 							<= address_port_a + 1;
							if(count_startup < 2'b10)
							begin 
								weight_lower_valid   				<= 1'b0;
								count_startup                       <= count_startup +1 ;   
							end 	
							else
								weight_lower_valid   					<= 1'b1;	
						end 	
						else
						begin 
							address_port_a 							<= address_port_a;
							weight_lower_valid 						<= 1'b0;	
						
						end 
						if(weight_request_upper_valid)	
						begin 
							address_port_b 							<= address_port_b + 1;
							if(count_startup < 2'b10)
							begin 
								weight_upper_valid   				<= 1'b0;
							end 	
							else
								weight_upper_valid   					<= 1'b1;	
						end 
						else
						begin 
							address_port_b 							<= address_port_b;
							weight_upper_valid	 					<= 1'b0;
						end	
						
						
					end 		  
				end	
			
			end
		endcase			
		end 
	
	end 

	assign  weight_upper_output = dout_port_a;
	assign  weight_lower_output = dout_port_b;
	
		awe_weight_table
		#(
			.WIDTH  ( 	C_WEIGHT_WIDTH*2				),
			.N_DEPTH(	C_WIGHT_TABLE_SIZE				),
			.W_DEPTH(	C_WEIGHT_TABLE_ADDRESS_WIDTH	)
		)weight_table_0
		(
			.clka		(clk_5x),
			.dina		(din_port_a),
			.addra		(address_port_a),
			.wea		(wea),
			.douta		(dout_port_a),
		
			.clkb		(clk_5x),
			.dinb		(din_port_b),
			.addrb		(address_port_b),
			.web		(web),
			.doutb		(dout_port_b)
		);

endmodule