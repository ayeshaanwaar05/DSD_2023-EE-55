`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 10:40:19 PM
// Design Name: 
// Module Name: rgb_driver
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


module rgb_driver(
    input logic [1:0] a,
    input logic [1:0] b,
    output logic R,
    output logic G,
    output logic B
    );
    assign R = (~b[1]&~b[0])|(a[1]&~b[0])|(a[1]&a[0])|(a[0]&~b[1])|(a[1]&~b[1]);
    assign G = (~a[1]&~a[0])|(~a[1]&b[0])|(~a[1]&b[1])|(b[1]&b[0])|(~a[0]&b[1]);
    assign B = (~a[0]&b[0])|(~a[1]&b[1])|(a[1]&~b[1])|(a[0]&~b[0]);
endmodule
