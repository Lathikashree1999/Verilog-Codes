module clk_gen;
  reg clk;
  
  initial 
    clk=0;
  
  always #2 clk = clk+1;
  
  initial begin
    $monitor("At time %0t : clk = %d",$time,clk);
    $dumpfile("waves.vcd");
    $dumpvars(0);
    #30 $finish;
  end
  
endmodule

/* OUTPUT
At time 0 : clk = 0
At time 2 : clk = 1
At time 4 : clk = 0
At time 6 : clk = 1
At time 8 : clk = 0
At time 10 : clk = 1
At time 12 : clk = 0
At time 14 : clk = 1
At time 16 : clk = 0
At time 18 : clk = 1
At time 20 : clk = 0
At time 22 : clk = 1
At time 24 : clk = 0
At time 26 : clk = 1
At time 28 : clk = 0 */
