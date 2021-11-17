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
    state                   ,
    next_row
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.svh"
    `include "cnn_layer_accel.svh"


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_CLG2_ROW_BUF_BRAM_DEPTH = $clog2(`MAX_NUM_INPUT_COLS);
    localparam ST_IDLE                      = 6'b000001;  
    localparam ST_AWE_CE_PRIM_BUFFER        = 6'b000010;
    localparam ST_WAIT_PFB_LOAD             = 6'b000100;
    localparam ST_AWE_CE_ACTIVE             = 6'b001000;
    localparam ST_WAIT_JOB_DONE             = 6'b010000;
    localparam ST_SEND_COMPLETE             = 6'b100000;
   
    
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
    input  logic [                            5:0]  state                   ;
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------      
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   bram_wrAddr             ;
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   bram_rdAddr             ;
    logic   [ C_CLG2_ROW_BUF_BRAM_DEPTH -1:0]   bram_rdAddr_w           ;
    logic   [ C_CLG2_ROW_BUF_BRAM_DEPTH -1:0]   bram_addr_w0            ;
    logic                                       bram_rden               ;
    logic                                       bram_rden_r             ;    
    logic   [            `PIXEL_WIDTH - 1:0]    bram_dataout            ;
    logic                                       bram_fifo_fwft          ;
    logic                                       repeat_row              ;
    logic                                       zero_dout               ;
    logic                                       valid_region            ;
    logic  [            `PIXEL_WIDTH - 1:0]     bram_rdAddr_arr[3:0]    ;
    logic  [                           1:0]     idx                     ;
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    xilinx_simple_dual_port_no_change_2_clock_ram #(
        .C_RAM_WR_WIDTH         ( `PIXEL_WIDTH                  ),         
        .C_RAM_WR_DEPTH         ( `MAX_NUM_INPUT_COLS           ),
        .C_RAM_RD_WIDTH         ( `PIXEL_WIDTH                  ),
        .C_RD_PORT_HIGH_PERF    ( 0                             )
    ) 
    i0_xilinx_simple_dual_port_no_change_2_clock_ram (
        .wr_clk     ( wr_clk         ),
        .wrAddr     ( bram_wrAddr    ),
        .wren       ( wr_en          ),
        .din        ( din            ),
        .rd_clk     ( rd_clk         ),
        .rdAddr     ( bram_rdAddr_w  ),
        .rden       ( bram_rden      ),
        .rd_mode    ( upsample       ),
        .fifo_fwft  ( 0              ),
        .dout       ( bram_dataout   )
    );
    

    // BEGIN Logic ----------------------------------------------------------------------------------------------------------------------------------
    assign valid_region = (input_row >= crpd_input_row_start && input_row <= crpd_input_row_end);
    
    always@(*) begin
        if(padding && (input_row < crpd_input_row_start || input_col < crpd_input_col_start || input_row > crpd_input_row_end || input_col > crpd_input_col_end)) begin
            zero_dout = 1;
        end else begin
            zero_dout = 0;
        end
    end
    
    always@(*) begin
        if(padding && !upsample && (input_row == crpd_input_row_start || input_row > crpd_input_row_end)) begin
            cncl_fetch_req = 1;
        end else if(upsample && !padding) begin
            cncl_fetch_req = repeat_row;
        end else if(upsample && padding) begin
            cncl_fetch_req = ((input_row == crpd_input_row_start || input_row > crpd_input_row_end)) || repeat_row;
        end else begin // !padding && !upsample
            cncl_fetch_req = 0;
        end
    end
    
    always@(posedge rd_clk) begin
        if(rst) begin
            repeat_row <= 0;
        end else begin
            if(job_complete_ack) begin
                repeat_row <= 0;
            end if(upsample && padding && valid_region && input_row >= 2 && next_row) begin
                repeat_row <= ~repeat_row;
            end else if(upsample && !padding && next_row) begin               
                repeat_row <= ~repeat_row;
            end 
        end
    end
    // END Logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN Logic ----------------------------------------------------------------------------------------------------------------------------------   
    // assign bram_rdAddr_w = (upsample) ? bram_rdAddr[C_CLG2_ROW_BUF_BRAM_DEPTH:1] : bram_rdAddr[(C_CLG2_ROW_BUF_BRAM_DEPTH - 1):0];
    assign bram_rdAddr_w = (upsample) ? bram_rdAddr_arr[idx] : bram_rdAddr;
    assign dout = (zero_dout) ? {`PIXEL_WIDTH{1'b0}} : bram_dataout;
    assign bram_rden = (upsample) ? rd_en : bram_rden_r;
    assign bram_fifo_fwft = upsample && padding;
    assign bram_addr_w0 = bram_rdAddr_arr[idx];
    
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
            end else if((bram_rden && !zero_dout) || (bram_rden && state == ST_AWE_CE_PRIM_BUFFER)) begin  // maybe this can be done better without worrying about the state?
                bram_rdAddr <= bram_rdAddr + 1;
            end
        end
    end
    
    always@(posedge rd_clk) begin
        if(rst) begin
            bram_rdAddr_arr[0] <= 0;
            bram_rdAddr_arr[1] <= 0;
            bram_rdAddr_arr[2] <= 1;
            bram_rdAddr_arr[3] <= 1;
            idx                <= 0;
        end else begin
            if(job_fetch_ack || job_complete_ack || rst_addr) begin
                bram_rdAddr_arr[0] <= 0;
                bram_rdAddr_arr[1] <= 0;
                bram_rdAddr_arr[2] <= 1;
                bram_rdAddr_arr[3] <= 1;
                idx                <= 0;
            end else if(bram_rden && !zero_dout) begin
                bram_rdAddr_arr[idx] <= bram_rdAddr_arr[idx] + 2;
                idx                  <= idx + 1;
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
 

`ifdef SIMULATION
    string state_s;
    always@(state) begin 
        case(state) 
            ST_IDLE:                    state_s = "ST_IDLE";              
            ST_AWE_CE_PRIM_BUFFER:      state_s = "ST_AWE_CE_PRIM_BUFFER";
            ST_WAIT_PFB_LOAD:           state_s = "ST_WAIT_PFB_LOAD";           
            ST_AWE_CE_ACTIVE:           state_s = "ST_AWE_CE_ACTIVE";
            ST_WAIT_JOB_DONE:           state_s = "ST_WAIT_JOB_DONE";
            ST_SEND_COMPLETE:           state_s = "ST_SEND_COMPLETE";
        endcase
    end
`endif 
   
endmodule