    // ----------------------------------------------------------------------------------------------------------------------------------	
    // [1] Config Regs
    // ----------------------------------------------------------------------------------------------------------------------------------
    // WINDOW_3x3_NUM_CYCLES = 5
    // NUM_M_CE_PER_QUAD = 8
    // num_input_rows = <...>
    // num_input_cols = <...>
    // depth = NUM_M_CE_PER_QUAD
    // num_kernels = <...>
    // stride = < 1 | 2>
    // kernel_size = 3 
    // conv_out_fmt = 0
    // cascade = 0
    // padding = 0
    // upsample = 0    
    // master_quad = 1
    // Note: accel output will be (input_depth * num_acl_output_rows * num_acl_output_cols) values
 
    
    num_kernels_cfg = num_kernels - 1
    num_output_rows = ((num_input_rows - kernel_size + (2 * padding)) / stride) + 1
    num_output_cols = ((num_input_rows - kernel_size + (2 * padding)) / stride) + 1     
    if(padding && !upsample) 
        num_expd_input_rows = num_input_rows + 2
        num_expd_input_cols = num_input_cols + 2       
    else if(!padding && upsample) 
        num_expd_input_rows = num_input_rows * 2
        num_expd_input_cols = num_input_cols * 2 
        num_output_rows = ((num_expd_input_rows - kernel_size + (2 * padding)) / stride) + 1
        num_output_cols = ((num_expd_input_cols - kernel_size + (2 * padding)) / stride) + 1
    else if(padding && upsample)
        num_expd_input_rows = (num_input_rows * 2) + 2
        num_expd_input_cols = (num_input_cols * 2) + 2
        num_output_rows = (((num_expd_input_rows - 2) - kernel_size + (2 * padding)) / stride) + 1
        num_output_cols = (((num_expd_input_cols - 2) - kernel_size + (2 * padding)) / stride) + 1        
    else 
        num_expd_input_rows = num_input_rows
        num_expd_input_cols = num_input_cols      
    // end if
    num_input_rows_cfg            = num_input_rows - 1
    num_input_cols_cfg            = num_input_cols - 1   
    num_expd_input_rows_cfg       = num_expd_input_rows - 1
    num_expd_input_cols_cfg       = num_expd_input_cols - 1      
    crpd_input_col_start_cfg      = 1
    crpd_input_row_start_cfg      = 1
    crpd_input_row__cfg        = num_expd_input_rows - 2
    crpd_input_col__cfg        = num_expd_input_cols - 2
    pfb_full_count_cfg            = num_expd_input_cols


    if(padding && stride == 2)     
        num_output_rows_cfg           = ceil(num_expd_input_rows / 2) - 1
        num_output_cols_cfg           = ceil(num_expd_input_cols / 2)
        pix_seq_data_full_count_cfg   = WINDOW_3x3_NUM_CYCLES * ceil(num_expd_input_cols / 2)
    else if(!padding && stride == 2) 
        num_acl_output_rows           = ceil(num_expd_input_rows / 2 ) - 1
        num_acl_output_cols           = ceil(num_expd_input_cols / 2 )
        num_output_rows_cfg           = ceil(num_expd_input_rows / 2 ) - 1
        num_output_cols_cfg           = ceil(num_expd_input_cols / 2 )
        pix_seq_data_full_count_cfg   = WINDOW_3x3_NUM_CYCLES * ceil(num_expd_input_cols / shortreal'(2)) 
    else if(padding && stride == 1) 
        num_acl_output_rows           = (((num_expd_input_rows - 2) - kernel_size + (2 * padding)) / stride) + 1
        num_acl_output_cols           = num_expd_input_cols
        num_output_rows_cfg           = (((num_expd_input_rows - 2) - kernel_size + (2 * padding)) / stride) + 1
        num_output_cols_cfg           = num_expd_input_cols
        pix_seq_data_full_count_cfg   = WINDOW_3x3_NUM_CYCLES * num_expd_input_cols
    else
        num_acl_output_rows           = ((num_expd_input_rows - kernel_size + (2 * padding)) / stride) + 1
        num_acl_output_cols           = num_expd_input_cols
        num_output_rows_cfg           = ((num_expd_input_rows - kernel_size + (2 * padding)) / stride) + 1
        num_output_cols_cfg           = num_expd_input_cols
        pix_seq_data_full_count_cfg   = WINDOW_3x3_NUM_CYCLES * num_expd_input_cols
     // end if



    // ----------------------------------------------------------------------------------------------------------------------------------	
    // [2.0] Pix Seq Data
    // ----------------------------------------------------------------------------------------------------------------------------------
    // MAX_NUM_M_INPUT_num_input_cols = 512
    pix_seq_data = [MAX_NUM_INPUT_num_input_cols * NUM_M_CE_PER_QUAD]
    
    if(stride == 1)
        pix_seq_data[0] = {2'b0, 1'b0, 1'b0, 1'b1, 1'b1, 10'd0  }
        pix_seq_data[1] = {2'b0, 1'b0, 1'b0, 1'b0, 1'b0, 10'd2  }
        pix_seq_data[2] = {2'b0, 1'b1, 1'b0, 1'b0, 1'b0, 10'd512}
        pix_seq_data[3] = {2'b0, 1'b0, 1'b0, 1'b0, 1'b0, 10'd513}
        pix_seq_data[4] = {2'b0, 1'b0, 1'b1, 1'b0, 1'b0, 10'd514}

        j = 0
        for(i = WINDOW_3x3_NUM_CYCLES i < (MAX_NUM_INPUT_num_input_cols * WINDOW_3x3_NUM_CYCLES) i = i + WINDOW_3x3_NUM_CYCLES)            
            if((j % 2) == 0) 
                pix_seq_data[i    ] = {2'b0, 1'b0, 1'b0, 1'b1, 1'b0, pix_seq_data[i - 5][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1}
                pix_seq_data[i + 1] = {2'b0, 1'b0, 1'b0, 1'b0, 1'b1, pix_seq_data[i - 4][`PIX_SEQ_DATA_SEQ_FIELD]}
            else           
                pix_seq_data[i    ] = {2'b0, 1'b0, 1'b0, 1'b1, 1'b1, pix_seq_data[i - 5][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1}
                pix_seq_data[i + 1] = {2'b0, 1'b0, 1'b0, 1'b0, 1'b0, pix_seq_data[i - 4][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2}
             // end if
            pix_seq_data[i + 2] = {2'b0, 1'b1, 1'b0, 1'b0, 1'b0, pix_seq_data[i - 3][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1}
            pix_seq_data[i + 3] = {2'b0, 1'b0, 1'b0, 1'b0, 1'b0, pix_seq_data[i - 2][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1}
            pix_seq_data[i + 4] = {2'b0, 1'b0, 1'b1, 1'b0, 1'b0, pix_seq_data[i - 1][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1}
            j = (j + 1) % 2
        // end for 
        while(i < (MAX_NUM_INPUT_num_input_cols * NUM_M_CE_PER_QUAD)) 
            pix_seq_data[i] = 0
            i = i + 1
        // end while    
    else if(stride == 2) 
        pix_seq_data[0] = {2'b0, 1'b0, 1'b0, 1'b1, 1'b1, 10'd0  }
        pix_seq_data[1] = {2'b0, 1'b0, 1'b0, 1'b0, 1'b0, 10'd2  }
        pix_seq_data[2] = {2'b1, 1'b1, 1'b0, 1'b0, 1'b0, 10'd512}
        pix_seq_data[3] = {2'b1, 1'b1, 1'b1, 1'b0, 1'b0, 10'd513}
        pix_seq_data[4] = {2'b0, 1'b0, 1'b1, 1'b0, 1'b0, 10'd514}
    
        j = 0
        for(i = WINDOW_3x3_NUM_CYCLES i < ((MAX_NUM_INPUT_num_input_cols / 2) * WINDOW_3x3_NUM_CYCLES) i = i + WINDOW_3x3_NUM_CYCLES) 
            pix_seq_data[i    ] = {2'b0, 1'b0, 1'b0, 1'b1, 1'b1, pix_seq_data[i - 5][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2}
            pix_seq_data[i + 1] = {2'b0, 1'b0, 1'b0, 1'b0, 1'b0, pix_seq_data[i - 4][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2}
            pix_seq_data[i + 2] = {2'b0, 1'b1, 1'b0, 1'b0, 1'b0, pix_seq_data[i - 3][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2}
            pix_seq_data[i + 3] = {2'b0, 1'b1, 1'b1, 1'b0, 1'b0, pix_seq_data[i - 2][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2}
            pix_seq_data[i + 4] = {2'b0, 1'b0, 1'b1, 1'b0, 1'b0, pix_seq_data[i - 1][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2}
            j = (j + 1) % 2
        // end for       
        while(i < (MAX_NUM_INPUT_num_input_cols * NUM_M_CE_PER_QUAD)) 
            pix_seq_data[i] = 0
            i = i + 1
        // end while
    // end if
    
    

    // ----------------------------------------------------------------------------------------------------------------------------------	
    // [2.1] Pix Seq Data
    // ----------------------------------------------------------------------------------------------------------------------------------
    MAX_NUM_INPUT_num_input_cols = 512;
    NUM_PIX_SEQ_VALUES_PER_BUS = 8
    i = 1;
    @(1x_clk);
    config_data[127:112]   = pix_seq_data[(0 * NUM_PIX_SEQ_VALUES_PER_BUS) + 7]; 
    config_data[111:96]    = pix_seq_data[(0 * NUM_PIX_SEQ_VALUES_PER_BUS) + 6];     
    config_data[95:80]     = pix_seq_data[(0 * NUM_PIX_SEQ_VALUES_PER_BUS) + 5];     
    config_data[79:64]     = pix_seq_data[(0 * NUM_PIX_SEQ_VALUES_PER_BUS) + 4];     
    config_data[63:48]     = pix_seq_data[(0 * NUM_PIX_SEQ_VALUES_PER_BUS) + 3];
    config_data[47:32]     = pix_seq_data[(0 * NUM_PIX_SEQ_VALUES_PER_BUS) + 2];     
    config_data[31:16]     = pix_seq_data[(0 * NUM_PIX_SEQ_VALUES_PER_BUS) + 1];     
    config_data[15:0]      = pix_seq_data[(0 * NUM_PIX_SEQ_VALUES_PER_BUS) + 0];
    @(1x_clk);
    config_valid[0]        = 1;
    while(i < MAX_NUM_INPUT_num_input_cols)
        @(1x_clk);
        wait(config_accept[0])
        config_data[127:112]    = pix_seq_data[(i * NUM_PIX_SEQ_VALUES_PER_BUS) + 7]; 
        config_data[111:96]     = pix_seq_data[(i * NUM_PIX_SEQ_VALUES_PER_BUS) + 6];     
        config_data[95:80]      = pix_seq_data[(i * NUM_PIX_SEQ_VALUES_PER_BUS) + 5];     
        config_data[79:64]      = pix_seq_data[(i * NUM_PIX_SEQ_VALUES_PER_BUS) + 4];     
        config_data[63:48]      = pix_seq_data[(i * NUM_PIX_SEQ_VALUES_PER_BUS) + 3];     
        config_data[47:32]      = pix_seq_data[(i * NUM_PIX_SEQ_VALUES_PER_BUS) + 2];     
        config_data[31:16]      = pix_seq_data[(i * NUM_PIX_SEQ_VALUES_PER_BUS) + 1];     
        config_data[15:0]       = pix_seq_data[(i * NUM_PIX_SEQ_VALUES_PER_BUS) + 0];
        i = i + 1;
    // end while
    
    
    // ----------------------------------------------------------------------------------------------------------------------------------	
    // [3] Kernel Data
    // ----------------------------------------------------------------------------------------------------------------------------------
    NUM_3x3_KERNEL_SLOTS = 10    
    kernel_data = [num_kernels * depth * NUM_3x3_KERNEL_SLOTS]
    i = 1
    @(5x_clk)
    // (n * NUM_3x3_KERNEL_SLOTS * depth) => selects the nth kernel
    // ((d * NUM_3x3_KERNEL_SLOTS) + i) => selects ith filter value for the nth kernel at depth d 
    weight_data[127:112]  = kernel_data[(0 * NUM_3x3_KERNEL_SLOTS * depth) + (7 * NUM_3x3_KERNEL_SLOTS) + 0] 
    weight_data[111:96]   = kernel_data[(0 * NUM_3x3_KERNEL_SLOTS * depth) + (6 * NUM_3x3_KERNEL_SLOTS) + 0]     
    weight_data[95:80]    = kernel_data[(0 * NUM_3x3_KERNEL_SLOTS * depth) + (5 * NUM_3x3_KERNEL_SLOTS) + 0]     
    weight_data[79:64]    = kernel_data[(0 * NUM_3x3_KERNEL_SLOTS * depth) + (4 * NUM_3x3_KERNEL_SLOTS) + 0]     
    weight_data[63:48]    = kernel_data[(0 * NUM_3x3_KERNEL_SLOTS * depth) + (3 * NUM_3x3_KERNEL_SLOTS) + 0]     
    weight_data[47:32]    = kernel_data[(0 * NUM_3x3_KERNEL_SLOTS * depth) + (2 * NUM_3x3_KERNEL_SLOTS) + 0]     
    weight_data[31:16]    = kernel_data[(0 * NUM_3x3_KERNEL_SLOTS * depth) + (1 * NUM_3x3_KERNEL_SLOTS) + 0]     
    weight_data[15:0]     = kernel_data[(0 * NUM_3x3_KERNEL_SLOTS * depth) + (0 * NUM_3x3_KERNEL_SLOTS) + 0]
    @(5x_clk)  
    weight_valid          = 1      
    kernel_idx            = 0
    while(kernel_idx < num_kernels)
        while(i < NUM_3x3_KERNEL_SLOTS)
            @(5x_clk)
            wait(weight_ready)          
                weight_data[127:112]    = kernel_data[(kernel_idx * NUM_3x3_KERNEL_SLOTS * depth) + (7 * NUM_3x3_KERNEL_SLOTS) + i] 
                weight_data[111:96]     = kernel_data[(kernel_idx * NUM_3x3_KERNEL_SLOTS * depth) + (6 * NUM_3x3_KERNEL_SLOTS) + i]     
                weight_data[95:80]      = kernel_data[(kernel_idx * NUM_3x3_KERNEL_SLOTS * depth) + (5 * NUM_3x3_KERNEL_SLOTS) + i]     
                weight_data[79:64]      = kernel_data[(kernel_idx * NUM_3x3_KERNEL_SLOTS * depth) + (4 * NUM_3x3_KERNEL_SLOTS) + i]     
                weight_data[63:48]      = kernel_data[(kernel_idx * NUM_3x3_KERNEL_SLOTS * depth) + (3 * NUM_3x3_KERNEL_SLOTS) + i]     
                weight_data[47:32]      = kernel_data[(kernel_idx * NUM_3x3_KERNEL_SLOTS * depth) + (2 * NUM_3x3_KERNEL_SLOTS) + i]     
                weight_data[31:16]      = kernel_data[(kernel_idx * NUM_3x3_KERNEL_SLOTS * depth) + (1 * NUM_3x3_KERNEL_SLOTS) + i]     
                weight_data[15:0]       = kernel_data[(kernel_idx * NUM_3x3_KERNEL_SLOTS * depth) + (0 * NUM_3x3_KERNEL_SLOTS) + i]
                i = i + 1
             // end wait
         // end while
        kernel_idx = kernel_idx + 1
        i = 0
    // end while   


    // ----------------------------------------------------------------------------------------------------------------------------------	
    // [4] Pixel Data
    // ----------------------------------------------------------------------------------------------------------------------------------        i = 0; 
    pix_data = [depth * num_input_rows * num_input_cols];    
    j = 0; // indexes into the specifed column
    i = 0; // keeps track of the row your at
    k = 0; // keeps track of where in the column you are
    while(i < (num_input_rows * num_input_cols)) 
        @(1x_clk)
        if(job_fetch_request) 
            job_fetch_ack = 1;                
            @(1x_clk)
            job_fetch_ack = 0;
            // (n * (num_input_rows * num_input_cols)) => selects the nth image map
            // (i) => selects the ith value at the nth input map
            pixel_data[127:112]     = pix_data[(7 * (num_input_rows * num_input_cols)) + i];
            pixel_data[111:96]      = pix_data[(6 * (num_input_rows * num_input_cols)) + i];          
            pixel_data[95:80]       = pix_data[(5 * (num_input_rows * num_input_cols)) + i];           
            pixel_data[79:64]       = pix_data[(4 * (num_input_rows * num_input_cols)) + i];           
            pixel_data[63:48]       = pix_data[(3 * (num_input_rows * num_input_cols)) + i];           
            pixel_data[47:32]       = pix_data[(2 * (num_input_rows * num_input_cols)) + i];            
            pixel_data[31:16]       = pix_data[(1 * (num_input_rows * num_input_cols)) + i];           
            pixel_data[15:0]        = pix_data[(0 * (num_input_rows * num_input_cols)) + i];
            @(1x_clk)
            pixel_valid             = 1;
            j                       = i + 1; 
            k                       = 0;
            while(k < num_input_cols)
                @(1x_clk)
                wait(pixel_ready) 
                pixel_data[127:112]  = pix_data[(7 * (num_input_rows * num_input_cols)) + j];
                pixel_data[111:96]   = pix_data[(6 * (num_input_rows * num_input_cols)) + j];          
                pixel_data[95:80]    = pix_data[(5 * (num_input_rows * num_input_cols)) + j];           
                pixel_data[79:64]    = pix_data[(4 * (num_input_rows * num_input_cols)) + j];           
                pixel_data[63:48]    = pix_data[(3 * (num_input_rows * num_input_cols)) + j];           
                pixel_data[47:32]    = pix_data[(2 * (num_input_rows * num_input_cols)) + j];            
                pixel_data[31:16]    = pix_data[(1 * (num_input_rows * num_input_cols)) + j];           
                pixel_data[15:0]     = pix_data[(0 * (num_input_rows * num_input_cols)) + j];
                j                    = j + 1;
                k                    = k + 1;
            // end while
            @(1x_clk)
            job_fetch_complete = 1;
            pixel_valid = 0;
            @(1x_clk)
            job_fetch_complete = 0;
            i = i + num_input_cols;     
        // end if
    // end while
        