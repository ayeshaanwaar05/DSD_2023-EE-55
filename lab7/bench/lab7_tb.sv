module lab7_tb();

logic[3:0] num;
logic[2:0] sel;
logic reset,write,clk;
logic[7:0] anode;
logic[6:0] seg;

lab7 DUT(
.num(num),
.sel(sel),
.reset(reset),
.write(write),
.clk(clk),
.anode(anode),
.seg(seg)
);

initial 
begin
    clk = 1'b0;
    forever #5 clk <= ~clk; // Generate a 100 MHz t_out signal
end

initial
begin
    reset = 1;
end

initial
begin
    @(posedge clk);
    num <= 4'b0000;
    sel <= 3'b000; 
    write <= 1;
    reset <= 0; 
    @(posedge clk);
    num <= 4'b0001;
    sel <= 3'b001; 
    write <= 1;
    reset <= 0; 
    @(posedge clk);
    num <= 4'b0010;
    sel <= 3'b010; 
    write <= 1;
    reset <= 0; 
    @(posedge clk);
    num <= 4'b0011;
    sel <= 3'b011; 
    write <= 1;
    reset <= 0; 
    @(posedge clk);
    num <= 4'b0100;
    sel <= 3'b100; 
    write <= 1;
    reset <= 0; 
    @(posedge clk);
    num <= 4'b0101;
    sel <= 3'b101; 
    write <= 1;
    reset <= 0; 
    @(posedge clk);
    num <= 4'b0110;
    sel <= 3'b110; 
    write <= 1;
    reset <= 0; 
    @(posedge clk);
    num <= 4'b0111;
    sel <= 3'b111; 
    write <= 1;
    reset <= 0; 
    @(posedge clk);
    write <= 0;
    sel <= 0;
    @(posedge clk);
    write <= 0;
    sel <= 1;
    $stop;

end



endmodule