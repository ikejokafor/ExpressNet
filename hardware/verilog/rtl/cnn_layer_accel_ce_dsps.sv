`timescale 1ns / 1ns

module cnn_layer_accel_ce_dsps
(
	rst						,
	clk						, 
	clk_5x					,
	
	new_map				    ,
	kernal_window_size      ,
	mode                    ,	
		
	cascade_datain			,
	cascade_carryin			,
	cascade_datain_valid	,
		
	pixel_valid_upper		,
	pixel_datain_upper		,
		
	pixel_valid_lower		,
	pixel_datain_lower 		,
		
	weight_valid_upper		,
	weight_datain_upper		,
	
	weight_valid_lower		,
	weight_datain_lower		,
		
	dataout_valid			,
	dataout_p				,
	dataout_c				,
		
	cascade_dataout			,
	cascade_carryout		,
	cascade_dataout_valid
);

	`include "awe.svh"

	parameter C_MAX_WINDOW_SIZE_COUNTER = 11 +1; // MAX KERNAL SIZE + 1 


	localparam  	ST_IDLE 			          = 2'b00;
	localparam   	ST_MACC         			  = 2'b01;
	localparam   	ST_POOLING       			  = 2'b10;
	
	localparam 		C_PIPE_DELAY 				  =	5;
	localparam      C_PIPE_DELAY_CONV             = 2;
	localparam 		C_NUM_DATA_STAGES_B_DSP_0  	  =	1;
	localparam 		C_NUM_DATA_STAGES_C_DSP_0     =	3;
	localparam 		C_NUM_DATA_STAGES_C_DSP_1     =	2;
	localparam      C_NUM_DATA_STAGES_PCIN_DSP_0  = 3;
	localparam 		C_NUM_MAX_STAGES       		  =	1; 
	
	
	localparam     C_MULTIPLIER_DELAY = 4;



	input                 											rst;
	input 															clk; 
	input															clk_5x;
	
	
	input                                             		        new_map;
	input  				[C_KERNAL_SIZE_WIDTH-1:0]                   kernal_window_size;
	input 				[C_MODE_WIDTH-1:0]							mode;
	
	
	input      			[(C_P_OUTPUT_WIDTH-1):0]                    cascade_datain;
	input     														cascade_carryin;
	input 															cascade_datain_valid;
	
													
	input 															pixel_valid_upper;
	input      signed 	[C_DATAIN_WIDTH-1:0]                        pixel_datain_upper;
	
	input 															pixel_valid_lower;
	input	   signed 	[C_DATAIN_WIDTH-1:0]						pixel_datain_lower ;
	
	input	   signed 	[C_WEIGHT_WIDTH-1:0] 						weight_datain_upper;
	input															weight_valid_upper;
	
	input	   signed	[C_WEIGHT_WIDTH-1:0] 						weight_datain_lower;
	input															weight_valid_lower;
	
	output 		reg													dataout_valid;
	output     			[(C_P_OUTPUT_WIDTH-1):0]      				dataout_p;
	output 															dataout_c;
	
	output     			[(C_P_OUTPUT_WIDTH-1):0]      				cascade_dataout;
	output 															cascade_carryout;
	output															cascade_dataout_valid;
	

	wire    signed   	[(C_A_INPUT_WIDTH-1):0]   					A0;
	wire    signed    	[(C_B_INPUT_WIDTH-1):0]						B0;
	wire    signed    	[(C_C_INPUT_WIDTH-1):0]						C0;
	
	wire    signed   	[(C_A_INPUT_WIDTH-1):0]						A1;
	wire    signed     	[(C_B_INPUT_WIDTH-1):0]						B1;
	wire    signed    	[(C_C_INPUT_WIDTH-1):0]						C1;
	
	wire    signed    	[(C_P_OUTPUT_WIDTH-1):0]					P0_IN ;
	wire															C0_IN;
	
	
	wire    signed    	[(C_P_OUTPUT_WIDTH-1):0]					P1_IN ;
	wire															C1_IN;
	
	wire    signed    	[(C_P_OUTPUT_WIDTH-1):0]					PRODUCT0 ;
	wire				[3:0]										CARRY0;
	
	wire    signed    	[(C_P_OUTPUT_WIDTH-1):0]				    PRODUCT1 ;
	wire				[3:0]										CARRY1;
	
	
	
	wire        		[8:0]                                       OPMODE_0;
	wire        		[8:0]                                       OPMODE_1;
	
	wire        		[3:0]                                       ALUMODE_0;
	wire        		[3:0]                                       ALUMODE_1;
	
	
	wire 										 					CARRYCASCOUT0;
	wire 	signed		[C_P_OUTPUT_WIDTH-1:0]						PCOUT0;
	
	wire    signed    	[C_B_INPUT_WIDTH-1:0]						BCOUT0;
	wire    signed    	[C_B_INPUT_WIDTH-1:0]						BCOUT1;
	
	
	wire 															dataout_valid_w;
	
	reg 				[2:0]										count;
	reg         		[C_MAX_WINDOW_SIZE_COUNTER:0]				preg_rst;
	reg         		[1:0]										state;

		    
	reg  	signed		[C_DATAIN_WIDTH-1:0]   					   	dsp_0_B_stage_reg[C_NUM_DATA_STAGES_B_DSP_0-1:0];
	reg  	signed		[C_DATAIN_WIDTH-1:0]      				   	dsp_0_C_stage_reg[C_NUM_DATA_STAGES_C_DSP_0-1:0];
	reg  	signed		[C_DATAIN_WIDTH-1:0]      				   	dsp_0_PCIN_stage_reg[C_NUM_DATA_STAGES_PCIN_DSP_0-1:0];
	reg                                                             dsp_0_PCIN_valid_stage_reg[C_NUM_DATA_STAGES_PCIN_DSP_0-1:0];
	
	reg  	signed		[C_DATAIN_WIDTH-1:0]      				   	dsp_1_C_stage_reg[C_NUM_DATA_STAGES_C_DSP_1-1:0];
	
	reg 	signed		[C_DATAIN_WIDTH-1:0]      				   	min_max_stage_reg[C_NUM_MAX_STAGES-1:0];
		
			
	wire    signed		[C_DATAIN_WIDTH-1:0] 					   	min_max_pixel_value_of_input_w;
		
	reg    				[C_PIPE_DELAY-1:0]    	 				   	pipe_delay;
	reg    				[C_PIPE_DELAY_CONV-1:0]    	 				   	pipe_delay_convolution;
	
		
	reg  				[C_KERNAL_SIZE_WIDTH-1:0]                  	kernal_window_size_reg;
	reg 				[C_MODE_WIDTH-1:0]						   	mode_reg;
	
	reg           										    		start_flag ;
	
	
	wire    signed		[C_INPUT_MUX_WIDTH-1:0]						dsp_mux_0_A_datain_0;
	wire    signed		[C_INPUT_MUX_WIDTH-1:0]						dsp_mux_0_A_datain_1;
	wire    signed		[C_INPUT_MUX_WIDTH-1:0]						dsp_mux_0_A_datain_2;
	wire    signed		[C_INPUT_MUX_WIDTH-1:0]						dsp_mux_0_A_datain_3;
	
	
	wire    signed		[C_INPUT_MUX_WIDTH-1:0]						dsp_mux_0_B_datain_0;
	wire    signed		[C_INPUT_MUX_WIDTH-1:0]						dsp_mux_0_B_datain_1;
	wire    signed		[C_INPUT_MUX_WIDTH-1:0]						dsp_mux_0_B_datain_2;
	wire    signed		[C_INPUT_MUX_WIDTH-1:0]						dsp_mux_0_B_datain_3;
	
	
	wire    signed		[C_INPUT_MUX_WIDTH-1:0]						dsp_mux_1_A_datain_0;
	wire    signed		[C_INPUT_MUX_WIDTH-1:0]						dsp_mux_1_A_datain_1;
	wire    signed		[C_INPUT_MUX_WIDTH-1:0]						dsp_mux_1_A_datain_2;
	wire    signed		[C_INPUT_MUX_WIDTH-1:0]						dsp_mux_1_A_datain_3;
	
	
	wire  	signed 		[C_INPUT_MUX_WIDTH-1:0]						dsp_mux_1_B_datain_0;
	wire  	signed 		[C_INPUT_MUX_WIDTH-1:0]						dsp_mux_1_B_datain_1;
	wire    signed 		[C_INPUT_MUX_WIDTH-1:0]						dsp_mux_1_B_datain_2;
	wire    signed 		[C_INPUT_MUX_WIDTH-1:0]						dsp_mux_1_B_datain_3;
	
	wire    signed 		[(C_INPUT_MUX_WIDTH-1):0] 					dsp_mux_0_A_dataout;
	wire    signed 		[(C_INPUT_MUX_WIDTH-1):0]					dsp_mux_0_B_dataout;
	
	wire    signed 		[(C_INPUT_MUX_WIDTH-1):0]  					dsp_mux_1_A_dataout;
	wire    signed 		[(C_INPUT_MUX_WIDTH-1):0]					dsp_mux_1_B_dataout;
	
	integer      i;
	
	
	
	
	assign  dsp_mux_0_A_datain_0 = {{(C_INPUT_MUX_WIDTH - C_DATAIN_WIDTH){pixel_datain_upper[C_DATAIN_WIDTH-1]}},pixel_datain_upper};
	assign  dsp_mux_0_A_datain_1 = ({(C_INPUT_MUX_WIDTH){pixel_datain_upper[C_DATAIN_WIDTH-1]}});
	assign  dsp_mux_0_A_datain_2 = {{(C_INPUT_MUX_WIDTH){pixel_datain_upper[C_DATAIN_WIDTH-1]}}};
	assign  dsp_mux_0_A_datain_3 = {(C_INPUT_MUX_WIDTH){0}};
	
	
	awe_dsp_input_mux
	#(
		.C_DATA_WIDTH(C_INPUT_MUX_WIDTH)
	)
	dsp_0_input_mux_A
	(
		.clk		(clk_5x),
		.rst		(rst),
		
		.mode   	(mode_reg),
		
		.datain_0	(dsp_mux_0_A_datain_0),
		.datain_1	(dsp_mux_0_A_datain_1),
		.datain_2	(dsp_mux_0_A_datain_2),
		.datain_3	(dsp_mux_0_A_datain_3),
		
		.dataout	(dsp_mux_0_A_dataout)

	);
	
	
	assign  dsp_mux_0_B_datain_0 = {{(C_INPUT_MUX_WIDTH - C_WEIGHT_WIDTH){weight_datain_upper[C_WEIGHT_WIDTH-1]}},weight_datain_upper[C_WEIGHT_WIDTH-1:0]};
	assign  dsp_mux_0_B_datain_1 = {{(C_INPUT_MUX_WIDTH - C_DATAIN_WIDTH){pixel_datain_upper[C_DATAIN_WIDTH-1]}},pixel_datain_upper};
	assign  dsp_mux_0_B_datain_2 = {{(C_INPUT_MUX_WIDTH - C_DATAIN_WIDTH){pixel_datain_upper[C_DATAIN_WIDTH-1]}},pixel_datain_upper};
	assign  dsp_mux_0_B_datain_3 = {(C_INPUT_MUX_WIDTH){0}};
	
	
	
	awe_dsp_input_mux 
	#(
		.C_DATA_WIDTH(C_INPUT_MUX_WIDTH)
	)
	dsp_0_input_mux_B
	(
		.clk		(clk_5x),
		.rst		(rst),
		
		.mode		(mode_reg),
		
		.datain_0	(dsp_mux_0_B_datain_0),
		.datain_1	(dsp_mux_0_B_datain_1),
		.datain_2	(dsp_mux_0_B_datain_2),
		.datain_3	(dsp_mux_0_B_datain_3),
		
		.dataout	(dsp_mux_0_B_dataout)

	);
	
	assign  dsp_mux_1_A_datain_0 = {{(C_INPUT_MUX_WIDTH - C_DATAIN_WIDTH){pixel_datain_lower[C_DATAIN_WIDTH-1]}},pixel_datain_lower};
	assign  dsp_mux_1_A_datain_1 = {(C_INPUT_MUX_WIDTH){min_max_pixel_value_of_input_w[C_DATAIN_WIDTH-1]}};
	assign  dsp_mux_1_A_datain_2 = {(C_INPUT_MUX_WIDTH){min_max_pixel_value_of_input_w[C_DATAIN_WIDTH-1]}};
	assign  dsp_mux_1_A_datain_3 = {(C_INPUT_MUX_WIDTH){0}};
	
	
	awe_dsp_input_mux
	#(
		.C_DATA_WIDTH(C_INPUT_MUX_WIDTH)
	)
	dsp_1_input_mux_A
	(
		.clk		(clk_5x),
		.rst		(rst),
		
		.mode		(mode_reg),
		
		.datain_0	(dsp_mux_1_A_datain_0),
		.datain_1	(dsp_mux_1_A_datain_1),
		.datain_2	(dsp_mux_1_A_datain_2),
		.datain_3	(dsp_mux_1_A_datain_3),
		
		.dataout	(dsp_mux_1_A_dataout)

	);
	
	assign  dsp_mux_1_B_datain_0 = {{(C_INPUT_MUX_WIDTH - C_WEIGHT_WIDTH){weight_datain_lower[C_WEIGHT_WIDTH-1]}},weight_datain_lower[C_WEIGHT_WIDTH-1:0]};
	assign  dsp_mux_1_B_datain_1 = {{(C_INPUT_MUX_WIDTH - C_DATAIN_WIDTH){min_max_pixel_value_of_input_w[C_DATAIN_WIDTH-1]}},min_max_pixel_value_of_input_w};
	assign  dsp_mux_1_B_datain_2 = {{(C_INPUT_MUX_WIDTH - C_DATAIN_WIDTH){min_max_pixel_value_of_input_w[C_DATAIN_WIDTH-1]}},min_max_pixel_value_of_input_w};
	assign  dsp_mux_1_B_datain_3 = {(C_INPUT_MUX_WIDTH){0}};
	
	awe_dsp_input_mux
	#(
		.C_DATA_WIDTH(C_INPUT_MUX_WIDTH)
	)
	dsp_1_input_mux_B
	(
		.clk		(clk_5x),
		.rst		(rst),
		
		.mode		(mode_reg),
		
		
		.datain_0	(dsp_mux_1_B_datain_0),
		.datain_1	(dsp_mux_1_B_datain_1),
		.datain_2	(dsp_mux_1_B_datain_2),
		.datain_3	(dsp_mux_1_B_datain_3),
		
		.dataout	(dsp_mux_1_B_dataout)
	
	 );

	 	
		
	assign A0 = ((pixel_valid_upper && weight_valid_upper && (mode_reg == `CONVOLUTION_MODE))  |
				 (pixel_valid_upper && pixel_valid_lower  && (mode_reg == `MAX_POOLING_MODE)) | 
				 (pixel_valid_upper && pixel_valid_lower  && (mode_reg == `MIN_POOLING_MODE)) | 
				 (pixel_valid_upper && weight_valid_upper && (mode_reg == `FC_MODE))           )? {{(C_A_INPUT_WIDTH - C_INPUT_MUX_WIDTH){dsp_mux_0_A_dataout[C_INPUT_MUX_WIDTH-1]}}, dsp_mux_0_A_dataout}:0;
				
	assign B0 = ((pixel_valid_upper && weight_valid_upper && (mode_reg == `CONVOLUTION_MODE))  |
				 (pixel_valid_upper && pixel_valid_lower  && (mode_reg == `MAX_POOLING_MODE)) | 
				 (pixel_valid_upper && pixel_valid_lower  && (mode_reg == `MIN_POOLING_MODE)) | 
				 (pixel_valid_upper && weight_valid_upper && (mode_reg == `FC_MODE))           )? {{(C_B_INPUT_WIDTH - C_INPUT_MUX_WIDTH){dsp_mux_0_B_dataout[C_INPUT_MUX_WIDTH-1]}}, dsp_mux_0_B_dataout}:0;
				 
	assign C0 = ((mode_reg == `MAX_POOLING_MODE) | (mode_reg == `MIN_POOLING_MODE) ) ? {{(C_C_INPUT_WIDTH - C_INPUT_MUX_WIDTH){dsp_0_C_stage_reg[0][C_INPUT_MUX_WIDTH-1]}},dsp_0_C_stage_reg[0]}:0;			  
				 
				 
				 
