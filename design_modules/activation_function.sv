`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2022 14:18:24
// Design Name: 
// Module Name: activation_function
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


module activation_function(
    output int out[10],
    input int in[10],
    input bit rst
);

always_comb begin
    if(rst == 0) begin
        for(int i = 0; i < 10; i++) begin
            if(in[i] < 0) out[i] = 0;
            else out[i] = in[i] / 100;
        end
    end
end
endmodule
