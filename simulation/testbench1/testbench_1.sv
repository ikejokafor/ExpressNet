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

    parameter C_PERIOD_100MHz = 10;    
    parameter C_PERIOD_500MHz = 2; 
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
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    reg             pixel_valid;
    wire            pixel_ready; 
    reg [127:0]     pixel_data;  

    reg   [3:0]     config_valid; 
    wire [3:0]      config_accept;    
    reg [127:0]     config_data;
    
    reg             job_start           ;
    wire            job_accept          ;
    wire            job_fetch_request   ;
    reg             job_fetch_ack       ;
    reg             job_fetch_complete  ;
    wire            job_complete        ;
    reg             job_complete_ack    ;  
    
    clock_gen #(
        .C_PERIOD_BY_2(C_PERIOD_100MHz / 2)
    )
    i0_clock_gen (
        .clk_out(clk_100MHz)
    );

    
    clock_gen #(
        .C_PERIOD_BY_2(C_PERIOD_500MHz / 2)
    )
    i1_clock_gen (
        .clk_out(clk_500MHz)
    );

    
    cnn_layer_accel_quad #(       
        .C_PIXEL_WIDTH     ( `PIXEL_WIDTH      ),
        .C_NUM_AWE         ( `NUM_AWE          ),
        .C_NUM_CE_PER_AWE  ( `NUM_CE_PER_AWE   ),
        .C_BRAM_DEPTH      ( `BRAM_DEPTH       ) 
    ) 
    i0_cnn_layer_accel_quad (
        .clk_if               ( clk_100MHz   ),  
        .clk_core             ( clk_500MHz   ),  
        .rst                  ( rst          ),  

        .job_start            ( job_start             ),  
        .job_accept           ( job_accept            ),  
        .job_parameters       (                       ),  
        .job_fetch_request    ( job_fetch_request     ),  
        .job_fetch_ack        ( job_fetch_ack         ), 
        .job_fetch_complete   ( job_fetch_complete    ),
        .job_complete         ( job_complete          ),  
        .job_complete_ack     ( job_complete_ack      ),  

        .cascade_in_data      (),  
        .cascade_in_valid     (),  
        .cascade_in_ready     (),  

        .cascade_out_data     (),  
        .cascade_out_valid    (),  
        .cascade_out_ready    (),  

        .config_valid         ( config_valid    ),  
        .config_accept        ( config_accept   ),  
        .config_data          ( config_data     ),  

        .result_valid         (),  
        .result_accept        (),  
        .result_data          (),  

        .pixel_valid          ( pixel_valid  ),  
        .pixel_ready          ( pixel_ready  ),  
        .pixel_data           ( pixel_data   )
    );

 
    integer fd, fd0;
    bit [`PIXEL_WIDTH - 1:0]    arr[0:((ROWS * COLS * 8) - 1)];
    bit [15:0]                  arr2[0:((512 * 8) - 1)];
    int i;
    int j;
    int k;
    int n;
    bit parity0;
    bit parity1;
    initial begin
        i0_cnn_layer_accel_quad.num_input_rows_cfg    = ROWS - 1;
        i0_cnn_layer_accel_quad.num_input_cols_cfg    = COLS - 1;
        i0_cnn_layer_accel_quad.pfb_full_count_cfg    = COLS;
        i0_cnn_layer_accel_quad.last_kernel           = 0;
        i0_cnn_layer_accel_quad.next_row              = 0;
        pixel_valid                                   = 0;
        job_start                                     = 0;
        job_fetch_ack                                 = 0;
        job_complete_ack                              = 0;
        job_fetch_complete                            = 0;                                        
        config_data                                   = 0;
        config_valid                                  = 0;
        fd0 = $fopen("seq.txt", "w");
        
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
        $fclose(fd);

  
        //                 RM   RST    P
        arr2[0] = {3'b0, 1'b0, 1'b1, 1'b1, 10'd0  };
        arr2[1] = {3'b0, 1'b0, 1'b0, 1'b0, 10'd2  };
        arr2[2] = {3'b0, 1'b0, 1'b0, 1'b0, 10'd512};
        arr2[3] = {3'b0, 1'b0, 1'b0, 1'b0, 10'd513};
        arr2[4] = {3'b0, 1'b1, 1'b0, 1'b0, 10'd514};
        parity0 = 0;
        parity1 = 1;

    
        j = 0;      
        for(i = 5; i < (512 * 5); i = i + 5) begin
            arr2[i    ] = {3'b0, 1'b0, 1'b1, parity0, arr2[i - 5][`SEQ_DATA_SEQ_FIELD] + 10'd1};
            if((j % 2) == 0) begin
                arr2[i + 1] = {3'b0, 1'b0, 1'b0, parity1, arr2[i - 4][`SEQ_DATA_SEQ_FIELD]};
            end else begin           
                arr2[i + 1] = {3'b0, 1'b0, 1'b0, parity1, arr2[i - 4][`SEQ_DATA_SEQ_FIELD] + 10'd2};
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
        #(C_PERIOD_100MHz * 2) rst = 0;
   
        i = 1;
        @(posedge clk_100MHz);
        config_data[127:112]    = arr2[0 + 56]; 
        config_data[111:96]     = arr2[0 + 48];     
        config_data[95:80]      = arr2[0 + 40];     
        config_data[79:64]      = arr2[0 + 32];     
        config_data[63:48]      = arr2[0 + 24];     
        config_data[47:32]      = arr2[0 + 16];     
        config_data[31:16]      = arr2[0 + 8];     
        config_data[15:0]       = arr2[0 + 0];
        config_valid[0]         = 1;
        while(i < 512) begin
            @(posedge clk_100MHz);
            if(config_accept[0]) begin
                config_data[127:112]    = arr2[i + 56]; 
                config_data[111:96]     = arr2[i + 48];     
                config_data[95:80]      = arr2[i + 40];     
                config_data[79:64]      = arr2[i + 32];     
                config_data[63:48]      = arr2[i + 24];     
                config_data[47:32]      = arr2[i + 16];     
                config_data[31:16]      = arr2[i + 8];      
                config_data[15:0]       = arr2[i + 0];
                i = i + 1;
            end
        end
        @(posedge clk_100MHz);
        config_valid[0]                = 0;
        
        $stop;    
        
        @(posedge clk_100MHz);
        job_start = 1;
        while(1) begin
            @(posedge clk_100MHz);
            if(job_accept) begin
                break;
            end
        end
        @(posedge clk_100MHz);
        job_start = 0; 
        
        $stop;        
        
        i = 0;  
        while(i < (ROWS * COLS)) begin
            @(posedge clk_100MHz);
            if(job_fetch_request) begin
                job_fetch_ack = 1;                
                @(posedge clk_100MHz);
                job_fetch_ack = 0;
                pixel_valid  = 1;
                pixel_data[127:112]     = arr[(7 * (ROWS * COLS)) + i];
                pixel_data[111:96]      = arr[(6 * (ROWS * COLS)) + i];          
                pixel_data[95:80]       = arr[(5 * (ROWS * COLS)) + i];           
                pixel_data[79:64]       = arr[(4 * (ROWS * COLS)) + i];           
                pixel_data[63:48]       = arr[(3 * (ROWS * COLS)) + i];           
                pixel_data[47:32]       = arr[(2 * (ROWS * COLS)) + i];            
                pixel_data[31:16]       = arr[(1 * (ROWS * COLS)) + i];           
                pixel_data[15:0]        = arr[(0 * (ROWS * COLS)) + i];
                j                       = i + 1;
                n                       = 0;
                while(n < COLS) begin
                    @(posedge clk_100MHz);
                    if(pixel_ready) begin
                        pixel_data[127:112]  = arr[(7 * (ROWS * COLS)) + j];
                        pixel_data[111:96]   = arr[(6 * (ROWS * COLS)) + j];          
                        pixel_data[95:80]    = arr[(5 * (ROWS * COLS)) + j];           
                        pixel_data[79:64]    = arr[(4 * (ROWS * COLS)) + j];           
                        pixel_data[63:48]    = arr[(3 * (ROWS * COLS)) + j];           
                        pixel_data[47:32]    = arr[(2 * (ROWS * COLS)) + j];            
                        pixel_data[31:16]    = arr[(1 * (ROWS * COLS)) + j];           
                        pixel_data[15:0]     = arr[(0 * (ROWS * COLS)) + j];
                        j                   = j + 1;
                        n                   = n + 1;
                    end
                end
                job_fetch_complete = 1;
                pixel_valid = 0;
                @(posedge clk_100MHz);
                job_fetch_complete = 0;
                i = i + COLS;
            end
        end 

        #(C_PERIOD_100MHz)
        $stop;
    end

    always@(posedge clk_500MHz) begin
        if(i0_cnn_layer_accel_quad.genblk1[0].i0_cnn_layer_accel_awe_rowbuffers.ce0_start) begin
            $fwrite(fd0, "%d\t%d\n", 
                i0_cnn_layer_accel_quad.genblk1[0].i0_cnn_layer_accel_awe_rowbuffers.seq_datain_even, 
                i0_cnn_layer_accel_quad.genblk1[0].i0_cnn_layer_accel_awe_rowbuffers.seq_datain_odd
            );
            $fflush(fd0);
        end
    end
    
endmodule