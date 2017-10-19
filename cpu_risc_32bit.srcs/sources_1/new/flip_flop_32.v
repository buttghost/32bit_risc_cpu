`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2017 11:53:37 PM
// Design Name: 
// Module Name: flip_flop_32
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


module flip_flop_32(
    output reg[31:0] Q,
    input [31:0] D,
    input clk
    );
    always@(posedge clk)
    begin
        Q = D;
    end
endmodule
