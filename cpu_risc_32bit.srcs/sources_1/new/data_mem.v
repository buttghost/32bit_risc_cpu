`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2017 11:23:22 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem(
    output reg [31:0] DOut,
    input [31:0] AIn,
    input [31:0] DIn,
    input WE, preload,
    input [31:0] preloadadd, preloaddat,
    output reg [31:0] checkout,
    input finish
    );
    reg[31:0] mem [255:0];
    always@(WE, preloadadd)
    begin
        if (preload)
            begin
            if (finish == 0)
                begin
                mem[preloadadd] = preloaddat;
                end
             else
                begin   
                checkout = mem[preloadadd];
                end
            end
        else
            begin    
            if (WE == 1)
                mem[AIn] <= DIn;
            else
                DOut <= mem[AIn];
            end
    end
endmodule
