module reg_eg;
  reg y;
  wire a;
  always@(posedge clk)
    begin
      if(reset)
        y<=0;
      else
        y<=a;
    end
endmodule
