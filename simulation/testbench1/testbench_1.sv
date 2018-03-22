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
    localparam DEPTH                = 8;
    localparam KERNEL_SIZE          = 3;
   

    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Wires / Regs
	//----------------------------------------------------------------------------------------------------------------------------------------------- 
    reg  [`NUM_NETWORK_IF - 1:0]   from_network_valid;
    wire [`NUM_NETWORK_IF - 1:0]   from_network_accept;	    
    reg  [`PAYLOAD_WIDTH  - 1:0]   from_network_payload;    

    wire [`NUM_NETWORK_IF - 1:0]   to_network_valid;	
    reg  [`NUM_NETWORK_IF - 1:0]   to_network_accept;	
    wire [`PAYLOAD_WIDTH  - 1:0]   to_network_payload;


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

    
    cnn_layer_accel_awp #(
        .C_NUM_NETWORK_IF   ( `NUM_NETWORK_IF   ),
        .C_PAYLOAD_WIDTH    ( `PAYLOAD_WIDTH    ),
        .C_NUM_QUADS        ( `NUM_QUADS        ),
        .C_NUM_AWE          ( `NUM_AWE          ),
        .C_NUM_CE_PER_AWE   ( `NUM_CE_PER_AWE   ),
        .C_PIXEL_WIDTH      ( `PIXEL_WIDTH      ),
        .C_BRAM_DEPTH       ( `BRAM_DEPTH       ),
        .C_SEQ_DATA_WIDTH   ( 16                )
    ) 
    i0_cnn_layer_accel_awp (
        .clk_500MHz             ( clk_500MHz            ),
        .accel_rst              ( rst                   ),

        .network_rst            ( rst                   ),
        .network_clk            ( clk_100MHz            ),
 
        .from_network_valid		( from_network_valid	),
        .from_network_accept	( from_network_accept	),
        .from_network_payload   ( from_network_payload  ),

        .to_network_valid		( to_network_valid	    ),
        .to_network_accept		( to_network_accept	    ),
        .to_network_payload		( to_network_payload	)
    );
 
 
    integer fd;
    bit [`PIXEL_WIDTH - 1:0]      arr[0:((ROWS * COLS * 8) - 1)];
    bit [`SEQ_DATA_WIDTH - 1:0]   arr2[0:((COLS * 5) - 1)];
    int i;
    int j;
    int k;
    bit parity0;
    bit parity1;
    initial begin
        i0_cnn_layer_accel_awp.i0_cnn_layer_accel_quad.num_input_rows_cfg   = ROWS - 1;
        i0_cnn_layer_accel_awp.i0_cnn_layer_accel_quad.num_input_cols_cfg   = COLS - 1;
        i0_cnn_layer_accel_awp.i0_cnn_layer_accel_quad.num_input_depth_cfg  = DEPTH - 1;
        i0_cnn_layer_accel_awp.i0_cnn_layer_accel_quad.start                = 0;  
        from_network_valid                                                  = 0;
        
        fd = $fopen("map.txt", "w");
        for(k = 0; k < DEPTH; k = k + 1) begin
            for(i = 0; i < ROWS; i = i + 1) begin
                for(j = 0; j < COLS; j = j + 1) begin
                    arr[(k * ROWS + i) * COLS + j] = $urandom_range(1, 10);
                    $fwrite(fd, "%d ", arr[(k * ROWS + i) * COLS + j]);
                end
                $fwrite(fd, "\n");
            end
            $fwrite(fd, "\n");
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
        for(i = 5; i < (512 * 5); i = i + 5) begin
            arr2[i    ] = {3'b0, 1'b0, 1'b1, parity0, arr2[i - 5][`SEQ_DATA_SEQ_FIELD] + 10'd1};
            if((j % 2) == 0) begin
                arr2[i + 1] = {3'b0, 1'b0, 1'b0, 1'b0, parity1, arr2[i - 4][`SEQ_DATA_SEQ_FIELD]};
            end else begin
                arr2[i + 1] = {3'b0, 1'b0, 1'b0, 1'b0, parity1, arr2[i - 4][`SEQ_DATA_SEQ_FIELD] + 10'd2};
            end
            arr2[i + 2] = {3'b0, 1'b0, 1'b0, 1'b0, arr2[i - 3][`SEQ_DATA_SEQ_FIELD] + 10'd1};
            arr2[i + 3] = {3'b0, 1'b0, 1'b0, 1'b0, arr2[i - 2][`SEQ_DATA_SEQ_FIELD] + 10'd1};
            arr2[i + 4] = {3'b0, 1'b1, 1'b0, 1'b0, arr2[i - 1][`SEQ_DATA_SEQ_FIELD] + 10'd1};
            parity0 = ~parity0;
            parity1 = ~parity1;
            j = (j + 1) % 2;
        end
        while(i < (512 * 8)) begin
            arr2[i] = 0;
            i = i + 1;
        end

        rst = 1;
        #(C_PERIOD1 * 2) rst = 0;
       
        i = 1;
        @(posedge clk_100MHz);
        from_network_payload[127:112]    = arr2[(0 * 8) + 0]; 
        from_network_payload[111:96]     = arr2[(0 * 8) + 1];     
        from_network_payload[95:80]      = arr2[(0 * 8) + 2];     
        from_network_payload[79:64]      = arr2[(0 * 8) + 3];     
        from_network_payload[63:48]      = arr2[(0 * 8) + 4];     
        from_network_payload[47:32]      = arr2[(0 * 8) + 5];     
        from_network_payload[31:15]      = arr2[(0 * 8) + 6];     
        from_network_payload[15:0]       = arr2[(0 * 8) + 7];
        i0_cnn_layer_accel_awp.seq_wren  = 1;
        while(i < 512) begin
            @(posedge clk_100MHz);
            from_network_payload[127:112]    = arr2[(i * 8) + 0]; 
            from_network_payload[111:96]     = arr2[(i * 8) + 1];     
            from_network_payload[95:80]      = arr2[(i * 8) + 2];     
            from_network_payload[79:64]      = arr2[(i * 8) + 3];     
            from_network_payload[63:48]      = arr2[(i * 8) + 4];     
            from_network_payload[47:32]      = arr2[(i * 8) + 5];     
            from_network_payload[31:15]      = arr2[(i * 8) + 6];     
            from_network_payload[15:0]       = arr2[(i * 8) + 7];
            i = i + 1;
        end
        i0_cnn_layer_accel_awp.seq_wren = 0;
        
        #(C_PERIOD1)
        $stop;

        
        @(posedge clk_100MHz);
        i0_cnn_layer_accel_awp.i0_cnn_layer_accel_quad.start = 1;  
        @(posedge clk_100MHz);
        i0_cnn_layer_accel_awp.i0_cnn_layer_accel_quad.start = 0; 
        
        #(C_PERIOD1)
        $stop;        
        
        i = 0;  
        while(i < ROWS) begin
            @(posedge clk_100MHz);
            if(to_network_valid) begin
                @(posedge clk_100MHz);
                from_network_valid = 1;
                from_network_payload[127:112] = arr[(0 * (ROWS * COLS)) + i];
                from_network_payload[111:96]  = arr[(1 * (ROWS * COLS)) + i];           
                from_network_payload[95:80]   = arr[(2 * (ROWS * COLS)) + i];           
                from_network_payload[79:64]   = arr[(3 * (ROWS * COLS)) + i];           
                from_network_payload[63:48]   = arr[(4 * (ROWS * COLS)) + i];           
                from_network_payload[47:32]   = arr[(5 * (ROWS * COLS)) + i];           
                from_network_payload[31:15]   = arr[(6 * (ROWS * COLS)) + i];           
                from_network_payload[15:0]    = arr[(7 * (ROWS * COLS)) + i];
                j = i + 1;
                while(j < COLS) begin
                    if(to_network_accept) begin
                        from_network_payload[127:112] = arr[(0 * (ROWS * COLS)) + j];
                        from_network_payload[111:96]  = arr[(1 * (ROWS * COLS)) + j];           
                        from_network_payload[95:80]   = arr[(2 * (ROWS * COLS)) + j];           
                        from_network_payload[79:64]   = arr[(3 * (ROWS * COLS)) + j];           
                        from_network_payload[63:48]   = arr[(4 * (ROWS * COLS)) + j];           
                        from_network_payload[47:32]   = arr[(5 * (ROWS * COLS)) + j];           
                        from_network_payload[31:15]   = arr[(6 * (ROWS * COLS)) + j];           
                        from_network_payload[15:0]    = arr[(7 * (ROWS * COLS)) + j];
                        j = j + 1;
                    end
                end
                from_network_valid = 0;
                i = i + COLS;
            end
        end 

        #(C_PERIOD1)
        $stop;
    end
    
endmodule