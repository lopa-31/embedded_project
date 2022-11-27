`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2022 14:18:24
// Design Name: 
// Module Name: top_module
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


module top_module(
    output out[10],
    input flag
);

int val1[23] = '{229, 287, -233, 196, 290, 257, -344, -265, 247, 237, -254, -215, -240, -215, -216, -206, 229, 216, 231, 237, 308, 204, -202};
int col1[23] = '{9, 15, 23, 1, 2, 3, 9, 9, 3, 15, 2, 3, 14, 15, 18, 19, 9, 11, 5, 15, 22, 23, 15};
int rowPtr1[11] = '{0, 3, 7, 7, 8, 9, 10, 16, 18, 22, 23};

int val2[9] = '{157, -207, -203, 228, -207, 171, -318, -214, -172};
int col2[9] = '{2, 6, 2, 6, 7, 1, 8, 4, 0};
int rowPtr2[11] = '{0, 2, 5, 5, 5, 5, 5, 7, 8, 8, 9};

int vector[25] = '{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 0, 0, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0}; 

int bias1[10] = '{30, 3433, 4762, 4158, 564, -44, 8480, 3861, 2136, -138};
int bias2[10] = '{-215, 8327, 582, -1670, 1669, -94, 874, 670, -1667, -560};

int result1[10], result1a[10], result1b[10], result2[10], result2a[10], result2b[10];

int i = 0;
bit rst1 = 1, rst1a = 1, rst1b = 1, rst2 = 1, rst2a = 1, rst2b = 1, rst3 = 1;

matrix_multiplication #(.n(10), .m(25), .nnz(23)) inst1(.result(result1), .vector(vector), .val(val1), .col(col1), .rowPtr(rowPtr1), .rst(rst1));

bias_adder inst1a (.out(result1a), .in(result1), .bias(bias1), .rst(rst1a));

activation_function inst1b(.out(result1b), .in(result1a), .rst(rst1b));

matrix_multiplication #(.n(10), .m(10), .nnz(9)) inst2(.result(result2), .vector(result1b), .val(val2), .col(col2), .rowPtr(rowPtr2), .rst(rst2));

bias_adder inst2a(.out(result2a), .in(result2), .bias(bias2), .rst(rst2a));

comparator inst3 (.out(out), .in(result2a), .rst(rst3));

//always @(posedge clk && flag == 0) begin
//    vector[i] = vector_element;
//    i++;
//    if(i == 289) begin 
//        flag = 1;
//    end
//end

always_comb begin
    if(flag == 1) begin
        rst1 = 0;
        rst1a = 0;
        rst1b = 0;
        rst2 = 0;
        rst2a = 0;
        rst2b = 0;
        rst3 = 0;
    end
end
endmodule
