module bcd_ripple_counter(input clk, rst, output reg [3:0] count);
  always@(posedge clk or posedge rst) begin
    if(rst)
      count <= 4'b0000;
    else if(count == 4'b1010)
      count <= 4'b0000;
    else
      count <= count+1;
  end
 endmodule
