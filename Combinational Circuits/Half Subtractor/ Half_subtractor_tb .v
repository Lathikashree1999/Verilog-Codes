module tb_half_subtractor;
    reg a,b;
    wire B,D;
    Half_subtractor HS(a,b,B,D);
    initial begin
        $monitor("At time %0t:a=%b,b=%b,Borrow=%b,Difference=%b",$time,a,b,B,D);
        a=0;b=0;#1;
        a=0;b=1;#1;
        a=1;b=0;#1;
        a=1;b=1;#1;
    end
endmodule
