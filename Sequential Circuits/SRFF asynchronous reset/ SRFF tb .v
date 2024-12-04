module srff_tb;
    reg clk,rst;
    reg s,r;
    wire q,q_bar;
    srff_asyn_rst srff(clk,rst,s,r,q,q_bar);
    
    always #2 clk=~clk;
    initial begin 
        clk=0;rst=0;s=0;r=0;
        $display("Reset=%b --> q=%b,q_bar=%b",rst,q,q_bar);
        #3 rst=1;
        $display("Reset=%b --> q=%b,q'=%b",rst,q,q_bar);
        
        drive(2'b00);
        drive(2'b01);
        drive(2'b10);
        drive(2'b11);
        
        $finish;
    end
    
    task drive(input [1:0]ip);
        begin
            @(posedge clk);
            {s,r}=ip;
            #2;
            $display("s=%b, r=%b, q=%b, q_bar=%b",s,r,q,q_bar);
        end
    endtask
        
endmodule
