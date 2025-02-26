`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench for lab5 module
//////////////////////////////////////////////////////////////////////////////////

module lab5_tb();
    logic [3:0] num; 
    logic [2:0] sel; 
    logic seg[6:0];  
    logic [7:0] an;  

   
    lab5 UUT (
        .num(num),
        .sel(sel),
        .seg(seg),  
        .an(an)     
    );

    // Apply test vectors
    initial begin
      
        
        num = 4'b0000; sel = 3'b000; #10;
        num = 4'b0001; sel = 3'b001; #10;
        num = 4'b0010; sel = 3'b010; #10;
        num = 4'b0011; sel = 3'b011; #10;
        num = 4'b0100; sel = 3'b100; #10;
        num = 4'b0101; sel = 3'b101; #10;
        num = 4'b0110; sel = 3'b110; #10;
        num = 4'b0111; sel = 3'b111; #10;
        num = 4'b1000; sel = 3'b000; #10;
        num = 4'b1001; sel = 3'b001; #10;
        num = 4'b1010; sel = 3'b010; #10;
        num = 4'b1011; sel = 3'b011; #10;
        num = 4'b1100; sel = 3'b100; #10;
        num = 4'b1101; sel = 3'b101; #10;
        num = 4'b1110; sel = 3'b110; #10;
        num = 4'b1111; sel = 3'b111; #10;
        
        $stop;
    end
   initial begin
         $monitor("num = %b , sel = %b -> seg = %p,  an = %b", num, sel, seg, an);
   end   
endmodule
