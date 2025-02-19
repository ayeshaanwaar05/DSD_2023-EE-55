`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025 08:40:43 AM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
 input logic a,
 input logic b,
 input logic c,
 output logic sum,
 output logic carry
 );

 assign sum = (a ^ b) ^ c;
 assign carry = (a & b) | (c&(a ^ b));

 endmodule
