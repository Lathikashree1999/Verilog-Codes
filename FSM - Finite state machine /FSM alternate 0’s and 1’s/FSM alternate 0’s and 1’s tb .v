module tb;
  reg clk, rst, x;
  wire z;
  
  alternate_0s_1s alter(clk, rst, x, z);
  
  initial clk = 0;
  always #2 clk=~clk;
  
  initial begin
    x = 0;
    #1 rst = 0;
    #2 rst = 1;
    
    #3 x=1;
    #4 x=1;
    #4 x=0;
    #4 x=1;
    #4 x=0;
    #4 x=1;
    #4 x=1;
    #4 x=0;
    #4 x=1;
    #4 x=0;
    #4 x=1;
    #4 x=0;
    #4 x=1;
    #4 x=1;
    #10 $finish;
  end
  
  initial begin 
    $dumpfile("waves.vcd");
    $dumpvars;
  end
  
endmodule
    
