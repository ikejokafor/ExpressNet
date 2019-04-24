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
// Additional Comments:     Unverified for expd or upsampled max input image size
//                              Unverified for padding > 1
//                              Verified ONLY for upsampling followed by padding
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
    input_col               ,
    input_row               ,
    crpd_input_col_start    ,
    crpd_input_row_start    ,
    crpd_input_col_end      ,
    crpd_input_row_end      ,
    job_fetch_ack           ,
    job_complete_ack        ,
    rst_addr                ,
    cncl_fetch_req          ,
    next_row
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
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  input_col               ;
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  input_row               ;
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  crpd_input_col_start    ;
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  crpd_input_row_start    ;
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  crpd_input_col_end      ;
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  crpd_input_row_end      ;
    input  logic                                    job_fetch_ack           ;
    input  logic                                    job_complete_ack        ;
    input  logic                                    rst_addr                ;
    output logic                                    cncl_fetch_req          ;
    input  logic                                    next_row                ;
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------      
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   bram_wrAddr         ;
    logic   [   C_CLG2_ROW_BUF_BRAM_DEPTH :0]   bram_rdAddr         ;
    logic   [ C_CLG2_ROW_BUF_BRAM_DEPTH -1:0]   bram_rdAddr_w       ;
    logic                                       bram_rden           ;
    logic                                       bram_rden_r         ;    
    logic   [            `PIXEL_WIDTH - 1:0]    bram_dataout        ;
    logic                                       repeat_row          ;
    logic                                       zero_dout           ;
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    xilinx_simple_dual_port_no_change_2_clock_ram #(
        .C_RAM_WR_WIDTH         ( `PIXEL_WIDTH                  ),         
        .C_RAM_WR_DEPTH         ( `MAX_NUM_INPUT_COLS           ),
        .C_RAM_RD_WIDTH         ( `PIXEL_WIDTH                  ),
        .C_RD_PORT_HIGH_PERF    ( 0                             ),
        .C_FIFO_FWFT            ( 1                             )
    ) 
    i0_xilinx_simple_dual_port_no_change_2_clock_ram (
        .wr_clk     ( wr_clk        ),
        .wrAddr     ( bram_wrAddr   ),
        .wren       ( wr_en         ),
        .din        ( din           ),
        .rd_clk     ( rd_clk        ),
        .rdAddr     ( bram_rdAddr_w ),
        .rden       ( bram_rden     ),
        .rd_mode    ( upsample      ),
        .dout       ( bram_dataout  )
    );
    

    // BEGIN Logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(*) begin
        if((padding && !upsample) && (input_row < crpd_input_row_start || input_col < crpd_input_col_start || input_row > crpd_input_row_end || input_col > crpd_input_col_end)) begin
            zero_dout = 1;
        end else begin
            zero_dout = 0;
        end
        if((padding && !upsample) && (input_row == crpd_input_row_start || input_row > crpd_input_row_end)) begin
            cncl_fetch_req = 1;
        end else if((!padding && upsample)) begin
            cncl_fetch_req = repeat_row;
        end else begin
            cncl_fetch_req = 0;
        end
    end
    
    always@(posedge rd_clk) begin
        if(rst) begin
            repeat_row <= 0;
        end else begin
            if(upsample && next_row) begin               
                repeat_row <= ~repeat_row;
            end
        end
    end
    // END Logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN Logic ----------------------------------------------------------------------------------------------------------------------------------   
    assign bram_rdAddr_w = (upsample) ? bram_rdAddr[C_CLG2_ROW_BUF_BRAM_DEPTH:1] : bram_rdAddr[(C_CLG2_ROW_BUF_BRAM_DEPTH - 1):0];
    assign dout = (zero_dout) ? {`PIXEL_WIDTH{1'b0}} : bram_dataout;
    assign bram_rden = (upsample) ? rd_en : bram_rden_r;
    
    always@(posedge wr_clk) begin
        if(rst) begin
            bram_wrAddr <= 0;   
        end else begin
            if(job_fetch_ack || job_complete_ack) begin
                bram_wrAddr <= 0;
            end else if(wr_en) begin
                bram_wrAddr <= bram_wrAddr + 1;
            end
        end
    end
    
    always@(posedge rd_clk) begin
        if(rst) begin
            bram_rdAddr <= 0;
        end else begin
            if(job_fetch_ack || job_complete_ack || rst_addr) begin
                bram_rdAddr <= 0;
            end else if(bram_rden) begin
                bram_rdAddr <= bram_rdAddr + 1;
            end
        end
    end
    
    always@(posedge rd_clk) begin
        if(rst) begin
            bram_rden_r <= 0;
        end else begin
            bram_rden_r <= 0;
            if(rd_en && !zero_dout) begin
                bram_rden_r <= 1;
            end
        end
    end
    // END ------------------------------------------------------------------------------------------------------------------------------------------  
    
   
endmodule