`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2017 05:39:35 PM
// Design Name: 
// Module Name: IMem
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


module IMem(AIn, DOut, we, DIn, ADin);
input [31:0] AIn;
output reg [31:0] DOut;
input we; //tied to reset
input [31:0] DIn; //insert instructions
input [31:0] ADin;

reg [31:0] instructionmem [31:0];

always @ (*)
begin
    if (we)
        begin
        instructionmem [ADin] = DIn;
        DOut = 32'b0;
        end
    else
        begin    
        DOut = instructionmem [AIn];
        end
end

endmodule
