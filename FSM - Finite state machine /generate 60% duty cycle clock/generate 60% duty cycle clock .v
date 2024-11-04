module duty_cycle_clk_60(input in_clk, rst, output reg out_clk);
  reg [3:0] counter;
  
  always@(posedge in_clk or posedge rst) begin
    if(rst) begin
      counter <= 0;
      out_clk <= 0;
    end
    
    else begin
      counter <= counter+1;
      if(counter<6)
        out_clk <= 1;
      else 
        out_clk <= 0;
      if (counter==9)
        counter <= 0;
    end
  end
endmodule
