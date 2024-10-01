module dff_gate_level(
  input d,clk,
  output q,q_bar
);
  wire d_bar,n1,n2;
  not g1(d_bar,d);
  nand g2(n1,d,clk);
  nand g3(n2,d_bar,clk);
  nand g4(q,n1,q_bar);
  nand g5(q_bar,n2,q);
endmodule
