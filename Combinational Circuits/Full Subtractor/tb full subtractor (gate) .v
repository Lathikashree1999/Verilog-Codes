module tb_full_subtractor;
    reg a,b,Cin;
    wire B,D;
    full_subtarctor FS(a,b,Cin,B,D);
    initial begin
        $monitor("At time %0h: a=%b,b%b,Cin=%b,Difference=%b,Borrow=%b",$time,a,b,Cin,B,D);
        a=0;b=0;Cin=0;#1;
        a=0;b=0;Cin=1;#1;
        a=0;b=1;Cin=0;#1;
        a=0;b=1;Cin=1;#1;
        a=1;b=0;Cin=0;#1;
        a=1;b=0;Cin=1;#1;
        a=1;b=1;Cin=0;#1;
        a=1;b=1;Cin=1;#1;
    end
endmodule
