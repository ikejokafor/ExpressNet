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
//                          
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_awe_rowbuffers #(
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
    num_input_cols              ,        
    state                       ,
    gray_code                   ,
    pix_seq_datain              ,
    pfb_rden                    ,
    last_kernel                 ,
    row_matric                  ,
    ce0_pixel_datain            ,
    ce1_pixel_datain            ,
    ce0_execute                 ,
    ce1_execute                 ,
    ce0_pixel_dataout           ,
    ce1_pixel_dataout           ,
    ce0_cycle_counter           ,
    ce1_cycle_counter           ,
    row_matric_wrAddr           ,
    ce0_pixel_dataout_valid     ,
    ce1_pixel_dataout_valid
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_LOG2_BRAM_DEPTH        = clog2(`BRAM_DEPTH);
    localparam C_PIXEL_DATAOUT_WIDTH    = `PIXEL_WIDTH * 4;
    localparam C_CE_PIXEL_DOUT_WIDTH    = `PIXEL_WIDTH * `NUM_CE_PER_AWE;
    
    localparam ST_IDLE                  = 5'b00001;  
    localparam ST_AWE_CE_PRIM_BUFFER    = 5'b00010;
    localparam ST_WAIT_PFB_LOAD         = 5'b00100;
    localparam ST_AWE_CE_ACTIVE         = 5'b01000;
    localparam ST_JOB_DONE              = 5'b10000;
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input                                           clk                         ;
    input                                           rst                         ;
    input       [       C_LOG2_BRAM_DEPTH - 2:0]    input_row                   ;
    input       [       C_LOG2_BRAM_DEPTH - 2:0]    input_col                   ;
    input       [       C_LOG2_BRAM_DEPTH - 2:0]    num_input_cols              ;
    input       [                           4:0]    state                       ;
    input       [                           1:0]    gray_code                   ;
    input       [`PIX_SEQ_BRAM_DATA_WIDTH - 1:0]    pix_seq_datain              ;
    input                                           pfb_rden                    ;
    input                                           last_kernel                 ;
    input                                           row_matric                  ;
    input       [            `PIXEL_WIDTH - 1:0]    ce0_pixel_datain            ;
    input       [            `PIXEL_WIDTH - 1:0]    ce1_pixel_datain            ;      
    input                                           ce0_execute                 ;
    input                                           ce1_execute                 ;
    output      [   C_CE_PIXEL_DOUT_WIDTH - 1:0]    ce0_pixel_dataout           ;
    output      [   C_CE_PIXEL_DOUT_WIDTH - 1:0]    ce1_pixel_dataout           ;
    output reg  [                           2:0]    ce0_cycle_counter           ;
    output reg  [                           2:0]    ce1_cycle_counter           ;        
    input       [       C_LOG2_BRAM_DEPTH - 2:0]    row_matric_wrAddr           ;
    output                                          ce0_pixel_dataout_valid     ;
    output                                          ce1_pixel_dataout_valid     ;
    
    
 	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    reg                                         ce0_row_rename              ;
    reg                                         ce1_row_rename              ;
    
    wire    [            `PIXEL_WIDTH - 1:0]    ce0_pixel_datain_d          ;
    wire    [            `PIXEL_WIDTH - 1:0]    ce1_pixel_datain_d          ;
    
    wire    [`PIX_SEQ_BRAM_DATA_WIDTH - 1:0]    pix_seq_datain_d            ;
    wire    [`PIX_SEQ_DATA_SEQ_WIDTH0 - 1:0]    pix_seq_datain_field0       ;
    wire    [ `PIX_SEQ_DATA_SEQ_WIDTH - 1:0]    pix_seq_datain_even         ;
    wire    [ `PIX_SEQ_DATA_SEQ_WIDTH - 1:0]    pix_seq_datain_even_d       ;
    wire    [ `PIX_SEQ_DATA_SEQ_WIDTH - 1:0]    pix_seq_datain_odd          ;
    wire    [ `PIX_SEQ_DATA_SEQ_WIDTH - 1:0]    pix_seq_datain_odd_d        ;
    reg     [            `PIXEL_WIDTH - 1:0]    row_buffer_sav_val0         ;
    reg     [            `PIXEL_WIDTH - 1:0]    row_buffer_sav_val1         ;

    reg     [       C_LOG2_BRAM_DEPTH - 1:0]    bram0_wrAddr                ;
    reg     [       C_LOG2_BRAM_DEPTH - 1:0]    bram0_rdAddr                ;
    reg     [            `PIXEL_WIDTH - 1:0]    bram0_datain                ;
    reg                                         bram0_wren                  ;
    reg                                         bram0_rden                  ;
    reg     [            `PIXEL_WIDTH - 1:0]    bram0_dataout               ;

    reg     [       C_LOG2_BRAM_DEPTH - 1:0]    bram1_wrAddr                ;
    reg     [       C_LOG2_BRAM_DEPTH - 1:0]    bram1_rdAddr                ;
    reg     [            `PIXEL_WIDTH - 1:0]    bram1_datain                ;
    reg                                         bram1_wren                  ;
    reg                                         bram1_rden                  ;
    reg     [            `PIXEL_WIDTH - 1:0]    bram1_dataout               ;

    reg     [       C_LOG2_BRAM_DEPTH - 1:0]    bram2_wrAddr                ;
    reg     [       C_LOG2_BRAM_DEPTH - 1:0]    bram2_rdAddr                ;
    reg     [            `PIXEL_WIDTH - 1:0]    bram2_datain                ;
    reg                                         bram2_wren                  ;
    reg                                         bram2_rden                  ;
    reg     [            `PIXEL_WIDTH - 1:0]    bram2_dataout               ;

    reg     [       C_LOG2_BRAM_DEPTH - 1:0]    bram3_wrAddr                ;
    reg     [       C_LOG2_BRAM_DEPTH - 1:0]    bram3_rdAddr                ;
    reg     [            `PIXEL_WIDTH - 1:0]    bram3_datain                ;
    reg                                         bram3_wren                  ;
    reg                                         bram3_rden                  ;
    reg     [            `PIXEL_WIDTH - 1:0]    bram3_dataout               ;

    wire                                        ce0_row_matric              ;
    wire                                        ce1_row_matric              ;      
    reg     [       C_LOG2_BRAM_DEPTH - 2:0]    row_matric_ce0_wrAddr       ;
    reg     [       C_LOG2_BRAM_DEPTH - 2:0]    row_matric_ce1_wrAddr       ;
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    xilinx_simple_dual_port_no_change_ram #(
        .C_RAM_WIDTH    ( `PIXEL_WIDTH          ),      
        .C_RAM_DEPTH    ( `BRAM_DEPTH           ),
        .C_RAM_PERF     ( "HIGH_PERFORMANCE"    )
    ) 
    i0_xilinx_simple_dual_port_no_change_ram (
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
        .C_RAM_DEPTH    ( `BRAM_DEPTH           ),
        .C_RAM_PERF     ( "HIGH_PERFORMANCE"    )
    ) 
    i1_xilinx_simple_dual_port_no_change_ram (
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
        .C_RAM_DEPTH    ( `BRAM_DEPTH           ),
        .C_RAM_PERF     ( "HIGH_PERFORMANCE"    )
    ) 
    i2_xilinx_simple_dual_port_no_change_ram (
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
        .C_RAM_DEPTH    ( `BRAM_DEPTH           ),
        .C_RAM_PERF     ( "HIGH_PERFORMANCE"    )
    ) 
    i3_xilinx_simple_dual_port_no_change_ram (
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
        .clk        ( clk                       ),
        .rst        ( rst                       ),
        .ce         ( 1'b1                      ),
        .data_in    ( bram0_rden                ),
        .data_out   ( ce0_pixel_dataout_valid   )
    );
  
  
    SRL_bit #(
        .C_CLOCK_CYCLES( 3 )
    ) 
    i1_SRL_bit (
        .clk        ( clk                       ),
        .rst        ( rst                       ),
        .ce         ( 1'b1                      ),
        .data_in    ( bram2_rden                ),
        .data_out   ( ce1_pixel_dataout_valid   )
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
        .C_CLOCK_CYCLES  ( C_CE0_ROW_MAT_WR_ADDR_DELAY  ),
        .C_DATA_WIDTH    ( C_LOG2_BRAM_DEPTH - 1        )
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
        .C_CLOCK_CYCLES  ( C_CE1_ROW_MAT_WR_ADDR_DELAY  ),
        .C_DATA_WIDTH    ( C_LOG2_BRAM_DEPTH - 1        )
    ) 
    i6_SRL_bus (
        .clk        ( clk                       ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( row_matric_wrAddr         ),
        .data_out   ( row_matric_ce1_wrAddr     )
    );
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------            
    always@(posedge clk) begin
        if(rst) begin
            ce0_cycle_counter <= 0;
        end else begin
            if(ce0_pixel_dataout_valid) begin
                ce0_cycle_counter <= ce0_cycle_counter + 1;
                if(ce0_cycle_counter == 4) begin
                    ce0_cycle_counter <= 0;
                end
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    

    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------            
    always@(posedge clk) begin
        if(rst) begin
            ce1_cycle_counter <= 0;
        end else begin
            if(ce1_pixel_dataout_valid) begin
                ce1_cycle_counter <= ce1_cycle_counter + 1;
                if(ce1_cycle_counter == 4) begin
                    ce1_cycle_counter <= 0;
                end
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------  

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------        
    always@(posedge clk) begin
        if(gray_code == 2'b00 && ce0_cycle_counter == 2) begin
            row_buffer_sav_val0 <= bram1_dataout;
        end else if(gray_code == 2'b01 && ce0_cycle_counter == 2) begin
            row_buffer_sav_val0 <= bram0_dataout;
        end else if(gray_code == 2'b11 && ce0_cycle_counter == 2) begin
            row_buffer_sav_val0 <= bram1_dataout;
        end else if(gray_code == 2'b10 && ce0_cycle_counter == 2) begin
            row_buffer_sav_val0 <= bram0_dataout;
        end
    end
    
    always@(posedge clk) begin
        if(rst) begin
            ce0_row_rename <= 0;
        end begin
            ce0_row_rename <= 0;
            if(ce0_cycle_counter == 2) begin // needs to be a little earlier bc of rden delay
                ce0_row_rename <= 1;
            end
        end
    end
    
    always@(posedge clk) begin
        if(gray_code == 2'b00 && ce1_cycle_counter == 2) begin
            row_buffer_sav_val1 <= bram3_dataout;
        end else if(gray_code == 2'b01 && ce1_cycle_counter == 2) begin
            row_buffer_sav_val1 <= bram2_dataout;
        end else if(gray_code == 2'b11 && ce1_cycle_counter == 2) begin
            row_buffer_sav_val1 <= bram3_dataout;
        end else if(gray_code == 2'b10 && ce1_cycle_counter == 2) begin
            row_buffer_sav_val1 <= bram2_dataout;
        end
    end
    
    always@(posedge clk) begin
        if(rst) begin
            ce1_row_rename <= 0;
        end begin
            ce1_row_rename <= 0;
            if(ce1_cycle_counter == 2) begin    // needs to be a little earlier bc of rden delay
                ce1_row_rename <= 1;
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
            bram0_wren              <= 0;
            bram1_wren              <= 0;
            bram0_rden              <= 0;
            bram1_rden              <= 0;
            // convolution engine 1
            bram2_wren              <= 0;
            bram3_wren              <= 0;  
            bram2_rden              <= 0;
            bram3_rden              <= 0;
        end else begin
            // convolution engine 0
            bram0_wren              <= 0;
            bram1_wren              <= 0;
            bram0_rden              <= 0;
            bram1_rden              <= 0;
            // convolution engine 1
            bram2_wren              <= 0;
            bram3_wren              <= 0;  
            bram2_rden              <= 0;
            bram3_rden              <= 0;
            case(state)           
                ST_AWE_CE_PRIM_BUFFER: begin
                    // convolution engine 0
                    if(pfb_rden) begin
                        if(input_row == 0 && input_col <= num_input_cols) begin
                            bram0_wren <= 1;
                            bram1_wren <= 1;
                            bram0_wrAddr <= {1'b0, input_col};
                            bram1_wrAddr <= {1'b0, input_col};
                            bram0_datain <= ce0_pixel_datain;
                            bram1_datain <= ce0_pixel_datain;
                        end else if(input_row == 1 && input_col <= num_input_cols) begin
                            bram1_wren      <= 1;  
                            bram1_wrAddr    <= {1'b1, input_col};
                            bram1_datain    <= ce0_pixel_datain;
                        end else if(input_row == 2 && input_col <= num_input_cols) begin
                            bram0_wren      <= 1;
                            bram0_wrAddr    <= {1'b1, input_col};
                            bram0_datain    <= ce0_pixel_datain;
                        end
                    end
                    // convolution engine 1
                    if(pfb_rden) begin
                        if(input_row == 0 && input_col <= num_input_cols) begin
                            bram2_wren <= 1;
                            bram3_wren <= 1;
                            bram2_wrAddr <= {1'b0, input_col};
                            bram3_wrAddr <= {1'b0, input_col};
                            bram2_datain <= ce1_pixel_datain;
                            bram3_datain <= ce1_pixel_datain;
                        end else if(input_row == 1 && input_col <= num_input_cols) begin
                            bram3_wren <= 1;   
                            bram3_wrAddr <= {1'b1, input_col};
                            bram3_datain <= ce1_pixel_datain;                            
                        end else if(input_row == 2 && input_col <= num_input_cols) begin
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
                    // conv eng 0 incoming row logic
                    if(ce0_row_matric && last_kernel) begin
                        if(!(gray_code[0] ^ gray_code[1])) begin
                            bram1_wren      <= 1;                  
                            bram1_wrAddr    <= {gray_code[0], row_matric_ce0_wrAddr};
                            bram1_datain    <= ce0_pixel_datain_d;                 
                        end else if(gray_code[0] ^ gray_code[1]) begin
                            bram0_wren      <= 1;
                            bram0_wrAddr    <= {gray_code[1], row_matric_ce0_wrAddr};
                            bram0_datain    <= ce0_pixel_datain_d;                                          
                        end
                    end
                    // conv eng 0 row rename logic
                    if(ce0_row_rename && last_kernel) begin
                        if(!(gray_code[0] ^ gray_code[1])) begin             
                            bram0_wren      <= 1;
                            bram0_wrAddr    <= {gray_code[1], row_matric_ce0_wrAddr};
                            bram0_datain    <= row_buffer_sav_val0;
                        end else if(gray_code[0] ^ gray_code[1]) begin                                        
                            bram1_wren      <= 1;                       
                            bram1_wrAddr    <= {gray_code[0], row_matric_ce0_wrAddr};
                            bram1_datain    <= row_buffer_sav_val0;  
                        end
                    end
                    // conv eng 1 incoming row logic
                    if(ce1_row_matric && last_kernel) begin
                        if(!(gray_code[0] ^ gray_code[1])) begin
                            bram3_wren      <= 1;                  
                            bram3_wrAddr    <= {gray_code[0], row_matric_ce1_wrAddr};
                            bram3_datain    <= ce1_pixel_datain_d;                 
                        end else if(gray_code[0] ^ gray_code[1]) begin
                            bram2_wren      <= 1;
                            bram2_wrAddr    <= {gray_code[1], row_matric_ce1_wrAddr};
                            bram2_datain    <= ce1_pixel_datain_d;                                          
                        end
                    end
                    // conv eng 1 row rename logic
                    if(ce1_row_rename && last_kernel) begin
                        if(!(gray_code[0] ^ gray_code[1])) begin              
                            bram2_wren      <= 1;
                            bram2_wrAddr    <= {gray_code[1], row_matric_ce1_wrAddr};
                            bram2_datain    <= row_buffer_sav_val1;
                        end else if(gray_code[0] ^ gray_code[1]) begin                                        
                            bram3_wren      <= 1;                       
                            bram3_wrAddr    <= {gray_code[0], row_matric_ce1_wrAddr};
                            bram3_datain    <= row_buffer_sav_val1;  
                        end
                    end 
                end
                default: begin
                
                end
            endcase
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
                ST_JOB_DONE:                state_s = "ST_JOB_DONE";
        endcase
    end
`endif	
	
endmodule