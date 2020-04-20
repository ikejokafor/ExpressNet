`timescale 1ns / 1ps

module adder_tree
#(
	parameter C_NUM_INPUTS = 8,
	parameter C_INPUT_WIDTH = 8,
	parameter C_OUTPUT_WIDTH = 32
)
(
	input												clk,
	input												rst,
	output												datain_ready,
	input												datain_valid,
	input			[(C_NUM_INPUTS*C_INPUT_WIDTH)-1:0]	datain,
	input												dataout_ready,
	output												dataout_valid,
	output signed	[C_OUTPUT_WIDTH-1:0]					dataout
);
	
	function integer cadivb;
		input [31:0] a;
		input [31:0] b;
		begin
			if ((a % b) == 0)
				cadivb = a / b;
			else
				cadivb = (a / b) + 1;
		end
	endfunction
	
	function integer num_nodes_from_level;
		input [31:0] starting_num_nodes;
		input [31:0] level;
		integer i;
		integer num_nodes;
		begin
			num_nodes_from_level = starting_num_nodes;
			num_nodes = starting_num_nodes;
			
			for ( i=0; i<level; i=i+1)
			begin
				num_nodes = cadivb(num_nodes,2);
				num_nodes_from_level = num_nodes_from_level + num_nodes;
			end
		end
	endfunction
	
	function integer get_level_offset;
		input	[31:0] starting_num_nodes;
		input	[31:0] level;
		
		begin
			if (level == 0)
				get_level_offset = 0;
			else
				get_level_offset = num_nodes_from_level(starting_num_nodes, level-1);
		end
	endfunction
	
	function integer num_nodes_at_level;
		input	[31:0]	starting_num_nodes;
		input	[31:0]	level;
		integer i;
		begin
			num_nodes_at_level = starting_num_nodes;
			
			for ( i=0; i<level; i=i+1)
			begin
				num_nodes_at_level = cadivb(num_nodes_at_level,2);
			end
		end
	endfunction
	
	function integer num_levels;
		input	[31:0] starting_num_nodes;
		integer i;
		begin
			num_levels = 1;
			
			for ( i=starting_num_nodes; i> 1; i= cadivb(i,2))
				num_levels = num_levels + 1;
		end
	endfunction
	
	localparam C_NUM_LEVELS = num_levels(C_NUM_INPUTS);
	localparam C_NUM_PARTIALS = num_nodes_from_level(C_NUM_INPUTS,C_NUM_LEVELS-1);
	
	integer i;
	
	wire								pipeline_enable;
	
	reg signed	[C_OUTPUT_WIDTH-1:0] 	result			[C_NUM_PARTIALS-1:0];
	reg			[C_NUM_LEVELS-1:0]		result_valid = {(C_NUM_LEVELS){1'b0}};
	
	//Initial Input Registering	
	always @(posedge clk)
	begin
		for (i=0; i<C_NUM_INPUTS; i = i + 1)
		begin
			if (pipeline_enable)
			begin
				//result[i] = {{C_OUTPUT_WIDTH-C_INPUT_WIDTH{1'b0}},datain[i*C_INPUT_WIDTH +: C_INPUT_WIDTH]};
	
				result[i] <= $signed(datain[i*C_INPUT_WIDTH +: C_INPUT_WIDTH]);
				
				//result[i] <= $unsigned(datain[i*C_INPUT_WIDTH +: C_INPUT_WIDTH]);
			end
		end
	end
	
	always @(posedge clk)
	begin
		if (rst)
		begin
			result_valid <= {C_NUM_LEVELS{1'b0}};
		end
		else
		begin
			if (pipeline_enable)
			begin
				result_valid <= {result_valid[C_NUM_LEVELS-2:0],(datain_valid & datain_ready)};
			end
		end
	end
	
	genvar level_index;
	generate
		//num_sums = C_NUM_DESCRIPTORS;
		//num_inputs = C_NUM_DESCRIPTORS;
		
		for (level_index = 0; level_index < C_NUM_LEVELS-2; level_index = level_index + 1)
		begin : LBL_ADDER_LEVEL
			integer num_inputs;
			integer num_outputs;
			integer input_offset;
			integer output_offset;
			integer result_index;
			
			reg signed	[C_OUTPUT_WIDTH-1:0] op1;
			reg signed	[C_OUTPUT_WIDTH-1:0] op2;
			
			always @(posedge clk)
			begin				
				num_inputs		=  num_nodes_at_level(C_NUM_INPUTS,level_index);
				num_outputs 	=  num_nodes_at_level(C_NUM_INPUTS,level_index + 1);
				
				input_offset	= get_level_offset(C_NUM_INPUTS,level_index);	
				output_offset	= get_level_offset(C_NUM_INPUTS,level_index + 1);	
				
				if (pipeline_enable)
				begin
					result[output_offset + num_outputs - 1] <= result[input_offset + num_inputs - 1];
				end
				
				for (result_index = 0; result_index < num_inputs/2; result_index = result_index + 1)
				begin
					if (pipeline_enable)
					begin
						op1 = result[(input_offset + result_index*2) + 0];
						op2 = result[(input_offset + result_index*2) + 1];
					
						result[output_offset + result_index] <= op1 + op2;
					end
				end
				
			end
		end
	endgenerate
	
	always @(posedge clk)
	begin
		if (pipeline_enable)
		begin
			result[C_NUM_PARTIALS-1] <= result[get_level_offset(C_NUM_INPUTS,C_NUM_LEVELS-2) + 0] +
										result[get_level_offset(C_NUM_INPUTS,C_NUM_LEVELS-2) + 1];
		end
	end
		
	assign pipeline_enable = dataout_ready;
	
	assign datain_ready = dataout_ready;
	assign dataout = result[C_NUM_PARTIALS-1];	
	assign dataout_valid = result_valid[C_NUM_LEVELS-1];
	
endmodule
