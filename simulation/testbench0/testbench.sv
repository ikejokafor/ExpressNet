`timescale 1ns / 1ps
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
module testbench;

    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Clock and Reset
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    parameter C_PERIOD_100MHz = 10;    
    parameter C_PERIOD_500MHz = 2; 
    logic rst;
    logic clk_100MHz;
    logic clk_500MHz;

   
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

    
    // test_0_wrapper #(
    //     .ROWS               ( 20               ),
    //     .COLS               ( 20               ),
    //     .DEPTH              ( 8                 ),
    //     .KERNEL_SIZE        ( 3                 ),
    //     .NUM_KERNELS        ( 1                ),
    //     .C_PERIOD_100MHz    ( C_PERIOD_100MHz   ),
    //     .C_PERIOD_500MHz    ( C_PERIOD_500MHz   )
    // )
    // i0_test_0_wrapper (
    //     .clk_100MHz     ( clk_100MHz ),
    //     .clk_500MHz     ( clk_500MHz ),
    //     .rst            ( rst        )
    // );
    
    
    test_1_wrapper #(
        .ROWS               ( 20               ),
        .COLS               ( 20               ),
        .DEPTH              ( 8                 ),
        .KERNEL_SIZE        ( 3                 ),
        .NUM_KERNELS        ( 1                ),
        .STRIDE             ( 2                ),
       
        .C_PERIOD_100MHz    ( C_PERIOD_100MHz   ),
        .C_PERIOD_500MHz    ( C_PERIOD_500MHz   )
    )
    i0_test_1_wrapper (
        .clk_100MHz     ( clk_100MHz ),
        .clk_500MHz     ( clk_500MHz ),
        .rst            ( rst        )
    );
    
    
    initial begin
        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------                  
        rst = 1;
        #(C_PERIOD_100MHz * 10) rst = 0;
 	    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    end
    
endmodule