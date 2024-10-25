module tb;
  reg a,b;
  wire y;
  
  nand_gate gate(a,b,y);
  
  initial begin
    a=0;b=0;#2;
    a=0;b=1;#2;
    a=1;b=0;#2;
    a=1;b=1;#2;
  end
   
  initial begin
    $monitor("a=%b,b=%b,y=%b",a,b,y);
  end
  
endmodule
