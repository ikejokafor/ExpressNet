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
    clk_if                      ,
    clk_core                    ,
    rst                         ,
    config_mode                 ,
    job_accept                  ,
	next_kernel                 ,
	last_kernel                 , 
    wht_config_wren             ,
    wht_config_data             ,
    wht_seq_addr0               ,
    wht_seq_addr1               ,
    ce_execute                  ,
    wht_table_dout              ,
    wht_table_dout_valid        ,
    conv_out_fmt                ,
    num_kernels                 
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	localparam C_CLG2_BRAM_A_DEPTH          = clog2(`WHT_TBL_BRAM_DEPTH);
    localparam C_CLG2_BRAM_B_DEPTH          = clog2(`WHT_TBL_BRAM_DEPTH);
    localparam C_WHT_DOUT_WIDTH             = `WEIGHT_WIDTH * `NUM_DSP_PER_CE; 
    localparam C_CLG2_MAX_BRAM_3x3_KERNELS  = clog2(`MAX_BRAM_3x3_KERNELS);


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input   logic                             clk_core                         ;
    input   logic                             rst                         ;
    input   logic                             config_mode                 ;
    input   logic                             job_accept                  ;
	input   logic                             next_kernel                 ;
	output  logic                             last_kernel                 ;
    input   logic                             wht_config_wren             ;
    input   logic [                   15:0]   wht_config_data             ;
    input   logic [                    3:0]   wht_seq_addr0               ;
    input   logic [                    3:0]   wht_seq_addr1               ;
    input   logic                             ce_execute                  ;
    output  logic [ C_WHT_DOUT_WIDTH - 1:0]   wht_table_dout              ;
    output  logic                             wht_table_dout_valid        ;
    input   logic                             conv_out_fmt                ;
    input  logic [C_CLG2_MAX_BRAM_3x3_KERNELS - 1:0]   num_kernels        ;
 
 
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    logic    [    C_CLG2_BRAM_A_DEPTH - 1:0]     wht_table_addrA             ;
    logic    [    C_CLG2_BRAM_B_DEPTH - 1:0]     wht_table_addrA_cfg         ;
    logic    [    C_CLG2_BRAM_B_DEPTH - 1:0]     wht_table_addr0_w           ;
    logic    [    C_CLG2_BRAM_B_DEPTH - 1:0]     wht_table_addr0             ;
    logic    [    C_CLG2_BRAM_B_DEPTH - 1:0]     wht_table_addr1_w           ;   
    logic    [    C_CLG2_BRAM_B_DEPTH - 1:0]     wht_table_addr1             ;
    logic    [                          5:0]     kernel_idx                  ;
    logic    [                          3:0]     kernel_count                ;
    logic                                        ce_wht_table_rden           ;
    logic                                        next_kernel_d               ;
	logic    [          `WEIGHT_WIDTH - 1:0]     wht_table_dout0             ;
    logic    [          `WEIGHT_WIDTH - 1:0]     wht_table_dout1             ;
    logic                                        wht_table_rden              ;
	
   

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------       
    SRL_bit #(
        .C_CLOCK_CYCLES ( 3 )
    ) 
    i0_SRL_bit (
        .clk_core        ( clk_core                       ),
        .rst        ( rst                       ),
        .ce         ( 1'b1                      ),
        .data_in    ( ce_wht_table_rden         ),
        .data_out   ( wht_table_dout_valid      )
    );

    
    SRL_bit #(
        .C_CLOCK_CYCLES ( 3 )
    ) 
    i1_SRL_bit (
        .clk_core   ( clk_core                                           ),
        .rst        ( rst                                           ),
        .ce         ( 1'b1                                          ),
        .data_in    ( kernel_idx == num_kernels && !config_mode     ),
        .data_out   ( last_kernel                                   )
    );
    

    SRL_bit #(
        .C_CLOCK_CYCLES ( 6 )   // seq data 3 cycle latency and awe bram 3 cycle read latency
    ) 
    i2_SRL_bit (
        .clk_core   ( clk_core               ),
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
        .clk_core        ( clk_core                ),
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
        .clk_core        ( clk_core                ),
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
        .clkA       ( clk_core              ),
        .addrA      ( wht_table_addrA       ),
        .wrenA      ( wht_config_wren       ),
        .dinA       ( wht_config_data       ),
        .rdenA      ( wht_table_rdenA       ),
        .doutA      ( wht_table_dout0       ),
        .clkB       ( clk_if                ),
        .addrB      ( wht_table_addr1       ),
        .wrenB      (                       ),
        .dinB       (                       ),
        .rdenB      ( wht_table_rdenB       ),
        .doutB      ( wht_table_dout1       )
    );


	// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    assign wht_table_addrA_cfg      = {kernel_idx        ,   kernel_count       };
    assign wht_table_addr0_w        = {kernel_idx        ,   wht_seq_addr0      };
    assign wht_table_addr1_w        = {kernel_idx        ,   wht_seq_addr1      };
	assign wht_table_dout           = {wht_table_dout1   ,   wht_table_dout0    };  
    assign wht_table_addrA          = (config_mode) ? wht_table_addrA_cfg : wht_table_addr0;                                  
    assign wht_table_rdenA          = ce_wht_table_rden;
    assign wht_table_rdenB          = ce_wht_table_rden;
   
   
    // Has not been test for 1x1 kernels
    always@(posedge clk_core) begin
        if(rst) begin
            kernel_count        <= 0;
            kernel_idx        <= 0;
            ce_wht_table_rden      <= 0;
		end else begin
            ce_wht_table_rden       <= 0;
            // kernel count
            if(job_accept || kernel_count == `KERNEL_3x3_COUNT_FULL_MINUS_1 && wht_config_wren)begin
                kernel_count <= 0;
            end else if(wht_config_wren) begin
                kernel_count <= kernel_count + 1;
            end
            // kernel group logic
            if(conv_out_fmt == `CONV_OUT_FMT0) begin
                if(job_accept || (kernel_idx == num_kernels && (next_kernel_d))) begin
                    kernel_idx <= 0;
                end else if ((kernel_count == `KERNEL_3x3_COUNT_FULL_MINUS_1 && config_mode && wht_config_wren) || next_kernel_d) begin
                    kernel_idx <= kernel_idx + 1;
                end
            end else if(conv_out_fmt == `CONV_OUT_FMT1) begin
                if(job_accept || (kernel_idx == num_kernels && (next_kernel))) begin
                    kernel_idx <= 0;
                end else if ((kernel_count == `KERNEL_3x3_COUNT_FULL_MINUS_1 && config_mode && wht_config_wren) || next_kernel) begin
                    kernel_idx <= kernel_idx + 1;
                end
            end
            if(ce_execute) begin
                ce_wht_table_rden <= 1;
			end
        end
    end
	// END logic ------------------------------------------------------------------------------------------------------------------------------------
  
    
    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
	// DEBUG ----------------------------------------------------------------------------------------------------------------------------------------

endmodule
