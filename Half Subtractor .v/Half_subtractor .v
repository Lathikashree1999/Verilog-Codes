module Half_subtractor(a,b,B,D);
    input a,b;
    output B,D;
    assign D=a^b;
    assign B=~a^b;
endmodule
