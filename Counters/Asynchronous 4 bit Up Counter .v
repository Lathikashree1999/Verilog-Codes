module asyn_up_counter(input clk, rst, output reg[3:0]count);
  always@(posedge clk or posedge rst) begin
    if(rst)
      count <= 4'b0000;
    else if(count < 4'b1111)
      count <= count+1;
    else
      count <= count;
  end
endmodule
