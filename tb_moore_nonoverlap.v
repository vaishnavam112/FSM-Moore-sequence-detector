`timescale 1ns / 1ps
module tb_moore_nonoverlap();
    reg clk,in,arstn;
    wire out;
    integer i;
    moore_nonoverlap moore(.clk(clk), .in(in), .arstn(arstn), .out(out));
    
    always #5 clk=~clk;
    
    initial 
    begin
    clk=0;
    arstn=0;
    in=0;
    #3;
    arstn=1;
    in=1;#10
    in=1;#10
    in=0;#20
    in=1;#20
    in=1;#4
    in=1;#3
    in=0;#4
    in=1;#1
    in=1;#4
    in=0;#6
    in=1;#3
    in=1;#2
    in=0;#5
    in=1;#3
        
    #20
    $finish;    
    end
endmodule
