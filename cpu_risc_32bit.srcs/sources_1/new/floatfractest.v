`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2017 11:12:20 PM
// Design Name: 
// Module Name: floatfractest
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


module floatfractest;

reg [31:0] num, num2;
wire [31:0] test;

floatingmultiplier TEST (num, num2, test);

always
    begin
    #5
    num = 32'hbe800000;
    num2 = 32'hbe700000;
    end

endmodule
