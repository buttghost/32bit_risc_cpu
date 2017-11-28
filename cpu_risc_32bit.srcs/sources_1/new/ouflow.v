`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2017 12:52:35 PM
// Design Name: 
// Module Name: ouflow
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


module fmtocpu(
input [31:0]in,
input invalid,
output reg [31:0] product
    );

always
begin
    product = (invalid) ? 32'b1 : in;
end    
endmodule
