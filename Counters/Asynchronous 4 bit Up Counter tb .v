module tb;
  reg clk, rst;
  wire [3:0] count;
  
  asyn_up_counter upcounter(clk,rst,count);
  
  initial begin
      clk = 0;
      forever #5 clk = ~clk;
  end

  initial begin
    $monitor("Time = %0t, Reset = %b, Count = %b", $time, rst, count);
      rst = 1; #10;
      rst = 0; #200;
      rst = 1; #10;
      rst = 0; #50;
      $stop;
  end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
  
endmodule
