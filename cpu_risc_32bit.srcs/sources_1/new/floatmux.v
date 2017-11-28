`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2017 05:27:55 PM
// Design Name: 
// Module Name: floatmux
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


module floatmux #(parameter WIDTH=32)(
input [WIDTH-1:0] in0, in1,
input sel,
output reg [WIDTH-1:0] out
    );
    
always
    begin
        out = (sel) ? in1 : in0;
    end    
endmodule

