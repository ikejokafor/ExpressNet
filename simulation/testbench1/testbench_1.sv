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
module testbench_1;

    parameter C_PERIOD0 = 2;     // ns; ie 500 MHz clock
    parameter C_PERIOD1 = 10;    // ns; ie 100 MHz clcok   
    reg rst;
    wire clk_100MHz;
    wire clk_500MHz;


  	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"

    

    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_LOG2_BRAM_DEPTH    = clog2(`BRAM_DEPTH);
    localparam ROWS                 = 10;
    localparam COLS                 = 10;
    localparam KERNEL_SIZE          = 3;
   

    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Wires / Regs
	//----------------------------------------------------------------------------------------------------------------------------------------------- 
    reg                             pixel_datain_tag;
    wire                            pixel_datain_rdy;
    reg                             seq_datain_tag;
    wire                            seq_datain_rdy;
    reg [`PIXEL_WIDTH - 1:0]        datain;
    reg                             datain_valid;
    
   
    clock_gen #(
        .C_PERIOD_BY_2(C_PERIOD1 / 2)
    )
    i0_clock_gen (
        .clk_out(clk_100MHz)
    );

    
    clock_gen #(
        .C_PERIOD_BY_2(C_PERIOD0 / 2)
    )
    i1_clock_gen (
        .clk_out(clk_500MHz)
    );

    
    cnn_layer_accel_octo #(
        .C_NUM_AWE          ( `NUM_AWE          ),
        .C_PIXEL_WIDTH      ( `PIXEL_WIDTH      ),
        .C_BRAM_DEPTH       ( `BRAM_DEPTH       ),
        .C_SEQ_DATA_WIDTH   ( `SEQ_DATA_WIDTH   )  
    ) 
    i0_cnn_layer_accel_octo (
        .clk_100MHz             ( clk_100MHz        ),
        .clk_500MHz             ( clk_500MHz        ),
        .rst                    ( rst               ),
        .pixel_datain_tag       ( pixel_datain_tag  ),
        .pixel_datain_rdy       ( pixel_datain_rdy  ),
        .seq_datain_tag         ( seq_datain_tag    ),
        .seq_datain_rdy         ( seq_datain_rdy    ),
        .datain                 ( datain            ),
        .datain_valid           ( datain_valid      )
    );
 
 
    integer fd;
    bit [`PIXEL_WIDTH - 1:0]      arr[0:((ROWS * COLS) - 1)];
    bit [`SEQ_DATA_WIDTH - 1:0]   arr2[0:((COLS * 5) - 1)];
    int i;
    int j;
    bit parity0;
    bit parity1;
    initial begin
        i0_cnn_layer_accel_octo.new_map = 0;
        i0_cnn_layer_accel_octo.i0_cnn_layer_accel_octo_bram_ctrl.num_input_rows_cfg = ROWS - 1;
        i0_cnn_layer_accel_octo.i0_cnn_layer_accel_octo_bram_ctrl.num_input_cols_cfg = COLS - 1;
        pixel_datain_tag = 0;
        seq_datain_tag = 0;
        datain = 0;
        datain_valid = 0;
        
        fd = $fopen("map.txt", "w");
        for(i = 0; i < ROWS; i = i + 1) begin
            for(j = 0; j < COLS; j = j + 1) begin
                arr[i * COLS + j] = $urandom_range(1, 10);
                $fwrite(fd, "%d ", arr[i * COLS + j]);
            end
            $fwrite(fd, "\n");
        end
        
        //          RM   RST    P
        arr2[0] = {1'b0, 1'b1, 1'b1, 10'd0  };
        arr2[1] = {1'b0, 1'b0, 1'b0, 10'd2  };
        arr2[2] = {1'b0, 1'b0, 1'b0, 10'd512};
        arr2[3] = {1'b0, 1'b0, 1'b0, 10'd513};
        arr2[4] = {1'b1, 1'b0, 1'b0, 10'd514};
        parity0 = 0;
        parity1 = 1;

    
        j = 0;      
        for(i = 5; i < ((COLS - (KERNEL_SIZE - 1)) * 5); i = i + 5) begin
            arr2[i    ] = {1'b0, 1'b1, parity0, arr2[i - 5][`SEQ_DATA_SEQ_FIELD] + 10'd1};
            if((j % 2) == 0) begin
                arr2[i + 1] = {1'b0, 1'b0, 1'b0, parity1, arr2[i - 4][`SEQ_DATA_SEQ_FIELD]};
            end else begin
                arr2[i + 1] = {1'b0, 1'b0, 1'b0, parity1, arr2[i - 4][`SEQ_DATA_SEQ_FIELD] + 10'd2};
            end
            arr2[i + 2] = {1'b0, 1'b0, 1'b0, arr2[i - 3][`SEQ_DATA_SEQ_FIELD] + 10'd1};
            arr2[i + 3] = {1'b0, 1'b0, 1'b0, arr2[i - 2][`SEQ_DATA_SEQ_FIELD] + 10'd1};
            arr2[i + 4] = {1'b1, 1'b0, 1'b0, arr2[i - 1][`SEQ_DATA_SEQ_FIELD] + 10'd1};
            parity0 = ~parity0;
            parity1 = ~parity1;
            j = (j + 1) % 2;
        end
        
        
        rst = 1;
        #(C_PERIOD0 * 2) rst = 0;

        
        @(posedge clk_500MHz);
        i0_cnn_layer_accel_octo.new_map = 1;
        @(posedge clk_500MHz);
        i0_cnn_layer_accel_octo.new_map = 0;
        

        i = 1;
        @(posedge clk_500MHz);
        datain = arr2[0];
        datain_valid = 1;
        seq_datain_tag = 1;
        while(i < ((COLS - (KERNEL_SIZE - 1)) * 5)) begin
            @(posedge clk_500MHz);
            if(seq_datain_rdy) begin
                datain = arr2[i];
                i = i + 1;
            end
        end
        datain_valid = 0;
        seq_datain_tag = 0;

        
        i = 1;
        @(posedge clk_500MHz);
        datain = arr[0];
        datain_valid = 1;
        pixel_datain_tag = 1;
        while(i < (COLS * ROWS)) begin
            @(posedge clk_500MHz);
            if(pixel_datain_rdy) begin
                datain = arr[i];
                i = i + 1;
            end
        end 
        datain_valid = 0;
        pixel_datain_tag = 0;    
        $stop;
    end
    
endmodule