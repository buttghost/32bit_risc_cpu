`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2017 11:21:59 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
    output [31:0] DOut,
    input [31:0] Drs1,
    input [31:0] Drs2,
    input [31:0] Dimm
    );
    wire [31:0] d1, d2, d_add, d_sh;
    mux2to1 mux1 (.Data(d1),
                  .D0(Drs2),
                  .D1(Drs1),
                  .sel());
    mux2to1 mux2 (.Data(d2),
                  .D0(Dimm),
                  .D1(Drs2),
                  .sel());
    Adder adder (.DOut(d_add),   // to mux
                 .D1(d1),
                 .D2(d2),
                 .cin(/*SUBI ? 1 : 0*/));
    Shifter sh (.DOut(d_sh),    // to mux
                .D1(d1),
                .D2(d2),
                .SLI(),
                .SRI());
    // case to choose add, shift, or gate operations
    case()
    endcase
endmodule
