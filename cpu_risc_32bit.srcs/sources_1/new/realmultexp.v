`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2017 12:44:30 PM
// Design Name: 
// Module Name: realmultexp
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


module realmultexp(
input [8:0] in,
output reg [8:0] out
    );
    
reg [8:0] signout;
    
always @ (*)
begin
signout = in + 127;
out = signout [7:0];
end    
endmodule
