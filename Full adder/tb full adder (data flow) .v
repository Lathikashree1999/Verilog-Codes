module fulladder_tb;
    wire Sum,Cout;
    reg x,y,Cin;
    fulladder tb(.x(x), .y(y) ,.Cin(Cin), .Sum(Sum), .Cout(Cout));
    initial begin
        $monitor("At time %0t: x=%b, y=%b, Cin=%b, Sum=%b, Cout=%b",$time,x,y,Cin,Sum,Cout);
        x=0; y=0; Cin=0; #1;
        x=0; y=0; Cin=1; #1;
        x=0; y=1; Cin=0; #1;
        x=0; y=1; Cin=1; #1;
        x=1; y=0; Cin=0; #1;
        x=1; y=0; Cin=1; #1;
        x=1; y=1; Cin=0; #1;
        x=1; y=1; Cin=1; #1;
        $dumpfile("fulladder.vcd");
        $dumpvars(1,fulladder_tb);
        #100;
        $finish;
    end
endmodule
