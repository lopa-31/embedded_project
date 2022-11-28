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
    output out[10],
    input int in[10],
    input bit rst
);
byte indexMax = -1;
int max = -2147483647;
reg temp[10];

always_comb begin
    if(rst == 0) begin
        for(int i = 0; i < 10; i++) begin
            if(max < in[i]) begin
                max = in[i];
                indexMax = i;
            end
        end
        for(int i = 0; i < 10; i++) begin
            if(i == indexMax) temp[i] = 1;
            else temp[i] = 0;
        end
    end else begin
        for(int i = 0; i < 10; i++) begin
            temp[i] = 0;
        end
    end
end

assign out = temp;
endmodule
