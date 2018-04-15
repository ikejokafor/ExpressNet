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
    kernel_full_count           ,    
    wht_config_wren             ,
    wht_config_data             ,
    ce0_wht_seq_addr            ,
    ce1_wht_seq_addr            ,
    ce_execute                  ,
    ce_cycle_counter            ,    
    ce0_wht_table_dout          ,   
    ce1_wht_table_dout          ,   
    ce_wht_table_dout_valid       
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	localparam C_CLG2_BRAM_A_DEPTH          = clog2(`BRAM_DEPTH);
    localparam C_CLG2_BRAM_B_DEPTH          = clog2(`BRAM_DEPTH);
    localparam C_WHT_DOUT_WIDTH             = `WEIGHT_WIDTH; 


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input                               clk                         ;
    input                               rst                         ;
    input                               config_mode                 ;
    input                               job_accept                  ;
    input                               next_kernel                 ;
    output                              last_kernel                 ;
    input                               kernel_config_valid         ;
    input   [                   15:0]   kernel_full_count           ;
    input                               wht_config_wren             ;
    input   [                   15:0]   wht_config_data             ;
    input   [                    3:0]   ce0_wht_seq_addr            ;
    input   [                    3:0]   ce1_wht_seq_addr            ;
    input                               ce_execute                  ;
    input   [                    2:0]   ce_cycle_counter            ;
    output  [ C_WHT_DOUT_WIDTH - 1:0]   ce0_wht_table_dout          ;
    output  [ C_WHT_DOUT_WIDTH - 1:0]   ce1_wht_table_dout          ;
    output                              ce_wht_table_dout_valid     ;
 
 
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    wire    [    C_CLG2_BRAM_A_DEPTH - 1:0]     wht_table_addrA             ;
    wire    [    C_CLG2_BRAM_B_DEPTH - 1:0]     wht_table_addrA_cfg         ;
    wire    [    C_CLG2_BRAM_B_DEPTH - 1:0]     ce0_wht_table_addr_w        ;
    wire    [    C_CLG2_BRAM_B_DEPTH - 1:0]     ce0_wht_table_addr          ;
    wire    [    C_CLG2_BRAM_B_DEPTH - 1:0]     ce1_wht_table_addr_w        ;   
    wire    [    C_CLG2_BRAM_B_DEPTH - 1:0]     ce1_wht_table_addr          ;
    reg     [                          5:0]     kernel_full_count_cfg       ;
    reg     [                          5:0]     kernel_group                ;
    reg     [                          3:0]     kernel_count                ;
    reg                                         wht_table_rden              ;
    

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
        .data_out   ( ce_wht_table_dout_valid   )
    );

    
    SRL_bit #(
        .C_CLOCK_CYCLES ( 3 )
    ) 
    i1_SRL_bit (
        .clk        ( clk                                                   ),
        .rst        ( rst                                                   ),
        .ce         ( 1'b1                                                  ),
        .data_in    ( kernel_group == kernel_full_count_cfg && !config_mode ),
        .data_out   ( last_kernel                                           )
    );
    
    
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( C_CE_WHT_SEQ_ADDR_DELAY  ),
        .C_DATA_WIDTH    ( C_CLG2_BRAM_A_DEPTH      )
    ) 
    i0_SRL_bus (
        .clk        ( clk                   ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( ce0_wht_table_addr_w  ),
        .data_out   ( ce0_wht_table_addr    )
    );
    
    
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( C_CE_WHT_SEQ_ADDR_DELAY  ),
        .C_DATA_WIDTH    ( C_CLG2_BRAM_B_DEPTH      )
    ) 
    i1_SRL_bus (
        .clk        ( clk                   ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( ce1_wht_table_addr_w  ),
        .data_out   ( ce1_wht_table_addr    )
    );
    

    xilinx_true_dual_port_no_change_ram #(
        .C_RAM_A_WIDTH      ( `WEIGHT_WIDTH                 ),                   
        .C_RAM_A_DEPTH      ( `BRAM_DEPTH                   ),
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
        .doutA      ( ce0_wht_table_dout    ),
        .clkB       ( clk                   ),
        .addrB      ( ce1_wht_table_addr    ),
        .wrenB      (                       ),
        .dinB       (                       ),
        .rdenB      ( wht_table_rden        ),
        .doutB      ( ce1_wht_table_dout    )
    );
    

	// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    assign wht_table_addrA_cfg      = {kernel_group      ,   kernel_count       };
    assign ce0_wht_table_addr_w     = {kernel_group      ,   ce0_wht_seq_addr   };
    assign ce1_wht_table_addr_w     = {kernel_group      ,   ce1_wht_seq_addr   };
    assign wht_table_addrA          = (config_mode) ? wht_table_addrA_cfg : ce0_wht_table_addr;
    
    always@(posedge clk) begin
        if(rst) begin
            kernel_full_count_cfg   <= 0;
            kernel_count            <= 0;
            kernel_group            <= 0;
            wht_table_rden          <= 0;
        end else begin
            wht_table_rden          <= 0;
            if(kernel_config_valid) begin
                kernel_full_count_cfg <= kernel_full_count;
            end
            // kernel count
            if(job_accept || kernel_count == 4'd9)begin
                kernel_count <= 0;
            end else if(wht_config_wren) begin
                kernel_count <= kernel_count + 1;
            end
            // kernel group logic
            if(job_accept || (kernel_group == kernel_full_count_cfg && next_kernel)) begin
                kernel_group <= 0;
            end else if ((kernel_count == 4'd9 && config_mode) || next_kernel) begin
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
