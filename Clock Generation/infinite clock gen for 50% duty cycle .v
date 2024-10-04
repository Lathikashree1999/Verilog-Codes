module clock_gen;
  reg clk;

  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 50% duty cycle, 10ns period
  end

endmodule
