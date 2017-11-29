`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2017 04:34:37 PM
// Design Name: 
// Module Name: floatmult
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


module normalmult(
input [24:0] in,
input [5:0] shift,
output reg [22:0] frac,
output reg [5:0] expchange
    );

always @ (*)
    begin
        frac = (in[0]) ? (in[23:1] + 1) : in[23:1];
        expchange = 47 - shift;
    end
endmodule
