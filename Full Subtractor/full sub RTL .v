module full_subtractor(input a,b,c,
	output diff,borrow
);
  wire dif1,bor1,bor2;
  half_sub hs1(a,b,dif1,bor1);
  half_sub hs2(dif1,c,diff,bor2);
  assign borrow = bor1|bor2;
endmodule

module half_sub(input a,b,output diff,borrow);
  assign diff = a^b;
  assign borrow = ~a&b;
endmodule
