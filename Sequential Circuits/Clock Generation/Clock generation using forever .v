module gen_clk;
  reg clk;
  
  initial begin
    clk=0;
    forever
      #2 clk=~clk;
  end
  
  initial begin
    $monitor("At time %t : clock = %d",$time,clk);
    $dumpfile("waves.vcd");
    $dumpvars(0);
    #20 $finish;
  end
  
endmodule

/* OUTPUT
At time                    0 : clock = 0
At time                    2 : clock = 1
At time                    4 : clock = 0
At time                    6 : clock = 1
At time                    8 : clock = 0
At time                   10 : clock = 1
At time                   12 : clock = 0
At time                   14 : clock = 1
At time                   16 : clock = 0
At time                   18 : clock = 1 */
