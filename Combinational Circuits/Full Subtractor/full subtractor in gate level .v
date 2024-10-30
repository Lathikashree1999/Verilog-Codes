module full_subtractor(
  input a,b,c,
  output diff,borrow
);
  wire n1,n2,n3,n4,n5;
  xor g1(n1,a,b);
  not g2(n2,a);
  not g3(n3,n1);
  and g4(n4,n1,c);
  and g5(n5,n2,b);
  or g6(borrow,n4,n5);
  xor g7(diff,n1,c);
endmodule
