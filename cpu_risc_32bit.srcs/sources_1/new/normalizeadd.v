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
input [22:0] in,
output reg [5:0] shift,
output reg [22:0] out
    );

integer i = 0;  
integer check; 
always
    begin
        if (in == 0)
            begin
                shift = 5'b100000;
            end
        else
            begin
                check = in[23];
                while (check != 1)
                    begin
                        i = i + 1;
                        check = in[23 - i];
                    end
                shift = i;
                out = in << i;    
            end    
    end    
endmodule
