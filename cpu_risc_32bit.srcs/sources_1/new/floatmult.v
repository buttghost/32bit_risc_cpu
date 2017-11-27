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


module fracmult(
input [23:0] num1, num2,
output reg [47:0] product
    );

always
    begin
        product = num1 * num2;
    end    
endmodule
