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
    output /*[3:0] D*/reg load,     // temporary width
    input [5:0] Opcode
    );
    always@(*)
    case(Opcode)
        6'h04:  load <= 1;
        default: load <= 0;
    endcase
endmodule
