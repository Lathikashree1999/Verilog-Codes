module half_adder(
  input a,b,
  output sum,carry
);
  xor xor_g1(sum,a,b);
  and and_g2(carry,a,b);
endmodule
