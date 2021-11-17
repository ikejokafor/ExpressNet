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
//
//
//
//
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_trans_eg_fifo (
	rst           ,
	wr_clk        ,
	rd_clk        ,
	din           ,
	wr_en         ,
	rd_en         ,
	dout          ,
	full          ,
	empty         ,
	valid         ,
	wr_rst_busy   ,
	rd_rst_busy   
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "utilities.svh"
	`include "cnn_layer_accel_trans_fifo.svh"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_TRANS_EG_DIN_WTH = `TRANS_EG_FIFO_META_WTH + `TRANS_EG_FIFO_PYLD_WTH;
	localparam C_TRANS_EG_DOU_WTH = `TRANS_EG_FIFO_META_WTH + `TRANS_EG_FIFO_PYLD_WTH;
	

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	input  logic 								rst           ;
	input  logic 								wr_clk        ;
	input  logic 								rd_clk        ;
	input  logic [C_TRANS_EG_DIN_WTH - 1:0]		din           ;
	input  logic 								wr_en         ;
	input  logic 								rd_en         ;
	output logic [C_TRANS_EG_DOU_WTH - 1:0]		dout          ;
	output logic 								full          ;
	output logic 								empty         ;
	output logic 								valid         ;
	output logic 								wr_rst_busy   ;
	output logic 								rd_rst_busy   ;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                      	trans_eg_pyld_fifo_empty                                        ;
	logic                                      	trans_eg_pyld_fifo_vld                                          ;
    logic                                      	trans_eg_pyld_fifo_wr_rst_busy                                  ;
    logic                                      	trans_eg_pyld_fifo_rd_rst_busy                                  ;
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                       trans_eg_meta_fifo_empty                                        ;
	logic                                       trans_eg_meta_fifo_vld                                          ;
    logic                                       trans_eg_meta_fifo_wr_rst_busy                                  ;
    logic                                       trans_eg_meta_fifo_rd_rst_busy                                  ;
	

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Instantiations
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	// WR_WIDTH: 1024
    // WR_DPETH: 512
    // RD_WIDTH: 1024
    // RD_DEPTH: 512 
    trans_eg_pyld_fifo
    i0_trans_eg_pyld_fifo (
        .srst           ( rst                               ),
        .wr_clk         ( wr_clk                            ),
        .rd_clk         ( rd_clk                            ),
        .din            ( din[`TRANS_EG_FIFO_PYLD_FIELD]	),
        .wr_en          ( wr_en						        ),
        .rd_en          ( rd_en                       		),
        .dout           ( dout[`TRANS_EG_FIFO_PYLD_FIELD]	),
        .full           (                                   ),
        .empty          ( trans_eg_pyld_fifo_empty          ),
        .valid          ( trans_eg_pyld_fifo_vld            ),
        .wr_rst_busy    ( trans_eg_pyld_fifo_wr_rst_busy    ),
        .rd_rst_busy    ( trans_eg_pyld_fifo_rd_rst_busy    )
    );
	
	
	// WR_WIDTH: 1024
    // WR_DPETH: 512
    // RD_WIDTH: 1024
    // RD_DEPTH: 512 
    trans_eg_meta_fifo
    i0_trans_eg_meta_fifo (
        .srst           ( rst                                   ),
        .wr_clk         ( wr_clk                                ),
        .rd_clk         ( rd_clk                                ),
        .din            ( din[`TRANS_EG_FIFO_PYLD_FIELD]		),
        .wr_en          ( wr_en                       			),
        .rd_en          ( rd_en                       			),
        .dout           ( dout[`TRANS_EG_FIFO_META_FIELD]		),
        .full           (                                       ),
        .empty          ( trans_eg_meta_fifo_empty              ),
        .valid          ( trans_eg_meta_fifo_vld                ),
        .wr_rst_busy    ( trans_eg_meta_fifo_wr_rst_busy        ),
        .rd_rst_busy    ( trans_eg_meta_fifo_rd_rst_busy        )
    );
	
	
	// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
	assign empty 		= trans_eg_meta_fifo_empty 			&& trans_eg_pyld_fifo_empty;
	assign valid 		= trans_eg_meta_fifo_vld 			&& trans_eg_pyld_fifo_vld;
	assign wr_rst_busy 	= trans_eg_meta_fifo_wr_rst_busy 	&& trans_eg_pyld_fifo_wr_rst_busy;
	assign rd_rst_busy 	= trans_eg_meta_fifo_rd_rst_busy 	&& trans_eg_pyld_fifo_rd_rst_busy;
	// END logic ------------------------------------------------------------------------------------------------------------------------------------

endmodule