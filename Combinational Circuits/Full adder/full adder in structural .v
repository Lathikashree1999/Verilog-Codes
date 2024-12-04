// Code your design here
module full_adder(
  input a,b,c,
  output sum,carry
);
  
  wire x,y,z;
  half_adder ha1(.a(a),.b(b),.s(x),.c(y));
  half_adder ha2(.a(x),.b(c),.s(sum),.c(z));
  or g1(carry,y,z);
  
endmodule


module half_adder(
  input a,b,
  output s,c
);
  
  xor xor_g1(s,a,b);
  and and_g2(c,a,b);
  
endmodule
