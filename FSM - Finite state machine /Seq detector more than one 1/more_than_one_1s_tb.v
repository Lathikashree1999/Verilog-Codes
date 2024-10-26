module more_than_one_1s_tb;
  reg clk,rst,x;
  wire z;
  
  more_than_one_1s ones(clk,rst,x,z);
  
  initial clk=0;
  always #2 clk=~clk;
  
  initial begin
    x=0;
    #1 rst=0;
    #2 rst=1;
    
    #3 x=0;
    #3 x=1;
    #3 x=1;
    #3 x=0;
    #3 x=0;
    #3 x=1;
    #3 x=1;
    #3 x=0;
    #3 x=0;
    #3 x=1;
    #3 x=0;
    #3 x=1;
    #3 x=1;
    #3 x=1;
    #3 x=1;
    #3 x=1;
    #10 $finish;
  end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
    
