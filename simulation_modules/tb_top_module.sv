`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2022 14:26:47
// Design Name: 
// Module Name: tb_top_module
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


module tb_top_module;
bit out[10];
bit [1:0] flag;

top_module inst0 (.out(out), .flag(flag));

initial begin 
    flag = 0;
    #100 flag = 1;
    #100 flag = 0;
    #100 flag = 2;
    #100 flag = 0;
    #100 flag = 3;
end

endmodule
