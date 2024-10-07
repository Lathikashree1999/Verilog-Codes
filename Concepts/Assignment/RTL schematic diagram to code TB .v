module tb;
  reg x1,x2,x3;
  reg clk;
  wire g,f;
  rtl rt(x1,x2,x3,g,f);
  
  always #20 clk=~clk;
  initial begin
    $monitor("x1=%b,x2=%b,x3=%b,g=%b,f=%b",x1,x2,x3,g,f);
    
    x1=1;x2=1;x3=0;
  end
endmodule
