`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2017 05:22:53 PM
// Design Name: 
// Module Name: floatingmultiplier
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


module floatingmultiplier(
input [31:0] num1, num2,
output reg [31:0] product
    );
    
wire [31:0] out;
wire [8:0] realexp1;
wire [8:0] realexp2;
wire [8:0] preshiftexp;
wire [5:0] shift;
wire [8:0] prerealexp;
wire valid;
wire [47:0] fracprod;
wire [24:0] truncated;
wire [5:0] tnshift;//check

multsign MS1(.sign1(num1[31]), .sign2(num2[31]), .signout(out[31]));
realexp RE1(.in({0,num1[30:23]}), .out(realexp1));   
realexp RE2(.in({0,num2[30:23]}), .out(realexp2)); 
addexp AE1(.in1(realexp1), .in2(realexp2), .out(preshiftexp));
normmultexp NME(.in1(preshiftexp), .in2({3'b000, shift}), .out(prerealexp));
realmultexp RME(.in(prerealexp), .out({valid,out[30:23]}));
fmtocpu FTC(.in(out), .invalid(~valid), .product(product));
floatmult FM(.num1({1, num1[22:0]}), .num2({1, num2[22:0]}), .product(fracprod));
truncmult TM(.num(fracprod), .truncated(truncated), .shift(tnshift));
normalmult NM(.in(truncated), .shift(tnshift), .frac(out[22:0]), .expchange(shift));
endmodule
