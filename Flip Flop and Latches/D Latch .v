module d_latch(input en,d, output reg q);
  always@(*) begin
    if(en)
      q<=d;
    else
      q<=q;
  end
endmodule
