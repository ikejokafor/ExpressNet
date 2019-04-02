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
// Additional Comments:     Unverified for padded or upsampled max input image size
//                          
//                          
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_prefetch_buffer (
    wr_clk                  ,
    rd_clk                  ,
    rst                     ,
    din                     ,
    wr_en                   ,
    rd_en                   ,
    dout                    ,
    padding                 ,
    upsample                ,
    padded_num_input_cols   ,
    padded_num_input_rows   ,
    cropd_input_col_start   ,
    cropd_input_row_start   ,
    cropd_input_col_end     ,
    cropd_input_row_end     ,
    job_fetch_ack           ,
    job_complete_ack        
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_CLG2_ROW_BUF_BRAM_DEPTH = clog2(`MAX_NUM_INPUT_COLS);
   
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input  logic                                    wr_clk                  ;
    input  logic                                    rd_clk                  ;
    input  logic                                    rst                     ;
    input  logic [          `PIXEL_WIDTH - 1:0]     din                     ;
    input  logic                                    wr_en                   ;
    input  logic                                    rd_en                   ;
    output logic [           `PIXEL_WIDTH - 1:0]    dout                    ;
    input  logic                                    padding                 ;
    input  logic                                    upsample                ;
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  padded_num_input_cols   ;
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  padded_num_input_rows   ;
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  cropd_input_col_start   ;
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  cropd_input_row_start   ;
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  cropd_input_col_end     ;
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  cropd_input_row_end     ;
    input  logic                                    job_fetch_ack           ;
    input  logic                                    job_complete_ack        ;
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------      
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   bram_wrAddr     ;
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   bram_rdAddr     ;   
    logic                                       bram_rden       ;
    logic                                       bram_rden_r     ;    
    logic   [            `PIXEL_WIDTH - 1:0]    bram_dataout    ;
    logic                                       zero_dout       ;
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   input_col       ;
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   input_row       ;


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    xilinx_simple_dual_port_no_change_2_clock_ram #(
        .C_RAM_A_WIDTH      ( `PIXEL_WIDTH          ),         
        .C_RAM_A_DEPTH      ( `MAX_NUM_INPUT_COLS   ),
        .C_RAM_B_WIDTH      ( `MAX_NUM_INPUT_COLS   ),
        .C_PORT_A_RAM_PERF  ( "LOW_LATENCY"         ),
        .C_PORT_B_RAM_PERF  ( "HIGH_PERFORMANCE"    )
    ) 
    i0_xilinx_simple_dual_port_no_change_2_clock_ram (
        .wr_clk     ( wr_clk        ),
        .wrAddr     ( bram_wrAddr   ),
        .wren       ( wr_en         ),
        .din        ( din           ),
        .rd_clk     ( rd_clk        ),
        .rdAddr     ( bram_rdAddr   ),
        .rden       ( bram_rden     ),
        .dout       ( bram_dataout  )
    );
    
  
    // BEGIN Logic ----------------------------------------------------------------------------------------------------------------------------------  
    always@(posedge wr_clk) begin
        if(rst) begin
            bram_wrAddr     <= 0;   
        end else begin
            if(job_fetch_ack) begin
                bram_wrAddr <= 0;
            end else if(wr_en) begin
                bram_wrAddr <= bram_wrAddr + 1;
            end
        end
    end
    // END ------------------------------------------------------------------------------------------------------------------------------------------  


    // BEGIN Logic ----------------------------------------------------------------------------------------------------------------------------------
    assign dout         = (zero_dout) ? {`PIXEL_WIDTH{1'b0}} : bram_dataout;
    assign bram_rden    = bram_rden_r;
    
    always@(posedge rd_clk) begin
        if(rst) begin
            bram_rdAddr     <= 0;
            bram_rden_r     <= 0;
            zero_dout       <= 0;
            input_col       <= 0;
            input_row       <= 0;
        end else begin
            bram_rden_r     <= 0;
            zero_dout       <= 0;
            if(job_complete_ack) begin
                input_col <= 0;
                input_row <= 0;
            end else if(rd_en) begin
                if(padding && !upsample) begin
               
                end else if(!padding && upsample) begin
               
                end else if(padding && upsample) begin
               
                end else if(!padding && !upsample) begin
                    bram_rden_r <= 1;
                end
            end
        end
    end
    // END ------------------------------------------------------------------------------------------------------------------------------------------     
endmodule