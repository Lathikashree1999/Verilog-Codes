module function_sum_example;
  reg [7:0] a, b;
  wire [7:0] result;

  function [7:0] sum;
    input [7:0] x, y;
    begin
      sum = x + y;
    end
  endfunction

  assign result = sum(a, b);

  initial begin
    a = 8;
    b = 12;
    #1 $display("Sum: %d", result); // output: 20
  end
endmodule
