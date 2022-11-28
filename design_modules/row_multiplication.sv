`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2022 14:18:24
// Design Name: 
// Module Name: row_multiplication
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


//(* use_dsp = "yes" *)
module row_multiplication
#(parameter n = 0, m = 0, nnz = 0)
(
    output int rowOutput,
    input int rowIndex,
    input int vector[m],
    input int val[nnz],
    input int col[nnz],
    input int rowPtr[n + 1],
    input bit rst
);
int curr, prev;
always_comb begin
    curr = 0; prev = 0;
	if(rst == 0) begin
	   for(int i = rowPtr[rowIndex], j = 0; i < rowPtr[rowIndex+1] && j < 16; i = i + 1, j = j + 1) begin
		     curr = prev + val[i] * vector[col[i]];
		     prev = curr;
	   end
	   rowOutput = prev;
	 end
	 else begin 
	   rowOutput = 0;
	 end
end
endmodule
