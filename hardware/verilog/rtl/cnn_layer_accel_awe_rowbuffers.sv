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
// Additional Comments:     CE stands for convolution engine
//                          
//                          
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_awe_rowbuffers #(
    parameter C_FIRST_AWE_ROW_BUF           = 0,
    parameter C_SEQ_DATAIN_DELAY            = 0,
    parameter C_CE0_ROW_MATRIC_DELAY        = 3,
    parameter C_CE1_ROW_MATRIC_DELAY        = 4,
    parameter C_CE0_ROW_MAT_WR_ADDR_DELAY   = 4,
    parameter C_CE1_ROW_MAT_WR_ADDR_DELAY   = 5,
    parameter C_CE0_ROW_MAT_PX_DIN_DELAY    = 2,
    parameter C_CE1_ROW_MAT_PX_DIN_DELAY    = 3
) (
    clk                         ,          
    rst                         ,     
    input_row                   ,
    input_col                   ,
    num_expd_input_cols         , 
    state                       ,
    gray_code                   ,
    pix_seq_datain              ,
    pfb_rden                    ,
    last_kernel                 ,
    row_matric                  ,
	row_rename                  ,
    ce0_pixel_datain            ,
    ce1_pixel_datain            ,
    ce0_execute                 ,
    ce1_execute                 ,
    ce0_pixel_dataout           ,
    ce1_pixel_dataout           ,
    ce0_cycle_counter           ,
    ce1_cycle_counter           ,
	ce0_move_one_row_down       ,
	ce1_move_one_row_down       ,
    row_matric_wrAddr           ,
    ce0_pixel_dataout_valid     ,
    ce1_pixel_dataout_valid     , 
    rst_addr                    ,
    conv_out_fmt                ,
    num_kernels                 ,
    cascade_in_valid            ,
    cascade_in_ready            ,
    cascade                     ,
    master_quad
`ifdef SIMULATION
    ,
    ce0_last_kernel             ,
    ce1_last_kernel             
`endif    
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.svh"
    `include "cnn_layer_accel_QUAD.svh"
    `include "cnn_layer_accel.svh"


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_CLG2_ROW_BUF_BRAM_DEPTH    = $clog2(`ROW_BUF_BRAM_DEPTH);
    localparam C_PIXEL_DATAOUT_WIDTH        = `PIXEL_WIDTH * 4;
    localparam C_CE_PIXEL_DOUT_WIDTH        = `PIXEL_WIDTH * `NUM_CE_PER_AWE;
    localparam C_CLG2_MAX_BRAM_3x3_KERNELS  = $clog2(`MAX_BRAM_3x3_KERNELS);
    
    localparam ST_IDLE                      = 6'b000001;  
    localparam ST_AWE_CE_PRIM_BUFFER        = 6'b000010;
    localparam ST_WAIT_PFB_LOAD             = 6'b000100;
    localparam ST_AWE_CE_ACTIVE             = 6'b001000;
    localparam ST_WAIT_JOB_DONE             = 6'b010000;
    localparam ST_SEND_COMPLETE             = 6'b100000;
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input  logic                                        clk                         ;
    input  logic                                        rst                         ;
    input  logic    [ C_CLG2_ROW_BUF_BRAM_DEPTH - 2:0]  input_row                   ;
    input  logic    [ C_CLG2_ROW_BUF_BRAM_DEPTH - 2:0]  input_col                   ;
    input  logic    [ C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  num_expd_input_cols         ;
    input  logic    [                             5:0]  state                       ;
    input  logic    [                             1:0]  gray_code                   ;
    input  logic    [ `PIX_SEQ_BRAM_DATA_WIDTH - 1:0]   pix_seq_datain              ;
    input  logic                                        pfb_rden                    ;
    input  logic                                        last_kernel                 ;
    input  logic                                        row_matric                  ;
	input  logic                                        row_rename                  ;
	input  logic    [            `PIXEL_WIDTH - 1:0]    ce0_pixel_datain            ;
    input  logic    [            `PIXEL_WIDTH - 1:0]    ce1_pixel_datain            ;      
    input  logic                                        ce0_execute                 ;
    input  logic                                        ce1_execute                 ;
    output logic    [   C_CE_PIXEL_DOUT_WIDTH - 1:0]    ce0_pixel_dataout           ;
    output logic    [   C_CE_PIXEL_DOUT_WIDTH - 1:0]    ce1_pixel_dataout           ;
    output logic    [                           2:0]    ce0_cycle_counter           ;
    output logic    [                           2:0]    ce1_cycle_counter           ;        
	input  logic										ce0_move_one_row_down       ;
	input  logic 										ce1_move_one_row_down       ;
    input  logic    [ C_CLG2_ROW_BUF_BRAM_DEPTH - 2:0]  row_matric_wrAddr           ;
	output logic                                        ce0_pixel_dataout_valid     ;
    output logic                                        ce1_pixel_dataout_valid     ;
    input  logic                                        rst_addr                    ;
    input logic                                         conv_out_fmt                ;
    input  logic    [C_CLG2_MAX_BRAM_3x3_KERNELS - 1:0] num_kernels                 ;
    input logic                                         cascade_in_valid            ;
    output logic                                        cascade_in_ready            ;
    input logic                                         cascade                     ;
    input logic                                         master_quad                 ;
`ifdef SIMULATION
    input logic                                         ce0_last_kernel             ;
    input logic                                         ce1_last_kernel             ;
`endif

 
    
 	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    logic                                       ce0_row_rename              ;
    logic                                       ce1_row_rename              ;
	logic                                       ce0_row_rename_d            ;
    logic                                       ce1_row_rename_d            ;

    logic   [            `PIXEL_WIDTH - 1:0]    ce0_pixel_datain_d          ;
    logic   [            `PIXEL_WIDTH - 1:0]    ce1_pixel_datain_d          ;

    logic   [`PIX_SEQ_BRAM_DATA_WIDTH - 1:0]    pix_seq_datain_d            ;
    logic   [`PIX_SEQ_DATA_SEQ_WIDTH0 - 1:0]    pix_seq_datain_field0       ;
    logic   [ `PIX_SEQ_DATA_SEQ_WIDTH - 1:0]    pix_seq_datain_even         ;
    logic   [ `PIX_SEQ_DATA_SEQ_WIDTH - 1:0]    pix_seq_datain_even_d       ;
    logic   [ `PIX_SEQ_DATA_SEQ_WIDTH - 1:0]    pix_seq_datain_odd          ;
    logic   [ `PIX_SEQ_DATA_SEQ_WIDTH - 1:0]    pix_seq_datain_odd_d        ;
    logic   [            `PIXEL_WIDTH - 1:0]    row_buffer_sav_val0         ;
    logic   [            `PIXEL_WIDTH - 1:0]    row_buffer_sav_val1         ;
  
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   bram0_wrAddr                ;
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   bram0_rdAddr                ;
    logic   [             `PIXEL_WIDTH - 1:0]   bram0_datain                ;
    logic                                       bram0_wren                  ;
    logic                                       bram0_rden                  ;
    logic   [             `PIXEL_WIDTH - 1:0]   bram0_dataout               ;
   
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   bram1_wrAddr                ;
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   bram1_rdAddr                ;
    logic   [             `PIXEL_WIDTH - 1:0]   bram1_datain                ;
    logic                                       bram1_wren                  ;
    logic                                       bram1_rden                  ;
    logic   [             `PIXEL_WIDTH - 1:0]   bram1_dataout               ;
 
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   bram2_wrAddr                ;
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   bram2_rdAddr                ;
    logic   [            `PIXEL_WIDTH - 1:0]    bram2_datain                ;
    logic                                       bram2_wren                  ;
    logic                                       bram2_rden                  ;
    logic   [            `PIXEL_WIDTH - 1:0]    bram2_dataout               ;

    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   bram3_wrAddr                ;
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]   bram3_rdAddr                ;
    logic   [             `PIXEL_WIDTH - 1:0]   bram3_datain                ;
    logic                                       bram3_wren                  ;
    logic                                       bram3_rden                  ;
    logic   [             `PIXEL_WIDTH - 1:0]   bram3_dataout               ;

    logic                                       ce0_row_matric              ;
    logic                                       ce1_row_matric              ;      
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 2:0]   row_matric_ce0_wrAddr       ;
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 2:0]   row_matric_ce1_wrAddr       ;
	logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 2:0]   row_rename_ce0_wrAddr       ;
    logic   [C_CLG2_ROW_BUF_BRAM_DEPTH - 2:0]   row_rename_ce1_wrAddr       ;

	logic                                       ce0_cycle_counter_incr      ;
	logic             							ce1_cycle_counter_incr      ;

	logic                                       ce0_reset_counters		    ;
	logic             							ce1_reset_counters		    ;
    logic                                       ce0_rename_condition        ;
    logic                                       ce1_rename_condition        ;
    logic                                       ce0_execute_d               ;
    logic                                       ce1_execute_d               ; 
    logic                                       ce0_row_matric_en           ;
    logic                                       ce0_row_rename_en           ;    
    logic                                       ce1_row_matric_en           ;
    logic                                       ce1_row_rename_en           ; 
    logic  [C_CLG2_MAX_BRAM_3x3_KERNELS - 1:0]  ce0_rm_kernel_count         ;
    logic  [C_CLG2_MAX_BRAM_3x3_KERNELS - 1:0]  ce0_rr_kernel_count         ;    
    logic  [C_CLG2_MAX_BRAM_3x3_KERNELS - 1:0]  ce1_rm_kernel_count         ;
    logic  [C_CLG2_MAX_BRAM_3x3_KERNELS - 1:0]  ce1_rr_kernel_count         ; 
    logic  [                              2:0]  ce0_cycle_counter_d         ;
    
 
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    xilinx_simple_dual_port_no_change_ram #(
        .C_RAM_WIDTH    ( `PIXEL_WIDTH          ),      
        .C_RAM_DEPTH    ( `ROW_BUF_BRAM_DEPTH   ),
        .C_RAM_PERF     ( "HIGH_PERFORMANCE"    )
    ) 
    bram0 (
        .wrAddr             ( bram0_wrAddr      ),  
        .rdAddr             ( bram0_rdAddr      ),
        .datain             ( bram0_datain      ),
        .clk                ( clk               ),    
        .wren               ( bram0_wren        ),
        .rden               ( bram0_rden        ),
        .dataout            ( bram0_dataout     )
    );
    
    
    xilinx_simple_dual_port_no_change_ram #(
        .C_RAM_WIDTH    ( `PIXEL_WIDTH          ),      
        .C_RAM_DEPTH    ( `ROW_BUF_BRAM_DEPTH   ),
        .C_RAM_PERF     ( "HIGH_PERFORMANCE"    )
    ) 
    bram1 (
        .wrAddr             ( bram1_wrAddr      ),  
        .rdAddr             ( bram1_rdAddr      ),
        .datain             ( bram1_datain      ),
        .clk                ( clk               ),      
        .wren               ( bram1_wren        ),
        .rden               ( bram1_rden        ),
        .dataout            ( bram1_dataout     )
    );
    
    
    xilinx_simple_dual_port_no_change_ram #(
        .C_RAM_WIDTH    ( `PIXEL_WIDTH          ),      
        .C_RAM_DEPTH    ( `ROW_BUF_BRAM_DEPTH   ),
        .C_RAM_PERF     ( "HIGH_PERFORMANCE"    )
    ) 
    bram2 (
        .wrAddr             ( bram2_wrAddr      ),  
        .rdAddr             ( bram2_rdAddr      ),
        .datain             ( bram2_datain      ),
        .clk                ( clk               ),       
        .wren               ( bram2_wren        ),
        .rden               ( bram2_rden        ),
        .dataout            ( bram2_dataout     )
    );
    
    
    xilinx_simple_dual_port_no_change_ram #(
        .C_RAM_WIDTH    ( `PIXEL_WIDTH          ),      
        .C_RAM_DEPTH    ( `ROW_BUF_BRAM_DEPTH   ),
        .C_RAM_PERF     ( "HIGH_PERFORMANCE"    )
    ) 
    bram3 (
        .wrAddr             ( bram3_wrAddr      ),  
        .rdAddr             ( bram3_rdAddr      ),
        .datain             ( bram3_datain      ),
        .clk                ( clk               ),       
        .wren               ( bram3_wren        ),
        .rden               ( bram3_rden        ),
        .dataout            ( bram3_dataout     )
    );

    
    SRL_bit #(
        .C_CLOCK_CYCLES( 3 )
    ) 
    i0_SRL_bit (
        .clk        ( clk               		        	),
        .rst        ( rst                       			),
        .ce         ( 1'b1                      			),
        .data_in    ( bram0_rden && !ce0_move_one_row_down  ),
        .data_out   ( ce0_pixel_dataout_valid   			)
    );
  
  
    SRL_bit #(
        .C_CLOCK_CYCLES( 3 )
    ) 
    i1_SRL_bit (
        .clk        ( clk                       		    ),
        .rst        ( rst                       		    ),
        .ce         ( 1'b1                      		    ),
        .data_in    ( bram2_rden && !ce1_move_one_row_down  ),
        .data_out   ( ce1_pixel_dataout_valid               )
    );
 
 
	SRL_bit #(
        .C_CLOCK_CYCLES( 3 )
    ) 
    i4_SRL_bit (
        .clk        ( clk               		        	),
        .rst        ( rst                       			),
        .ce         ( 1'b1                      			),
        .data_in    ( bram0_rden && ce0_move_one_row_down 	),
        .data_out   ( ce0_cycle_counter_incr   			    )
    );
  
  
    SRL_bit #(
        .C_CLOCK_CYCLES( 3 )
    ) 
    i5_SRL_bit (
        .clk        ( clk                       		    ),
        .rst        ( rst                       		    ),
        .ce         ( 1'b1                      		    ),
        .data_in    ( bram2_rden && ce1_move_one_row_down   ),
        .data_out   ( ce1_cycle_counter_incr                )
    );


    // delay bc of different start times and when you can row matric
    SRL_bit #(
        .C_CLOCK_CYCLES( C_CE0_ROW_MATRIC_DELAY )
    ) 
    i2_SRL_bit (
        .clk        ( clk               ),
        .rst        ( rst               ),
        .ce         ( 1'b1              ),
        .data_in    ( row_matric        ),
        .data_out   ( ce0_row_matric    )
    );

    
    // delay bc of different start times and when you can row matric
    SRL_bit #(
        .C_CLOCK_CYCLES( C_CE1_ROW_MATRIC_DELAY )
    ) 
    i3_SRL_bit (
        .clk        ( clk               ),
        .rst        ( rst               ),
        .ce         ( 1'b1              ),
        .data_in    ( row_matric        ),
        .data_out   ( ce1_row_matric    )
    );


    // delay bc of different start times and when you can row rename
    SRL_bit #(
        .C_CLOCK_CYCLES( C_CE0_ROW_MATRIC_DELAY + 1 )
    ) 
    i6_SRL_bit (
        .clk        ( clk               ),
        .rst        ( rst               ),
        .ce         ( 1'b1              ),
        .data_in    ( row_rename        ),
        .data_out   ( ce0_row_rename    )
    );

    
    // delay bc of different start times and when you can row rename
    SRL_bit #(
        .C_CLOCK_CYCLES( C_CE1_ROW_MATRIC_DELAY + 1 )
    ) 
    i7_SRL_bit (
        .clk        ( clk               ),
        .rst        ( rst               ),
        .ce         ( 1'b1              ),
        .data_in    ( row_rename        ),
        .data_out   ( ce1_row_rename    )
    );
 
    
   // delay bc of different start times and when you can row rename
    SRL_bit #(
        .C_CLOCK_CYCLES( 1 )
    ) 
    i8_SRL_bit (
        .clk        ( clk               ),
        .rst        ( rst               ),
        .ce         ( 1'b1              ),
        .data_in    ( ce0_row_rename    ),
        .data_out   ( ce0_row_rename_d  )
    );

    
    // delay bc of different start times and when you can row rename
    SRL_bit #(
        .C_CLOCK_CYCLES( 1 )
    ) 
    i9_SRL_bit (
        .clk        ( clk               ),
        .rst        ( rst               ),
        .ce         ( 1'b1              ),
        .data_in    ( ce1_row_rename    ),
        .data_out   ( ce1_row_rename_d  )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES( 3 )
    ) 
    i10_SRL_bit (
        .clk        ( clk            ),
        .rst        ( rst            ),
        .ce         ( 1'b1           ),
        .data_in    ( ce0_execute    ),
        .data_out   ( ce0_execute_d  )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES( 3 )
    ) 
    i11_SRL_bit (
        .clk        ( clk            ),
        .rst        ( rst            ),
        .ce         ( 1'b1           ),
        .data_in    ( ce1_execute    ),
        .data_out   ( ce1_execute_d  )
    );
    
    
    // delay bc of pfb latency and different start times
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( C_CE0_ROW_MAT_PX_DIN_DELAY   ),
        .C_DATA_WIDTH    ( `PIXEL_WIDTH                 )
    ) 
    i0_SRL_bus (
        .clk        ( clk                   ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( ce0_pixel_datain      ),
        .data_out   ( ce0_pixel_datain_d    )
    );

    
    // delay bc of pfb latency and different start times
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( C_CE1_ROW_MAT_PX_DIN_DELAY   ),
        .C_DATA_WIDTH    ( `PIXEL_WIDTH                 )
    ) 
    i1_SRL_bus (
        .clk        ( clk                   ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( ce1_pixel_datain      ),
        .data_out   ( ce1_pixel_datain_d    )
    ); 

    
    // delay for ce1
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 1                        ),
        .C_DATA_WIDTH    ( `PIX_SEQ_DATA_SEQ_WIDTH  )
    ) 
    i2_SRL_bus (
        .clk        ( clk                       ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( pix_seq_datain_even       ),
        .data_out   ( pix_seq_datain_even_d     )
    ); 

    
    // delay for ce1
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 1                        ),
        .C_DATA_WIDTH    ( `PIX_SEQ_DATA_SEQ_WIDTH  )
    ) 
    i3_SRL_bus (
        .clk        ( clk                       ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( pix_seq_datain_odd        ),
        .data_out   ( pix_seq_datain_odd_d      )
    );     
 
    
    // delay for seq datain
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( C_SEQ_DATAIN_DELAY       ),
        .C_DATA_WIDTH    ( `PIX_SEQ_BRAM_DATA_WIDTH )
    ) 
    i4_SRL_bus (
        .clk        ( clk                       ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( pix_seq_datain            ),
        .data_out   ( pix_seq_datain_d          )
    );
    
    
    // delay for conv eng0 row matriculation write address
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( C_CE0_ROW_MAT_WR_ADDR_DELAY      ),
        .C_DATA_WIDTH    ( C_CLG2_ROW_BUF_BRAM_DEPTH - 1    )
    ) 
    i5_SRL_bus (
        .clk        ( clk                       ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( row_matric_wrAddr         ),
        .data_out   ( row_matric_ce0_wrAddr     )
    );
    
    
    // delay for conv eng1 row matriculation write address
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( C_CE1_ROW_MAT_WR_ADDR_DELAY      ),
        .C_DATA_WIDTH    ( C_CLG2_ROW_BUF_BRAM_DEPTH - 1    )
    ) 
    i6_SRL_bus (
        .clk        ( clk                       ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( row_matric_wrAddr         ),
        .data_out   ( row_matric_ce1_wrAddr     )
    );
    
	    // delay for conv eng0 row matriculation write address
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( C_CE0_ROW_MAT_WR_ADDR_DELAY + 1  ),
        .C_DATA_WIDTH    ( C_CLG2_ROW_BUF_BRAM_DEPTH - 1    )
    ) 
    i7_SRL_bus (
        .clk        ( clk                       ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( row_matric_wrAddr         ),
        .data_out   ( row_rename_ce0_wrAddr     )
    );
    
    
    // delay for conv eng1 row matriculation write address
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( C_CE1_ROW_MAT_WR_ADDR_DELAY + 1 ),
        .C_DATA_WIDTH    ( C_CLG2_ROW_BUF_BRAM_DEPTH - 1   )
    ) 
    i8_SRL_bus (
        .clk        ( clk                       ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( row_matric_wrAddr         ),
        .data_out   ( row_rename_ce1_wrAddr     )
    );
    
    
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 2 ),
        .C_DATA_WIDTH    ( 3  )
    ) 
    i9_SRL_bus (
        .clk        ( clk                       ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( ce0_cycle_counter         ),
        .data_out   ( ce0_cycle_counter_d       )
    );
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------            
    generate
        if(C_FIRST_AWE_ROW_BUF == 0) begin
            always@(posedge clk) begin
                if(rst) begin
                    cascade_in_ready <= 0;
                end else begin
                    cascade_in_ready <= 0;
                    if(cascade && !master_quad && cascade_in_valid && ce0_cycle_counter_d == `WINDOW_3x3_NUM_CYCLES_MINUS_1) begin
                        cascade_in_ready  <= 1;
                    end
                end
            end
        end
    endgenerate
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------            
    always@(posedge clk) begin
        if(rst || ce0_reset_counters) begin
            ce0_cycle_counter <= 0;
        end else begin
            if(ce0_pixel_dataout_valid || ce0_cycle_counter_incr) begin
                ce0_cycle_counter <= ce0_cycle_counter + 1;
                if(ce0_cycle_counter == `WINDOW_3x3_NUM_CYCLES_MINUS_1) begin
                    ce0_cycle_counter <= 0;
                end
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    

    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------            
    always@(posedge clk) begin
        if(rst || ce1_reset_counters) begin
            ce1_cycle_counter <= 0;
        end else begin
            if(ce1_pixel_dataout_valid || ce1_cycle_counter_incr) begin
                ce1_cycle_counter <= ce1_cycle_counter + 1;
                if(ce1_cycle_counter == `WINDOW_3x3_NUM_CYCLES_MINUS_1) begin
                    ce1_cycle_counter <= 0;
                end
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------  

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------        
	assign ce0_rename_condition = ce0_row_rename;
	assign ce0_reset_counters = (~ce0_pixel_dataout_valid & ~ce0_cycle_counter_incr);

    // need to save value beforehand bc we overlapp execution with row matriculation / renaming and rowbuffer BRAM's only have 1 read port
    always@(posedge clk) begin
        if(gray_code == 2'b00 && ce0_rename_condition) begin
            row_buffer_sav_val0 <= bram1_dataout;
        end else if(gray_code == 2'b01 && ce0_rename_condition) begin
            row_buffer_sav_val0 <= bram0_dataout;
        end else if(gray_code == 2'b11 && ce0_rename_condition) begin
            row_buffer_sav_val0 <= bram1_dataout;
        end else if(gray_code == 2'b10 && ce0_rename_condition) begin
            row_buffer_sav_val0 <= bram0_dataout;
        end
    end
    
    
	assign ce1_rename_condition = ce1_row_rename;
	assign ce1_reset_counters = (~ce1_pixel_dataout_valid & ~ce1_cycle_counter_incr);

    // need to save value beforehand bc we overlapp execution with row matriculation / renaming and rowbuffer BRAM's only have 1 read port
    always@(posedge clk) begin
        if(gray_code == 2'b00 && ce1_rename_condition) begin
            row_buffer_sav_val1 <= bram3_dataout;
        end else if(gray_code == 2'b01 && ce1_rename_condition) begin
            row_buffer_sav_val1 <= bram2_dataout;
        end else if(gray_code == 2'b11 && ce1_rename_condition) begin
            row_buffer_sav_val1 <= bram3_dataout;
        end else if(gray_code == 2'b10 && ce1_rename_condition) begin
            row_buffer_sav_val1 <= bram2_dataout;
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign ce0_row_matric_en = (conv_out_fmt == `CONV_OUT_FMT0) ? last_kernel 
                                : (conv_out_fmt == `CONV_OUT_FMT1 && !ce0_move_one_row_down) ? (ce0_rm_kernel_count == num_kernels) 
                                : (conv_out_fmt == `CONV_OUT_FMT1 && ce0_move_one_row_down) ? 1 
                                : 0;
    assign ce0_row_rename_en = (conv_out_fmt == `CONV_OUT_FMT0) ? last_kernel 
                                : (conv_out_fmt == `CONV_OUT_FMT1 && !ce0_move_one_row_down) ? (ce0_rr_kernel_count == num_kernels) 
                                : (conv_out_fmt == `CONV_OUT_FMT1 && ce0_move_one_row_down) ? 1 
                                : 0;
    
    always@(posedge clk) begin
        if(rst) begin
            ce0_rm_kernel_count <= 0;
        end else begin
            if(ce0_cycle_counter == `WINDOW_3x3_NUM_CYCLES_MINUS_1 && ce0_rm_kernel_count == num_kernels && !ce0_move_one_row_down) begin
                ce0_rm_kernel_count <= 0;
            end else if(ce0_cycle_counter == `WINDOW_3x3_NUM_CYCLES_MINUS_1 && !ce0_move_one_row_down) begin
                ce0_rm_kernel_count <= ce0_rm_kernel_count + 1;
            end
        end
    end
    
    always@(posedge clk) begin
        if(rst) begin
            ce0_rr_kernel_count <= 0;
        end else begin
            if(ce0_cycle_counter == `WINDOW_3x3_NUM_CYCLES_MINUS_1 && ce0_rr_kernel_count == num_kernels && !ce0_move_one_row_down) begin
                ce0_rr_kernel_count <= 0;
            end else if(ce0_cycle_counter == `WINDOW_3x3_NUM_CYCLES_MINUS_1 && !ce0_move_one_row_down) begin
                ce0_rr_kernel_count <= ce0_rr_kernel_count + 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
 

    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------        
    assign ce1_row_matric_en = (conv_out_fmt == `CONV_OUT_FMT0) ? last_kernel 
                                : (conv_out_fmt == `CONV_OUT_FMT1 && !ce1_move_one_row_down) ? (ce1_rm_kernel_count == num_kernels) 
                                : (conv_out_fmt == `CONV_OUT_FMT1 && ce1_move_one_row_down) ? 1 
                                : 0;
    assign ce1_row_rename_en = (conv_out_fmt == `CONV_OUT_FMT0) ? last_kernel 
                                : (conv_out_fmt == `CONV_OUT_FMT1 && !ce1_move_one_row_down) ? (ce1_rr_kernel_count == num_kernels) 
                                : (conv_out_fmt == `CONV_OUT_FMT1 && ce1_move_one_row_down) ? 1 
                                : 0;
    
    always@(posedge clk) begin
        if(rst) begin
            ce1_rm_kernel_count <= 0;
        end else begin
            if(ce1_cycle_counter == `WINDOW_3x3_NUM_CYCLES_MINUS_1 && ce1_rm_kernel_count == num_kernels && !ce1_move_one_row_down) begin
                ce1_rm_kernel_count <= 0;
            end else if(ce1_cycle_counter == `WINDOW_3x3_NUM_CYCLES_MINUS_1 && !ce1_move_one_row_down) begin
                ce1_rm_kernel_count <= ce1_rm_kernel_count + 1;
            end
        end
    end
    
    always@(posedge clk) begin
        if(rst) begin
            ce1_rr_kernel_count <= 0;
        end else begin
            if(ce1_cycle_counter == `WINDOW_3x3_NUM_CYCLES_MINUS_1 && ce1_rr_kernel_count == num_kernels && !ce1_move_one_row_down) begin
                ce1_rr_kernel_count <= 0;
            end else if(ce1_cycle_counter == `WINDOW_3x3_NUM_CYCLES_MINUS_1 && !ce1_move_one_row_down) begin
                ce1_rr_kernel_count <= ce1_rr_kernel_count + 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
 
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    assign ce0_pixel_dataout        = {bram1_dataout, bram0_dataout};
    assign ce1_pixel_dataout        = {bram3_dataout, bram2_dataout};
    assign pix_seq_datain_field0    = pix_seq_datain_d[`PIX_SEQ_DATA_SEQ_FIELD0];
    assign pix_seq_datain_even      =   {  
                                            gray_code[1] ^ pix_seq_datain_d[`PIX_SEQ_DATA_SEQ_FIELD1],
                                            pix_seq_datain_d[`PIX_SEQ_DATA_SEQ_FIELD2]
                                        };
    assign pix_seq_datain_odd       =   {  
                                            gray_code[0] ^ pix_seq_datain_d[`PIX_SEQ_DATA_SEQ_FIELD1], 
                                            pix_seq_datain_field0,
                                            pix_seq_datain_d[0] 
                                                | pix_seq_datain_d[`PIX_SEQ_DATA_PARITY_FIELD]
                                        };
                                        
    
    always@(posedge clk) begin
        if(rst) begin
            // convolution engine 0
            bram0_wren <= 0;
            bram1_wren <= 0;
            bram0_rden <= 0;
            bram1_rden <= 0;
            // convolution engine 1
            bram2_wren <= 0;
            bram3_wren <= 0;  
            bram2_rden <= 0;
            bram3_rden <= 0;
        end else begin
            // convolution engine 0
            bram0_wren <= 0;
            bram1_wren <= 0;
            bram0_rden <= 0;
            bram1_rden <= 0;
            if(rst_addr) begin
                bram0_wrAddr <= 0;
                bram1_wrAddr <= 0;
            end
            // convolution engine 1
            bram2_wren <= 0;
            bram3_wren <= 0;            
            bram2_rden <= 0;
            bram3_rden <= 0;
            if(rst_addr) begin
                bram2_wrAddr <= 0;
                bram3_wrAddr <= 0;
            end
            case(state)           
                ST_AWE_CE_PRIM_BUFFER: begin
                    // convolution engine 0
                    if(pfb_rden) begin
                        if(input_row == 0 && input_col <= num_expd_input_cols) begin
                            bram0_wren <= 1;
                            bram1_wren <= 1;
                            bram0_wrAddr <= {1'b0, input_col};
                            bram1_wrAddr <= {1'b0, input_col};
                            bram0_datain <= ce0_pixel_datain;
                            bram1_datain <= ce0_pixel_datain;
                        end else if(input_row == 1 && input_col <= num_expd_input_cols) begin
                            bram1_wren      <= 1;  
                            bram1_wrAddr    <= {1'b1, input_col};
                            bram1_datain    <= ce0_pixel_datain;
                        end else if(input_row == 2 && input_col <= num_expd_input_cols) begin
                            bram0_wren      <= 1;
                            bram0_wrAddr    <= {1'b1, input_col};
                            bram0_datain    <= ce0_pixel_datain;
                        end
                    end
                    // convolution engine 1
                    if(pfb_rden) begin
                        if(input_row == 0 && input_col <= num_expd_input_cols) begin
                            bram2_wren <= 1;
                            bram3_wren <= 1;
                            bram2_wrAddr <= {1'b0, input_col};
                            bram3_wrAddr <= {1'b0, input_col};
                            bram2_datain <= ce1_pixel_datain;
                            bram3_datain <= ce1_pixel_datain;
                        end else if(input_row == 1 && input_col <= num_expd_input_cols) begin
                            bram3_wren <= 1;   
                            bram3_wrAddr <= {1'b1, input_col};
                            bram3_datain <= ce1_pixel_datain;                            
                        end else if(input_row == 2 && input_col <= num_expd_input_cols) begin
                            bram2_wren <= 1;   
                            bram2_wrAddr <= {1'b1, input_col}; 
                            bram2_datain <= ce1_pixel_datain;                          
                        end
                    end
                end
                ST_AWE_CE_ACTIVE: begin
                    //convolution engine 0
                    if(ce0_execute) begin
                        bram0_rden              <= 1;
                        bram1_rden              <= 1;
                        bram0_rdAddr            <= pix_seq_datain_even;
                        bram1_rdAddr            <= pix_seq_datain_odd;
                    end
                    //convolution engine 1
                    if(ce1_execute) begin
                        bram2_rden              <= 1;
                        bram3_rden              <= 1;
                        bram2_rdAddr            <= pix_seq_datain_even_d;
                        bram3_rdAddr            <= pix_seq_datain_odd_d;
                    end
                end
                default: begin
                end
            endcase
            // conv eng 0 incoming row logic
            if(ce0_row_matric && (ce0_row_matric_en || (ce0_row_matric_en && ce0_execute_d) || ce0_move_one_row_down)) begin
                if(!(^gray_code) && bram1_wrAddr < {gray_code[0], num_expd_input_cols[C_CLG2_ROW_BUF_BRAM_DEPTH - 2:0]}) begin  // gray_code == 00 || gray_code == 11
                    bram1_wren      <= 1;                  
                    bram1_wrAddr    <= {gray_code[0], row_matric_ce0_wrAddr};
                    bram1_datain    <= ce0_pixel_datain_d;                 
                end else if(^gray_code && bram0_wrAddr < {gray_code[1], num_expd_input_cols[C_CLG2_ROW_BUF_BRAM_DEPTH - 2:0]}) begin // gray_code == 01 || gray_code == 10 
                    bram0_wren      <= 1;
                    bram0_wrAddr    <= {gray_code[1], row_matric_ce0_wrAddr};
                    bram0_datain    <= ce0_pixel_datain_d;                                          
                end
            end
            // conv eng 0 row rename logic
            if(ce0_row_rename_d && (ce0_row_rename_en || (ce0_row_rename_en && ce0_execute_d) || ce0_move_one_row_down)) begin
                if(!(^gray_code) && bram0_wrAddr < {gray_code[1], num_expd_input_cols[C_CLG2_ROW_BUF_BRAM_DEPTH - 2:0]}) begin  // gray_code == 00 || gray_code == 11          
                    bram0_wren      <= 1;
                    bram0_wrAddr    <= {gray_code[1], row_rename_ce0_wrAddr};
                    bram0_datain    <= row_buffer_sav_val0;
                end else if(^gray_code && bram1_wrAddr < {gray_code[0], num_expd_input_cols[C_CLG2_ROW_BUF_BRAM_DEPTH - 2:0]}) begin  // gray_code == 01 || gray_code == 10                                       
                    bram1_wren      <= 1;                       
                    bram1_wrAddr    <= {gray_code[0], row_rename_ce0_wrAddr};
                    bram1_datain    <= row_buffer_sav_val0;  
                end
            end
            // conv eng 1 incoming row logic
            if(ce1_row_matric && (ce1_row_matric_en || (ce1_row_matric_en && ce1_execute_d) || ce1_move_one_row_down)) begin
                if(!(^gray_code) && bram3_wrAddr < {gray_code[0], num_expd_input_cols[C_CLG2_ROW_BUF_BRAM_DEPTH - 2:0]}) begin  // gray_code == 00 || gray_code == 11
                    bram3_wren      <= 1;                  
                    bram3_wrAddr    <= {gray_code[0], row_matric_ce1_wrAddr};
                    bram3_datain    <= ce1_pixel_datain_d;                 
                end else if(^gray_code && bram2_wrAddr < {gray_code[1], num_expd_input_cols[C_CLG2_ROW_BUF_BRAM_DEPTH - 2:0]}) begin    // gray_code == 01 || gray_code == 10 
                    bram2_wren      <= 1;
                    bram2_wrAddr    <= {gray_code[1], row_matric_ce1_wrAddr};
                    bram2_datain    <= ce1_pixel_datain_d;                                          
                end
            end
            // conv eng 1 row rename logic
            if(ce1_row_rename_d && (ce1_row_rename_en || (ce1_row_rename_en && ce1_execute_d) || ce1_move_one_row_down)) begin
                if(!(^gray_code) && bram2_wrAddr < {gray_code[1], num_expd_input_cols[C_CLG2_ROW_BUF_BRAM_DEPTH - 2:0]}) begin  // gray_code == 00 || gray_code == 11              
                    bram2_wren      <= 1;
                    bram2_wrAddr    <= {gray_code[1], row_rename_ce1_wrAddr};
                    bram2_datain    <= row_buffer_sav_val1;
                end else if(^gray_code && bram3_wrAddr < {gray_code[0], num_expd_input_cols[C_CLG2_ROW_BUF_BRAM_DEPTH - 2:0]}) begin  // gray_code == 01 || gray_code == 10                                       
                    bram3_wren      <= 1;                       
                    bram3_wrAddr    <= {gray_code[0], row_rename_ce1_wrAddr};
                    bram3_datain    <= row_buffer_sav_val1;  
                end
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
	// DEBUG ----------------------------------------------------------------------------------------------------------------------------------------

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
    
    
    int output_row_ce0;
    int output_col_ce0;
    int output_row_ce1;
    int output_col_ce1;
    always@(posedge clk) begin
        if(rst) begin
            output_row_ce0 <= 0;
            output_col_ce0 <= 0;
            output_row_ce1 <= 0;
            output_col_ce1 <= 0;
        end else begin
            case(state)
                ST_IDLE: begin
                    output_row_ce0 <= 0;
                    output_col_ce1 <= 0;
                    output_row_ce1 <= 0;
                    output_col_ce1 <= 0;                    
                end
                ST_AWE_CE_ACTIVE: begin
                    if(ce0_cycle_counter == `WINDOW_3x3_NUM_CYCLES_MINUS_1) begin
                        if(output_col_ce0 == num_expd_input_cols) begin
                            output_col_ce0 <= 0;
                            if(ce0_last_kernel) begin
                                output_row_ce0 <= output_row_ce0 + 1;
                            end
                        end else if(ce0_pixel_dataout_valid) begin
                            output_col_ce0 <= output_col_ce0 + 1;
                        end
                    end
                    if(ce1_cycle_counter == `WINDOW_3x3_NUM_CYCLES_MINUS_1) begin
                        if(output_col_ce1 == num_expd_input_cols) begin
                            output_col_ce1  <= 0;
                            if(ce1_last_kernel) begin
                                output_row_ce1 <= output_row_ce1 + 1;
                            end
                        end else if(ce1_pixel_dataout_valid) begin
                            output_col_ce1 <= output_col_ce1 + 1;
                        end
                    end
                end
            endcase
        end
    end
`endif
	
	
endmodule