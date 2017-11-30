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

reg reset;

DP DUT (reset);

always
    begin
    reset = 1;
    #5
    reset = 0;
    #250
    
    $display("Finished");
    $stop;
    end
endmodule
