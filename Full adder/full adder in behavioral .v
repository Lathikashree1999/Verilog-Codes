module full_adder(
  input a,b,c,
  output reg sum,carry
);
  
  always@(*) begin
    sum=a^b^c;
    carry=(a&b)|(b&c)|(c&a);
  end
  
endmodule
