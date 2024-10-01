module gen_clk();
  reg clk;
  integer no_of_clk;
  
  initial begin
    clk=0;
    no_of_clk=0;
  end
  
  always #2 clk = ~clk;
  
  always@(posedge clk)
    no_of_clk = no_of_clk + 1;
  
  initial begin
    $monitor($time, "clock = %d",clk);
    #100 $display("No. of clock cycles = %d",no_of_clk);
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
  
endmodule

/* output 
                   0clock = 0
                   2clock = 1
                   4clock = 0
                   6clock = 1
                   8clock = 0
                  10clock = 1
                  12clock = 0
                  14clock = 1
                  16clock = 0
                  18clock = 1
                  20clock = 0
                  22clock = 1
                  24clock = 0
                  26clock = 1
                  28clock = 0
                  30clock = 1
                  32clock = 0
                  34clock = 1
                  36clock = 0
                  38clock = 1
                  40clock = 0
                  42clock = 1
                  44clock = 0
                  46clock = 1
                  48clock = 0
                  50clock = 1
                  52clock = 0
                  54clock = 1
                  56clock = 0
                  58clock = 1
                  60clock = 0
                  62clock = 1
                  64clock = 0
                  66clock = 1
                  68clock = 0
                  70clock = 1
                  72clock = 0
                  74clock = 1
                  76clock = 0
                  78clock = 1
                  80clock = 0
                  82clock = 1
                  84clock = 0
                  86clock = 1
                  88clock = 0
                  90clock = 1
                  92clock = 0
                  94clock = 1
                  96clock = 0
                  98clock = 1
No. of clock cycles =          25 */
