`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2017 05:20:56 PM
// Design Name: 
// Module Name: mux3to1
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


module mux3to1(
    output reg[31:0] Data,
    input [31:0] D0,
    input [31:0] D1,
    input [31:0] D2,
    input [1:0] sel
    );
    always@(sel)
    Data = (sel == 2'b00) ? D0 : (sel == 2'b01) ? D1 : (sel == 2'b10) ? D2 : 32'bX;
endmodule
