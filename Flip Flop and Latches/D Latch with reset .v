module d_latch(input en,rst,d, output reg q);
  always@(en or rst or d) begin
    if(!rst)
      q<=0;
    else if(en)
      q<=d;
  end
endmodule
