module Half_adder(a,b,sum,Cout);
    input a,b;
    output sum,Cout;
    assign sum= a^b;
    assign Cout= a&b;
endmodule
