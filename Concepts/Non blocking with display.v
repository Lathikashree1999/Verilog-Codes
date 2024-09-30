module exp();                //Output a=x,b=x
  reg a,b;
  
  initial begin
    a<=1'b0;
    b<=1'b1;
    a<=1;
    a<=b;
    $display("a=%b,b=%b",a,b);
  end
  
endmodule

module exp();                  //output a=1,b=1
  reg a,b;

   initial begin
    //$display("a=%b,b=%b",a,b);
    a<=1'b0;
    b<=1'b1;
    a<=1;
    #2 a<=b;
    $display("a=%b,b=%b",a,b);
  end
  
endmodule
