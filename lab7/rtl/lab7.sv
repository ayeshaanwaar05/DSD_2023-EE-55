`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2025 11:34:46 AM
// Design Name: 
// Module Name: seven_seg
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


module lab_7 (
    input logic clk,
    input logic reset,
    input logic write,
    input logic [2:0] sel,
    input logic [3:0] num,
    output logic [7:0] an,
    output logic [6:0] seg
);
    logic clock;   
    logic [3:0]reg0;
    logic [3:0]reg1;
    logic [3:0]reg2;
    logic [3:0]reg3;
    logic [3:0]reg4;
    logic [3:0]reg5;
    logic [3:0]reg6;
    logic [3:0]reg7;
    logic [3:0]mux_out;
    logic [2:0]count_sel;
    logic [2:0]final_sel;
    logic [7:0]en;
    freq_divider fdriver(
            .clock(clock),
            .clk(clk)
    );
    counter co_sel(
            .count_sel(count_sel),
            .clock(clock),
            .reset(reset)
    );
   
   sel selector(
      .final_sel(final_sel),
      .sel(sel),
      .count_sel(count_sel),
      .write(write)
   );
   enabler storage(
       .en(en),
       .sel(sel),
       .write(write)
  );

    registers ffs(
      .reg0(reg0), .reg1(reg1), .reg2(reg2), .reg3(reg3), .reg4(reg4), .reg5(reg5), .reg6(reg6), .reg7(reg7),
      .num(num),
      .clk(clk),
      .reset(reset),
      .en(en)
    );

  
    anode_decoder anode_inst (
        .final_sel(final_sel),
        .an(an)
        
    );

    // Multiplexer to select active digit data
    mux mux_inst (
        
        .reg0(reg0), .reg1(reg1), .reg2(reg2), .reg3(reg3), .reg4(reg4), .reg5(reg5), .reg6(reg6), .reg7(reg7),
        .mux_out(mux_out),.mux_sel(final_sel)
    );

    // Seven-segment decoder to display value
    display_decoder display_inst (
        .num(mux_out),
        .seg(seg)
    );

    
    
endmodule
module sel(
     output logic [2:0]final_sel, 
     input logic[2:0]sel, 
     input logic[2:0]count_sel, 
     input logic write
);
    always_comb
    begin

        if(write)
        begin
            final_sel = sel;
        end

        else if(~write) 
        begin
            final_sel = count_sel;
        end

    end
endmodule
module anode_decoder(
    input logic [2:0]final_sel,
    //input logic write;
    output logic [7:0]an
    
);
    
    always_comb
    begin
            case(final_sel)
                3'b000 : an = 8'b11111110;
                3'b001 : an = 8'b11111101;
                3'b010 : an = 8'b11111011;
                3'b011 : an = 8'b11110111;
                3'b100 : an = 8'b11101111;
                3'b101 : an = 8'b11011111;
                3'b110 : an = 8'b10111111;
                3'b111 : an = 8'b01111111;
                default: an = 8'b11111111;
            endcase
        end
    
  
endmodule
module enabler(output logic[7:0]en, input logic[2:0]sel, logic write
);
    always_comb
    begin
    if(write)
    begin
        case(sel)
        3'b000 : en = 8'b00000001;
        3'b001 : en = 8'b00000010;
        3'b010 : en = 8'b00000100;
        3'b011 : en = 8'b00001000;
        3'b100 : en = 8'b00010000;
        3'b101 : en = 8'b00100000;
        3'b110 : en = 8'b01000000;
        3'b111 : en = 8'b10000000;
        default: en = 8'b00000000;
        endcase
    end
    else
    begin
        en = 8'b00000000;
    end

    end
endmodule
module registers (
    input  logic clk,
    input  logic reset,
    input  logic [3:0] num,
    input  logic [7:0]en,                 // 8-bit enable signal for 8 registers
    output logic [3:0]reg0,logic [3:0]reg1,logic [3:0]reg2,logic [3:0]reg3,logic [3:0]reg4,logic [3:0]reg5,logic [3:0]reg6,logic [3:0]reg7
);
always_ff @(posedge clk) begin
    if (reset) begin
        reg0 <= 4'b0000;
        reg1 <= 4'b0000;
        reg2 <= 4'b0000;
        reg3 <= 4'b0000;
        reg4 <= 4'b0000;
        reg5 <= 4'b0000;
        reg6 <= 4'b0000;
        reg7 <= 4'b0000;
    end else if (~reset) begin
         if (en[0]==1) 
         begin
         reg0 <= num;
         end
         else if (en[1]==1) 
         begin 
         reg1 <= num;
         end
         else if (en[2]==1) 
         begin 
         reg2 <= num;
         end
         else if (en[3]==1) 
         begin 
         reg3 <= num;
         end
         else if (en[4]==1) 
         begin 
         reg4 <= num;
         end
         else if (en[5]==1) 
         begin 
         reg5 <= num;
         end
         else if (en[6]==1) 
         begin 
         reg6 <= num;
         end
         else if (en[7]==1) 
         begin 
         reg7 <= num;
         end
    end
end
endmodule
module mux(
       input logic [2:0]mux_sel,
       input logic [3:0]reg0,
       input logic [3:0]reg1,
       input logic [3:0]reg2,
       input logic [3:0]reg3,
       input logic [3:0]reg4,
       input logic [3:0]reg5,
       input logic [3:0]reg6,
       input logic [3:0]reg7,
       output logic [3:0] mux_out
);
     always_comb begin
        case (mux_sel)
           3'b000: mux_out = reg0;
           3'b001: mux_out = reg1;
           3'b010: mux_out = reg2;
           3'b011: mux_out = reg3;
           3'b100: mux_out = reg4;
           3'b101: mux_out = reg5;
           3'b110: mux_out = reg6;
           3'b111: mux_out = reg7;
        endcase
      end
endmodule
module display_decoder(
           input logic [3:0]num,
           output logic [7:0]seg
);
always_comb
    begin
    case(num)

        4'b0000: seg = 7'b0000001;  
        4'b0001: seg = 7'b1001111;  
        4'b0010: seg = 7'b0010010;  
        4'b0011: seg = 7'b0000110;  
        4'b0100: seg = 7'b1001100;  
        4'b0101: seg = 7'b0100100; 
        4'b0110: seg = 7'b0100000;  
        4'b0111: seg = 7'b0001111; 
        4'b1000: seg = 7'b0000000; 
        4'b1001: seg = 7'b0000100; 
        4'b1010: seg = 7'b0001000; 
        4'b1011: seg = 7'b1100000; 
        4'b1100: seg = 7'b0110001; 
        4'b1101: seg = 7'b1000010; 
        4'b1110: seg = 7'b0110000; 
        4'b1111: seg = 7'b0111000; 
        default: seg = 7'b1111111;
    endcase
    end
endmodule
module freq_divider(
    input logic clk,
    output logic clock
);

logic clk1,clk2,clk3,clk4,clk5,clk6,clk7,clk8,clk9,clk10,clk11,clk12,clk13,clk14,clk15,clk16;   
    toggle_ff ff_1(
	    .t_out(clk1),
	    .clk(clk)
    );
    toggle_ff ff_2(
	    .t_out(clk2),
	    .clk(clk1)
    );
    toggle_ff ff_3(
	    .t_out(clk3),
	    .clk(clk2)
    );
    toggle_ff ff_4(
	    .t_out(clk4),
	    .clk(clk3)
    );   
    toggle_ff ff_5(
	    .t_out(clk5),
	    .clk(clk4)
    );   
    toggle_ff ff_6(
	    .t_out(clk6),
	    .clk(clk5)
    );   
    toggle_ff ff_7(
	    .t_out(clk7),
	    .clk(clk6)
    );    
    toggle_ff ff_8(
	    .t_out(clk8),
	    .clk(clk7)
    );   
    toggle_ff ff_9(
	    .t_out(clk9),
	    .clk(clk8)
    );   
    toggle_ff ff_10(
	    .t_out(clk10),
	    .clk(clk9)
    );
    toggle_ff ff_11(
	    .t_out(clk11),
	    .clk(clk10)
    );
    toggle_ff ff_12(
	    .t_out(clk12),
	    .clk(clk11)
    );   
    toggle_ff ff_13(
	    .t_out(clk13),
	    .clk(clk12)
    );   
    toggle_ff ff_14(
	    .t_out(clk14),
	    .clk(clk13)
    );   
    toggle_ff ff_15(
	    .t_out(clk15),
	    .clk(clk4)
    );   
    toggle_ff ff_16(
	    .t_out(clk15),
	    .clk(clk5)
    );      
    toggle_ff ff_17(
	    .t_out(clock),
	    .clk(clk16)
    );

endmodule
module toggle_ff(input logic clk,output logic t_out
);

  initial
  begin
        t_out <= 0;
  end

  always @(posedge clk) 
  begin
    t_out <= ~t_out;
  end

endmodule

//counter selection\\
module counter(input logic clock,reset,output logic [2:0]count_sel
);
	
	always_ff @ (posedge clock)
	begin
	 if (reset)
		count_sel <= 0;
	 else 
		count_sel <= count_sel+1;
	end
	
endmodule


	


