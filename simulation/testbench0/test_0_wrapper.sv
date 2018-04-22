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
module test_0_wrapper #(
    parameter ROWS              = 20 ,
    parameter COLS              = 20 ,
    parameter DEPTH             = 8  ,
    parameter KERNEL_SIZE       = 3  ,
    parameter NUM_KERNELS       = 5  ,
    parameter C_PERIOD_100MHz   = 10 ,
    parameter C_PERIOD_500MHz   = 2 
) (
    input logic clk_100MHz    ,
    input logic clk_500MHz    ,
    input logic rst           
);
  	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"

 
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_LOG2_BRAM_DEPTH        = clog2(`BRAM_DEPTH);
    localparam NUM_KERNEL_3x3_VALUES    = 10;
    localparam NUM_CE_PER_QUAD          = `NUM_AWE * `NUM_CE_PER_AWE;

    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    logic             pixel_valid;
    logic             pixel_ready; 
    logic [127:0]     pixel_data;  

    logic             weight_valid;
    logic             weight_ready;
    logic [127:0]     weight_data;
    
    logic   [3:0]     config_valid; 
    logic  [3:0]      config_accept;    
    logic [127:0]     config_data;
    
    logic            job_start           ;
    logic            job_accept          ;
    logic            job_fetch_request   ;
    logic            job_fetch_ack       ;
    logic            job_fetch_complete  ;
    logic            job_complete        ;
    logic            job_complete_ack    ;  
    genvar           g;
    
    integer fd, fd0;
    logic [`PIXEL_WIDTH - 1:0]    pix_data_sim[0:((ROWS * COLS * 8) - 1)];
    int                           pix_data_sol[0:(DEPTH - 1)][0:((ROWS - 2) - 1)][0:((COLS - 2) - 1)][0:((KERNEL_SIZE * KERNEL_SIZE) - 1)];
    int                           pix_data_result[0:(DEPTH - 1)][0:((ROWS - 2) - 1)][0:((COLS - 2) - 1)][0:((KERNEL_SIZE * KERNEL_SIZE) - 1)];    
    logic [15:0]                  pix_seq_data_sim[0:((512 * 8) - 1)];
    logic [15:0]                  kernel_data_sim[0:((DEPTH * NUM_KERNEL_3x3_VALUES * NUM_KERNELS) - 1)];
   // logic [15:0]                  kernel_data_sim[0:((DEPTH * NUM_KERNEL_3x3_VALUES * NUM_KERNELS) - 1)];

    logic [15:0] kernel_group_cfg;  
    int i;
    int j;
    int k;
    int n;
    int a;
    int b;
    int n0;
    int n1;
    int z;
    int i0;
    
    int        ce0_pixel_dataout_valid[`NUM_AWE - 1:0];
    int        ce1_pixel_dataout_valid[`NUM_AWE - 1:0];
    int        ce0_pixel_dataout[`NUM_AWE - 1:0];      
    int        ce1_pixel_dataout[`NUM_AWE - 1:0];  
    int        output_col0[`NUM_AWE - 1:0];
    int        output_row0[`NUM_AWE - 1:0]; 
    int        output_col1[`NUM_AWE - 1:0];
    int        output_row1[`NUM_AWE - 1:0];
    int        cycle_counter0[`NUM_AWE - 1:0];
    int        cycle_counter1[`NUM_AWE - 1:0]; 
 
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------        
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
    

    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------  
    generate
        for(g = 0; g < `NUM_AWE; g = g + 1) begin

            assign ce0_pixel_dataout_valid[g]           = i0_cnn_layer_accel_quad.ce0_pixel_dataout_valid[g];
            assign ce1_pixel_dataout_valid[g]           = i0_cnn_layer_accel_quad.ce1_pixel_dataout_valid[g];  
            assign ce0_pixel_dataout[g]                 = i0_cnn_layer_accel_quad.ce0_pixel_dataout[g];
            assign ce1_pixel_dataout[g]                 = i0_cnn_layer_accel_quad.ce1_pixel_dataout[g];

            
            always@(posedge clk_500MHz) begin
                if(rst) begin
                    output_col0[g]      <= 0;
                    output_row0[g]      <= 0;
                    cycle_counter0[g]   <= 0;
                end else begin
                    if(cycle_counter0[g] == 4) begin
                        cycle_counter0[g] <= 0;
                    end else if(ce0_pixel_dataout_valid[g]) begin
                        cycle_counter0[g] <= cycle_counter0[g] + 1;
                    end 
                    if(cycle_counter0[g] == 4) begin
                        if(output_col0[g] == COLS - 1) begin
                            output_col0[g]  <= 0;
                            if(i0_cnn_layer_accel_quad.last_kernel[NUM_CE_PER_QUAD - 1]) begin
                                output_row0[g]  <= output_row0[g] + 1;
                            end
                        end else if(ce0_pixel_dataout_valid[g]) begin
                            output_col0[g]  <= output_col0[g] + 1;
                        end
                    end
                end
            end
            
            always@(posedge clk_500MHz) begin
                if(rst) begin
                    output_col1[g]      <= 0;
                    output_row1[g]      <= 0;
                    cycle_counter1[g]   <= 0;
                end else begin
                    if(cycle_counter1[g] == 4) begin
                        cycle_counter1[g] <= 0;
                    end else if(ce1_pixel_dataout_valid[g]) begin
                        cycle_counter1[g] <= cycle_counter1[g] + 1;
                    end 
                    if(cycle_counter1[g] == 4) begin
                        if(output_col1[g] == COLS - 1) begin
                            output_col1[g]  <= 0;
                            if(i0_cnn_layer_accel_quad.last_kernel[NUM_CE_PER_QUAD - 1]) begin
                                output_row1[g]  <= output_row1[g] + 1;
                            end
                        end else if(ce1_pixel_dataout_valid[g]) begin
                            output_col1[g]  <= output_col1[g] + 1;
                        end
                    end
                end
            end
            
            always@(posedge clk_500MHz) begin
                if(ce0_pixel_dataout_valid[g]) begin
                    for(i0 = 0; i0 < (KERNEL_SIZE * KERNEL_SIZE); i0++) begin
                        if(output_row0[g]  < COLS - 2 && output_col0[g]  < ROWS - 2) begin
                            if(pix_data_sol[g * 2][output_row0[g]][output_col0[g]][i0] == ce0_pixel_dataout[g][31:16] 
                                || pix_data_sol[g * 2][output_row0[g]][output_col0[g]][i0] == ce0_pixel_dataout[g][15:0]) begin
                                pix_data_result[g * 2][output_row0[g] ][output_col0[g]][i0] = 1;
                            end
                        end
                    end
                end
            end
            
            always@(posedge clk_500MHz) begin
                if(ce0_pixel_dataout_valid[g]) begin
                    for(i0 = 0; i0 < (KERNEL_SIZE * KERNEL_SIZE); i0++) begin
                        if(output_row1[g]  < COLS - 2 && output_col1[g]  < ROWS - 2) begin
                            if(pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][i0] == ce1_pixel_dataout[g][31:16] 
                                || pix_data_sol[g * 2 + 1][output_row1[g]][output_col1[g]][i0] == ce1_pixel_dataout[g][15:0]) begin
                                pix_data_result[g * 2 + 1][output_row1[g] ][output_col1[g]][i0] = 1;
                            end
                        end
                    end
                end
            end
            
        end    
    endgenerate
 	// END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    initial begin
        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
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
 	    // END logic ------------------------------------------------------------------------------------------------------------------------------------
       
        
        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
        fd = $fopen("map.txt", "w");
        for(k = 0; k < DEPTH; k = k + 1) begin
            for(i = 0; i < ROWS; i = i + 1) begin
                for(j = 0; j < COLS; j = j + 1) begin
                    pix_data_sim[(k * ROWS + i) * COLS + j] = $urandom_range(1, 65535);
                    $fwrite(fd, "%d ", pix_data_sim[(k * ROWS + i) * COLS + j]);
                end
                $fwrite(fd, "\n");
            end
            $fwrite(fd, "\n");
            $fwrite(fd, "\n");
        end
        $fclose(fd);
 	    // END logic ------------------------------------------------------------------------------------------------------------------------------------
        
 
        // BEGIN logic ---------------------------------------------------------------------------------------------------------------------------------- 
        for(k = 0; k < DEPTH; k = k + 1) begin
            for(i = 0; i < (ROWS - 2); i = i + 1) begin
                for(j = 0; j < (COLS - 2); j = j + 1) begin
                    a = i;
                    z = 0;
                    for(n0 = 0; n0 < KERNEL_SIZE; n0 = n0 + 1) begin
                        b = j;
                        for(n1 = 0; n1 < KERNEL_SIZE; n1 = n1 + 1) begin
                            pix_data_sol[k][i][j][z] = pix_data_sim[(k * ROWS + a) * COLS + b];
                            pix_data_result[k][i][j][z] = 0;
                            b++;
                            z++;
                        end
                        a++;
                    end
                end
            end
        end
 	    // END logic ------------------------------------------------------------------------------------------------------------------------------------
        

        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------         
        fd = $fopen("kernel.txt", "w");
        for(k = 0; k < NUM_KERNELS; k = k + 1) begin
            for(i = 0; i < DEPTH; i = i + 1) begin
                for(j = 0; j < NUM_KERNEL_3x3_VALUES; j = j + 1) begin
                    kernel_data_sim[(k * DEPTH + i) * NUM_KERNEL_3x3_VALUES + j] = $urandom_range(1, 100);
                    $fwrite(fd, "%d ", kernel_data_sim[(k * DEPTH + i) * NUM_KERNEL_3x3_VALUES + j]);
                end
                $fwrite(fd, "\n");
            end
            $fwrite(fd, "\n");
            $fwrite(fd, "\n");
        end
        $fclose(fd);
 	    // END logic ------------------------------------------------------------------------------------------------------------------------------------
 

        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------          
        //                            RM   RST    P
        pix_seq_data_sim[0] = {3'b0, 1'b0, 1'b1, 1'b1, 10'd0  };
        pix_seq_data_sim[1] = {3'b0, 1'b0, 1'b0, 1'b0, 10'd2  };
        pix_seq_data_sim[2] = {3'b0, 1'b0, 1'b0, 1'b0, 10'd512};
        pix_seq_data_sim[3] = {3'b0, 1'b0, 1'b0, 1'b0, 10'd513};
        pix_seq_data_sim[4] = {3'b0, 1'b1, 1'b0, 1'b0, 10'd514};
    
        j = 0;
        fd = $fopen("seq.txt", "w");
        $fwrite(fd, "%d\t%d\t%d\t%d\t%d\n", pix_seq_data_sim[0][9:0], pix_seq_data_sim[1][9:0], pix_seq_data_sim[2][9:0], pix_seq_data_sim[3][9:0], pix_seq_data_sim[4][9:0]);       
        for(i = 5; i < (512 * 5); i = i + 5) begin            
            if((j % 2) == 0) begin
                pix_seq_data_sim[i    ] = {3'b0, 1'b0, 1'b1, 1'b0, pix_seq_data_sim[i - 5][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
                pix_seq_data_sim[i + 1] = {3'b0, 1'b0, 1'b0, 1'b1, pix_seq_data_sim[i - 4][`PIX_SEQ_DATA_SEQ_FIELD]};
            end else begin           
                pix_seq_data_sim[i    ] = {3'b0, 1'b0, 1'b1, 1'b1, pix_seq_data_sim[i - 5][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
                pix_seq_data_sim[i + 1] = {3'b0, 1'b0, 1'b0, 1'b0, pix_seq_data_sim[i - 4][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2};
            end
            pix_seq_data_sim[i + 2] = {3'b0, 1'b0, 1'b0, 1'b0, pix_seq_data_sim[i - 3][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
            pix_seq_data_sim[i + 3] = {3'b0, 1'b0, 1'b0, 1'b0, pix_seq_data_sim[i - 2][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
            pix_seq_data_sim[i + 4] = {3'b0, 1'b1, 1'b0, 1'b0, pix_seq_data_sim[i - 1][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
            j = (j + 1) % 2;
            $fwrite(fd, "%d\t%d\t%d\t%d\t%d\n", pix_seq_data_sim[i][9:0], pix_seq_data_sim[i + 1][9:0], pix_seq_data_sim[i + 2][9:0], pix_seq_data_sim[i + 3][9:0], pix_seq_data_sim[i + 4][9:0]);
        end
        while(i < (512 * 8)) begin
            pix_seq_data_sim[i] = 0;
            i = i + 1;
        end
        $fclose(fd);
 	    // END logic ------------------------------------------------------------------------------------------------------------------------------------

 
        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------                  
        i = 1;
        @(posedge clk_100MHz);
        config_data[127:112]    = pix_seq_data_sim[(0 * 8) + 7]; 
        config_data[111:96]     = pix_seq_data_sim[(0 * 8) + 6];     
        config_data[95:80]      = pix_seq_data_sim[(0 * 8) + 5];     
        config_data[79:64]      = pix_seq_data_sim[(0 * 8) + 4];     
        config_data[63:48]      = pix_seq_data_sim[(0 * 8) + 3];     
        config_data[47:32]      = pix_seq_data_sim[(0 * 8) + 2];     
        config_data[31:16]      = pix_seq_data_sim[(0 * 8) + 1];     
        config_data[15:0]       = pix_seq_data_sim[(0 * 8) + 0];
        config_valid[0]         = 1;
        while(i < 512) begin
            @(posedge clk_100MHz);
            if(config_accept[0]) begin
                config_data[127:112]    = pix_seq_data_sim[(i * 8) + 7]; 
                config_data[111:96]     = pix_seq_data_sim[(i * 8) + 6];     
                config_data[95:80]      = pix_seq_data_sim[(i * 8) + 5];     
                config_data[79:64]      = pix_seq_data_sim[(i * 8) + 4];     
                config_data[63:48]      = pix_seq_data_sim[(i * 8) + 3];     
                config_data[47:32]      = pix_seq_data_sim[(i * 8) + 2];     
                config_data[31:16]      = pix_seq_data_sim[(i * 8) + 1];     
                config_data[15:0]       = pix_seq_data_sim[(i * 8) + 0];
                i = i + 1;
            end
        end
        @(posedge clk_100MHz);
        config_valid[0]                = 0;
  	    // END logic ------------------------------------------------------------------------------------------------------------------------------------
       
  
        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------  
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
        weight_data[127:112]                        = kernel_data_sim[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (7 * NUM_KERNEL_3x3_VALUES) + 0]; 
        weight_data[111:96]                         = kernel_data_sim[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (6 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[95:80]                          = kernel_data_sim[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (5 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[79:64]                          = kernel_data_sim[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (4 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[63:48]                          = kernel_data_sim[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (3 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[47:32]                          = kernel_data_sim[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (2 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[31:16]                          = kernel_data_sim[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (1 * NUM_KERNEL_3x3_VALUES) + 0];     
        weight_data[15:0]                           = kernel_data_sim[(0 * NUM_KERNEL_3x3_VALUES * DEPTH) + (0 * NUM_KERNEL_3x3_VALUES) + 0];
        weight_valid                                = 1;      
        kernel_group_cfg                            = 0;
        config_data                                 = 0;
        while(j < 2) begin
            while(i < NUM_KERNEL_3x3_VALUES) begin
                @(posedge clk_500MHz);
                if(weight_ready) begin
                    weight_data[127:112]    = kernel_data_sim[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (7 * NUM_KERNEL_3x3_VALUES) + i]; 
                    weight_data[111:96]     = kernel_data_sim[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (6 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[95:80]      = kernel_data_sim[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (5 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[79:64]      = kernel_data_sim[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (4 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[63:48]      = kernel_data_sim[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (3 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[47:32]      = kernel_data_sim[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (2 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[31:16]      = kernel_data_sim[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (1 * NUM_KERNEL_3x3_VALUES) + i];     
                    weight_data[15:0]       = kernel_data_sim[(j * NUM_KERNEL_3x3_VALUES * DEPTH) + (0 * NUM_KERNEL_3x3_VALUES) + i];
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
  	    // END logic ------------------------------------------------------------------------------------------------------------------------------------

  
        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
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

        
        i = 0; 
        j = 0;
        while(i < (ROWS * COLS)) begin
            @(posedge clk_100MHz);
            if(job_fetch_request) begin
                job_fetch_ack = 1;                
                @(posedge clk_100MHz);
                job_fetch_ack = 0;
                pixel_valid  = 1;
                pixel_data[127:112]     = pix_data_sim[(7 * (ROWS * COLS)) + i];
                pixel_data[111:96]      = pix_data_sim[(6 * (ROWS * COLS)) + i];          
                pixel_data[95:80]       = pix_data_sim[(5 * (ROWS * COLS)) + i];           
                pixel_data[79:64]       = pix_data_sim[(4 * (ROWS * COLS)) + i];           
                pixel_data[63:48]       = pix_data_sim[(3 * (ROWS * COLS)) + i];           
                pixel_data[47:32]       = pix_data_sim[(2 * (ROWS * COLS)) + i];            
                pixel_data[31:16]       = pix_data_sim[(1 * (ROWS * COLS)) + i];           
                pixel_data[15:0]        = pix_data_sim[(0 * (ROWS * COLS)) + i];
                j                       = i + 1;
                n                       = 0;
                while(n < COLS) begin
                    @(posedge clk_100MHz);
                    if(pixel_ready) begin
                        pixel_data[127:112]  = pix_data_sim[(7 * (ROWS * COLS)) + j];
                        pixel_data[111:96]   = pix_data_sim[(6 * (ROWS * COLS)) + j];          
                        pixel_data[95:80]    = pix_data_sim[(5 * (ROWS * COLS)) + j];           
                        pixel_data[79:64]    = pix_data_sim[(4 * (ROWS * COLS)) + j];           
                        pixel_data[63:48]    = pix_data_sim[(3 * (ROWS * COLS)) + j];           
                        pixel_data[47:32]    = pix_data_sim[(2 * (ROWS * COLS)) + j];            
                        pixel_data[31:16]    = pix_data_sim[(1 * (ROWS * COLS)) + j];           
                        pixel_data[15:0]     = pix_data_sim[(0 * (ROWS * COLS)) + j];
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
  	    // END logic ------------------------------------------------------------------------------------------------------------------------------------

        
        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------            
        while(1) begin
            @(posedge clk_100MHz);
            if(job_complete) begin
                job_complete_ack = 1;
                break;
            end
        end
        @(posedge clk_100MHz);
        job_complete_ack = 0; 
   	    // END logic ------------------------------------------------------------------------------------------------------------------------------------
       

        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
        for(i = 0; i < DEPTH; i++) begin
            for(a = 0; a < (ROWS - 2); a++) begin
                for(b = 0; b < (COLS - 2); b++) begin
                    for(n = 0; n < (KERNEL_SIZE * KERNEL_SIZE); n++) begin
                        if(!pix_data_result[i][a][b][n]) begin
                            $display("Failed at: %d %d %d %d", i, a, b, n);
                            $stop;
                        end
                    end
                end
            end
        end
        
        $display("Passed");
        $stop;
  	    // END logic ------------------------------------------------------------------------------------------------------------------------------------        
    end
    
   
endmodule