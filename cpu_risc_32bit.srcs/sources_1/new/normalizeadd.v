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
input [24:0] in,
output reg [5:0] shift,
output reg [22:0] out,
output reg zero
    );

integer n = 0;
reg [24:0] preshift;
always @ (in)
begin
    if (in == 0)
        begin
            zero = 1;
            out = in [22:0];
        end
    
    else
        begin //need separate case to handle any needed shift right
            for (integer i = 0; i < 25; i = i + 1)
                begin
                    if (in[i] == 1)
                        begin
                            n = i;
                        end
                end
                shift = 24 - n;
                zero = 0;
                preshift = in >> shift;
                out = preshift [22:0];
        end    
end      
endmodule
