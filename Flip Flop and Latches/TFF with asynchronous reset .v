module tff(
  input clk,rst,t,
  output reg q,
  output q_bar
);
  always@(posedge clk or negedge rst) begin
    if(!rst) q<=0;
    else begin
      q <= t?~q:q;
    end
  end
  assign q_bar=~q;
endmodule
