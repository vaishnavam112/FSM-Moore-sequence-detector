`timescale 1ns / 1ps
module moore_overlap #(parameter s0=00, s1=01, s2=10, s3=11)(
    input in,clk, arstn,
    output reg out
    );
    reg [1:0] current_state, next_state;
    //state transition
    always@(posedge clk,negedge arstn)
    begin if(~arstn)
         current_state<=s0;
         else current_state<=next_state;
    end 
    
    //next_state
    always@(current_state)
    begin
        case(current_state)
            s0:if(in==1)
                next_state=s1;
                else next_state=s0;
                
            s1:if(in==1)
                    next_state=s2;
                    else next_state=s0;
                    
             s2:if(in==0)
                    next_state=s3;
                    else next_state=s2;
                    
             s3:if(in==1)begin
                    next_state=s1;
                    out<=1'b1;end
                    else next_state=s0;
         endcase      
    end    
    
    //output logic
    always@(current_state)
    begin
        case(current_state)
        s0:out=0;
        s1:out=0;
        s2:out=0;
        s3:if(in==1)
                out=1;
                else out=0;
         endcase       
    
    end
    
endmodule
