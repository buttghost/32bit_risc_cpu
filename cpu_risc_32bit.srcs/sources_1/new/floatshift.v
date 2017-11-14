`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2017 12:22:58 AM
// Design Name: 
// Module Name: floatshift
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


module floatshift(
input [23:0] in,
input [7:0] shift,
output reg [23:0] out
    );
    
always
    begin
        out <= {in[23], in[22:0] >> shift};
    end    
endmodule