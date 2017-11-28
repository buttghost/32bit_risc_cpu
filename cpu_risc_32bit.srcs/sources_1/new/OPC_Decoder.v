`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2017 12:47:48 PM
// Design Name: 
// Module Name: OPC_Decoder
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


module OPC_Decoder(
    output reg [23:0] D,     // temporary width
    input [5:0] Opcode
    );
    always@(Opcode)
    case(Opcode)
        5'h00: assign D = 24'b000000000000000000000001; // nop uses add
        5'h01: assign D = 24'b000000000000000000000001; // add
        5'h02: assign D = 24'b000000000000000000000010; // sub
        5'h03: assign D = 24'b000000000000000000000100; // store
        5'h04: assign D = 24'b000000000000000000001000; // load
        5'h05: assign D = 24'b000000000000000000010000; // move
        5'h06: assign D = 24'b000000000000000000100000; // sge
        5'h07: assign D = 24'b000000000000000001000000; // sle
        5'h08: assign D = 24'b000000000000000010000000; // sgt
        5'h09: assign D = 24'b000000000000000100000000; // slt
        5'h0a: assign D = 24'b000000000000001000000000; // seq
        5'h0b: assign D = 24'b000000000000010000000000; // sne
        5'h0c: assign D = 24'b000000000000100000000000; // and
        5'h0d: assign D = 24'b000000000001000000000000; // or
        5'h0e: assign D = 24'b000000000010000000000000; // xor
        5'h0f: assign D = 24'b000000000100000000000000; // not
        5'h10: assign D = 24'b000000001000000000000000; // movei
        5'h11: assign D = 24'b000000010000000000000000; // sli
        5'h12: assign D = 24'b000000100000000000000000; // sri
        5'h13: assign D = 24'b000001000000000000000000; // addi
        5'h14: assign D = 24'b000010000000000000000000; // subi
        5'h15: assign D = 24'b000100000000000000000000; // jump
        5'h16: assign D = 24'b001000000000000000000000; // branch
        5'h17: assign D = 24'b010000000000000000000000; // addf
        5'h18: assign D = 24'b100000000000000000000000; // mulf
    endcase
endmodule
