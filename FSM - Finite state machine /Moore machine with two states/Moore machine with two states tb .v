module tb;
  reg clk, rst, j, k;
  wire y;
  
  moore_machine moore(clk, rst, j, k, y);
  
  initial begin
    clk = 0;
    forever #2 clk = ~clk;
  end
  
  initial begin
    j = 0; k = 0;
    #1 rst = 1;
    #2 rst = 0;
    
    #3 j = 0; k = 1;
    #4 j = 1; k = 0;
    #4 j = 1; k = 1;
    #4 j = 0; k = 0;
    #4 j = 1; k = 0;
    #4 j = 1; k = 1;
    
    #10 $finish;
  end
  
  initial begin
    $monitor("At time %0t : clk = %b, rst = %b, j = %b, k = %b, y = %b",$time, clk, rst, j, k, y);
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
    
