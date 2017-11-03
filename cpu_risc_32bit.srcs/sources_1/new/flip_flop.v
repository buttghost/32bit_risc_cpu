`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2017 12:31:57 PM
// Design Name: 
// Module Name: flip_flop
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


module flip_flop #(parameter WIDTH = 32) //we can change the bit width on instantiation
    (input [WIDTH-1:0] d,
    input clk, reset,
    output reg [WIDTH-1:0] q);
    
    always @ (posedge clk, posedge reset)
        begin
        if (reset == 1)
            begin
            q <= 32'b0;
            end
        else
            begin    
            q <= d;
            end
        end
endmodule
