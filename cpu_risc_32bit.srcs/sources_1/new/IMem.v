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
reg [31:0] instructionmem [31:0];

initial
    begin
    instructionmem[0] = 32'h10010064; //load r0, r1, 100
    instructionmem[1] = 32'h4c1e0001; //addi r0, r30, 1
    instructionmem[2] = 32'h00000000; //nop
    instructionmem[3] = 32'h00000000; //nop
    instructionmem[4] = 32'h44220001; //sli r1, r2, 1
    instructionmem[5] = 32'h00000000; //nop
    instructionmem[6] = 32'h00000000; //nop
    instructionmem[7] = 32'h00000000; //nop
    instructionmem[8] = 32'h04221800; //add r1, r2, r3
    instructionmem[9] = 32'h48240001; //sri r1, r4, 1
    instructionmem[10] = 32'h583e0005; //bra r1, r30, 5
    instructionmem[11] = 32'h6319d000; //mulf r24, r25, r26
    instructionmem[12] = 32'h0c4000c8; //store r2, r0, 200
    instructionmem[13] = 32'h4c650001; //addi r3, r5, 1
    instructionmem[14] = 32'h50860001; //subi r4, r6, 1
    instructionmem[15] = 32'h54000015; //jump 21
    instructionmem[16] = 32'h00000000; //nop
    instructionmem[17] = 32'h50650001; //store r2, r0, 200
    instructionmem[18] = 32'h46860001; //addi r3, r5, 1
    instructionmem[19] = 32'h00000000; //subi r4, r6, 1
    instructionmem[20] = 32'h00000000; //nop
    instructionmem[21] = 32'h0ca000c9; //store r5, r0, 201
    instructionmem[22] = 32'h0cc000ca; //store r6, r0, 202
    instructionmem[23] = 32'h00000000; //nop
    instructionmem[24] = 32'h00000000; //nop
    instructionmem[25] = 32'h00000000; //nop
    instructionmem[26] = 32'h00000000; //nop
    end
always @ (*)
begin   
    DOut = instructionmem [AIn];
end
endmodule
