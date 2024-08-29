module Ripple_carry_adder_subtractor_tb #(parameter size=4);
    reg [size-1:0]a,b;
    reg ctrl;
    wire [size-1:0]s,cout;
    Ripple_carry_adder_subtractor rca(a,b,ctrl,s,cout);
    
    initial begin
        $monitor("A=%b,B=%b,Ctrl=%b,Sum=%b,Cout[3]=%b",a,b,ctrl,s,cout[3]);
        
        ctrl = 0;
        a=1;b=0;#3;
        a=2;b=4;#3;
        a=4'hb;b=4'h6;#3;
        a=5;b=3;#3;
        
        ctrl = 1;
        a=1;b=0;#3;
        a=2;b=4;#3;
        a=4'hb;b=4'h6;#3;
        a=5;b=3;#3;
        #3 $finish;
     end
endmodule
