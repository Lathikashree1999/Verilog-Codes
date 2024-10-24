module nand_gate(input a,b, output y);
  wire w;
  supply1 vdd;
  supply0 gnd;
  
  pmos p1(y,vdd,a);
  pmos p2(y,vdd,b);
  
  nmos n1(y,w,a);
  nmos m2(w,gnd,b);
  
endmodule
