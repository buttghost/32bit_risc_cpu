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
input [22:0] larger, smaller,
input lsign, ssign, //sign bits of numbers
output reg [23:0] sum, //to handle in case of overflow
output reg sign);

always
    begin
    sum <= (lsign == ssign) ? larger + smaller : larger - smaller;
    //if the signs agree, then the values are added together, if not they take away from each other
    sign <= lsign;  //no matter what, the sign bit is equal to the sign bit of the larger number
    end
endmodule
