`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2017 02:26:21 PM
// Design Name: 
// Module Name: normalizeadd
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


module normalizeadd(
input [23:0] in,
output reg [5:0] shift,
output reg [22:0] out,
output reg zero
    );

integer i = -1; //to cover overflow case
integer check; 
always
    begin
    if (in == 0)
        begin
        out = 0;
        zero = 1;
        end
    else
        begin    
        check = in[23];
        while (check != 1 && i <23)
            begin
                i = i + 1;
                check = in [i];
            end  
            out <= in >> i;
            zero <= 0; 
        end
    end    
endmodule
