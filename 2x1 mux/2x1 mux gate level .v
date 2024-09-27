module mux_2x1(input i0,i1,
               input sel,
               output y);
  wire s0,y1,y2;
  and(y1,i0,s0);
  not(s0,sel);
  and(y2,i1,sel);
  or(y,y1,y2);
endmodule
