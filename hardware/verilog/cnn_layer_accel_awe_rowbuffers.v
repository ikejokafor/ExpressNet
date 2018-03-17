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
    parameter C_PIXEL_WIDTH   = 18,
    parameter C_BRAM_DEPTH    = 1024
) (
    clk,                    
    rst,                    
    row,
    row_d,
    col,
    col_d,
    numRows,                
    numCols,                  
    state,
    gray_code,
    seq_datain,
    row_matric,
    pfb_rden,
    cycle_counter,
    pixel_datain,
    pixel_datain_valid,
    pixel_dataout,
    pixel_dataout_valid
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
    localparam C_PIXEL_DATAOUT_WIDTH    = `PIXEL_WIDTH * 4;
    
    localparam ST_IDLE                  = 6'b000001;  
    localparam ST_LOAD_SEQUENCER        = 6'b000010;
    localparam ST_AWE_CE_PRIM_BUFFER_0  = 6'b000100;
    localparam ST_AWE_CE_PRIM_BUFFER_1  = 6'b001000;
    localparam ST_LOAD_PFB              = 6'b010000;
    localparam ST_AWE_CE_ACTIVE         = 6'b100000;

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input                                           clk;
    input                                           rst;  
    input       [       C_LOG2_BRAM_DEPTH - 2:0]    row;
    input       [       C_LOG2_BRAM_DEPTH - 2:0]    row_d;
    input       [       C_LOG2_BRAM_DEPTH - 2:0]    col;    
    input       [       C_LOG2_BRAM_DEPTH - 2:0]    col_d;
    input       [       C_LOG2_BRAM_DEPTH - 2:0]    numRows;                
    input       [       C_LOG2_BRAM_DEPTH - 2:0]    numCols;
    input       [                           5:0]    state;
    input       [                           1:0]    gray_code;
    input       [         `SEQ_DATA_WIDTH - 1:0]    seq_datain;
    input                                           row_matric;
    input                                           pfb_rden;
    input       [                           5:0]    cycle_counter;
    input       [            `PIXEL_WIDTH - 1:0]    pixel_datain;
    input                                           pixel_datain_valid;    
    output reg  [   C_PIXEL_DATAOUT_WIDTH - 1:0]    pixel_dataout;
    output reg                                      pixel_dataout_valid;
	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Wires / Regs / Integers
	//-----------------------------------------------------------------------------------------------------------------------------------------------    
    reg                                         row_matric;       
    reg                                         pixel_dataout_valid_r;
    wire    [    `SEQ_DATA_SEQ_WIDTH - 1:0]     seq_datain_field;
    wire    [   `SEQ_DATA_SEQ_WIDTH0 - 1:0]     seq_datain_field0;
    wire    [   `SEQ_DATA_SEQ_WIDTH1 - 1:0]     seq_datain_field1;
    wire    [    `SEQ_DATA_SEQ_WIDTH - 1:0]     seq_datain_even;
    wire    [    `SEQ_DATA_SEQ_WIDTH - 1:0]     seq_datain_odd;
    reg     [           `PIXEL_WIDTH - 1:0]     row_buffer_sav_val0;
    reg     [           `PIXEL_WIDTH - 1:0]     row_buffer_sav_val1;

    
    reg     [      C_LOG2_BRAM_DEPTH - 1:0]     bram0_wrAddr;
    reg     [      C_LOG2_BRAM_DEPTH - 1:0]     bram0_rdAddr;
    reg     [           `PIXEL_WIDTH - 1:0]     bram0_datain; 
    reg                                         bram0_wren;
    reg                                         bram0_rden;
    reg     [           `PIXEL_WIDTH - 1:0]     bram0_dataout;

    reg     [      C_LOG2_BRAM_DEPTH - 1:0]     bram1_wrAddr;
    reg     [      C_LOG2_BRAM_DEPTH - 1:0]     bram1_rdAddr;
    reg     [           `PIXEL_WIDTH - 1:0]     bram1_datain; 
    reg                                         bram1_wren;
    reg                                         bram1_rden;
    reg     [           `PIXEL_WIDTH - 1:0]     bram1_dataout;
    
    reg     [      C_LOG2_BRAM_DEPTH - 1:0]     bram2_wrAddr;
    reg     [      C_LOG2_BRAM_DEPTH - 1:0]     bram2_rdAddr;
    reg     [           `PIXEL_WIDTH - 1:0]     bram2_datain; 
    reg                                         bram2_wren;
    reg                                         bram2_rden;
    reg     [           `PIXEL_WIDTH - 1:0]     bram2_dataout;  
    
    reg     [      C_LOG2_BRAM_DEPTH - 1:0]     bram3_wrAddr;
    reg     [      C_LOG2_BRAM_DEPTH - 1:0]     bram3_rdAddr;
    reg     [           `PIXEL_WIDTH - 1:0]     bram3_datain; 
    reg                                         bram3_wren;
    reg                                         bram3_rden;
    reg     [           `PIXEL_WIDTH - 1:0]     bram3_dataout;
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    xilinx_dual_port_1_clock_ram #(
        .C_RAM_WIDTH    ( C_PIXEL_WIDTH      ),      
        .C_RAM_DEPTH    ( C_BRAM_DEPTH       ),
        .C_SEQ_ACCESS   ( 0                  )
    ) 
    i0_xilinx_dual_port_1_clock_ram (
        .wrAddr     ( bram0_wrAddr      ),  
        .rdAddr     ( bram0_rdAddr      ),
        .datain     ( bram0_datain      ),
        .clk        ( clk               ),
        .rst        ( rst               ),        
        .wren       ( bram0_wren        ),
        .rden       ( bram0_rden        ),
        .dataout    ( bram0_dataout     ),
        .count      (                   ),        
        .full       (                   )
    );
    
    
    xilinx_dual_port_1_clock_ram #(
        .C_RAM_WIDTH    ( C_PIXEL_WIDTH      ),      
        .C_RAM_DEPTH    ( C_BRAM_DEPTH       ),
        .C_SEQ_ACCESS   ( 0                  )  
    ) 
    i1_xilinx_dual_port_1_clock_ram (
        .wrAddr     ( bram1_wrAddr      ),  
        .rdAddr     ( bram1_rdAddr      ),
        .datain     ( bram1_datain      ),
        .clk        ( clk               ),
        .rst        ( rst               ),
        .wren       ( bram1_wren        ),
        .rden       ( bram1_rden        ),
        .dataout    ( bram1_dataout     ),
        .count      (                   ),        
        .full       (                   )
    );
    
    
    xilinx_dual_port_1_clock_ram #(
        .C_RAM_WIDTH    ( C_PIXEL_WIDTH      ),      
        .C_RAM_DEPTH    ( C_BRAM_DEPTH       ),
        .C_SEQ_ACCESS   ( 0                  )  
    ) 
    i2_xilinx_dual_port_1_clock_ram (
        .wrAddr     ( bram2_wrAddr      ),  
        .rdAddr     ( bram2_rdAddr      ),
        .datain     ( bram2_datain      ),
        .clk        ( clk               ),
        .rst        ( rst               ),        
        .wren       ( bram2_wren        ),
        .rden       ( bram2_rden        ),
        .dataout    ( bram2_dataout     ),
        .count      (                   ),        
        .full       (                   )
    );
    
    
    xilinx_dual_port_1_clock_ram #(
        .C_RAM_WIDTH    ( C_PIXEL_WIDTH      ),      
        .C_RAM_DEPTH    ( C_BRAM_DEPTH       ),
        .C_SEQ_ACCESS   ( 0                  )  
    ) 
    i3_xilinx_dual_port_1_clock_ram (
        .wrAddr     ( bram3_wrAddr      ),  
        .rdAddr     ( bram3_rdAddr      ),
        .datain     ( bram3_datain      ),
        .clk        ( clk               ),
        .rst        ( rst               ),        
        .wren       ( bram3_wren        ),
        .rden       ( bram3_rden        ),
        .dataout    ( bram3_dataout     ),
        .count      (                   ),
        .full       (                   )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES( 2 )
    ) 
    i1_SRL_bit (
        .clk        ( clk                       ),
        .rst        ( rst                       ),
        .ce         ( 1'b1                      ),
        .data_in    ( pixel_dataout_valid_r     ),
        .data_out   ( pixel_dataout_valid       )
    );


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------        
    always@(posedge clk) begin
        if(rst) begin
            row_buffer_sav_val0 <= 0;
            row_buffer_sav_val1 <= 0;
        end else begin
            if(gray_code == 2'b00 && cycle_counter == 2) begin
                row_buffer_sav_val0 <= bram1_dataout;
                row_buffer_sav_val1 <= bram3_dataout;
            end else if(gray_code == 2'b01 && cycle_counter == 2) begin
                row_buffer_sav_val0 <= bram0_dataout;
                row_buffer_sav_val1 <= bram2_dataout;
            end else if(gray_code == 2'b11 && cycle_counter == 0) begin
                row_buffer_sav_val0 <= bram1_dataout;
                row_buffer_sav_val1 <= bram3_dataout;
            end else if(gray_code == 2'b10 && cycle_counter == 0) begin
                row_buffer_sav_val0 <= bram0_dataout;
                row_buffer_sav_val1 <= bram2_dataout;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
 

    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------        
    assign seq_datain_field = seq_datain[`SEQ_DATA_SEQ_FIELD];
    assign seq_datain_field0 = seq_datain[`SEQ_DATA_SEQ_FIELD0];
    assign seq_datain_field1 = seq_datain[`SEQ_DATA_SEQ_FIELD1];
    assign seq_datain_even =    {  
                                    gray_code[0] ^ seq_datain_field[`SEQ_DATA_SEQ_WIDTH - 1], 
                                    seq_datain_field1
                                };
    assign seq_datain_odd =     {  
                                    gray_code[1] ^ seq_datain_field[`SEQ_DATA_SEQ_WIDTH - 1], 
                                    seq_datain_field0,
                                    seq_datain[0] 
                                        | seq_datain[`SEQ_DATA_PARITY_FIELD]
                                };
                                
    always@(posedge clk) begin
        if(rst) begin
            bram0_wrAddr            <= 0;
            bram1_wrAddr            <= 0;
            bram2_wrAddr            <= 0;
            bram3_wrAddr            <= 0;
            bram0_rdAddr            <= 0;
            bram1_rdAddr            <= 0;
            bram2_rdAddr            <= 0;
            bram3_rdAddr            <= 0;
            bram0_wren              <= 0;
            bram1_wren              <= 0;
            bram2_wren              <= 0;
            bram3_wren              <= 0;  
            bram0_rden              <= 0;
            bram1_rden              <= 0;
            bram2_rden              <= 0;
            bram3_rden              <= 0;
            pixel_dataout_valid_r   <= 0;
        end else begin
            bram0_wren              <= 0;
            bram1_wren              <= 0;
            bram2_wren              <= 0;
            bram3_wren              <= 0;  
            bram0_rden              <= 0;
            bram1_rden              <= 0;
            bram2_rden              <= 0;
            bram3_rden              <= 0;
            pixel_dataout_valid_r   <= 0;
            case(state)           
                ST_AWE_CE_PRIM_BUFFER_0, ST_AWE_CE_PRIM_BUFFER_1: begin
                    if(pfb_rden) begin
                        if(row_d == 0 && col_d <= numCols) begin
                            bram0_wren <= 1;
                            bram1_wren <= 1;
                            bram2_wren <= 1;
                            bram3_wren <= 1;
                            bram0_wrAddr <= {1'b0, col_d};
                            bram1_wrAddr <= {1'b0, col_d};
                            bram2_wrAddr <= {1'b0, col_d};
                            bram3_wrAddr <= {1'b0, col_d};
                            bram0_datain <= pixel_datain;
                            bram1_datain <= pixel_datain;
                            bram2_datain <= pixel_datain;
                            bram3_datain <= pixel_datain;
                        end else if(row_d == 1 && col_d <= numCols) begin
                            bram1_wren <= 1;
                            bram3_wren <= 1;   
                            bram1_wrAddr <= {1'b1, col_d};
                            bram3_wrAddr <= {1'b1, col_d};
                            bram1_datain <= pixel_datain;
                            bram3_datain <= pixel_datain;                            
                        end else if(row_d == 2 && col_d <= numCols) begin
                            bram0_wren <= 1;
                            bram2_wren <= 1;   
                            bram0_wrAddr <= {1'b1, col_d};
                            bram2_wrAddr <= {1'b1, col_d}; 
                            bram0_datain <= pixel_datain;
                            bram2_datain <= pixel_datain;                          
                        end
                    end
                end
                ST_AWE_CE_ACTIVE: begin
                    bram0_rden              <= 1;
                    bram1_rden              <= 1;
                    bram2_rden              <= 1;
                    bram3_rden              <= 1;
                    bram0_rdAddr            <= seq_datain_even;
                    bram1_rdAddr            <= seq_datain_odd;
                    bram2_rdAddr            <= seq_datain_even;
                    bram3_rdAddr            <= seq_datain_odd;
                    pixel_dataout_valid_r   <= 1;
                    if(bram0_rden) begin
                        pixel_dataout[35:0]     <= {bram1_dataout, bram0_dataout};
                        pixel_dataout[71:36]    <= {bram3_dataout, bram2_dataout};
                    end
                    if(row_matric) begin
                        bram0_wren <= 1;
                        bram1_wren <= 1;
                        bram2_wren <= 1;
                        bram3_wren <= 1;
                        if(!(gray_code[0] ^ gray_code[1])) begin
                            // incoming row                         
                            bram1_wrAddr    <= {1'b0, col};
                            bram3_wrAddr    <= {1'b0, col};
                            bram1_datain    <= pixel_datain;                 
                            bram3_datain    <= pixel_datain;
                            // row rename
                            bram0_wrAddr    <= {1'b0, col};
                            bram2_wrAddr    <= {1'b0, col};                            
                            bram0_datain    <= row_buffer_sav_val0;
                            bram2_datain    <= row_buffer_sav_val1;
                        end else begin
                            // incoming row
                            bram0_wrAddr    <= {1'b0, col};
                            bram2_wrAddr    <= {1'b0, col};
                            bram0_datain    <= pixel_datain;                 
                            bram2_datain    <= pixel_datain;
                            // row rename
                            bram1_wrAddr    <= {1'b0, col};
                            bram3_wrAddr    <= {1'b0, col};
                            bram1_datain    <= row_buffer_sav_val0;
                            bram3_datain    <= row_buffer_sav_val1;                           
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
                ST_IDLE:                    state_s = "ST_IDLE";              
                ST_LOAD_SEQUENCER:          state_s = "ST_LOAD_SEQUENCER";     
                ST_AWE_CE_PRIM_BUFFER_0:    state_s = "ST_AWE_CE_PRIM_BUFFER_0";
                ST_AWE_CE_PRIM_BUFFER_1:    state_s = "ST_AWE_CE_PRIM_BUFFER_1";
                ST_LOAD_PFB:                state_s = "ST_LOAD_PFB";           
                ST_AWE_CE_ACTIVE:           state_s = "ST_AWE_CE_ACTIVE";  
        endcase
    end
`endif	
	
endmodule