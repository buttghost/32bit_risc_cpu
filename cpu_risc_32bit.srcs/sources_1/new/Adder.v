`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2017 11:28:25 AM
// Design Name: 
// Module Name: Adder
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


module Adder(
    output reg [31:0] DOut,
    input [31:0] D1,
    input [31:0] D2,
    input cin
    );
    always@(*)
    begin
    DOut <= D1 + D2 + cin; 
    end
endmodule
