module exp();              //Output a=1,b=1
  reg a,b;
   initial begin
     //$monitor("a=%b,b=%b",a,b);
    a<=1'b0;
    b<=1'b1;
    a<=1;
    #2 a<=b;
    $monitor("a=%b,b=%b",a,b);
  end
endmodule

module exp();           //Output a=x,b=1
  reg a,b;
   initial begin
    //$monitor("a=%b,b=%b",a,b);
    a<=1'b0;
    b<=1'b1;
    a<=1;
    a<=b;
    $monitor("a=%b,b=%b",a,b);
  end
endmodule

