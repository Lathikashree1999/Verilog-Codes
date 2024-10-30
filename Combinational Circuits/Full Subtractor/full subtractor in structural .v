module full_subtractor(
  input a,b,c,
  output diff,borrow
);
  wire d1,b1,b2;
  half_subtractor hs1(a,b,d1,b1);
  half_subtractor hs2(d1,c,diff,b2);
  or (borrow,b1,b2);
endmodule

module half_subtractor(
  input a,b,
  output diff,borrow
);
  wire n1;
  xor(diff,a,b);
  not(n1,a);
  and(borrow,n1,b);
endmodule
