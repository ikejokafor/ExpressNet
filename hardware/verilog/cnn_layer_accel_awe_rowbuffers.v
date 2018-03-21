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
    parameter C_PIXEL_WIDTH     = 18,
    parameter C_BRAM_DEPTH      = 1024,
    parameter C_SEQ_DATA_WIDTH  = 16
) (
    clk_500MHz,                    
    accel_rst,                    
    input_row_d,
    input_col,
    input_col_d,
    num_input_cols,                  
    state,
    gray_code,
    seq_datain,
    row_matric,
    pfb_rden,
    cycle_counter,
    pixel_datain,
    pixel_dataout,
    row_matric_done,
    wrAddr
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
    
    localparam ST_IDLE_0                = 4'b0001;  
    localparam ST_AWE_CE_PRIM_BUFFER    = 4'b0010;
    localparam ST_WAIT_PFB_LOAD         = 4'b0100;
    localparam ST_AWE_CE_ACTIVE         = 4'b1000;

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input                                           clk_500MHz;
    input                                           accel_rst;  
    input       [       C_LOG2_BRAM_DEPTH - 2:0]    input_row;
    input       [       C_LOG2_BRAM_DEPTH - 2:0]    input_col;    
    input       [       C_LOG2_BRAM_DEPTH - 2:0]    num_input_cols;
    input       [                           3:0]    state;
    input       [                           1:0]    gray_code;
    input       [        C_SEQ_DATA_WIDTH - 1:0]    seq_datain;
    input                                           row_matric;
    input       [                           5:0]    cycle_counter;
    input       [           C_PIXEL_WIDTH - 1:0]    pixel_datain;
    input                                           pfb_rden;    
    output reg  [   C_PIXEL_DATAOUT_WIDTH - 1:0]    pixel_dataout;
    input                                           row_matric_done;
    input       [       C_LOG2_BRAM_DEPTH - 2:0]    wrAddr;
	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Wires / Regs / Integers
	//-----------------------------------------------------------------------------------------------------------------------------------------------    
    reg                                         row_matric;       
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
        .C_RAM_DEPTH    ( C_BRAM_DEPTH       )
    ) 
    i0_xilinx_dual_port_1_clock_ram (
        .wrAddr             ( bram0_wrAddr      ),  
        .rdAddr             ( bram0_rdAddr      ),
        .datain             ( bram0_datain      ),
        .clk                ( clk_500MHz        ),
        .rst                ( rst               ),        
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
        .clk                ( clk_500MHz        ),
        .rst                ( rst               ),        
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
        .clk                ( clk_500MHz        ),
        .rst                ( rst               ),        
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
        .clk                ( clk_500MHz        ),       
        .wren               ( bram3_wren        ),
        .rden               ( bram3_rden        ),
        .dataout            ( bram3_dataout     )
    );
   

    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------        
    always@(posedge clk_500MHz) begin
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
                                
    always@(posedge clk_500MHz) begin
        if(accel_rst) begin
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
                            bram0_datain <= pixel_datain;
                            bram1_datain <= pixel_datain;
                        end else if(input_row == 1 && input_col <= num_input_cols) begin
                            bram1_wren      <= 1;  
                            bram1_wrAddr    <= {1'b1, input_col};
                            bram1_datain    <= pixel_datain;
                        end else if(input_row == 2 && input_col <= num_input_cols) begin
                            bram0_wren      <= 1;
                            bram0_wrAddr    <= {1'b1, input_col};
                            bram0_datain    <= pixel_datain;
                        end
                    end
                    // convolution engine 1
                    if(pfb_rden) begin
                        if(input_row == 0 && input_col <= num_input_cols) begin
                            bram2_wren <= 1;
                            bram3_wren <= 1;
                            bram2_wrAddr <= {1'b0, input_col};
                            bram3_wrAddr <= {1'b0, input_col};
                            bram2_datain <= pixel_datain;
                            bram3_datain <= pixel_datain;
                        end else if(input_row == 1 && input_col <= num_input_cols) begin
                            bram3_wren <= 1;   
                            bram3_wrAddr <= {1'b1, input_col};
                            bram3_datain <= pixel_datain;                            
                        end else if(input_row == 2 && input_col <= num_input_cols) begin
                            bram2_wren <= 1;   
                            bram2_wrAddr <= {1'b1, input_col}; 
                            bram2_datain <= pixel_datain;                          
                        end
                    end
                end
                ST_AWE_CE_ACTIVE: begin
                    //convolution engine 0
                    if(ceo_start) begin
                        bram0_rden              <= 1;
                        bram1_rden              <= 1;
                        bram0_rdAddr            <= seq_datain_even;
                        bram1_rdAddr            <= seq_datain_odd;
                        if(bram0_rden) begin
                            pixel_dataout[31:0]     <= {bram1_dataout, bram0_dataout};
                        end
                        if(row_matric) begin
                            if(!(gray_code[0] ^ gray_code[1])) begin
                                // incoming row
                                bram1_wren      <= 1;                  
                                bram1_wrAddr    <= {gray_code[0], wrAddr};
                                bram1_datain    <= pixel_datain;                 
                                // row rename
                                bram0_wren      <= 1;
                                bram0_wrAddr    <= {gray_code[1], wrAddr};
                                bram0_datain    <= row_buffer_sav_val0;
                            end else if(gray_code[0] ^ gray_code[1]) begin
                                // incoming row
                                bram0_wren      <= 1;
                                bram0_wrAddr    <= {gray_code[0], wrAddr};
                                bram0_datain    <= pixel_datain;                                          
                                // row rename
                                bram1_wren      <= 1;                       
                                bram1_wrAddr    <= {gray_code[1], wrAddr};
                                bram1_datain    <= pixel_datain;  
                            end
                        end
                    end
                    //convolution engine 1
                    if(ce1_start) begin
                        bram2_rden              <= 1;
                        bram3_rden              <= 1;
                        bram2_rdAddr            <= seq_datain_even;
                        bram3_rdAddr            <= seq_datain_odd;
                        if(bram2_rden) begin
                            pixel_dataout[63:32] <= {bram3_dataout, bram2_dataout};
                        end
                        if(row_matric) begin
                            if(!(gray_code[0] ^ gray_code[1])) begin
                                // incoming row
                                bram3_wren      <= 1;                  
                                bram3_wrAddr    <= {gray_code[0], wrAddr};
                                bram3_datain    <= pixel_datain;                 
                                // row rename
                                bram2_wren      <= 1;
                                bram2_wrAddr    <= {gray_code[1], wrAddr};
                                bram2_datain    <= row_buffer_sav_val0;
                            end else if(gray_code[0] ^ gray_code[1]) begin
                                // incoming row
                                bram2_wren      <= 1;
                                bram2_wrAddr    <= {gray_code[0], wrAddr};
                                bram2_datain    <= pixel_datain;                                          
                                // row rename
                                bram3_wren      <= 1;                       
                                bram3_wrAddr    <= {gray_code[1], wrAddr};
                                bram3_datain    <= pixel_datain;  
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
        endcase
    end
`endif	
	
endmodule