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
bit [9:0] out;
bit [6:0] led_out;
bit activate_anode;
bit [2:0] flag;

top_module inst0 (.out(out), .led_out(led_out), .activate_anode(activate_anode), .flag(flag));

initial begin 
    flag = 0;
    #100 flag = 1;
    #100 flag = 0;
    #100 flag = 2;
    #100 flag = 0;
    #100 flag = 3;
    #100 flag = 0;
end

endmodule
