`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2017 12:41:38 PM
// Design Name: 
// Module Name: realexp
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


module realexp(
input [8:0] in,
output reg [8:0] out);

always @(*)
begin
    out = in - 127;
end
endmodule
