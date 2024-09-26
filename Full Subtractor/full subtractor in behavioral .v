module full_subtractor(
  input a,b,c,
  output reg diff,borrow
);
  always@(*) begin
    diff = a^b^c;
    borrow = (~a&b)|(b&c)|(c&~a);
  end
endmodule
