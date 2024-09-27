module rca #(parameter size=4)
(
  input [size-1:0] a,b,
  input cin,
  output [size-1:0] sum,
  output cout
);
  assign {cout,sum} = a+b+cin;
endmodule
