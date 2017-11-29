`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2017 12:42:58 PM
// Design Name: 
// Module Name: addexp
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


module addexp(
input [8:0] in1, in2,
output reg [8:0] out
    );
    
always @ (*)
begin
    out = in1 + in2;
end    
endmodule
