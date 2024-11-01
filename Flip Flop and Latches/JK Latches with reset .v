module jk_latch(input enable, reset, j, k, output reg q, output qn);
  initial
    q=0;
  
  always@(enable or reset or j or k) begin
    if(reset)
      q<=0;
    else if(enable) begin
      if(j==0 && k==0)
        q<=q;
      else if(j==0 && k==1)
        q<=0;
      else if(j==1 && k==0)
        q<=1;
      else
        q<=~q;
    end
  end
  assign qn=~q;
endmodule
