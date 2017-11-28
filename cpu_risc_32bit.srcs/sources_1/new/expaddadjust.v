`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2017 07:17:44 PM
// Design Name: 
// Module Name: expaddadjust
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


module expaddadjust(
input [7:0] exp,
input [5:0] adjust,
input zero,
output reg [7:0] finalexp
    );
always
    begin
        finalexp <= (zero) ? 0 : (exp + {2'b00, adjust});
    end
endmodule
