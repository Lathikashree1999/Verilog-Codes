module mux4x1(
  input sel0,sel1,
  input i0,i1,i2,i3,
  output y
);
  wire y0,y1;
  assign y0 = sel1 ? i1 : i0;
  assign y1 = sel1 ? i3 : i2;
  assign y = sel0 ? y1 : y0;
endmodule
