module dff(
  input clk, rst,
  input d,
  output reg q
);
  always@(posedge clk) begin
    if(rst)
    	q<=0;
    else
    	q<=q;
  end
endmodule

module rtl(
  input x1,x2,x3,
  output g,f
);
  wire d1,d2;
  assign d2 = x1&x2;
  dff df1(.d(d1),.q(f));
  assign d1=x3&f;
  dff df0(.d(d2),.q(g));
endmodule
