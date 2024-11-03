module tb;
  reg clk,rst;
  wire [3:0] op;
  
  lfsr lfsr1(clk,rst,op);
  
  always #2 clk=~clk;
  
  initial begin
    $monitor("op=%b",op);
    clk=0;rst=1;
    #5 rst=0;
    #50 $finish;
  end
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
