module sr_latch(input s,r,enable, output reg q, output qn);
  always@(s or r or enable) begin
    if(enable) begin
      if(s==0 && r==0)
        q<=q;
      else if(s==0 && r==1)
        q<=0;
      else if(s==1 && r==0)
        q<=1;
      else
        q<=1'bx;
    end
  end
  assign qn=~q;
endmodule
