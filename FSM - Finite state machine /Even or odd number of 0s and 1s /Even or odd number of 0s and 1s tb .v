module even_odd_fsm_tb;
    reg clk, rst
    reg [1:0] in;
    wire [1:0] out;
  
    even_odd evenout(clk, rst, in, out);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        in = 0;
      
        #10 reset = 0;

        in = 0; #10;  // State: S10 (Odd 0's, Even 1's)
        $display("Time: %0d, Input: %b, Output (out): %b", $time, in, out);
        
        in = 1; #10;  // State: S11 (Odd 0's, Odd 1's)
        $display("Time: %0d, Input: %b, Output (out): %b", $time, in, out);
        
        in = 1; #10;  // State: S10 (Odd 0's, Even 1's)
        $display("Time: %0d, Input: %b, Output (out): %b", $time, in, out);
        
        in = 0; #10;  // State: S00 (Even 0's, Even 1's)
        $display("Time: %0d, Input: %b, Output (out): %b", $time, in, out);
        
        in = 0; #10;  // State: S10 (Odd 0's, Even 1's)
        $display("Time: %0d, Input: %b, Output (out): %b", $time, in, out);
        
        in = 1; #10;  // State: S11 (Odd 0's, Odd 1's)
        $display("Time: %0d, Input: %b, Output (out): %b", $time, in, out);
        
        in = 1; #10;  // State: S10 (Odd 0's, Even 1's)
        $display("Time: %0d, Input: %b, Output (out): %b", $time, in, out);
        
        in = 1; #10;  // State: S11 (Odd 0's, Odd 1's)
        $display("Time: %0d, Input: %b, Output (out): %b", $time, in, out);
      
        #10 $finish;
    end
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end

endmodule
