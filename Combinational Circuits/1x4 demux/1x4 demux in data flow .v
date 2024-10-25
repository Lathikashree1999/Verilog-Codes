module demux1x4(
  input sel0,sel1,
  input i,
  output [3:0] y
);
  assign y[0] = ~sel1 & ~sel0 & i;
  assign y[1] = ~sel1 & sel0 & i;
  assign y[2] = sel1 & ~sel0 & i;
  assign y[3] = sel1 & sel0 & i;
endmodule
