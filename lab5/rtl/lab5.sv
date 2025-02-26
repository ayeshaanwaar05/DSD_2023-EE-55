`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2025 10:09:02 PM
// Design Name: 
// Module Name: lab5
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


module lab5(input logic [3:0]num,
            input logic [2:0]sel,
            output logic seg[6:0],
            output logic [7:0]an
    );
    // Assigning inputs to segment 
    assign seg[6]=(~num[3]&~num[2]&~num[1]&num[0])|(~num[3]&num[2]&~num[1]&~num[0])|(num[3]&num[2]&~num[1]&num[0])|(num[3]&~num[2]&num[1]&num[0]);
    assign seg[5]=(~num[3]&num[2]&~num[1]&num[0])|(num[3]&num[2]&num[1]&~num[0])|(num[3]&num[1]&num[0])|(num[2]&num[1]&~num[0]);
    assign seg[4]=(~num[3]&~num[2]&num[1]&~num[0])|(num[3]&num[2]&num[1])|(num[3]&num[2]&~num[0]);
    assign seg[3]=(~num[3]&~num[2]&~num[1]&num[0])|(~num[3]&num[2]&~num[1]&~num[0])|(num[2]&num[1]&num[0])|(num[3]&~num[2]&num[1]&~num[0]);
    assign seg[2]=(~num[3]&num[0])|(~num[3]&num[2]&~num[1])|(~num[2]&~num[1]&num[0]);
    assign seg[1]=(num[3]&num[2]&~num[1]&num[0])|(~num[3]&~num[2]&num[0])|(~num[3]&~num[2]&num[1])|(~num[2]&num[1]&num[0]);
    assign seg[0]=(~num[3]&~num[2]&~num[1])|(num[3]&num[2]&~num[1]&~num[0])|(~num[3]&num[2]&num[1]&num[0]);
    // Assigning inputs to selector
    assign an[0]=sel[2]|sel[1]|sel[0];
    assign an[1]=sel[2]|sel[1]|~sel[0];
    assign an[2]=sel[2]|~sel[1]|sel[0];
    assign an[3]=sel[2]|~sel[1]|~sel[0];
    assign an[4]=~sel[2]|sel[1]|sel[0];
    assign an[5]=~sel[2]|sel[1]|~sel[0];
    assign an[6]=~sel[2]|~sel[1]|sel[0];
    assign an[7]=~sel[2]|~sel[1]|~sel[0];
endmodule
