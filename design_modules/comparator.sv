`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2022 14:18:24
// Design Name: 
// Module Name: comparator
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


module comparator(
    output bit [9:0] out,
    input int in[10],
    input bit rst
);
bit [3:0] indexMax = -1;
int max = -2147483647;

always_comb begin
    if(rst == 0) begin
        for(int i = 0; i < 10; i++) begin
            if(max < in[i]) begin
                max = in[i];
                indexMax = i;
            end
        end
        for(int i = 0; i < 10; i++) begin
            if(i == indexMax) out[i] = 1;
            else out[i] = 0;
        end
    end else begin
        for(int i = 0; i < 10; i++) begin
            out[i] = 0;
        end
    end
end

endmodule
