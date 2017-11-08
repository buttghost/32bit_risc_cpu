`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2017 10:40:21 AM
// Design Name: 
// Module Name: Shifter
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


module Shifter(
    output reg [31:0] DOut,
    input signed [31:0] D1,
    input [31:0] D2,
    input SLI,
    input SRI
    );
    wire [1:0] shift = {SLI, SRI};
    always@(*)
    begin
        case(shift)
        2'b01: DOut <= D1 >>> D2;
        2'b10: DOut <= D1 << D2;
        endcase
    end
endmodule
