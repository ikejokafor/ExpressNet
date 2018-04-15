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
    localparam C_LOG2_BRAM_DEPTH        = clog2(`BRAM_DEPTH);
    localparam ROWS                     = 10;
    localparam COLS                     = 10;
    localparam DEPTH                    = 8;
    localparam NUM_KERNEL_3x3_VALUES    = 10;
    localparam KERNEL_SIZE              = 3;
    localparam NUM_KERNELS              = 16'd2;
   

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    reg             pixel_valid;
    wire            pixel_ready; 
    reg [127:0]     pixel_data;  
    
    reg             weight_valid;
    wire            weight_ready;
    reg [127:0]     weight_data;

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
    
    integer fd, fd0;
    bit [`PIXEL_WIDTH - 1:0]    arr[0:((ROWS * COLS * 8) - 1)];
    bit [15:0]                  arr2[0:((512 * 8) - 1)];
    bit [15:0]                  arr3[0:((DEPTH * NUM_KERNEL_3x3_VALUES * NUM_KERNELS) - 1)];     // for 3x3 kernel, there are 10 values
    bit [15:0]                  arr4[0:(DEPTH - 1)][0:((ROWS - 2) - 1)][0:((COLS - 2) - 1)][0:((KERNEL_SIZE * KERNEL_SIZE) - 1)];
    bit                         arr5[0:(DEPTH - 1)][0:((ROWS - 2) - 1)][0:((COLS - 2) - 1)][0:((KERNEL_SIZE * KERNEL_SIZE) - 1)];
    int i;
    int j;
    int k;
    int n;
    int a;
    int b;
    int n0;
    int n1;
    int z;
    bit parity0;
    bit parity1;
    reg [15:0] kernel_group_cfg;
    
    wire ce0_pixel_dataout_valid;
    wire ce1_pixel_dataout_valid;
    wire [31:0] ce0_pixel_dataout;      
    wire [31:0] ce1_pixel_dataout;  
    wire [8:0] output_col;
    wire [8:0] output_row; 
    
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

    
    cnn_layer_accel_quad
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

        .weight_valid         ( weight_valid   ),  
        .weight_ready         ( weight_ready  ),  
        .weight_data          ( weight_data    ),       

        .result_valid         (),  
        .result_accept        (),  
        .result_data          (),  

        .pixel_valid          ( pixel_valid  ),  
        .pixel_ready          ( pixel_ready  ),  
        .pixel_data           ( pixel_data   )
    );
    
    
    SRL_bus #(
        .C_CLOCK_CYCLES  ( 3 + 4 ),
        .C_DATA_WIDTH    ( 9     )
    ) 
    i0_SRL_bus (
        .clk        ( clk_500MHz    ),
        .ce         ( 1'b1          ),
        .rst        ( rst           ),
        .data_in    ( i0_cnn_layer_accel_quad.i0_cnn_layer_accel_quad_bram_ctrl.output_col    ),
        .data_out   ( output_col    )
    );
   
   
    SRL_bus #(
        .C_CLOCK_CYCLES  ( 3 + 4 ),
        .C_DATA_WIDTH    ( 9     )
    ) 
    i1_SRL_bus (
        .clk        ( clk_500MHz    ),
        .ce         ( 1'b1          ),
        .rst        ( rst           ),
        .data_in    ( i0_cnn_layer_accel_quad.i0_cnn_layer_accel_quad_bram_ctrl.output_row    ),
        .data_out   ( output_row    )
    );
    

    assign ce0_pixel_dataout_valid  = i0_cnn_layer_accel_quad.ce0_pixel_dataout_valid[0];
    assign ce1_pixel_dataout_valid  = i0_cnn_layer_accel_quad.ce1_pixel_dataout_valid[0];  
    assign ce0_pixel_dataout        = i0_cnn_layer_accel_quad.ce0_pixel_dataout[31:0];
    assign ce1_pixel_dataout        = i0_cnn_layer_accel_quad.ce1_pixel_dataout[31:0];
    int i0;
    

    always@(posedge clk_500MHz) begin
        if(ce0_pixel_dataout_valid) begin
            for(i0 = 0; i0 < (KERNEL_SIZE * KERNEL_SIZE); i0++) begin
                if(output_col < COLS - 2 && output_row < ROWS - 2) begin
                    if(arr4[0][output_row][output_col][i0] == ce0_pixel_dataout[31:16] || arr4[0][output_row][output_col][i0] == ce0_pixel_dataout[15:0]) begin
                        arr5[0][output_col][output_row][i0] = 1;
                    end
                end
            end
        end
    end
    
    initial begin
        i0_cnn_layer_accel_quad.i0_cnn_layer_accel_quad_bram_ctrl.pix_seq_data_full_count   = 5 * COLS;                                      
        i0_cnn_layer_accel_quad.kernel_full_count_cfg                                       = 10;
        i0_cnn_layer_accel_quad.num_input_rows_cfg                                          = ROWS - 1;
        i0_cnn_layer_accel_quad.num_input_cols_cfg                                          = COLS - 1;
        i0_cnn_layer_accel_quad.pfb_full_count_cfg                                          = COLS;
        pixel_valid                                                                         = 0;
        job_start                                                                           = 0;
        job_fetch_ack                                                                       = 0;
        job_complete_ack                                                                    = 0;
        job_fetch_complete                                                                  = 0;                                        
        config_data                                                                         = 0;
        config_valid                                                                        = 0;
        weight_valid                                                                        = 0;
        
        fd = $fopen("map.txt", "w");
        for(k = 0; k < DEPTH; k = k + 1) begin
            for(i = 0; i < ROWS; i = i + 1) begin
                for(j = 0; j < COLS; j = j + 1) begin
                    arr[(k * ROWS + i) * COLS + j] = $urandom_range(1, 65535);
                    $fwrite(fd, "%d ", arr[(k * ROWS + i) * COLS + j]);
                end
                $fwrite(fd, "\n");
            end
            $fwrite(fd, "\n");
            $fwrite(fd, "\n");
        end
        $fclose(fd);
        
        
        for(k = 0; k < DEPTH; k = k + 1) begin
            for(i = 0; i < (ROWS - 2); i = i + 1) begin
                for(j = 0; j < (COLS - 2); j = j + 1) begin
                    a = i;
                    z = 0;
                    for(n0 = 0; n0 < KERNEL_SIZE; n0 = n0 + 1) begin
                        b = j;
                        for(n1 = 0; n1 < KERNEL_SIZE; n1 = n1 + 1) begin
                            arr4[k][i][j][z] = arr[(k * ROWS + a) * COLS + b];
                            arr5[k][i][j][z] = 0;
                            b++;
                            z++;
                        end
                        a++;
                    end
                end
            end
        end

        
        fd = $fopen("kernel.txt", "w");
        for(k = 0; k < NUM_KERNELS; k = k + 1) begin
            for(i = 0; i < DEPTH; i = i + 1) begin
                for(j = 0; j < NUM_KERNEL_3x3_VALUES; j = j + 1) begin
                    arr3[(k * DEPTH + i) * NUM_KERNEL_3x3_VALUES + j] = $urandom_range(1, 10);
                    $fwrite(fd, "%d ", arr3[(k * DEPTH + i) * NUM_KERNEL_3x3_VALUES + j]);
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
            arr2[i    ] = {3'b0, 1'b0, 1'b1, parity0, arr2[i - 5][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
            if((j % 2) == 0) begin
                arr2[i + 1] = {3'b0, 1'b0, 1'b0, parity1, arr2[i - 4][`PIX_SEQ_DATA_SEQ_FIELD]};
            end else begin           
                arr2[i + 1] = {3'b0, 1'b0, 1'b0, parity1, arr2[i - 4][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2};
            end
            arr2[i + 2] = {3'b0, 1'b0, 1'b0, 1'b0, arr2[i - 3][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
            arr2[i + 3] = {3'b0, 1'b0, 1'b0, 1'b0, arr2[i - 2][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
            arr2[i + 4] = {3'b0, 1'b1, 1'b0, 1'b0, arr2[i - 1][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
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
        config_data[127:112]    = arr2[(0 * 8) + 7]; 
        config_data[111:96]     = arr2[(0 * 8) + 6];     
        config_data[95:80]      = arr2[(0 * 8) + 5];     
        config_data[79:64]      = arr2[(0 * 8) + 4];     
        config_data[63:48]      = arr2[(0 * 8) + 3];     
        config_data[47:32]      = arr2[(0 * 8) + 2];     
        config_data[31:16]      = arr2[(0 * 8) + 1];     
        config_data[15:0]       = arr2[(0 * 8) + 0];
        config_valid[0]         = 1;
        while(i < 512) begin
            @(posedge clk_100MHz);
            if(config_accept[0]) begin
                config_data[127:112]    = arr2[(i * 8) + 7]; 
                config_data[111:96]     = arr2[(i * 8) + 6];     
                config_data[95:80]      = arr2[(i * 8) + 5];     
                config_data[79:64]      = arr2[(i * 8) + 4];     
                config_data[63:48]      = arr2[(i * 8) + 3];     
                config_data[47:32]      = arr2[(i * 8) + 2];     
                config_data[31:16]      = arr2[(i * 8) + 1];     
                config_data[15:0]       = arr2[(i * 8) + 0];
                i = i + 1;
            end
        end
        @(posedge clk_100MHz);
        config_valid[0]                = 0;
        
        $stop;
        
        @(posedge clk_500MHz);
        config_valid[1]         = 1;        
        config_data[127:112]    = NUM_KERNELS - 1;
        config_data[111:96]     = NUM_KERNELS - 1;
        config_data[95:80]      = NUM_KERNELS - 1;
        config_data[79:64]      = NUM_KERNELS - 1;
        config_data[63:48]      = NUM_KERNELS - 1;
        config_data[47:32]      = NUM_KERNELS - 1;
        config_data[31:16]      = NUM_KERNELS - 1;
        config_data[15:0]       = NUM_KERNELS - 1;
        @(posedge clk_500MHz);
        config_valid[1]         = 0;
        config_data[127:112]    = 0;
        config_data[111:96]     = 0;
        config_data[95:80]      = 0;
        config_data[79:64]      = 0;
        config_data[63:48]      = 0;
        config_data[47:32]      = 0;
        config_data[31:16]      = 0;
        config_data[15:0]       = 0;
        
        i = 1;
        j = 0;
        @(posedge clk_500MHz);
        weight_data[127:112]                        = arr3[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (7 * NUM_KERNEL_3x3_VALUES) + 0]; 
        weight_data[111:96]                         = arr3[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (6 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[95:80]                          = arr3[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (5 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[79:64]                          = arr3[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (4 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[63:48]                          = arr3[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (3 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[47:32]                          = arr3[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (2 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[31:16]                          = arr3[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (1 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[15:0]                           = arr3[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (0 * NUM_KERNEL_3x3_VALUES) + 0];
        weight_valid                                = 1;      
        kernel_group_cfg                            = 0;
        config_data                                 = 0;
        while(j < 2) begin
            while(i < NUM_KERNEL_3x3_VALUES) begin
                @(posedge clk_500MHz);
                if(weight_ready) begin
                    weight_data[127:112]    = arr3[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (7 * NUM_KERNEL_3x3_VALUES) + i]; 
                    weight_data[111:96]     = arr3[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (6 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[95:80]      = arr3[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (5 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[79:64]      = arr3[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (4 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[63:48]      = arr3[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (3 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[47:32]      = arr3[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (2 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[31:16]      = arr3[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (1 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[15:0]       = arr3[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (0 * NUM_KERNEL_3x3_VALUES) + i];
                    i = i + 1;
                end
            end
            kernel_group_cfg = kernel_group_cfg + 1;
            config_data =   {   
                                kernel_group_cfg,
                                kernel_group_cfg,
                                kernel_group_cfg,
                                kernel_group_cfg,
                                kernel_group_cfg,
                                kernel_group_cfg,
                                kernel_group_cfg,
                                kernel_group_cfg
                            };
            i = 0;
            j = j + 1;
        end
        @(posedge clk_500MHz);
        weight_valid                        = 0;  

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
        j = 0;
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

        $stop;
        
        while(1) begin
            @(posedge clk_100MHz);
            if(job_complete) begin
                job_complete_ack = 1;
                break;
            end
        end
        @(posedge clk_100MHz);
        job_complete_ack = 0; 
        $stop;
    end
    
   
endmodule