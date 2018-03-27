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
    parameter C_NUM_CE_PER_AWE          = 2,
    parameter C_PIXEL_WIDTH             = 16,
    parameter C_BRAM_DEPTH              = 1024,
    parameter C_SEQ_DATA_WIDTH          = 16,
    parameter C_CE0_ROW_MATRIC_DELAY    = 1,
    parameter C_CE1_ROW_MATRIC_DELAY    = 2
) (
    clk                         ,          
    rst                         ,     
    input_row                   ,
    input_col                   ,
    num_input_cols              ,        
    state                       ,
    gray_code                   ,
    seq_datain                  ,
    pfb_rden                    ,
    last_kernel                 ,
    row_matric                  ,
    ce0_pixel_datain            ,
    ce1_pixel_datain            ,
    ce0_start                   ,
    ce1_start                   ,
    ce0_pixel_dataout           ,
    ce1_pixel_dataout           ,
    wrAddr                      ,
    ce1_cycle_counter           ,
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
    localparam C_LOG2_BRAM_DEPTH        = clog2(C_BRAM_DEPTH);
    localparam C_PIXEL_DATAOUT_WIDTH    = C_PIXEL_WIDTH * 4;
    localparam C_CE_PIXEL_DOUT_WIDTH    = C_PIXEL_WIDTH * C_NUM_CE_PER_AWE;
    
    localparam ST_IDLE_0                = 5'b00001;  
    localparam ST_AWE_CE_PRIM_BUFFER    = 5'b00010;
    localparam ST_WAIT_PFB_LOAD         = 5'b00100;
    localparam ST_AWE_CE_ACTIVE         = 5'b01000;
    localparam ST_JOB_DONE              = 5'b10000;
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input                                       clk                         ;
    input                                       rst                         ;
    input       [   C_LOG2_BRAM_DEPTH - 2:0]    input_row                   ;
    input       [   C_LOG2_BRAM_DEPTH - 2:0]    input_col                   ;
    input       [   C_LOG2_BRAM_DEPTH - 2:0]    num_input_cols              ;
    input       [                       4:0]    state                       ;
    input       [                       1:0]    gray_code                   ;
    input       [    C_SEQ_DATA_WIDTH - 1:0]    seq_datain                  ;
    input                                       pfb_rden                    ;
    input                                       last_kernel                 ;
    input                                       row_matric                  ;
    input       [        C_PIXEL_WIDTH - 1:0]   ce0_pixel_datain            ;
    input       [        C_PIXEL_WIDTH - 1:0]   ce1_pixel_datain            ;
    input                                       ce0_start                   ;
    input                                       ce1_start                   ;
    output      [C_CE_PIXEL_DOUT_WIDTH - 1:0]   ce0_pixel_dataout           ;
    output      [C_CE_PIXEL_DOUT_WIDTH - 1:0]   ce1_pixel_dataout           ;
    input       [    C_LOG2_BRAM_DEPTH - 2:0]   wrAddr                      ;
    output reg  [                        5:0]   ce1_cycle_counter           ;
    output                                      ce0_pixel_dataout_valid     ;
    output                                      ce1_pixel_dataout_valid     ;
    
    
 	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    reg                                     ce0_row_rename          ;
    reg                                     ce1_row_rename          ;
    reg     [                       5:0]    ce0_cycle_counter       ;
    
    wire                                    pfb_rden_d              ;
    wire    [   C_LOG2_BRAM_DEPTH - 2:0]    input_col_d             ;
    wire    [   C_LOG2_BRAM_DEPTH - 2:0]    input_row_d             ;
    wire    [       C_PIXEL_WIDTH - 1:0]    ce0_pixel_datain_d      ;
    wire    [       C_PIXEL_WIDTH - 1:0]    ce1_pixel_datain_d      ;

    wire    [ `SEQ_DATA_SEQ_WIDTH - 1:0]    seq_datain_field        ;
    wire    [`SEQ_DATA_SEQ_WIDTH0 - 1:0]    seq_datain_field0       ;
    wire    [`SEQ_DATA_SEQ_WIDTH1 - 1:0]    seq_datain_field1       ;
    wire    [ `SEQ_DATA_SEQ_WIDTH - 1:0]    seq_datain_even         ;
    wire    [ `SEQ_DATA_SEQ_WIDTH - 1:0]    seq_datain_even_d       ;
    wire    [ `SEQ_DATA_SEQ_WIDTH - 1:0]    seq_datain_odd          ;
    wire    [ `SEQ_DATA_SEQ_WIDTH - 1:0]    seq_datain_odd_d        ;
    reg     [       C_PIXEL_WIDTH - 1:0]    row_buffer_sav_val0     ;
    reg     [       C_PIXEL_WIDTH - 1:0]    row_buffer_sav_val1     ;

    reg     [   C_LOG2_BRAM_DEPTH - 1:0]    bram0_wrAddr            ;
    reg     [   C_LOG2_BRAM_DEPTH - 1:0]    bram0_rdAddr            ;
    reg     [       C_PIXEL_WIDTH - 1:0]    bram0_datain            ;
    reg                                     bram0_wren              ;
    reg                                     bram0_rden              ;
    reg     [       C_PIXEL_WIDTH - 1:0]    bram0_dataout           ;

    reg     [   C_LOG2_BRAM_DEPTH - 1:0]    bram1_wrAddr            ;
    reg     [   C_LOG2_BRAM_DEPTH - 1:0]    bram1_rdAddr            ;
    reg     [       C_PIXEL_WIDTH - 1:0]    bram1_datain            ;
    reg                                     bram1_wren              ;
    reg                                     bram1_rden              ;
    reg     [       C_PIXEL_WIDTH - 1:0]    bram1_dataout           ;

    reg     [   C_LOG2_BRAM_DEPTH - 1:0]    bram2_wrAddr            ;
    reg     [   C_LOG2_BRAM_DEPTH - 1:0]    bram2_rdAddr            ;
    reg     [       C_PIXEL_WIDTH - 1:0]    bram2_datain            ;
    reg                                     bram2_wren              ;
    reg                                     bram2_rden              ;
    reg     [       C_PIXEL_WIDTH - 1:0]    bram2_dataout           ;

    reg     [   C_LOG2_BRAM_DEPTH - 1:0]    bram3_wrAddr            ;
    reg     [   C_LOG2_BRAM_DEPTH - 1:0]    bram3_rdAddr            ;
    reg     [       C_PIXEL_WIDTH - 1:0]    bram3_datain            ;
    reg                                     bram3_wren              ;
    reg                                     bram3_rden              ;
    reg     [       C_PIXEL_WIDTH - 1:0]    bram3_dataout           ;

    wire                                    ce0_row_matric          ;
    wire                                    ce1_row_matric          ;
  
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    xilinx_dual_port_1_clock_ram #(
        .C_RAM_WIDTH    ( C_PIXEL_WIDTH      ),      
        .C_RAM_DEPTH    ( C_BRAM_DEPTH       )
    ) 
    i0_xilinx_dual_port_1_clock_ram (
        .wrAddr             ( bram0_wrAddr      ),  
        .rdAddr             ( bram0_rdAddr      ),
        .datain             ( bram0_datain      ),
        .clk                ( clk               ),    
        .wren               ( bram0_wren        ),
        .rden               ( bram0_rden        ),
        .dataout            ( bram0_dataout     )
    );
    
    
    xilinx_dual_port_1_clock_ram #(
        .C_RAM_WIDTH    ( C_PIXEL_WIDTH      ),      
        .C_RAM_DEPTH    ( C_BRAM_DEPTH       )
    ) 
    i1_xilinx_dual_port_1_clock_ram (
        .wrAddr             ( bram1_wrAddr      ),  
        .rdAddr             ( bram1_rdAddr      ),
        .datain             ( bram1_datain      ),
        .clk                ( clk               ),      
        .wren               ( bram1_wren        ),
        .rden               ( bram1_rden        ),
        .dataout            ( bram1_dataout     )
    );
    
    
    xilinx_dual_port_1_clock_ram #(
        .C_RAM_WIDTH    ( C_PIXEL_WIDTH      ),      
        .C_RAM_DEPTH    ( C_BRAM_DEPTH       ) 
    ) 
    i2_xilinx_dual_port_1_clock_ram (
        .wrAddr             ( bram2_wrAddr      ),  
        .rdAddr             ( bram2_rdAddr      ),
        .datain             ( bram2_datain      ),
        .clk                ( clk               ),       
        .wren               ( bram2_wren        ),
        .rden               ( bram2_rden        ),
        .dataout            ( bram2_dataout     )
    );
    
    
    xilinx_dual_port_1_clock_ram #(
        .C_RAM_WIDTH    ( C_PIXEL_WIDTH      ),      
        .C_RAM_DEPTH    ( C_BRAM_DEPTH       ) 
    ) 
    i3_xilinx_dual_port_1_clock_ram (
        .wrAddr             ( bram3_wrAddr      ),  
        .rdAddr             ( bram3_rdAddr      ),
        .datain             ( bram3_datain      ),
        .clk                ( clk               ),       
        .wren               ( bram3_wren        ),
        .rden               ( bram3_rden        ),
        .dataout            ( bram3_dataout     )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES( 2 )
    ) 
    i0_SRL_bit (
        .clk        ( clk                   ),
        .rst        ( rst                   ),
        .ce         ( 1'b1                  ),
        .data_in    ( pfb_rden              ),
        .data_out   ( pfb_rden_d            )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES( 3 )
    ) 
    i1_SRL_bit (
        .clk        ( clk                       ),
        .rst        ( rst                       ),
        .ce         ( 1'b1                      ),
        .data_in    ( bram0_rden                ),
        .data_out   ( ce0_pixel_dataout_valid   )
    );
  
  
    SRL_bit #(
        .C_CLOCK_CYCLES( 3 )
    ) 
    i2_SRL_bit (
        .clk        ( clk                       ),
        .rst        ( rst                       ),
        .ce         ( 1'b1                      ),
        .data_in    ( bram2_rden                ),
        .data_out   ( ce1_pixel_dataout_valid   )
    );
    

    SRL_bit #(
        .C_CLOCK_CYCLES( C_CE0_ROW_MATRIC_DELAY )
    ) 
    i3_SRL_bit (
        .clk        ( clk               ),
        .rst        ( rst               ),
        .ce         ( 1'b1              ),
        .data_in    ( row_matric        ),
        .data_out   ( ce0_row_matric    )
    );


    SRL_bit #(
        .C_CLOCK_CYCLES( C_CE1_ROW_MATRIC_DELAY )
    ) 
    i4_SRL_bit (
        .clk        ( clk               ),
        .rst        ( rst               ),
        .ce         ( 1'b1              ),
        .data_in    ( row_matric        ),
        .data_out   ( ce1_row_matric    )
    );
    
    
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 2                        ),
        .C_DATA_WIDTH    ( C_LOG2_BRAM_DEPTH - 1    )
    ) 
    i0_SRL_bus (
        .clk        ( clk           ),
        .ce         ( 1'b1          ),
        .rst        ( rst           ),
        .data_in    ( input_col     ),
        .data_out   ( input_col_d   )
    );


    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 2                        ),
        .C_DATA_WIDTH    ( C_LOG2_BRAM_DEPTH - 1    )
    ) 
    i1_SRL_bus (
        .clk        ( clk           ),
        .ce         ( 1'b1          ),
        .rst        ( rst           ),
        .data_in    ( input_row     ),
        .data_out   ( input_row_d   )
    );


    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 2                ),
        .C_DATA_WIDTH    ( C_PIXEL_WIDTH    )
    ) 
    i2_SRL_bus (
        .clk        ( clk                   ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( ce0_pixel_datain      ),
        .data_out   ( ce0_pixel_datain_d    )
    );


    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 2                ),
        .C_DATA_WIDTH    ( C_PIXEL_WIDTH    )
    ) 
    i3_SRL_bus (
        .clk        ( clk                   ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( ce1_pixel_datain      ),
        .data_out   ( ce1_pixel_datain_d    )
    ); 


    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 1                    ),
        .C_DATA_WIDTH    ( `SEQ_DATA_SEQ_WIDTH  )
    ) 
    i4_SRL_bus (
        .clk        ( clk                   ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( seq_datain_even       ),
        .data_out   ( seq_datain_even_d     )
    ); 


    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 1                    ),
        .C_DATA_WIDTH    ( `SEQ_DATA_SEQ_WIDTH  )
    ) 
    i5_SRL_bus (
        .clk        ( clk                   ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( seq_datain_odd        ),
        .data_out   ( seq_datain_odd_d      )
    );     
 
 
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------        
    always@(posedge clk) begin
        if(rst) begin
            ce0_row_rename <= 0;
        end else begin
            ce0_row_rename <= 0;
            if(gray_code == 2'b00 && ce0_cycle_counter == 2) begin
                row_buffer_sav_val0 <= bram1_dataout;
                ce0_row_rename      <= 1;
            end else if(gray_code == 2'b01 && ce0_cycle_counter == 2) begin
                row_buffer_sav_val0 <= bram0_dataout;
                ce0_row_rename      <= 1;
            end else if(gray_code == 2'b11 && ce0_cycle_counter == 0) begin
                row_buffer_sav_val0 <= bram1_dataout;
                ce0_row_rename      <= 1;
            end else if(gray_code == 2'b10 && ce0_cycle_counter == 0) begin
                row_buffer_sav_val0 <= bram0_dataout;
                ce0_row_rename      <= 1;
            end
        end
    end
    
    always@(posedge clk) begin
        if(rst) begin
            ce1_row_rename <= 0;
        end else begin
            ce1_row_rename <= 0;
            if(gray_code == 2'b00 && ce1_cycle_counter == 2) begin
                row_buffer_sav_val1 <= bram3_dataout;
                ce1_row_rename      <= 1;
            end else if(gray_code == 2'b01 && ce1_cycle_counter == 2) begin
                row_buffer_sav_val1 <= bram2_dataout;
                ce1_row_rename      <= 1;
            end else if(gray_code == 2'b11 && ce1_cycle_counter == 0) begin
                row_buffer_sav_val1 <= bram3_dataout;
                ce1_row_rename      <= 1;
            end else if(gray_code == 2'b10 && ce1_cycle_counter == 0) begin
                row_buffer_sav_val1 <= bram2_dataout;
                ce1_row_rename      <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
 
    
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
    assign ce0_pixel_dataout    = {bram1_dataout, bram0_dataout};
    assign ce1_pixel_dataout    = {bram3_dataout, bram2_dataout};
    assign seq_datain_field     = seq_datain[`SEQ_DATA_SEQ_FIELD];
    assign seq_datain_field0    = seq_datain[`SEQ_DATA_SEQ_FIELD0];
    assign seq_datain_field1    = seq_datain[`SEQ_DATA_SEQ_FIELD1];
    assign seq_datain_even      =   {  
                                        gray_code[0] ^ seq_datain_field[`SEQ_DATA_SEQ_WIDTH - 1], 
                                        seq_datain_field1
                                    };
    assign seq_datain_odd       =   {  
                                        gray_code[1] ^ seq_datain_field[`SEQ_DATA_SEQ_WIDTH - 1], 
                                        seq_datain_field0,
                                        seq_datain[0] 
                                            | seq_datain[`SEQ_DATA_PARITY_FIELD]
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
                    if(pfb_rden_d) begin
                        if(input_row_d == 0 && input_col_d <= num_input_cols) begin
                            bram0_wren <= 1;
                            bram1_wren <= 1;
                            bram0_wrAddr <= {1'b0, input_col_d};
                            bram1_wrAddr <= {1'b0, input_col_d};
                            bram0_datain <= ce0_pixel_datain_d;
                            bram1_datain <= ce0_pixel_datain_d;
                        end else if(input_row_d == 1 && input_col_d <= num_input_cols) begin
                            bram1_wren      <= 1;  
                            bram1_wrAddr    <= {1'b1, input_col_d};
                            bram1_datain    <= ce0_pixel_datain_d;
                        end else if(input_row_d == 2 && input_col_d <= num_input_cols) begin
                            bram0_wren      <= 1;
                            bram0_wrAddr    <= {1'b1, input_col_d};
                            bram0_datain    <= ce0_pixel_datain_d;
                        end
                    end
                    // convolution engine 1
                    if(pfb_rden_d) begin
                        if(input_row_d == 0 && input_col_d <= num_input_cols) begin
                            bram2_wren <= 1;
                            bram3_wren <= 1;
                            bram2_wrAddr <= {1'b0, input_col_d};
                            bram3_wrAddr <= {1'b0, input_col_d};
                            bram2_datain <= ce1_pixel_datain_d;
                            bram3_datain <= ce1_pixel_datain_d;
                        end else if(input_row_d == 1 && input_col_d <= num_input_cols) begin
                            bram3_wren <= 1;   
                            bram3_wrAddr <= {1'b1, input_col_d};
                            bram3_datain <= ce1_pixel_datain_d;                            
                        end else if(input_row_d == 2 && input_col_d <= num_input_cols) begin
                            bram2_wren <= 1;   
                            bram2_wrAddr <= {1'b1, input_col_d}; 
                            bram2_datain <= ce1_pixel_datain_d;                          
                        end
                    end
                end
                ST_AWE_CE_ACTIVE: begin
                    //convolution engine 0
                    if(ce0_start) begin
                        bram0_rden              <= 1;
                        bram1_rden              <= 1;
                        bram0_rdAddr            <= seq_datain_even;
                        bram1_rdAddr            <= seq_datain_odd;
                        // incoming row
                        if(ce0_row_matric && last_kernel) begin
                            if(!(gray_code[0] ^ gray_code[1])) begin
                                bram1_wren      <= 1;                  
                                bram1_wrAddr    <= {gray_code[0], wrAddr};
                                bram1_datain    <= ce0_pixel_datain_d;                 
                            end else if(gray_code[0] ^ gray_code[1]) begin
                                bram0_wren      <= 1;
                                bram0_wrAddr    <= {gray_code[0], wrAddr};
                                bram0_datain    <= ce0_pixel_datain_d;                                          
                            end
                        end
                        // row rename
                        if(ce0_row_rename && last_kernel) begin
                            if(!(gray_code[0] ^ gray_code[1])) begin             
                                bram0_wren      <= 1;
                                bram0_wrAddr    <= {gray_code[1], wrAddr};
                                bram0_datain    <= row_buffer_sav_val0;
                            end else if(gray_code[0] ^ gray_code[1]) begin                                        
                                bram1_wren      <= 1;                       
                                bram1_wrAddr    <= {gray_code[1], wrAddr};
                                bram1_datain    <= row_buffer_sav_val0;  
                            end
                        end
                    end
                    //convolution engine 1
                    if(ce1_start) begin
                        bram2_rden              <= 1;
                        bram3_rden              <= 1;
                        bram2_rdAddr            <= seq_datain_even_d;
                        bram3_rdAddr            <= seq_datain_odd_d;
                        // incoming row
                        if(ce1_row_matric && last_kernel) begin
                            if(!(gray_code[0] ^ gray_code[1])) begin
                                bram3_wren      <= 1;                  
                                bram3_wrAddr    <= {gray_code[0], wrAddr};
                                bram3_datain    <= ce1_pixel_datain_d;                 
                            end else if(gray_code[0] ^ gray_code[1]) begin
                                bram2_wren      <= 1;
                                bram2_wrAddr    <= {gray_code[0], wrAddr};
                                bram2_datain    <= ce1_pixel_datain_d;                                          
                            end
                        end
                        // row rename
                        if(ce1_row_rename && last_kernel) begin
                            if(!(gray_code[0] ^ gray_code[1])) begin              
                                bram2_wren      <= 1;
                                bram2_wrAddr    <= {gray_code[1], wrAddr};
                                bram2_datain    <= row_buffer_sav_val1;
                            end else if(gray_code[0] ^ gray_code[1]) begin                                        
                                bram3_wren      <= 1;                       
                                bram3_wrAddr    <= {gray_code[1], wrAddr};
                                bram3_datain    <= row_buffer_sav_val1;  
                            end
                        end
                    end
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
                ST_IDLE_0:                  state_s = "ST_IDLE_0";              
                ST_AWE_CE_PRIM_BUFFER:      state_s = "ST_AWE_CE_PRIM_BUFFER";
                ST_WAIT_PFB_LOAD:           state_s = "ST_WAIT_PFB_LOAD";           
                ST_AWE_CE_ACTIVE:           state_s = "ST_AWE_CE_ACTIVE";
                ST_JOB_DONE:                state_s = "ST_JOB_DONE";
        endcase
    end
`endif	
	
endmodule