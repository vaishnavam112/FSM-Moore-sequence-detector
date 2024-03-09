`timescale 1ns / 1ps
module tb_moore_overlap();
    reg clk,in,arstn;
    wire out;
    integer i;
    moore_overlap moore(.clk(clk), .in(in), .arstn(arstn), .out(out));
    
    always #3 clk=~clk;
    
    initial 
    begin
    clk=0;
    arstn=0;
    in=0;
    #3;
    arstn=1;
    #1;in=1;#1
    in=1;#2
    in=0;#1
    in=1;#5
    in=1;#1
    in=1;#1
    in=0;#1
    in=1;#7
    in=1;#1
    in=0;#2
    in=1;#1
    in=1;#1
    in=0;#1
    in=1;#1
        
    #20
    $finish;    
    end
endmodule
