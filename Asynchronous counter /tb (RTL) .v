module tb;
  reg clk, rst_n;
  reg j, k;
  reg up;
  wire [3:0] q, q_bar;
  asyn_counter counter(clk, rst_n, j, k, up, q, q_bar);
  
  always #2 clk = ~clk;
  initial begin
    clk = 0; rst_n = 0; 
    up = 1;
    #4; rst_n = 1;
    j = 1; k = 1;
    #80;
    rst_n = 0;
    #4; rst_n = 1; up = 0;
    #50;
    $finish;
  end

  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
