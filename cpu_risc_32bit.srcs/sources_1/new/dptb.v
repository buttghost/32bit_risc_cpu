`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2017 12:51:43 PM
// Design Name: 
// Module Name: dptb
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


module dptb;

reg [31:0] instin, instinadd, insertmemdat, insertmemadd;
reg reset, finish;
wire [31:0] finaldata;

DP DUT (.finish(finish), .instin(instin), .instinadd(instinadd), .insertmemdat(insertmemdat), .insertmemadd(insertmemadd), .reset(reset), .finaldata(finaldata));

always
    begin
    reset = 1;
    finish = 0;
    insertmemadd = 32'h00000064;
    insertmemdat = 32'h00000008;
    #5
    instinadd = 32'h00000000;
    instin = 32'h10010064;
    #10
    instinadd = 32'h00000001;
    instin = 32'h4c1e0001;
    #10
    instinadd = 32'h00000002;
    instin = 32'h00000000;
    #10
    instinadd = 32'h00000003;
    #10
    instinadd = 32'h00000004;
    instin = 32'h44220001;
    #10
    instinadd = 32'h00000005;
    instin = 32'h00000000;
    #10
    instinadd = 32'h00000006;
    #10
    instinadd = 32'h00000007;
    #10
    instinadd = 32'h00000008;
    instin = 32'h04221800;
    #10
    instinadd = 32'h00000009;
    instin = 32'h48240001;
    #10
    instinadd = 32'h0000000a;
    instin = 32'h583e0005;
    #10
    instinadd = 32'h0000000b;
    instin = 32'h00000000;
    #10
    instinadd = 32'h0000000c;
    instin = 32'h0c4000c8;
    #10
    instinadd = 32'h0000000d;
    instin = 32'h4c650001;
    #10
    instinadd = 32'h0000000e;
    instin = 32'h50860001;
    #10
    instinadd = 32'h0000000f;
    instin = 32'h54000012;
    #10
    instinadd = 32'h00000010;
    instin = 32'h50650001;
    #10
    instinadd = 32'h00000011;
    instin = 32'h46860001;
    #10
    instinadd = 32'h00000012;
    instin = 32'h00000000;
    #10
    instinadd = 32'h00000013;
    #10
    instinadd = 32'h00000014;
    #10
    instinadd = 32'h00000015;
    instin = 32'h0ca000c9;
    #10
    instinadd = 32'h00000016;
    instin = 32'h0ca000ca;
    #5
    instin = 32'h00000000;
    instinadd = 32'h00000003;
    insertmemdat = 32'h00000000;
    insertmemadd = 32'h00000000;
    reset = 0;
    #170
    finish = 1;
    reset = 1;
    insertmemadd = 32'h000000c8;
    #10
    insertmemadd = 32'h000000c9;
    #10
    insertmemadd = 32'h000000ca;
    #10
    $display("Finished");
    $stop;
    end
endmodule
