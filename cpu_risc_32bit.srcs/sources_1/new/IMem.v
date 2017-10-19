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


module IMem(AIn, DOut);
input [31:0] AIn;
output reg [31:0] DOut;

reg [31:0] instructionmem [15:0];

always @ (*)
begin
    assign DOut = instructionmem [AIn];
end

endmodule
