`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2017 04:01:00 PM
// Design Name: 
// Module Name: floatingtest
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


module floattesting;

/*
module normalizeadd(
input [24:0] in,
output reg [5:0] shift,
output reg [22:0] out,
output reg zero
    );
*/
reg [31:0] in1, in2;
wire [31:0] product;

floatadd TEST (in1, in2, product);
always
    begin
    #5
    in1 = 32'b0011_1111_1100_0000_0000_0000_0000_0000;
    in2 = 32'b0100_0000_0010_0000_0000_0000_0000_0000;
    end
endmodule