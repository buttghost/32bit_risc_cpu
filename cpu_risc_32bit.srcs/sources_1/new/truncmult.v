`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2017 04:34:37 PM
// Design Name: 
// Module Name: floatmult
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module truncmult(
input [47:0] num,
output reg [24:0] truncated,
output reg [5:0] shift
    );
integer i = 47;
integer j = 0;
always
    begin
       while (num[i] != 1)
           begin
               i = i - 1;//find the first 1
           end
       shift = i; //to shift the exponents
       for (j = 0; j < 24; j = j + 1)
           begin
               truncated [23-j] = num [i-j]; //make truncated only the parts after the first 1
           end
    end    
endmodule
