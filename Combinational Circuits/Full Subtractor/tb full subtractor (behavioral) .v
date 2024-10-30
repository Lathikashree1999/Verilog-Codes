module tb;
  reg a,b,c;
  wire diff,borrow;
  
  full_subtractor fs(.a(a),.b(b),.c(c),.diff(diff),.borrow(borrow));
  
  initial begin
    $monitor("a=%b, b=%b, c=%b, Difference=%b, borrow=%b",a,b,c,diff,borrow);
    repeat(10) begin
      {a,b,c}=$random;
      #2;
    end
  end
  
endmodule
