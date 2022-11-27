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

int temp[16];
always_comb begin
	if(rst == 0) begin
	   for(int i = rowPtr[rowIndex], j = 0; i < rowPtr[rowIndex+1] && j < 16; i = i + 1, j = j + 1) begin
		    temp[j] = val[i] * vector[col[i]];
	   end
	   
	   rowOutput = temp[0] + temp[1] + temp[2] + temp[3] + temp[4] 
	               + temp[5] + temp[6] + temp[7] + temp[8] + temp[9]
	               + temp[10] + temp[11] + temp[12] + temp[13] + temp[14] 
	               + temp[15];  
	 end
end
endmodule
