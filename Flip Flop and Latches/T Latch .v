module t_latch(input enable, t, output reg q);
  initial 
    q=0;
  always@(t or enable) begin
    if(enable) begin
      if(t==1)
        q<=~q;
      else
        q<=q;
    end
  end
endmodule
