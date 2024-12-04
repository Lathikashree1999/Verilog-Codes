module full_adder(
  input a,b,c,
  output sum,carry
);
  
  wire [4:0] x;
  xor g1(x[0],a,b);
  and g2(x[1],a,b);
  xor g3(sum,x[0],c);
  and g4(x[2],x[0],c);
  or g5(carry,x[2],x[1]);
  
endmodule
  
