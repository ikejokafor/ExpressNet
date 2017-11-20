`timescale 1ns / 1ns
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
// Dependencies:
//  
//   
//
// Revision:
//
//
//
//
// Additional Comments:
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module address_incrementer
(
 input clk,
 input rst,

 input              initialize,          // init parameters
 input       [63:0] initialize_address,  // starting address
 input       [35:0] initialize_length,   // total length of data
 input              initialize_complete, // all data has been fetched

 input              transfer_parameters_update,  // update signal
 input       [35:0] transfer_parameters_size,    // update amount
 output reg  [63:0] transfer_parameters_address, // output address
 output reg  [35:0] transfer_parameters_length,  // remaing length of data to be fetched
 output reg         transfer_parameters_valid,
 output reg         transfer_parameters_complete // all data has been fetched
);
 
 reg  [35:0] transfer_parameters_size_r;
 reg  [2:0]  increment_seq;
 reg         carry;

 always @(posedge clk)
 begin
  if (rst | initialize)
  begin
   transfer_parameters_address  <= initialize_address;
   transfer_parameters_length   <= initialize_length;
   transfer_parameters_valid    <= initialize;
   transfer_parameters_complete <= initialize_complete;
   increment_seq                <= 3'b000;
  end
  else
  begin
   case (increment_seq)
    3'b000 :
     begin
      if (transfer_parameters_update)
      begin
       transfer_parameters_size_r    <= transfer_parameters_size;
       transfer_parameters_valid     <= 1'b0;
       carry          <= 1'b0;
       increment_seq  <= 3'b001;
      end
     end
    3'b001 : 
     begin
      {carry,transfer_parameters_address[15:0]}  <= transfer_parameters_address[15:0] + transfer_parameters_size_r[15:0] + {15'b0,carry};
      increment_seq  <= 3'b010;
     end
    3'b010 :
     begin
      {carry,transfer_parameters_address[31:16]}  <= transfer_parameters_address[31:16] + transfer_parameters_size_r[31:16] + {15'b0,carry};
      increment_seq  <= 3'b011;
     end
    3'b011 :
     begin
      {carry,transfer_parameters_address[47:32]}  <= transfer_parameters_address[47:32] + {12'b0,transfer_parameters_size_r[35:32]} + {15'b0,carry};
      increment_seq  <= 3'b100;
     end
    3'b100 :
     begin
      {carry,transfer_parameters_address[63:48]}  <= transfer_parameters_address[63:48] + {15'b0,carry};
      transfer_parameters_valid      <= 1'b1;
      transfer_parameters_length     <= transfer_parameters_length - transfer_parameters_size_r;
      transfer_parameters_complete   <= (transfer_parameters_length <= transfer_parameters_size_r) ? 1'b1 : 1'b0;
      increment_seq  <= 3'b000;
     end
   endcase
  end
 end
endmodule
