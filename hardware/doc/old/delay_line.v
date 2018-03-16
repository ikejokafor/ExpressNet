`timescale 1ns / 1ps

module delay_line
(
	rst,
	clk,
	wr_en,
	delay,
	datain,
	dataout,
	dataout_valid
);

`include "math.vh"

	parameter 	C_MAX_DELAY 	= 32;
	parameter	C_DWIDTH 		= 32;
	parameter	C_PTR_WIDTH 	= clog2(C_MAX_DELAY);
	
	input						rst;
	input						clk;
	input						wr_en;
	input	[C_PTR_WIDTH-1:0]	delay;
	input	[C_DWIDTH-1:0]		datain;
	output	[C_DWIDTH-1:0]		dataout;
	output						dataout_valid;
	
	
	reg		[C_PTR_WIDTH-1:0]	delay_minus_1;
	reg		[C_PTR_WIDTH-1:0]	rd_ptr;
	reg		[C_PTR_WIDTH-1:0]	rd_ptr_plus_1;
	wire	[C_PTR_WIDTH-1:0]	rd_ptr_next;
	reg		[C_PTR_WIDTH-1:0]	wr_ptr;
	
	reg		[C_DWIDTH-1:0]		delay_buffer[C_MAX_DELAY-1:0];
	reg		[C_DWIDTH-1:0]		delay_buffer_early_register;
	reg		[C_DWIDTH-1:0]		delay_buffer_dataout;
	
	reg							lock_step;
	
	assign rd_ptr_next 		= (lock_step & wr_en) ? ((rd_ptr == (delay_minus_1)) ? 0 : rd_ptr_plus_1) : rd_ptr;
	assign dataout 			= delay_buffer_dataout;
	assign dataout_valid 	= lock_step & wr_en;
	
	always @(posedge clk)
	begin
		delay_minus_1 <= delay-1;
	end
	
	always @(posedge clk)
	begin
		rd_ptr_plus_1 <=  rd_ptr_next + 1;
	end
	
	always @(posedge clk)
	begin
		delay_buffer_dataout <= delay_buffer[rd_ptr_next];
	end
	
	always @(posedge clk)
	begin
		if (wr_en)
		begin
			delay_buffer[wr_ptr] <= datain;
		end
	end
	
	always @(posedge clk)
	begin
		if (wr_en)
		begin
			if (wr_ptr == 0)
			begin
				delay_buffer_early_register <= datain;
			end
		end
	end
	
	always @(posedge clk)
	begin
		if (rst)
		begin
			wr_ptr <= 0;
		end
		else
		begin
			if (wr_en)
			begin
				if (wr_ptr == (delay_minus_1))
				begin
					wr_ptr <= 0;
				end
				else
				begin
					wr_ptr <= wr_ptr + 1;
				end
			end
		end
	end
	
	always @(posedge clk)
	begin
		if (rst)
		begin
			rd_ptr <= 0;
		end
		else
		begin
			if (wr_en)
			begin
				if (lock_step)
				begin
					rd_ptr <= rd_ptr_next;
				end
			end
		end
	end
		
	always @(posedge clk)
	begin
		if (rst)
		begin
			lock_step <= 1'b0;
		end
		else
		begin
			if (wr_en)
			begin
				if (wr_ptr == delay_minus_1)
				begin
					lock_step <= 1'b1;
				end
			end
		end
	end
	
endmodule
