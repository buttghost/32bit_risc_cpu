`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2017 02:17:22 PM
// Design Name: 
// Module Name: floatcalc
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


module floatcalcadd(
input [23:0] larger, smaller,
input parity, //sign bits xor'd
output reg [24:0] sum //to handle in case of overflow
);

always
    begin
        if (parity == 0)
            begin
            sum = larger + smaller;
            end
        else
            begin
            sum = larger - smaller;
            end    
    end
endmodule
