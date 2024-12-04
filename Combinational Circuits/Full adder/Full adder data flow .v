module fulladder(x,y,Cin,Sum,Cout);
input x,y,Cin;
output Sum,Cout;

     assign Sum=x^y^Cin;
     assign Cout=(x&y)|(y&Cin)|(Cin&x);

endmodule
