module tb;
  reg[3:0] d;
  wire [1:0]y;
  
  encoder2_4 enc(d,y);
  
  initial begin
    $monitor("D=%b, y=%b",d,y);
    d=4'b0001;#5;
    d=4'b0010;#5;
    d=4'b0100;#5;
    d=4'b1000;#5;
    d=4'b0000;#5;
  end
  
endmodule
