`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025
// Design Name: 
// Module Name: rgb_driver_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for rgb_driver module
// 
// Dependencies: rgb_driver.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module rgb_driver_tb();
    logic [1:0] a;
    logic [1:0] b;
    logic R, G, B;
    rgb_driver UUT (
        .a(a),
        .b(b),
        .R(R),
        .G(G),
        .B(B)
    );

    initial begin
        // Apply all possible input combinations (2-bit values)
        a = 2'b00; b = 2'b00; #10;
        a = 2'b00; b = 2'b01; #10;
        a = 2'b00; b = 2'b10; #10;
        a = 2'b00; b = 2'b11; #10;
        a = 2'b01; b = 2'b00; #10;
        a = 2'b01; b = 2'b01; #10;
        a = 2'b01; b = 2'b10; #10;
        a = 2'b01; b = 2'b11; #10;
        a = 2'b10; b = 2'b00; #10;
        a = 2'b10; b = 2'b01; #10;
        a = 2'b10; b = 2'b10; #10;
        a = 2'b10; b = 2'b11; #10;
        a = 2'b11; b = 2'b00; #10;
        a = 2'b11; b = 2'b01; #10;
        a = 2'b11; b = 2'b10; #10;
        a = 2'b11; b = 2'b11; #10;
        $stop;
    end

    // Monitor the output signals
    initial begin
        $monitor("a=%b, b=%b -> R=%b, G=%b, B=%b", a, b, R, G, B);
    end
endmodule
