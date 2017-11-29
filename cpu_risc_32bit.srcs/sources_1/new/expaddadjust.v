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
always @ (*)
    begin
        if (zero)
            begin
                finalexp <= 8'b0;
            end
        else
            begin
                if(adjust[5])
                    begin
                    finalexp <= exp - {4'b0,adjust[4:0]};
                    end
                else
                    begin
                    finalexp <= exp + {4'b0,adjust[4:0]};    
                    end
            end    
    end
endmodule
