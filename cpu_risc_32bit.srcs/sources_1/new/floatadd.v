`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2017 05:18:51 PM
// Design Name: 
// Module Name: floatadd
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


module floatadd(
input [31:0] num1, num2,
output reg [31:0] sum);

wire sign;
wire dexp;
wire [7:0] mux8out;
wire [23:0] preshiftsmall;
wire [23:0] bigfrac;
wire [23:0] smallfrac;


floatcmp F1 (.num1(num1 [30:23]), .num2(num2 [30:23]), .sign(sign), .dexp(dexp)); 
floatmux8 M81 (.in0(num1 [30:23]), .in1(num1 [30:23]), .sel(sign), .out(mux8out));
floatmux24 M241 (.in0({num1[31], num1[22:0]}), .in1({num2[31], num2[22:0]}), .sel(sign), .out(preshiftsmall));
floatmux24 M242 (.in0({num1[31], num1[22:0]}), .in1({num2[31], num2[22:0]}), .sel(~sign), .out(bigfrac));
floatshift FS1 (.in(preshiftsmall), .shift(dexp), .out(smallfrac));

endmodule
