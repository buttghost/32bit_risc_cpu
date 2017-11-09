`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2017 02:47:20 PM
// Design Name: 
// Module Name: DP
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


module DP();
reg clk;
initial clk = 0;
always #5 clk = ~clk;

// IF
wire [31:0] D_pc;   // bus between PC and IM
wire [25:0] D_j;    // jump bus to extension
reg [31:0] D_b;    // calculated branch bus
PC pc (.Count(D_pc),    // output to IM
       .Jump({6'b0, D_j}),     // input from IM, extended 6 bit 0's
       .Branch(D_b),   // input from branch calculation
       .sel_j(),    // input from opc dec
       .sel_b(),    // input from opc dec
       .clk(clk),
       .reset());
wire [31:0] D_im;   // bus between IM and IR
IMem im (.AIn(D_pc),    // input from PC
         .DOut(D_im));      // output to IR
wire [5:0] D_opc;   // bus between IR and OPC DEC
wire [4:0] D_rs1;   // addr bus for rs1
wire [4:0] D_rs2;   // addr bus for rs2 or rd in imm
wire [4:0] D_rd;    // addr bus for rd
wire [15:0] D_ab;   // ALU or branch bus to extension
IR ir (.OPC(D_opc),      // to OPC DEC
       .RS_RS1(D_rs1),   // to RF
       .RD_RS2(D_rs2),   // to RF
       .RD(D_rd),       // to mux then flipflop
       .Imm_J(D_j),    // to extension then PC
       .Imm_AB(D_ab),   // to ALU or branch calculation
       .Data(D_im),     // input from IM
       .clk(clk));
wire [31:0] D_prev_pc;
flip_flop ir_phase (.d(D_pc),       // from PC
                    .clk(clk),
                    .reset(),
                    .q(D_prev_pc));      // to branch calculation
// branch adder
always@(*)
begin
D_b <= D_prev_pc + D_ab;
end
endmodule
