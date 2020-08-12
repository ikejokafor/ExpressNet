module fifo_fwft
#(
	parameter	C_DATA_WIDTH = 128,
	parameter	C_FIFO_DEPTH = 16
)
(
	input							clk,
	input							rst,
	input							wren,
	input							rden,
	input		[C_DATA_WIDTH-1:0]	datain,
	output	reg	[C_DATA_WIDTH-1:0]	dataout,
	output							empty,
	output	reg						full,
	output	reg						almost_full
);


	localparam C_FIFO_DEPTH_ACTUAL = (C_FIFO_DEPTH < 2) ? 2 : C_FIFO_DEPTH;
	localparam C_LOG2_FIFO_DEPTH = 
		(C_FIFO_DEPTH_ACTUAL <= 2)    ? 1  :
		(C_FIFO_DEPTH_ACTUAL <= 4)    ? 2  :
		(C_FIFO_DEPTH_ACTUAL <= 8)    ? 3  :
		(C_FIFO_DEPTH_ACTUAL <= 16)   ? 4  :
		(C_FIFO_DEPTH_ACTUAL <= 32)   ? 5  :
		(C_FIFO_DEPTH_ACTUAL <= 64)   ? 6  :
		(C_FIFO_DEPTH_ACTUAL <= 128)  ? 7  :
		(C_FIFO_DEPTH_ACTUAL <= 256)  ? 8  :
		(C_FIFO_DEPTH_ACTUAL <= 512)  ? 9  :
		(C_FIFO_DEPTH_ACTUAL <= 1024) ? 10 :
		(C_FIFO_DEPTH_ACTUAL <= 2048) ? 11 :
		(C_FIFO_DEPTH_ACTUAL <= 4096) ? 12 :
		(C_FIFO_DEPTH_ACTUAL <= 8192) ? 13 : 
		(C_FIFO_DEPTH_ACTUAL <= 16384) ? 14 : 
		(C_FIFO_DEPTH_ACTUAL <= 32768) ? 15 : 
		(C_FIFO_DEPTH_ACTUAL <= 65536) ? 16 : 
		(C_FIFO_DEPTH_ACTUAL <= 131072)? 17 : 18;
		
	localparam C_ALMOST_FULL_THRESHOLD = (C_FIFO_DEPTH_ACTUAL < 8) ? C_FIFO_DEPTH_ACTUAL - 1 : C_FIFO_DEPTH_ACTUAL - 4;
	
	localparam [C_LOG2_FIFO_DEPTH-1:0]	C_PTR_CONSTANT_0 = {{(C_LOG2_FIFO_DEPTH-1){1'b0}},1'b0};
	localparam [C_LOG2_FIFO_DEPTH-1:0]	C_PTR_CONSTANT_1 = {{(C_LOG2_FIFO_DEPTH-1){1'b0}},1'b1};
	
	wire							read_allow;
	wire							write_allow;
	
	reg								empty_delay;
	reg								empty_r;
	
	wire	[C_LOG2_FIFO_DEPTH-1:0]	rd_ptr;
	reg		[C_LOG2_FIFO_DEPTH-1:0]	rd_ptr_current;
	reg		[C_LOG2_FIFO_DEPTH-1:0]	rd_ptr_plus1;
	reg		[C_LOG2_FIFO_DEPTH-1:0]	wr_ptr;
	
	//reg		[C_LOG2_FIFO_DEPTH-1:0] occupancy;
	reg		[C_LOG2_FIFO_DEPTH:0] occupancy;	// bugfix by Sungho. 05/06/2013
	
	
	reg		[C_DATA_WIDTH-1:0]	fifo_buffer[C_FIFO_DEPTH_ACTUAL-1:0];
	
	  
	always @(posedge clk)
	begin
		if (write_allow)
		begin
			fifo_buffer[wr_ptr] <= datain;
		end
	end
	
	always @(posedge clk)
	begin
		dataout <= fifo_buffer[rd_ptr];
	end
	
	always @(posedge clk)
	begin
		if (rst)
		begin
			occupancy <= C_PTR_CONSTANT_0;
		end
		else
		begin
			case ({write_allow,read_allow})
				2'b00 :
					begin
					end
				2'b01 :
					begin
						occupancy <= occupancy - C_PTR_CONSTANT_1;
					end
				2'b10 :
					begin
						occupancy <= occupancy + C_PTR_CONSTANT_1;
					end
				2'b11 :
					begin
					end
			endcase
		end
	end
	
	assign rd_ptr = (read_allow) ? rd_ptr_plus1 : rd_ptr_current;
	
	always @(posedge clk)
	begin
		if (rst)
		begin
			wr_ptr <= C_PTR_CONSTANT_0;
		end
		else
		begin
			if (write_allow)
			begin
				if (wr_ptr == (C_FIFO_DEPTH_ACTUAL-1))
				begin
					wr_ptr <= C_PTR_CONSTANT_0;
				end
				else
				begin
					wr_ptr <= wr_ptr + C_PTR_CONSTANT_1;
				end
			end
		end
	end
	
	always @(posedge clk)
	begin
		if (rst)
		begin
			rd_ptr_current <= C_PTR_CONSTANT_0;
			rd_ptr_plus1 <= C_PTR_CONSTANT_1;
		end
		else
		begin
			rd_ptr_current <= rd_ptr;
			if (read_allow)
			begin
				if (rd_ptr_plus1 == (C_FIFO_DEPTH_ACTUAL-1))
				begin
					rd_ptr_plus1 <= C_PTR_CONSTANT_0;
				end
				else
				begin
					rd_ptr_plus1 <= rd_ptr_plus1 + C_PTR_CONSTANT_1;
				end
			end
		end
	end
	
	always @(posedge clk)
	begin
		if (rst)
		begin
			empty_delay <= 1'b0;
			empty_r <= 1'b1;
		end
		else
		begin
			empty_delay <= 1'b0;
			case ({write_allow,read_allow})
				2'b00 :
					begin
						empty_r <= empty_r;
					end
				2'b01 :
					begin
						if (occupancy == C_PTR_CONSTANT_1)
						begin
							empty_r <= 1'b1;
						end
					end
				2'b10 :
					begin
						if (occupancy == C_PTR_CONSTANT_0)
						begin
							empty_delay <= 1'b1;
						end
						
						empty_r <= 1'b0;
					end
				2'b11 :
					begin
						if ((occupancy == C_PTR_CONSTANT_0) || (occupancy == C_PTR_CONSTANT_1))
						begin
							empty_delay <= 1'b1;
						end
						
						empty_r <= empty_r;
					end
				
			endcase
		end
	end
	
	assign empty = empty_r | empty_delay;
	
	always @(posedge clk)
	begin
		if (rst)
		begin
			full <= 1'b0;
		end
		else
		begin
			case ({write_allow,read_allow})
				2'b00 :
					begin
						full <= full;
					end
				2'b01 :
					begin
						full <= 1'b0;
					end
				2'b10 :
					begin
						if (occupancy == (C_FIFO_DEPTH_ACTUAL - 1))
						begin
							full <= 1'b1;
						end
					end
				2'b11 :
					begin
						full <= full;
					end
				
			endcase
		end
	end
	
	always @(posedge clk)
	begin
		if (rst)
		begin
			almost_full <= 1'b0;
		end
		else
		begin
			case ({write_allow,read_allow})
				2'b00 :
					begin
						almost_full <= almost_full;
					end
				2'b01 :
					begin
						if (occupancy > (C_ALMOST_FULL_THRESHOLD))
						begin
							almost_full <= 1'b1;
						end
						else
						begin
							almost_full <= 1'b0;
						end
					end
				2'b10 :
					begin
						if (occupancy >= (C_ALMOST_FULL_THRESHOLD-1))
						begin
							almost_full <= 1'b1;
						end
						else
						begin
							almost_full <= 1'b0;
						end
					end
				2'b11 :
					begin
						almost_full <= almost_full;
					end
				
			endcase
		end
	end
	
	assign read_allow = rden & ~empty;
	assign write_allow = wren & ~full;
	
endmodule
