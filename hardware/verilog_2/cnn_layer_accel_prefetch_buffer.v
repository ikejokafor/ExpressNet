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
// Additional Comments:     Unverified for pded or upsampled max input image size
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
    pded_num_input_cols     ,
    pded_num_input_rows     ,
    crpd_input_col_start    ,
    crpd_input_row_start    ,
    crpd_input_col_end      ,
    crpd_input_row_end      ,
    job_fetch_ack           ,
    job_complete_ack        ,
    rst_addr                
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
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  pded_num_input_cols     ;
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  pded_num_input_rows     ;
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  crpd_input_col_start    ;
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  crpd_input_row_start    ;
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  crpd_input_col_end      ;
    input  logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  crpd_input_row_end      ;
    input  logic                                    job_fetch_ack           ;
    input  logic                                    job_complete_ack        ;
    input  logic                                    rst_addr                ;
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------      
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   bram_wrAddr     ;
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   bram_rdAddr     ;   
    logic                                       bram_rden       ;
    logic                                       bram_rden_r     ;    
    logic   [            `PIXEL_WIDTH - 1:0]    bram_dataout    ;
    logic                                       zero_dout       ;
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   input_col_r     ;
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   input_row_r     ;


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
        .rdAddr     ( bram_rdAddr   ),
        .rden       ( bram_rden     ),
        .dout       ( bram_dataout  )
    );
   
  
    // BEGIN Logic ----------------------------------------------------------------------------------------------------------------------------------  
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
    // END ------------------------------------------------------------------------------------------------------------------------------------------  


    // BEGIN Logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge rd_clk) begin
        if(rst) begin
            input_row_r   <= 0;
            input_col_r   <= 0;
        end else begin
            if(job_complete_ack) begin
                input_col_r  <= 0;
                input_row_r  <= 0;
            end else if(input_col_r == pded_num_input_cols) begin
                input_col_r  <= 0;
                input_row_r  <= input_row_r + 1;
            end else if(rd_en) begin
                input_col_r  <= input_col_r + 1;
            end
        end
    end
    // END Logic ------------------------------------------------------------------------------------------------------------------------------------
   
 
    // BEGIN Logic ---------------------------------------------------------------------------------------------------------------------------------- 
    assign dout         = (zero_dout) ? {`PIXEL_WIDTH{1'b0}} : bram_dataout;
    assign bram_rden    = bram_rden_r && !zero_dout;

    always@(posedge rd_clk) begin
        if(rst) begin
            bram_rden_r  <= 0;
            zero_dout    <= 0;
            bram_rdAddr  <= 0;
        end else begin
            bram_rden_r     <= 0;
            zero_dout       <= 0;
            if(rd_en) begin
                if(padding && !upsample && input_row_r == 0) begin  // input_row_r and input_col_r are outside crpd_start and crpd_end bounds
                    zero_dout <= 1;
                end else if(!padding && upsample) begin // repeat address twice, repeat every row twice
               
                end else if(padding && upsample) begin
               
                end else if(!padding && !upsample) begin
                    bram_rden_r <= 1;
                    if(job_fetch_ack || job_complete_ack || rst_addr) begin
                        bram_rdAddr <= 0;
                    end else if(bram_rden) begin
                        bram_rdAddr <= bram_rdAddr + 1;
                    end
                end
            end
        end
    end
    // END Logic ------------------------------------------------------------------------------------------------------------------------------------


endmodule