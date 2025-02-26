`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2025 05:33:32 PM
// Design Name: 
// Module Name: behavlab5
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


module behavlab5(
             input logic [3:0]num,
            input logic [2:0]sel,
            output logic seg[6:0],
            output logic [7:0]an
    );
    always_comb
    begin
    case(num)
    4'b0000 : {seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]} = 7'b0000001;
    4'b0001 : {seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]} = 7'b0000001;
    4'b0010 : {seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]} = 7'b0000001;
    4'b0011 : {seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]} = 7'b0000001;
    4'b0100 : {seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]} = 7'b0000001;
    4'b0101 : {seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]} = 7'b0000001;
    4'b0110 : {seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]} = 7'b0000001;
    4'b0111 : {seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]} = 7'b0000001;
    4'b1000 : {seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]} = 7'b0000001;
    4'b1001 : {seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]} = 7'b0000001;
    4'b1010 : {seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]} = 7'b0000001;
    4'b1011 : {seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]} = 7'b0000001;
    4'b1100 : {seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]} = 7'b0000001;
    4'b1101 : {seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]} = 7'b0000001;
    4'b1110 : {seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]} = 7'b0000001;
    4'b1111 : {seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]} = 7'b0000001;
    endcase
    end
    
    always_comb
    begin
    case(sel)
    3'b000 : {an[0],an[1],an[2],an[3],an[4],an[5],an[6],an[7]} = 8'b01111111;
    3'b001 : {an[0],an[1],an[2],an[3],an[4],an[5],an[6],an[7]} = 8'b01111111;
    3'b010 : {an[0],an[1],an[2],an[3],an[4],an[5],an[6],an[7]} = 8'b01111111;
    3'b011 : {an[0],an[1],an[2],an[3],an[4],an[5],an[6],an[7]} = 8'b01111111;
    3'b100 : {an[0],an[1],an[2],an[3],an[4],an[5],an[6],an[7]} = 8'b01111111;
    3'b101 : {an[0],an[1],an[2],an[3],an[4],an[5],an[6],an[7]} = 8'b01111111;
    3'b110 : {an[0],an[1],an[2],an[3],an[4],an[5],an[6],an[7]} = 8'b01111111;
    3'b111 : {an[0],an[1],an[2],an[3],an[4],an[5],an[6],an[7]} = 8'b01111111;
    endcase
    end
endmodule
