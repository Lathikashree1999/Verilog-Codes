module nor_gate(input a,b, output y);
  wire w;
  supply1 vdd;
  supply0 gnd;
  
  pmos p1(w,vdd,a);
  pmos p2(y,w,b);
  
  nmos n1(y,gnd,a);
  nmos m2(y,gnd,b);
  
endmodule
