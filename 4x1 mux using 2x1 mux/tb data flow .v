module tb;
  reg sel0,sel1;
  reg i0,i1,i2,i3;
  wire y;
  
  mux4x1 mux(sel0,sel1,i0,i1,i2,i3,y);
  
  initial begin
    $monitor("sel0=%b,sel1=%b,i0=%b,i1=%b,i2=%b,i3=%b,y=%b",   			  sel0,sel1,i0,i1,i2,i3,y);
    repeat (10) begin
      {i3,i2,i1,i0} = $random;
    end
    repeat (10) begin 
      {sel1,sel0} = $random;
      #2;
    end
  end
endmodule
