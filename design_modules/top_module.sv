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
    input [1:0] flag
);

int val1[23] = '{237, 216, 311, -247, -425, -317, 213, 213, -245, -280, -201, -265, -345, -313, -259, 205, 243, 246, 320, 227, 306, -332, 268};
int col1[23] = '{2, 5, 15, 1, 2, 3, 9, 23, 1, 2, 3, 15, 18, 19, 19, 21, 22, 2, 3, 3, 9, 9, 9};
int rowPtr1[11] = '{0, 2, 3, 8, 14, 17, 19, 21, 22, 22, 23};
int bias1[10] = '{3621, 1084, 4568, 9229, 3447, 3973, 3135, 6348, 6881, 4041};

int val2[9] = '{-164, 270, -259, -193, -263, -191, -282, 219, -182};
int col2[9] = '{2, 3, 4, 6, 4, 1, 2, 5, 5};
int rowPtr2[11] = '{0, 1, 4, 5, 5, 5, 5, 8, 9, 9, 9};
int bias2[10] = '{4978, 36, 9509, -2482, -2818, -3539, -2862, 5141, -2885, -2569};

int vector[25];

// Image 7
int vector1[25] = '{0, 0, 0, 0, 0, 0, 95, 69, 68, 0, 0, 0, 0, 53, 0, 0, 0, 51, 0, 0, 0, 0, 53, 0, 0}; 
// Image 1
int vector2[25] = '{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 76, 0, 0, 0, 0, 72, 0, 0, 0, 0, 6, 0, 0};
// Image 6
int vector3[25] = '{0, 0, 10, 0, 0, 0, 8, 0, 0, 0, 0, 95, 89, 0, 0, 0, 94, 17, 84, 0, 0, 0, 0, 0, 0};

int result1[10], result1a[10], result1b[10], result2[10], result2a[10];

// int i = 0;
bit rst = 1;

matrix_multiplication #(.n(10), .m(25), .nnz(23)) inst1(.result(result1), .vector(vector), .val(val1), .col(col1), .rowPtr(rowPtr1), .rst(rst));

bias_adder inst1a (.out(result1a), .in(result1), .bias(bias1), .rst(rst));

activation_function inst1b(.out(result1b), .in(result1a), .rst(rst));

matrix_multiplication #(.n(10), .m(10), .nnz(9)) inst2(.result(result2), .vector(result1b), .val(val2), .col(col2), .rowPtr(rowPtr2), .rst(rst));

bias_adder inst2a(.out(result2a), .in(result2), .bias(bias2), .rst(rst));

comparator inst3 (.out(out), .in(result2a), .rst(rst));

//always @(posedge clk && flag == 0) begin
//    vector[i] = vector_element;
//    i++;
//    if(i == 289) begin 
//        flag = 1;
//    end
//end

always @(flag) begin
        case(flag)
            0: begin
                rst = 1;
            end
            1: begin 
                vector = vector1;
                rst = 0;
            end  
            2: begin 
                vector = vector2;
                rst = 0;
            end  
            3: begin 
                vector = vector3;
                rst = 0;
            end  
        endcase
end
endmodule
