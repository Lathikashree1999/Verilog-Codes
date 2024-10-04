module tb;
  reg clk,din;
  wire dout;
  
  siso si(clk,din,dout);
  
  always #5 clk=~clk;
  
  initial begin
    clk=0;din=0;
    #10 din=1;
    #10 din=0;
    #10 din=1;
    #50 $finish;
  end
  
  initial begin
    $monitor("At time %0t : din=%d, dout=%d",$time,din,dout);
  end
  
endmodule
