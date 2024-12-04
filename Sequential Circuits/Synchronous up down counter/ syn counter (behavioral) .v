module syn_counter #(parameter size=4)(input clk,rst,up,
                                       output reg [3:0] cnt);
  always@(posedge clk) begin
    if(!rst) cnt<=4'b0;
    else begin
      if(up) cnt<=cnt+1;
      else cnt<=cnt-1;
    end
  end
endmodule
