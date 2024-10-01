module clk_gen;
  reg clk;
  
  initial begin 
    clk = 0;
  end
  
  always begin
    if(clk)
      #1 clk=1'b0;
    else
      #1 clk=1'b1;
  end
  
  initial begin
    $monitor("At time %0t : clk = %d",$time,clk);
    $dumpfile("waves.vcd");
    $dumpvars(0);
    #30 $finish;
  end
  
endmodule

/* OUTPUT
At time 0 : clk = 0
At time 1 : clk = 1
At time 2 : clk = 0
At time 3 : clk = 1
At time 4 : clk = 0
At time 5 : clk = 1
At time 6 : clk = 0
At time 7 : clk = 1
At time 8 : clk = 0
At time 9 : clk = 1
At time 10 : clk = 0
At time 11 : clk = 1
At time 12 : clk = 0
At time 13 : clk = 1
At time 14 : clk = 0
At time 15 : clk = 1
At time 16 : clk = 0
At time 17 : clk = 1
At time 18 : clk = 0
At time 19 : clk = 1
At time 20 : clk = 0
At time 21 : clk = 1
At time 22 : clk = 0
At time 23 : clk = 1
At time 24 : clk = 0
At time 25 : clk = 1
At time 26 : clk = 0
At time 27 : clk = 1
At time 28 : clk = 0
At time 29 : clk = 1 */
