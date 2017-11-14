`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2017 05:23:56 PM
// Design Name: 
// Module Name: floatcmp
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


module floatcmp(
input [7:0] num1, num2,
output reg sign, dexp);

always
    begin
        sign <= (num1 < num2) ? 1 : 0;
        dexp <= (num1 < num2) ? (num2 - num1) : (num1 - num2);
    end
endmodule
