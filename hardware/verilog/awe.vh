parameter  C_PACKET_WIDTH		 	= 66;


localparam C_DATAIN_WIDTH        	= 16;
localparam C_WEIGHTIN_WIDTH      	= 32;
localparam C_WEIGHT_WIDTH        	= C_WEIGHTIN_WIDTH >> 1;
localparam C_A_INPUT_WIDTH       	= 30;
localparam C_B_INPUT_WIDTH       	= 18;
localparam C_P_OUTPUT_WIDTH      	= 48;
localparam C_P_INPUT_WIDTH      	= 48;
localparam C_C_INPUT_WIDTH       	= 48;
localparam C_KERNAL_SIZE_WIDTH     	= 5;
localparam C_MODE_WIDTH     		= 2;
localparam C_INPUT_MUX_WIDTH        = 18;



`define    MAX_POOLING_MODE		   2'b10 
`define    MIN_POOLING_MODE		   2'b01 
`define    CONVOLUTION_MODE		   2'b00 
`define    FC_MODE		  		   2'b11  


`define    DSP_OP_MODE_P_M_M_0     9'b010000101
`define    DSP_OP_MODE_P_0_0_0     9'b010000000
`define    DSP_OP_MODE_0_M_M_0     9'b000000101
`define    DSP_OP_MODE_P_0_0_PCIN  9'b010010000
`define    DSP_OP_MODE_P_M_M_PCIN  9'b010010101
`define    DSP_OP_MODE_0_AB_0_C    9'b000110011
`define    DSP_OP_MODE_0_0_C_PCIN  9'b000011100
`define    DSP_OP_MODE_0_M_M_PCIN  9'b000010101

`define    DSP_ALU_MODE_ADD		   4'b0000
`define    DSP_ALU_MODE_SUB        4'b0011		

`define    MIN_VALUE               18'h2_0000
`define    MAX_VALUE               18'h1_ffff
`define    ZERO 		           0