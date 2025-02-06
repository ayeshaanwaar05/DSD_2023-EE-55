`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2025 10:00:26 AM
// Design Name: 
// Module Name: dsdlab2
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


module dsdlab2(output x , y,
              input a,b,c
    
    
);
    assign x = (a|b)^(~c);
    assign y = (a|b)&(~(a & b)^(a|b));

endmodule
