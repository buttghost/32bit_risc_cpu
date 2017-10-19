`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2017 11:23:22 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    output reg[31:0] DOut1,
    output reg[31:0] DOut2,
    input [4:0] AIn1,
    input [4:0] AIn2,
    input [4:0] AIn3,
    input [31:0] DIn
    );
    reg [31:0] rf [31:0];
    always@(*)
    begin
        DOut1 = rf[AIn1];
        DOut2 = rf[AIn2];
        rf[AIn3] = DIn;
    end
endmodule
