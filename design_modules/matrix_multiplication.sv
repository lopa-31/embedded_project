`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2022 14:18:24
// Design Name: 
// Module Name: matrix_multiplication
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


module matrix_multiplication
#(parameter n = 0, m = 0, nnz = 0)(
    output int result[n],
    input int vector[m],
    input int val[nnz],
	input int col[nnz],
	input int rowPtr[n + 1],
	input bit rst
);

row_multiplication #(.n(n), .m(m), .nnz(nnz)) inst0(.rowOutput(result[0]), .rowIndex(0), .vector(vector), .val(val), .col(col), .rowPtr(rowPtr), .rst(rst));

row_multiplication #(.n(n), .m(m), .nnz(nnz)) inst1(.rowOutput(result[1]), .rowIndex(1), .vector(vector), .val(val), .col(col), .rowPtr(rowPtr), .rst(rst));

row_multiplication #(.n(n), .m(m), .nnz(nnz)) inst2(.rowOutput(result[2]), .rowIndex(2), .vector(vector), .val(val), .col(col), .rowPtr(rowPtr), .rst(rst));

row_multiplication #(.n(n), .m(m), .nnz(nnz)) inst3(.rowOutput(result[3]), .rowIndex(3), .vector(vector), .val(val), .col(col), .rowPtr(rowPtr), .rst(rst));

row_multiplication #(.n(n), .m(m), .nnz(nnz)) inst4(.rowOutput(result[4]), .rowIndex(4), .vector(vector), .val(val), .col(col), .rowPtr(rowPtr), .rst(rst));

row_multiplication #(.n(n), .m(m), .nnz(nnz)) inst5(.rowOutput(result[5]), .rowIndex(5), .vector(vector), .val(val), .col(col), .rowPtr(rowPtr), .rst(rst));

row_multiplication #(.n(n), .m(m), .nnz(nnz)) inst6(.rowOutput(result[6]), .rowIndex(6), .vector(vector), .val(val), .col(col), .rowPtr(rowPtr), .rst(rst));

row_multiplication #(.n(n), .m(m), .nnz(nnz)) inst7(.rowOutput(result[7]), .rowIndex(7), .vector(vector), .val(val), .col(col), .rowPtr(rowPtr), .rst(rst));

row_multiplication #(.n(n), .m(m), .nnz(nnz)) inst8(.rowOutput(result[8]), .rowIndex(8), .vector(vector), .val(val), .col(col), .rowPtr(rowPtr), .rst(rst));

row_multiplication #(.n(n), .m(m), .nnz(nnz)) inst9(.rowOutput(result[9]), .rowIndex(9), .vector(vector), .val(val), .col(col), .rowPtr(rowPtr), .rst(rst));
endmodule
