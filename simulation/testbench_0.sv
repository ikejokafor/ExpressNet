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


    parameter C_PERIOD = 10;    
    reg rst;
    wire clk;   

    int i; 
    int j;
    int a;
    int b;
    int n;
    int m;
    int max;
    reg [63:0]opcode;          
    reg opcode_valid;   
    wire opcode_accept;   
    
    reg [15:0] datain;          
    reg datain_valid; 
    reg datain_valid_r;
    wire datain_ready;      
    logic [15:0] arr[99:0];
    integer fd;
    wire [15:0] dataout;
    wire        dataout_valid;
    
    clock_gen #(
        .C_PERIOD_BY_2(C_PERIOD / 2)
    ) 
    i0_clock_gen (
        .clk_out(clk)
    );
    
    
    cnn_layer_accel_layer_engine_pooler #(
        .C_DATAIN_WIDTH   (16)
    )
    i0_cnn_layer_accel_layer_engine_pooler (
        .clk                 ( clk ),
        .rst                 ( rst ),

        .opcode              ( opcode           ),
        .opcode_valid        ( opcode_valid     ),
        .opcode_accept       ( opcode_accept    ),

        .datain              ( datain           ),
        .datain_valid        ( datain_valid     ),
        .datain_ready        ( datain_ready     ),

        .dataout             (   dataout               ),
        .dataout_valid       (    dataout_valid              ),
        .dataout_ready       (     1'b0         )
    );
    


    initial begin
        rst = 1;  
        opcode_valid = 0;
        datain_valid = 0;
        datain_valid_r = 0;
        opcode [31:0] = 31'd100;
        #(C_PERIOD * 10) rst = 0;
        
        @(posedge clk);
        opcode_valid = 1;
        wait(opcode_accept);
        @(posedge clk);
        @(posedge clk);
        opcode_valid = 0;
        
        
        for(i = 0; i < 100; i = i + 1) begin
            arr[i]= $urandom_range(0, 100);
        end
        
        fd = $fopen("image.txt", "w");
        for(i = 0; i < 10; i = i + 1) begin
            for(j = 0; j < 10; j = j + 1) begin
                $fwrite(fd, "%d", arr[i * 10 + j]);
            end
            $fwrite(fd, "\n");
        end
        $fclose(fd);
        
        fd = $fopen("sol.txt", "w");
        for(i = 0; i < 8; i = i + 1) begin
            for(j = 0; j < 8; j = j + 1) begin
                max = 0;
                for(a = i, n = 0; n < 3; a = a + 1, n = n + 1) begin
                    for(b = j, m = 0; m < 3; b = b + 1, m = m + 1) begin
                        max = (max < arr[a * 10 + b]) ? arr[a * 10 + b] : max;
                    end                
                end
                $fwrite(fd, "%d", max);
            end
            $fwrite(fd, "\n");
        end
        $fclose(fd);
        
        datain          = arr[0];
        @(posedge clk);
        datain_valid    = 1;
        i = 1;
        while(i < 100) begin 
            @(posedge clk);
            if(datain_ready) begin
                datain          = arr[i];
                i = i + 1;
                datain_valid    = 1;
            end else begin
                if(datain_valid == 1) begin
                   i = i - 1;
                end
                datain_valid    = 0;
                
            end
        end
        //#(C_PERIOD * 200) $stop;
    end
    
endmodule