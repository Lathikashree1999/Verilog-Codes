module full_subtarctor(a,b,Cin,B,D);
    input a,b,Cin;
    output B,D;
    assign D=a^b^Cin;
    assign B=(~a&b)|(b&Cin)|(~a&Cin);
endmodule
