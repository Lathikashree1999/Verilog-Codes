module dff_tb;
    reg clk,rst,d;
    wire q;
    dff_syn_rst dff(clk,rst,d,q);
    
    always #2 clk=~clk;
    initial begin
        clk=0;rst=0;
        d=0;
        
        #3 rst=1;
        
        repeat(6) begin
            d=$urandom_range(0,1);
            #3;
        end
        
        rst=0;#3;
        rst=1;
        
        repeat(6) begin
            d=$urandom_range(0,1);
            #3;
        end
        $finish;
    end    
endmodule
