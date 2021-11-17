`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company:       Microsystems Design Lab (MDL)
//             The Pennsylvania State University
// Engineer:      Esakkimuthu Geethanjali
//
// Create Date:      10/15/2015
// Design Name:   Extract descriptor 
// Module Name:     
// Project Name:  Future Store Analytics
// Target Devices:   
// Tool versions:
// Description:      
//
// Dependencies:
//
// Revision:
// Revision 1.0 - File Created
//
// Additional Comments:
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(* use_dsp48 = "yes" *)
module cnn_layer_accel_ce_macc_1
(
   rst				,

   opmode			,
   alumode          ,
   
   CE				,
   CLK				,
   
   C_IN				,
   P_IN				,

   
   A				,
   B				,
   C				,
   
   P				,
   C_OUT			,
   
   BCOUT			,
  
   CARRYCASCOUT		,

   PCOUT
);

	`include "awe.svh"


	parameter C_DELAY           = 3;
	parameter C_OUTPUT_DELAY    = 2;
	
   
   input 																		rst;
   
   input					 [8:0]												opmode;
   input					 [3:0]												alumode; 	
   
   
   input                                                                		CE; 
   input                                                                		CLK;
   input          signed      [(C_A_INPUT_WIDTH+C_B_INPUT_WIDTH)-1:0]         	P_IN;
   input          		      													C_IN;
   
   
   input          signed      [C_A_INPUT_WIDTH-1:0]                     		A;
   input          signed      [C_B_INPUT_WIDTH-1:0]                     		B;
   input          signed      [C_C_INPUT_WIDTH-1:0]                     		C;
   
   output      	  signed      [C_P_OUTPUT_WIDTH-1:0]   							P;
   output    				  [3:0] 											C_OUT;
   
   output        signed       [C_B_INPUT_WIDTH -1:0]							BCOUT;
   
   output         																CARRYCASCOUT;     	// 1-bit output: Cascade carry
   output 					  [C_P_OUTPUT_WIDTH-1:0] 							PCOUT;            	// 48-bit output: Casca
   
    wire  					  [C_A_INPUT_WIDTH-1:0]								ACOUT;            	// 30-bit output: A port cascade
    wire  					  [C_B_INPUT_WIDTH-1:0]  							BCOUT;            	// 18-bit output: B cascade
    
      // Control outputs: Control Inputs/Status Bits
    wire						          										OVERFLOW;           // 1-bit output: Overflow in add/acc
    wire          																PATTERNBDETECT; 	// 1-bit output: Pattern bar detect
    wire         							 									PATTERNDETECT;   	// 1-bit output: Pattern detect
    wire          																UNDERFLOW;          // 1-bit output: Underflow in add/acc
      // Data outputs: Data Ports
    wire   					   [3:0]      										CARRYOUT;           // 4-bit output: Carry
    
    wire 					   [7:0]  											XOROUT;             // 8-bit output: XOR data
	wire					   [C_A_INPUT_WIDTH-1:0] 							ACIN ;
	wire 					   [C_B_INPUT_WIDTH-1:0] 							BCIN;
	
	wire 					   [8:0]											current_opmode;
	wire 					   [3:0]											current_alumode;
	
	
	//assign   current_opmode =  (start_new_macc) ? opmode:9'b010000101;
	
	assign   current_opmode =  opmode;
	assign   current_alumode = alumode;
	
	
	


   // DSP48E2: 48-bit Multi-Functional Arithmetic Block
   //          Kintex UltraScale+
   // Xilinx HDL Language Template, version 2016.4

   DSP48E2 #(
      // Feature Control Attributes: Data Path Selection
      .AMULTSEL("A"),                    // Selects A input to multiplier (A, AD)
      .A_INPUT("DIRECT"),                // Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
      .BMULTSEL("B"),                    // Selects B input to multiplier (AD, B)
      .B_INPUT("DIRECT"),                // Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
      .PREADDINSEL("A"),                 // Selects input to pre-adder (A, B)
      .RND(48'h000000000000),            // Rounding Constant
      .USE_MULT("DYNAMIC"),             // Select multiplier usage (DYNAMIC, MULTIPLY, NONE)
      .USE_SIMD("ONE48"),                // SIMD selection (FOUR12, ONE48, TWO24)
      .USE_WIDEXOR("FALSE"),             // Use the Wide XOR function (FALSE, TRUE)
      .XORSIMD("XOR24_48_96"),           // Mode of operation for the Wide XOR (XOR12, XOR24_48_96)
      // Pattern Detector Attributes: Pattern Detection Configuration
      .AUTORESET_PATDET("NO_RESET"),     // NO_RESET, RESET_MATCH, RESET_NOT_MATCH
      .AUTORESET_PRIORITY("RESET"),      // Priority of AUTORESET vs. CEP (CEP, RESET).
      .MASK(48'h3fffffffffff),           // 48-bit mask value for pattern detect (1=ignore)
      .PATTERN(48'h000000000000),        // 48-bit pattern match for pattern detect
      .SEL_MASK("MASK"),                 // C, MASK, ROUNDING_MODE1, ROUNDING_MODE2
      .SEL_PATTERN("PATTERN"),           // Select pattern value (C, PATTERN)
      .USE_PATTERN_DETECT("NO_PATDET"),  // Enable pattern detect (NO_PATDET, PATDET)
      // Programmable Inversion Attributes: Specifies built-in programmable inversion on specific pins
      .IS_ALUMODE_INVERTED(4'b0000),     // Optional inversion for ALUMODE
      .IS_CARRYIN_INVERTED(1'b0),        // Optional inversion for CARRYIN
      .IS_CLK_INVERTED(1'b0),            // Optional inversion for CLK
      .IS_INMODE_INVERTED(5'b00000),     // Optional inversion for INMODE
      .IS_OPMODE_INVERTED(9'b000000000), // Optional inversion for OPMODE
      .IS_RSTALLCARRYIN_INVERTED(1'b0),  // Optional inversion for RSTALLCARRYIN
      .IS_RSTALUMODE_INVERTED(1'b0),     // Optional inversion for RSTALUMODE
      .IS_RSTA_INVERTED(1'b0),           // Optional inversion for RSTA
      .IS_RSTB_INVERTED(1'b0),           // Optional inversion for RSTB
      .IS_RSTCTRL_INVERTED(1'b0),        // Optional inversion for RSTCTRL
      .IS_RSTC_INVERTED(1'b0),           // Optional inversion for RSTC
      .IS_RSTD_INVERTED(1'b0),           // Optional inversion for RSTD
      .IS_RSTINMODE_INVERTED(1'b0),      // Optional inversion for RSTINMODE
      .IS_RSTM_INVERTED(1'b0),           // Optional inversion for RSTM
      .IS_RSTP_INVERTED(1'b0),           // Optional inversion for RSTP
      // Register Control Attributes: Pipeline Register Configuration
      .ACASCREG(2),                      // Number of pipeline stages between A/ACIN and ACOUT (0-2)
      .ADREG(1),                         // Pipeline stages for pre-adder (0-1)
      .ALUMODEREG(1),                    // Pipeline stages for ALUMODE (0-1)
      .AREG(2),                          // Pipeline stages for A (0-2)
      .BCASCREG(2),                      // Number of pipeline stages between B/BCIN and BCOUT (0-2)
      .BREG(2),                          // Pipeline stages for B (0-2)
      .CARRYINREG(1),                    // Pipeline stages for CARRYIN (0-1)
      .CARRYINSELREG(1),                 // Pipeline stages for CARRYINSEL (0-1)
      .CREG(0),                          // Pipeline stages for C (0-1)
      .DREG(1),                          // Pipeline stages for D (0-1)
      .INMODEREG(1),                     // Pipeline stages for INMODE (0-1)
      .MREG(1),                          // Multiplier pipeline stages (0-1)
      .OPMODEREG(1),                     // Pipeline stages for OPMODE (0-1)
      .PREG(1)                           // Number of pipeline stages for P (0-1)
   )
   DSP48E2_inst (
      // Cascade outputs: Cascade Ports
      .ACOUT(ACOUT),                   // 30-bit output: A port cascade
      .BCOUT(BCOUT),                   // 18-bit output: B cascade
      .CARRYCASCOUT(CARRYCASCOUT),     // 1-bit output: Cascade carry
      .MULTSIGNOUT(MULTSIGNOUT),       // 1-bit output: Multiplier sign cascade
      .PCOUT(PCOUT),                   // 48-bit output: Cascade output
      // Control outputs: Control Inputs/Status Bits
      .OVERFLOW(OVERFLOW),             // 1-bit output: Overflow in add/acc
      .PATTERNBDETECT(PATTERNBDETECT), // 1-bit output: Pattern bar detect
      .PATTERNDETECT(PATTERNDETECT),   // 1-bit output: Pattern detect
      .UNDERFLOW(UNDERFLOW),           // 1-bit output: Underflow in add/acc
      // Data outputs: Data Ports
      .CARRYOUT(C_OUT),             // 4-bit output: Carry
      .P(P),                           // 48-bit output: Primary data
      .XOROUT(XOROUT),                 // 8-bit output: XOR data
      // Cascade inputs: Cascade Ports
      .ACIN(ACIN),                     // 30-bit input: A cascade data
      .BCIN(BCIN),                     // 18-bit input: B cascade
      .CARRYCASCIN(C_IN),       // 1-bit input: Cascade carry
      .MULTSIGNIN(MULTSIGNIN),         // 1-bit input: Multiplier sign cascade
      .PCIN(P_IN),                     // 48-bit input: P cascade
      // Control inputs: Control Inputs/Status Bits
      .ALUMODE(current_alumode),               // 4-bit input: ALU control
      .CARRYINSEL(3'b000),         // 3-bit input: Carry select
      .CLK(CLK),                       // 1-bit input: Clock
      .INMODE(5'b00000),                 // 5-bit input: INMODE control
      //.OPMODE(9'b001001000),                 // 9-bit input: Operation mode
 //     .OPMODE(9'b000000101),                 // 9-bit input: Operation mode
	  .OPMODE(current_opmode),                 // 9-bit input: Operation mode
      
	  // Data inputs: Data Ports
      .A(A),                           // 30-bit input: A data
      .B(B),                           // 18-bit input: B data
      .C(C),                           // 48-bit input: C data
      .CARRYIN(1'b0),               // 1-bit input: Carry-in
      .D(),                           // 27-bit input: D data
      // Reset/Clock Enable inputs: Reset/Clock Enable Inputs
      .CEA1(CE),                     // 1-bit input: Clock enable for 1st stage AREG
      .CEA2(CE),                     // 1-bit input: Clock enable for 2nd stage AREG
      .CEAD(CE),                     // 1-bit input: Clock enable for ADREG
      .CEALUMODE(CE),           // 1-bit input: Clock enable for ALUMODE
      .CEB1(CE),                     // 1-bit input: Clock enable for 1st stage BREG
      .CEB2(CE),                     // 1-bit input: Clock enable for 2nd stage BREG
      .CEC(CE),                       // 1-bit input: Clock enable for CREG
      .CECARRYIN(CE),           // 1-bit input: Clock enable for CARRYINREG
      .CECTRL(CE),                 // 1-bit input: Clock enable for OPMODEREG and CARRYINSELREG
      .CED(CE),                       // 1-bit input: Clock enable for DREG
      .CEINMODE(CE),             // 1-bit input: Clock enable for INMODEREG
      .CEM(CE),                       // 1-bit input: Clock enable for MREG
      .CEP(CE),                       // 1-bit input: Clock enable for PREG
      .RSTA(rst),                     // 1-bit input: Reset for AREG
      .RSTALLCARRYIN(rst),   // 1-bit input: Reset for CARRYINREG
      .RSTALUMODE(rst),         // 1-bit input: Reset for ALUMODEREG
      .RSTB(rst),                     // 1-bit input: Reset for BREG
      .RSTC(rst),                     // 1-bit input: Reset for CREG
      .RSTCTRL(rst),               // 1-bit input: Reset for OPMODEREG and CARRYINSELREG
      .RSTD(rst),                     // 1-bit input: Reset for DREG and ADREG
      .RSTINMODE(rst),           // 1-bit input: Reset for INMODEREG
      .RSTM(rst),                     // 1-bit input: Reset for MREG
      .RSTP(rst)                   // 1-bit input: Reset for PREG
   );
   
   
   
   endmodule