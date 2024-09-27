module tb;
  reg i0,i1,sel;
  wire y;
  mux_2x1 mux(i0,i1,sel,y);
  
  initial begin
    $monitor("i0=%b,i1=%b,sel=%b,y=%b",i0,i1,sel,y);
    i0=0;i1=1;
    sel=0;
    #2;
    sel=1;
  end
  
endmodule
