module half_subtractor(
  input a,b,
  output diff,borrow
);
  wire n1;
  xor g1(diff,a,b);
  not g2(n1,a);
  and g3(borrow,n1,b);
endmodule
