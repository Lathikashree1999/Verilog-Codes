module t_latch(input enable, reset, t, output reg q);
  initial 
    q=0;
  always@(t or enable or reset) begin
    if(reset)
      q<=0;
    else if(enable) begin
      if(t==1)
        q<=~q;
      else
        q<=q;
    end
  end
endmodule
