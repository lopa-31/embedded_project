 `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2022 20:32:27
// Design Name: 
// Module Name: seven_segment
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


module seven_segment(
    output reg [6:0] led_out,
    input bit [9:0] in,
    input bit rst
);
always_comb begin
    if(rst == 0) begin
        if(in[0] == 1) led_out = 7'b0000001;
        else if(in[1] == 1) led_out = 7'b1001111;
        else if(in[2] == 1) led_out = 7'b0010010;  
        else if(in[3] == 1) led_out = 7'b0000110;
        else if(in[4] == 1) led_out = 7'b1001100;
        else if(in[5] == 1) led_out = 7'b0100100;
        else if(in[6] == 1) led_out = 7'b0100000;
        else if(in[7] == 1) led_out = 7'b0001111;
        else if(in[8] == 1) led_out = 7'b0000000;
        else if(in[9] == 1) led_out = 7'b0000100;
        // else led_out = 7'b1111111;   
    end
end
        
endmodule
