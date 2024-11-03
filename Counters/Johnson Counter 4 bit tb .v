module tb;
  reg clk, rst;
  wire [3:0] q;
  
  johnson_counter john(clk, rst, q);
  
  initial begin
      clk = 0;
      forever #5 clk = ~clk;
  end

  initial begin
    $monitor("Time = %0t, Reset = %b, q = %b", $time, rst, q);
      rst = 1; #10;
      rst = 0; #80;
      rst = 1; #10;
      rst = 0; #40;
      $stop;
  end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
  
endmodule