/***** PIPE DELAY KEEPS TRACK OF IF THERE IS A VALID ENTRY IN THE POOLING PIPE***/
	
	always @(posedge clk_5x)
	begin 
		if(rst)
		begin 
			pipe_delay <= 0;
		end 
		else
		begin 
		    if (pixel_valid_upper & pixel_valid_lower & ((mode_reg == `MIN_POOLING_MODE) | (mode_reg == `MAX_POOLING_MODE))  ) 
				pipe_delay[0] <=1'b1 ;
			else
				pipe_delay[0] <=1'b0 ;
				
			for ( i = 1 ; i < C_PIPE_DELAY ;  i = i+1)
			begin 
				pipe_delay[i] <= pipe_delay[i-1];
			end 	
		end 
	end 
/***** PIPE DELAY KEEPS TRACK OF IF THERE IS A VALID ENTRY IN THE CONV PIPE***/	

	always @(posedge clk_5x)
	begin 
		if(rst)
		begin 
			pipe_delay_convolution <= 0;
		end 
		else
		begin 
		    if ((pixel_valid_upper | pixel_valid_lower )& (mode_reg == `CONVOLUTION_MODE) ) 
				pipe_delay_convolution[0] <=1'b1 ;
			else
				pipe_delay_convolution[0] <=1'b0 ;
				
			for ( i = 1 ; i < C_PIPE_DELAY_CONV ;  i = i+1)
			begin 
				pipe_delay_convolution[i] <= pipe_delay_convolution[i-1];
			end 	
		end 
	end 

	always @(posedge clk_5x)
	begin
		if(rst | new_map)
		begin 
			for ( i = 0 ; i < C_NUM_DATA_STAGES_C_DSP_0 ; i = i +1 )
			begin 
				dsp_0_PCIN_stage_reg[i] <= 0; 
				dsp_0_PCIN_valid_stage_reg[i]= 0;
			end 		
		
		end 
		else
		begin
			if(cascade_datain_valid && (mode_reg == `CONVOLUTION_MODE))
			begin 
					dsp_0_PCIN_stage_reg[0] <= cascade_datain;
					dsp_0_PCIN_valid_stage_reg[0] <= cascade_datain_valid;
			end 
			else
			begin 
					dsp_0_PCIN_stage_reg[0] <= 0;
					dsp_0_PCIN_valid_stage_reg[0] <= 0;
			
			end 
			for ( i = 1 ; i < C_NUM_DATA_STAGES_PCIN_DSP_0 ; i = i +1 )
			begin 
					dsp_0_PCIN_stage_reg[i] <= dsp_0_PCIN_stage_reg[i-1];
					dsp_0_PCIN_valid_stage_reg[i] <= dsp_0_PCIN_valid_stage_reg[i-1];
			end 		
		end 
	
	end 
	

		
	always @(posedge clk_5x)
	begin
		if(rst | new_map)
		begin 
			for ( i = 0 ; i < C_NUM_DATA_STAGES_C_DSP_0 ; i = i +1 )
			begin 
				if(mode == `MAX_POOLING_MODE)
					dsp_0_C_stage_reg[i] <= `MIN_VALUE ; 
				else if (mode == `MIN_POOLING_MODE)
					dsp_0_C_stage_reg[i] <= `MAX_VALUE ;
							
			end 		
		
		end 
		else
		begin
			if(pixel_valid_upper && pixel_valid_lower && ((mode_reg == `MIN_POOLING_MODE) | (mode_reg == `MAX_POOLING_MODE)))
			begin 
					dsp_0_C_stage_reg[0] <= pixel_datain_lower;
			end 
			for ( i = 1 ; i < C_NUM_DATA_STAGES_C_DSP_0 ; i = i +1 )
			begin 
					dsp_0_C_stage_reg[i] <= dsp_0_C_stage_reg[i-1];
			end 		
		end 
	
	end 
	
	always @(posedge clk_5x)
	begin
		if(rst | new_map)
		begin 
			for ( i = 0 ; i < C_NUM_DATA_STAGES_B_DSP_0 ; i = i +1 )
			begin 
				dsp_0_B_stage_reg[i] <= 0;							
			end 		
		end 
		else
		begin
			dsp_0_B_stage_reg[0] <= BCOUT0;
			for ( i = 1 ; i < C_NUM_DATA_STAGES_B_DSP_0 ; i = i +1 )
			begin 
					dsp_0_B_stage_reg[i] <= dsp_0_B_stage_reg[i-1];
			end 		
		end 
	
	end 
	
	

	
	assign  min_max_pixel_value_of_input_w = (pipe_delay[2] & (PRODUCT0[47] == 1'b1) & (mode_reg == `MAX_POOLING_MODE )) ? dsp_0_B_stage_reg[0] : 
	                                         (pipe_delay[2] & (PRODUCT0[47] == 1'b0) & (mode_reg == `MAX_POOLING_MODE )) ? dsp_0_C_stage_reg[C_NUM_DATA_STAGES_C_DSP_0-1] :
		 	    							 (pipe_delay[2] & (PRODUCT0[47] == 1'b1) & (mode_reg == `MIN_POOLING_MODE )) ? dsp_0_C_stage_reg[C_NUM_DATA_STAGES_C_DSP_0-1]: 
	                                         (pipe_delay[2] & (PRODUCT0[47] == 1'b0) & (mode_reg == `MIN_POOLING_MODE )) ? dsp_0_B_stage_reg[0] :0;
	
	
	always @(posedge clk_5x)
	begin
		if(rst | new_map)
		begin 
			for ( i = 0 ; i < C_NUM_MAX_STAGES ; i = i +1 )
			begin 
				if(mode == `MAX_POOLING_MODE)
					min_max_stage_reg[i] <= `MIN_VALUE ; 
				else if (mode == `MIN_POOLING_MODE)
						min_max_stage_reg[i] <= `MAX_VALUE ;
			end 		
		end 
		else
		begin
		
			if(((start_flag == 1'b1))&& ((mode_reg == `MAX_POOLING_MODE) || (mode_reg == `MIN_POOLING_MODE)) )
			begin 
				min_max_stage_reg[0] <= dsp_mux_1_B_dataout ; 
			end 
			else 			
			if (((mode_reg == `MAX_POOLING_MODE) || (mode_reg == `MIN_POOLING_MODE))) begin
				min_max_stage_reg[0] <=	dataout_p ;	
			end
			
			for ( i = 1 ; i < C_NUM_MAX_STAGES ; i = i +1 )
			begin 
					min_max_stage_reg[i] <= min_max_stage_reg[i-1];
			end 		
		end 
	end 
	
	
	assign A1 = ((pixel_valid_lower && weight_valid_lower && (mode_reg == `CONVOLUTION_MODE))  |
				 (pixel_valid_lower && weight_valid_lower && (mode_reg == `FC_MODE))           )? {{(C_A_INPUT_WIDTH - C_INPUT_MUX_WIDTH){dsp_mux_1_A_dataout[C_INPUT_MUX_WIDTH-1]}}, dsp_mux_1_A_dataout}:0;
				
	assign B1 = ((pixel_valid_lower && weight_valid_lower && (mode_reg == `CONVOLUTION_MODE))  |
				(pixel_valid_lower && weight_valid_lower && (mode_reg == `FC_MODE))           )? {{(C_B_INPUT_WIDTH - C_INPUT_MUX_WIDTH){dsp_mux_1_B_dataout[C_INPUT_MUX_WIDTH-1]}}, dsp_mux_1_B_dataout}:0;
			 
	
	assign  C1 = (pipe_delay[3])? {{(C_C_INPUT_WIDTH - C_INPUT_MUX_WIDTH){dsp_1_C_stage_reg[0][C_INPUT_MUX_WIDTH-1]}}, dsp_1_C_stage_reg[0]}: 0;
	
	always @(posedge clk_5x)
	begin
		if(rst | new_map)
		begin 
			for ( i = 0 ; i < C_NUM_DATA_STAGES_C_DSP_1 ; i = i +1 )
			begin 
					if(mode == `MAX_POOLING_MODE)
						dsp_1_C_stage_reg[i] <= `MIN_VALUE ; 
					else if (mode == `MIN_POOLING_MODE)
						dsp_1_C_stage_reg[i] <= `MAX_VALUE ;
			end 		
		
		end 
		else
		begin
			if((pipe_delay[2]) && ((mode_reg == `MIN_POOLING_MODE) | (mode_reg == `MAX_POOLING_MODE)))
			begin 
				dsp_1_C_stage_reg[0] <= dsp_mux_1_B_dataout;
			end 
			
			if(start_flag == 1'b1)
			begin 
				for ( i = 1 ; i < C_NUM_DATA_STAGES_C_DSP_1 ; i = i +1 )
				begin 
					dsp_1_C_stage_reg[1] <= dsp_mux_1_B_dataout;
				end 		
			end 
			else
			begin 
				for ( i = 1 ; i < C_NUM_DATA_STAGES_C_DSP_1 ; i = i +1 )
				begin 
					dsp_1_C_stage_reg[i] <= dsp_1_C_stage_reg[i-1];
				end 		
			end 	
		end 
	
	end 
	
	assign dataout_valid_w		  = preg_rst[kernal_window_size_reg];
    assign dataout_p              = (mode_reg == `CONVOLUTION_MODE) ? PRODUCT1:
									(((mode_reg == `MAX_POOLING_MODE) | (mode_reg == `MAX_POOLING_MODE)) & (PRODUCT1 == `ZERO))?  dsp_1_C_stage_reg[C_NUM_DATA_STAGES_C_DSP_1-1] :
									((mode_reg == `MAX_POOLING_MODE) & ~PRODUCT1[47]  ) ? min_max_stage_reg[C_NUM_MAX_STAGES-1]    :
									((mode_reg == `MAX_POOLING_MODE) &  PRODUCT1[47] )  ? dsp_1_C_stage_reg[C_NUM_DATA_STAGES_C_DSP_1-1] :
									((mode_reg == `MIN_POOLING_MODE) & ~PRODUCT1[47] )  ? dsp_1_C_stage_reg[C_NUM_DATA_STAGES_C_DSP_1-1] :
									((mode_reg == `MIN_POOLING_MODE) &  PRODUCT1[47] )  ? min_max_stage_reg[C_NUM_MAX_STAGES-1]    : min_max_stage_reg[C_NUM_MAX_STAGES-1];
									
    assign dataout_c			  = CARRY1; 
	
	

	

	always @(posedge clk_5x)
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
					if((((pixel_valid_upper) && weight_valid_upper) ||  (pipe_delay_convolution != 0)) && (mode_reg == `CONVOLUTION_MODE))
						begin 
							count 			<= count +1;
							if(count == 1)
								start_flag <= 1'b1;
							else
								start_flag <= 1'b0;		
							if(count == C_MULTIPLIER_DELAY-1)
							begin 
								state  		<= ST_MACC;
								count 		<= 0;
								preg_rst[0] <= 1'b1;
								start_flag  <= 1'b0;
							end	
						
						end 
					else if( pixel_valid_upper & pixel_valid_lower  & ((mode_reg == `MAX_POOLING_MODE) | (mode_reg == `MIN_POOLING_MODE)) )
						begin
							count 			<= count +1;
							if(count == 2)
								start_flag <= 1'b1;
							else
								start_flag <= 1'b0;							
							if(count == C_MULTIPLIER_DELAY-1)
							begin 
								state  		<= ST_POOLING;
								count 		<= 0;
								preg_rst[0] <= 1'b1;
								start_flag  <= 1'b0;
							end	
											
					end 
						
				end
				ST_MACC:
				begin
					if (count < kernal_window_size_reg)
					begin 	
							count 		<= count +1;
							preg_rst 	<= preg_rst << 1;
							
					end		
					else
					begin 
					    count       	<= 0;
						preg_rst[0] 	<= 1'b1;
						if ( kernal_window_size_reg != 0)
							preg_rst[kernal_window_size_reg] <= 1'b0;
						start_flag  <= 1'b0;
						
						if(~pixel_valid_upper && ~pixel_valid_lower && (pipe_delay_convolution == 0))
						begin 
							state <= ST_IDLE;
							preg_rst[0] <= 1'b0;
						end 	
						
					end 	
					
				end	
				ST_POOLING:
				begin 
					if (count < kernal_window_size_reg)
					begin 	
						count 		<= count +1;
						preg_rst 	<= preg_rst << 1;
						
					end		
					else
					begin 
					    count       	<= 0;
						preg_rst[0] 	<= 1'b1;
						preg_rst[kernal_window_size_reg] <= 1'b0;
						start_flag  <= 1'b0;
						
						if(~pixel_valid_upper && ~pixel_valid_lower && (pipe_delay[2:0]	== 3'b000) )
						begin 
							state = ST_IDLE;
							preg_rst[0] <= 0;
						end 		
						

					end 	
					
				end 
			endcase
		end 	
	end
	
	
	
	assign  ALUMODE_0 = ((mode_reg == `MAX_POOLING_MODE) | (mode_reg == `MIN_POOLING_MODE))  ? `DSP_ALU_MODE_SUB : 
						 (mode_reg == `CONVOLUTION_MODE)? `DSP_ALU_MODE_ADD :`DSP_ALU_MODE_ADD;
						 
	
	assign  ALUMODE_1 = ((mode_reg == `MAX_POOLING_MODE) | (mode_reg == `MIN_POOLING_MODE))  ? `DSP_ALU_MODE_SUB : 
						 (mode_reg == `CONVOLUTION_MODE) ?`DSP_ALU_MODE_ADD :`DSP_ALU_MODE_ADD;	
						 
		
//	assign  OPMODE_0 =  ((mode_reg == `MIN_POOLING_MODE)    | (mode_reg == `MAX_POOLING_MODE))?`DSP_OP_MODE_0_AB_0_C :
//						((preg_rst[kernal_window_size_reg-1] | start_flag) & (mode_reg == `CONVOLUTION_MODE) & (kernal_window_size_reg != 5'b00000))?`DSP_OP_MODE_0_M_M_PCIN  :
//						((mode_reg == `CONVOLUTION_MODE) & (kernal_window_size_reg == 5'b00000)) ? `DSP_OP_MODE_0_M_M_PCIN :
//						(rst)? `DSP_OP_MODE_0_M_M_PCIN :
//						`DSP_OP_MODE_P_M_M_PCIN;

	assign  OPMODE_0 =  ((mode_reg == `MIN_POOLING_MODE)    | (mode_reg == `MAX_POOLING_MODE))?`DSP_OP_MODE_0_AB_0_C :
					    ((preg_rst[kernal_window_size_reg-2] ) & (mode_reg == `CONVOLUTION_MODE) & (kernal_window_size_reg != 5'b00000))?`DSP_OP_MODE_P_M_M_PCIN  :
						((preg_rst[kernal_window_size_reg-1] ) & (mode_reg == `CONVOLUTION_MODE) & (kernal_window_size_reg != 5'b00000))?`DSP_OP_MODE_0_M_M_0  :
						((mode_reg == `CONVOLUTION_MODE) & (kernal_window_size_reg == 5'b00000)) ? `DSP_OP_MODE_0_M_M_PCIN :
						(rst)? `DSP_OP_MODE_0_M_M_0 :
						`DSP_OP_MODE_P_M_M_0;						
																
	assign  OPMODE_1 =  ((mode_reg == `MIN_POOLING_MODE)   | (mode_reg == `MAX_POOLING_MODE))?`DSP_OP_MODE_0_0_C_PCIN    :
	                    (preg_rst[kernal_window_size_reg-1] & (mode_reg == `CONVOLUTION_MODE) & (kernal_window_size_reg != 5'b00000))?`DSP_OP_MODE_P_M_M_PCIN :
						(preg_rst[kernal_window_size_reg]   & (mode_reg == `CONVOLUTION_MODE) & (kernal_window_size_reg != 5'b00000))?`DSP_OP_MODE_0_M_M_0    :
						((mode_reg == `CONVOLUTION_MODE) & (kernal_window_size_reg == 5'b00000)) ? `DSP_OP_MODE_0_M_M_PCIN :
						`DSP_OP_MODE_P_M_M_0; 
	
	
	
	
	always @(posedge clk_5x)
	begin
	if(rst)	
		dataout_valid <= 0;
	else	
		dataout_valid <= dataout_valid_w;
	end
	
	
	//assign P0_IN  =  dsp_0_PCIN_valid_stage_reg[C_NUM_DATA_STAGES_PCIN_DSP_0-1]? {{(C_P_INPUT_WIDTH - C_DATAIN_WIDTH){dsp_0_PCIN_stage_reg[C_NUM_DATA_STAGES_PCIN_DSP_0-1][C_DATAIN_WIDTH-1]}},dsp_0_PCIN_stage_reg[C_NUM_DATA_STAGES_PCIN_DSP_0-1]}:0;
	//assign C0_IN  =  dsp_0_PCIN_valid_stage_reg[C_NUM_DATA_STAGES_PCIN_DSP_0-1]?0 :0;
	
	//assign P0_IN  =  (cascade_datain_valid && (mode_reg == `CONVOLUTION_MODE))? cascade_datain:0;
	//assign C0_IN  =  (cascade_datain_valid && (mode_reg == `CONVOLUTION_MODE))?0 :0;
	assign P0_IN  =  cascade_datain;		 
	assign C0_IN  =  0;

	cnn_layer_accel_ce_macc_0  macc_0
	(
		.rst							(rst),
		
		.opmode							(OPMODE_0),
		.alumode						(ALUMODE_0),
		
		.CE								(1'b1),
		.CLK							(clk_5x),
		
		.C_IN							(C0_IN),
		.P_IN							(P0_IN),
		
		.A								(A0),
		.B								(B0),
		.C                              (C0), 
		
		.P								(PRODUCT0),
		.C_OUT							(CARRY0),
		
		.BCOUT							(BCOUT0),
	
		.CARRYCASCOUT					(CARRYCASCOUT0),
		.PCOUT							(PCOUT0)
	
	);
	

    //assign P1_IN  = (preg_rst[kernal_window_size_reg] && (mode_reg == `CONVOLUTION_MODE)) ? PCOUT0:
	//				(((preg_rst[0] == 1'b1) || (start_flag == 1'b1)) && (mode_reg == `MAX_POOLING_MODE)  ) ? {{(C_C_INPUT_WIDTH - C_INPUT_MUX_WIDTH){1'b1}}, `MIN_VALUE}:
	//				(((preg_rst[0] == 1'b1) || (start_flag == 1'b1)) && (mode_reg == `MIN_POOLING_MODE)  ) ? {{(C_C_INPUT_WIDTH - C_INPUT_MUX_WIDTH){1'b0}}, `MAX_VALUE}:
	//				((!((preg_rst[0] == 1'b1) || (start_flag == 1'b1))) && ((mode_reg == `MAX_POOLING_MODE) | (mode_reg == `MIN_POOLING_MODE)) )?{{(C_C_INPUT_WIDTH - C_INPUT_MUX_WIDTH){dataout_p[C_DATAIN_WIDTH-1]}}, dataout_p}:
	//				0;
	
    assign P1_IN  =  PCOUT0;	
	assign C1_IN  =  0;
	
		
	cnn_layer_accel_ce_macc_1  macc_1
	(
		.rst							(rst),
		
		.opmode							(OPMODE_1),
		.alumode						(ALUMODE_1),
		
		.CE								(1'b1),
		.CLK							(clk_5x),
		
		.C_IN							(C1_IN),
		.P_IN							(P1_IN),
			
		.A								(A1),
		.B								(B1),
		.C								(C1),
		
		.P								(PRODUCT1),
		.C_OUT							(CARRY1),   
		
		.BCOUT							(BCOUT1),
		
		.CARRYCASCOUT					(cascade_carryout),
		.PCOUT							(cascade_dataout)
		
	);
	
	
	assign cascade_dataout_valid = dataout_valid;
	
	
	
	always @ (posedge clk)
	begin 
		if(rst)
		begin 
			kernal_window_size_reg <= 5'b00100;
			mode_reg <=  0;
		end 
		else
		begin 
			if(new_map)
			begin 
			    if (kernal_window_size == 5'b00000)
					kernal_window_size_reg <= kernal_window_size ;
				else
					kernal_window_size_reg <= kernal_window_size + 1 ;
				mode_reg <= mode;
			end 	
			else
			begin 
				kernal_window_size_reg <= kernal_window_size_reg;
				mode_reg <= mode_reg;
			end 	
		end 
		
	end 
	
	
endmodule