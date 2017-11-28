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
reg sel_b;
PC pc (.Count(D_pc),    // output to IM
       .Jump({6'b0, D_j}),     // input from IM, extended 6 bit 0's
       .Branch(D_b),   // input from branch calculation
       .sel_j(),    // input from opc dec
       .sel_b(sel_b),    // input from opc dec
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
reg [31:0] D_imm;  // signed extended 32 imm for ALU
always@(*)
begin
D_imm = {{16{D_ab[15]}}, D_ab};
end
wire [31:0] D_prev_pc;
flip_flop ir_phase (.d(D_pc),       // from PC
                    .clk(clk),
                    .reset(),
                    .q(D_prev_pc));      // to branch calculation
// branch adder
always@(*)
begin
D_b <= D_prev_pc + D_imm;
end

// RF
wire [23:0] opc_rf, opc_alu;
OPC_Decoder decoder (.D(opc_rf),              // decoded opcode, to flipflop
                     .Opcode(D_opc));
wire [31:0] D_reg_d1, D_reg_d2;
reg_file rf (.DOut1(D_reg_d1),
             .DOut2(D_reg_d2),
             .AIn1(D_rs1),   // rs1
             .AIn2(D_rs2),   // rs2
             .AIn3(),   // rd 3 cycles later
             .DIn());   // data from WB stage
wire [31:0] D_alu_1, D_alu_2, D_alu_imm;
flip_flop #24 rf_phase_opc (.d(opc_rf),
                            .clk(clk),
                            .reset(),
                            .q(opc_alu));
flip_flop rf_phase_d1 (.d(D_reg_d1),   // from rf DOut1
                        .clk(clk),
                        .reset(),
                        .q(D_alu_1));      // to ALU
flip_flop rf_phase_d2 (.d(D_reg_d2),   // from rf DOut2
                       .clk(clk),
                       .reset(),
                       .q(D_alu_2));      // to ALU
flip_flop rf_phase_imm (.d(D_imm),       // from sext immediate value
                        .clk(clk),
                        .reset(),
                        .q(D_alu_imm));      // to ALU
wire [4:0] rd_rf_alu;
flip_flop #5 rf_phase_rd (.d(/*opc ? D_rs2 : D_rd*/),
                          .clk(clk),
                          .reset(),
                          .q(rd_rf_alu));
// comparer for sel_b
always@(*)
begin
if (D_reg_d1 === {{27{D_rs2[4]}}, D_rs2} /*&& branch from opc*/)
    sel_b <= 1;
else
    sel_b <= 0;
end

// ALU
wire [31:0] D_alu_val, D_mem_addr;
ALU alu (.DOut(D_alu_val),
         .Drs1(D_alu_1),    // need a mux to choose data input
         .Drs2(D_alu_2),
         .Dimm(D_alu_imm));
wire [31:0] D_mem_in;
flip_flop alu_phase_rs1 (.d(D_alu_1),   // to mem for store
                         .clk(clk),
                         .reset(),
                         .q(D_mem_in));
flip_flop alu_phase_alu (.d(D_alu_val),
                         .clk(clk),
                         .reset(),
                         .q(D_mem_addr));     // to data mem
wire [31:0] rd_alu_dm;
flip_flop alu_phase_rd (.d(rd_rf_alu),
                        .clk(clk),
                        .reset(),
                        .q(rd_alu_dm));
                        
// DM
wire [31:0] D_mem_out;
data_mem mem (.DOut(D_mem_out),
              .AIn(D_mem_addr),
              .DIn(D_mem_in),
              .WE());
endmodule
