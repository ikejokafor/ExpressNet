`timescale 1ns / 1ps
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_weight_table_top #(
    parameter C_CE_WHT_SEQ_ADDR_DELAY = 3
) (
    clk                         ,
    rst                         ,
    config_mode                 ,
    job_accept                  ,
	next_kernel                 ,
	last_kernel                 ,
    kernel_config_valid         ,
    num_kernels                 ,    
    wht_config_wren             ,
    wht_config_data             ,
    wht_seq_addr0               ,
    wht_seq_addr1               ,
    ce_execute                  ,
    ce_cycle_counter            , 
    output_stride               ,	
    wht_table_dout              ,   
    wht_table_dout_valid       
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	localparam C_CLG2_BRAM_A_DEPTH          = clog2(`ROW_BUF_BRAM_DEPTH);
    localparam C_CLG2_BRAM_B_DEPTH          = clog2(`ROW_BUF_BRAM_DEPTH);
    localparam C_WHT_DOUT_WIDTH             = `WEIGHT_WIDTH * `NUM_DSP_PER_CE; 


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input   logic                             clk                         ;
    input   logic                             rst                         ;
    input   logic                             config_mode                 ;
    input   logic                             job_accept                  ;
	input   logic                             next_kernel                 ;
	output  logic                             last_kernel                 ;
    input   logic                             kernel_config_valid         ;
    input   logic [                   15:0]   num_kernels                 ;
    input   logic                             wht_config_wren             ;
    input   logic [                   15:0]   wht_config_data             ;
    input   logic [                    3:0]   wht_seq_addr0               ;
    input   logic [                    3:0]   wht_seq_addr1               ;
    input   logic                             ce_execute                  ;
    input   logic [                    2:0]   ce_cycle_counter            ;
	input   logic [                    2:0]   output_stride		          ;
    output  logic [ C_WHT_DOUT_WIDTH - 1:0]   wht_table_dout              ;
    output  logic                             wht_table_dout_valid        ;
 
 
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    logic    [    C_CLG2_BRAM_A_DEPTH - 1:0]     wht_table_addrA             ;
    logic    [    C_CLG2_BRAM_B_DEPTH - 1:0]     wht_table_addrA_cfg         ;
    logic    [    C_CLG2_BRAM_B_DEPTH - 1:0]     wht_table_addr0_w           ;
    logic    [    C_CLG2_BRAM_B_DEPTH - 1:0]     wht_table_addr0             ;
    logic    [    C_CLG2_BRAM_B_DEPTH - 1:0]     wht_table_addr1_w           ;   
    logic    [    C_CLG2_BRAM_B_DEPTH - 1:0]     wht_table_addr1             ;
    logic    [                          5:0]     num_kernels_r               ;
    logic    [                          5:0]     kernel_group                ;
    logic    [                          3:0]     kernel_count                ;
    logic                                        wht_table_rden              ;
    logic                                        next_kernel_d               ;
	logic    [          `WEIGHT_WIDTH - 1:0]     wht_table_dout0             ;
    logic    [          `WEIGHT_WIDTH - 1:0]     wht_table_dout1             ;
	
   

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------       
    SRL_bit #(
        .C_CLOCK_CYCLES ( 3 )
    ) 
    i0_SRL_bit (
        .clk        ( clk                       ),
        .rst        ( rst                       ),
        .ce         ( 1'b1                      ),
        .data_in    ( wht_table_rden            ),
        .data_out   ( wht_table_dout_valid      )
    );

    
    SRL_bit #(
        .C_CLOCK_CYCLES ( 3 )
    ) 
    i1_SRL_bit (
        .clk        ( clk                                                   ),
        .rst        ( rst                                                   ),
        .ce         ( 1'b1                                                  ),
        .data_in    ( kernel_group == num_kernels_r && !config_mode         ),
        .data_out   ( last_kernel                                           )
    );
    

    SRL_bit #(
        .C_CLOCK_CYCLES ( 6 )   // seq data 3 cycle latency and bram 3 cycle read latency
    ) 
    i2_SRL_bit (
        .clk        ( clk               ),
        .rst        ( rst               ),
        .ce         ( 1'b1              ),
        .data_in    ( next_kernel       ),
        .data_out   ( next_kernel_d     )
    );    
    

    
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( C_CE_WHT_SEQ_ADDR_DELAY  ),
        .C_DATA_WIDTH    ( C_CLG2_BRAM_A_DEPTH      )
    ) 
    i0_SRL_bus (
        .clk        ( clk                ),
        .ce         ( 1'b1               ),
        .rst        ( rst                ),
        .data_in    ( wht_table_addr0_w  ),
        .data_out   ( wht_table_addr0    )
    );
    
    
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( C_CE_WHT_SEQ_ADDR_DELAY  ),
        .C_DATA_WIDTH    ( C_CLG2_BRAM_B_DEPTH      )
    ) 
    i1_SRL_bus (
        .clk        ( clk                ),
        .ce         ( 1'b1               ),
        .rst        ( rst                ),
        .data_in    ( wht_table_addr1_w  ),
        .data_out   ( wht_table_addr1    )
    );
    

    xilinx_true_dual_port_no_change_ram #(
        .C_RAM_A_WIDTH      ( `WEIGHT_WIDTH                 ),                   
        .C_RAM_A_DEPTH      ( `WHT_TBL_BRAM_DEPTH           ),
        .C_RAM_B_WIDTH      ( `WEIGHT_WIDTH                 ),
        .C_PORT_A_RAM_PERF  ( "PORT_A_HIGH_PERFORMANCE"     ),
        .C_PORT_B_RAM_PERF  ( "PORT_B_HIGH_PERFORMANCE"     )
    ) 
    weight_table (
        .clkA       ( clk                   ),
        .addrA      ( wht_table_addrA       ),
        .wrenA      ( wht_config_wren       ),
        .dinA       ( wht_config_data       ),
        .rdenA      ( wht_table_rden        ),
        .doutA      ( wht_table_dout0       ),
        .clkB       ( clk                   ),
        .addrB      ( wht_table_addr1       ),
        .wrenB      (                       ),
        .dinB       (                       ),
        .rdenB      ( wht_table_rden        ),
        .doutB      ( wht_table_dout1       )
    );
    

	// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    assign wht_table_addrA_cfg      = {kernel_group      ,   kernel_count       };
    assign wht_table_addr0_w        = {kernel_group      ,   wht_seq_addr0      };
    assign wht_table_addr1_w        = {kernel_group      ,   wht_seq_addr1      };
	assign wht_table_dout           = {wht_table_dout1   ,   wht_table_dout0    };  
    assign wht_table_addrA          = (config_mode) ? wht_table_addrA_cfg : wht_table_addr0;
   
   
    // Has not been test for 1x1 kernels
    always@(posedge clk) begin
        if(rst) begin
            num_kernels_r     <= 0;
            kernel_count      <= 0;
            kernel_group      <= 0;
            wht_table_rden    <= 0;
		end else begin
            wht_table_rden          <= 0;
            if(kernel_config_valid) begin
                num_kernels_r <= num_kernels;
            end
            // kernel count
            if(job_accept || kernel_count == `KERNEL_3x3_COUNT_FULL_MINUS_1)begin
                kernel_count <= 0;
            end else if(wht_config_wren) begin
                kernel_count <= kernel_count + 1;
            end
            // kernel group logic
            if(job_accept || (kernel_group == num_kernels_r && (next_kernel_d) )) begin
                kernel_group <= 0;
            end else if ((kernel_count == `KERNEL_3x3_COUNT_FULL_MINUS_1 && config_mode) || next_kernel_d ) begin
                kernel_group <= kernel_group + 1;
            end
            if(ce_execute) begin
                wht_table_rden <= 1;
			end
        end
    end
	// END logic ------------------------------------------------------------------------------------------------------------------------------------
  
    
    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
	// DEBUG ----------------------------------------------------------------------------------------------------------------------------------------

endmodule
