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


module truncmult(
input [47:0] num,
output reg [22:0] truncated,
output reg [5:0] shift
    );
reg [47:0] shiftedfrac;    
integer i = 45;
always @ (*)
    begin
    if (num[47])
        begin
        shift = -1;
        truncated = num[46:24];
        end
    else if (num[46])
        begin
        shift = 0;
        truncated = num[45:23];    
        end
    else
        begin
            while (num[i] != 1)
                begin
                    i = i - 1;
                end
                shift = 46 - i;
                shiftedfrac = num << i;
                truncated = shiftedfrac[46:24];
        end    
    end    
endmodule
