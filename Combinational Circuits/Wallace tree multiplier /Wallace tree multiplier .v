module half_adder(input a, b, output s0, c0);
  assign s0 = a ^ b;
  assign c0 = a & b;
endmodule

module full_adder(input a, b, cin, output s0, c0);
  assign s0 = a ^ b ^ cin;
  assign c0 = (a & b) | (b & cin) | (a & cin);
endmodule


module wallace_tree_multiplier(input [3:0] A, B, output [7:0] z);
  reg signed p[8][4];
  wire [17:0] c; 
  wire [10:0] s; 

  genvar g;
  reg signed [7:0]M;
  assign {M[7:4],M[3:0]} = {{4{A[3]}},A}; 
;
  
  generate
    for(g = 0; g<4; g++) begin
      and a0(p[g][0], M[g], B[0]);
      and a1(p[g][1], M[g], B[1]);
      and a2(p[g][2], M[g], B[2]);
      and a3(p[g][3], M[g], B[3]);
    end
  endgenerate
  
  generate
    for(g = 0; g<4; g++) and a4i(p[4][g], M[4], B[g]);
    for(g = 0; g<3; g++) and a5i(p[5][g], M[5], B[g]);
    for(g = 0; g<2; g++) and a6i(p[6][g], M[6], B[g]);
  endgenerate
  and a70(p[7][0], M[7], B[0]);
  
  assign z[0] = p[0][0];

  //row 0
  half_adder h0(p[0][2], p[1][1], s[0], c[0]);

  generate
    for(g = 0; g<5; g++) full_adder fg0(p[g][3], p[g+1][2], p[g+2][1], s[g+1], c[g+1]);
  endgenerate

  half_adder h1(s[1], p[3][0], s[6], c[6]);
 
  generate
    for(g = 0; g<4; g++) full_adder fg1(s[g+2], p[g+4][0], c[g+1], s[g+7], c[g+7]);
  endgenerate

  half_adder h2(p[0][1], p[1][0], z[1], c[11]);
  full_adder f9(s[0], p[2][0], c[11], z[2], c[12]);
  full_adder f10(s[6], c[0], c[12], z[3], c[13]);

  generate
    for(g = 0; g<4; g++) full_adder fg2(s[g+7], c[g+6], c[g+13], z[g+4], c[g+14]);
  endgenerate
endmodule
