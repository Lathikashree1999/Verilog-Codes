module tb;
  reg a,b;
  wire diff,borrow;
  
  half_subtractor hs(a,b,diff,borrow);
  
  initial begin
    $monitor("a=%b, b=%b, difference=%b, borrow=%b",a,b,diff,borrow);
    repeat(10) begin
      {a,b} = $random;
      #2;
    end
  end
  
endmodule
