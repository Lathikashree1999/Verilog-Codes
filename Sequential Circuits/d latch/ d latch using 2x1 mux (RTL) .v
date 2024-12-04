module d_latch(
  input d,enable,
  output reg q
);

  always@(*) begin
    if(enable)
      q=d;
    else
      q=q;
  end
endmodule
