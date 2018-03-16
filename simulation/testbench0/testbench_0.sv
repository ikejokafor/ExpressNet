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
//                
//                
//
// Dependencies:  
//                
//                
//                
//   
// Revision:
//
// Additional Comments:
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module testbench_0;

  	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"

    
    parameter C_PERIOD = 10;    
    reg rst;
    wire clk;
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_LOG2_BRAM_DEPTH        = clog2(`BRAM_DEPTH);
    localparam ROWS                     = 10;
    localparam COLS                     = 10;    
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Wires / Regs
	//----------------------------------------------------------------------------------------------------------------------------------------------- 
    reg [    C_LOG2_BRAM_DEPTH - 2:0]   row;
    reg [    C_LOG2_BRAM_DEPTH - 2:0]   col;
    reg [    C_LOG2_BRAM_DEPTH - 2:0]   numRows;
    reg [    C_LOG2_BRAM_DEPTH - 2:0]   numCols;
    reg [                        2:0]   state;               
    reg                                 mode;                
    reg [    C_LOG2_BRAM_DEPTH - 1:0]   sequence_datain;     
    reg [         `PIXEL_WIDTH - 1:0]   pixel_datain;        
    reg                                 pixel_datain_valid; 
    reg [    C_LOG2_BRAM_DEPTH - 2:0]   wrAddr;   
    reg [    C_LOG2_BRAM_DEPTH - 2:0]   wrAddr_r;
    reg                                 accum_reset;
    
    clock_gen #(
        .C_PERIOD_BY_2(C_PERIOD / 2)
    ) 
    i0_clock_gen (
        .clk_out(clk)
    );
    
    
    cnn_layer_accel_awe_rowbuffers #(
        .C_PIXEL_WIDTH  ( `PIXEL_WIDTH      ),
        .C_BRAM_DEPTH   ( `BRAM_DEPTH       )
    ) 
    i0_cnn_layer_accel_awe_rowbuffers (
        .clk                        ( clk                   ),              
        .rst                        ( rst                   ),
        .row                        ( row                   ),
        .col                        ( col                   ),
        .numRows                    ( numRows               ),
        .numCols                    ( numCols               ),
        .state                      ( state                 ),
        .mode                       ( mode                  ),
        .wrAddr                     ( wrAddr                ),
        .sequence_datain            ( sequence_datain       ),
        .accum_reset                ( accum_reset           ),
        .pixel_datain               ( pixel_datain          ),
        .pixel_datain_valid         ( pixel_datain_valid    ),
        .pixel_dataout              (                       ),
        .pixel_dataout_valid        (                       )
    );

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------            
    always@(posedge clk) begin
        if(rst) begin
            row         <= 0;
            col         <= 0;
            wrAddr      <= 0;
            wrAddr_r    <= 0;
        end else begin
            wrAddr_r <= wrAddr;
            if(pixel_datain_valid) begin
                col     <= col + 1;
                wrAddr  <= wrAddr + 1;
            end
            if(col == (COLS - 1)) begin
                col     <= 0;
                wrAddr  <= 0;
                row     <= row + 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    integer fd;
    bit [`PIXEL_WIDTH - 1:0]        arr[0:((ROWS * COLS) - 1)];
    bit [C_LOG2_BRAM_DEPTH - 1:0]   arr2[0:4];
    int i;
    int j;
    initial begin
        numRows = ROWS;
        numCols = COLS;
        arr2[0] = 0;
        arr2[1] = 1;
        arr2[2] = 512;
        arr2[3] = 513;
        arr2[4] = 514;
        pixel_datain = 0;       
        pixel_datain_valid = 0;
        state = 3'b010;
        mode = 1'b0;
        accum_reset = 0;

        fd = $fopen("debug.txt", "w");
        for(i = 0; i < ROWS; i = i + 1) begin
            for(j = 0; j < COLS; j = j + 1) begin
                arr[i * COLS + j] = $urandom_range(1, 10);
                $fwrite(fd, "%d ", arr[i * COLS + j]);
            end
            $fwrite(fd, "\n");
        end
        i = 0;
        j = 0;
        

        rst = 1;
        #(C_PERIOD * 10) rst = 0;
        
        @(posedge clk);
        pixel_datain = arr[i];
        pixel_datain_valid = 1;
        while(i < (ROWS * COLS)) begin
            @(posedge clk);
            i = i + 1;
            pixel_datain = arr[i];            
        end
        pixel_datain_valid = 0;
        
        
        while(1) begin
            @(posedge clk);
            sequence_datain = arr[j];
            arr[j]++;
            j = (j + 1) % 4;
            if(i == 32) begin
                $stop;
            end
        end
        state = 3'b100;

    end
    
endmodule