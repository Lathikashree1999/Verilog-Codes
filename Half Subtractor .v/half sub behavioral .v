module half_subtractor(
  input a,b,
  output reg diff,borrow
);
  always@(*) begin
    diff=a^b;
    borrow=~a&b;
  end
endmodule
