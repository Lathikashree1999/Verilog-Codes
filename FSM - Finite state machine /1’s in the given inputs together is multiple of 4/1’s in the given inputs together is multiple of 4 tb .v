module tb;
  reg clk, rst, in;
  wire y;

  multiple_of_4_ones mul4ones (clk, rst, in, y);

  initial begin 
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst = 1;
    in = 0;

    #10 rst = 0;

    // Test sequence: 01 (expecting z = 0 as number of 1's is 1)
    in = 0; #10;
    $display("Time: %0d, Input: %b, Output (y): %b", $time, in, y);
    in = 1; #10;
    $display("Time: %0d, Input: %b, Output (y): %b", $time, in, y);

    // Test sequence: 1111 (expecting z = 1 as number of 1's is 4)
    in = 1; #10;
    $display("Time: %0d, Input: %b, Output (y): %b", $time, in, y);
    in = 1; #10;
    $display("Time: %0d, Input: %b, Output (y): %b", $time, in, y);
    in = 1; #10;
    $display("Time: %0d, Input: %b, Output (y): %b", $time, in, y);
    in = 1; #10;
    $display("Time: %0d, Input: %b, Output (y): %b", $time, in, y);

    // Test sequence: 1101 (expecting z = 0 as number of 1's is 3)
    in = 1; #10;
    $display("Time: %0d, Input: %b, Output (y): %b", $time, in, y);
    in = 1; #10;
    $display("Time: %0d, Input: %b, Output (y): %b", $time, in, y);
    in = 0; #10;
    $display("Time: %0d, Input: %b, Output (y): %b", $time, in, y);
    in = 1; #10;
    $display("Time: %0d, Input: %b, Output (y): %b", $time, in, y);

    $finish;
  end

  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
