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
input [31:0] num1, num2,
output reg sign, s,
output reg [7:0] dexp);

always
    begin
        s = (num2[30:0] > num1[30:0]);
        sign = (num2[30:0]>num1[30:0]) ? num2[31] : num1[31];
        dexp = (sign) ? (num2[30:23]-num1[30:23]) : (num1[30:23]-num2[30:23]);
    end
endmodule
