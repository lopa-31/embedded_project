`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2022 14:18:24
// Design Name: 
// Module Name: bias_adder
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


module bias_adder(
    output int out[10],
    input int in[10],
    input int bias[10],
    input bit rst
);
always_comb begin
    if(rst == 0) begin
        for(int i = 0; i < 10; i++) begin
            out[i] = in[i] + bias[i];
        end
    end else begin
        for(int i = 0; i < 10; i++) begin
            out[i] = 0;
        end
    end
end
endmodule
