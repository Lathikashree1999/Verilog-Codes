module tb;
  reg sel0,sel1;
  reg i;
  wire [3:0]y;
  
  demux1x4 demux(sel0,sel1,i,y);
  
  initial begin
    $monitor("Sel1=%b,Sel0=%b,input=%b,output=%b",sel1,sel0,i,y);
    {sel1,sel0} = 2'b00; i=1; #1;
    {sel1,sel0} = 2'b01; i=1; #1;
    {sel1,sel0} = 2'b10; i=1; #1;
    {sel1,sel0} = 2'b11; i=1; #1;
    {sel1,sel0} = 2'b11; i=0; #1;
  end
  
endmodule
