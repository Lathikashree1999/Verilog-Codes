module dff_asy_blocking(
  input clk, rst_n,
  input d,
  output reg a
  );
  reg q;
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) q = 0;
    else begin
          q= d;
          a=q;
    end
  end
endmodule
