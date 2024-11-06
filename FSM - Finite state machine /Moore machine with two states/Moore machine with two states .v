module moore_machine(input clk, rst, j, k, output reg y);
  parameter s0 = 1'b0;
  parameter s1 = 1'b1;
  
  reg state, next_state;
  
  always@(posedge clk or posedge rst) begin
    if(rst)
      state <= s0;
    else
      state <= next_state;
  end
  
  always@(*) begin
    case(state)
      s0 : begin
        if(j==0)
          next_state = s0;
        else
          next_state = s1;
      end
      
      s1 : begin
        if(k==0)
          next_state = s1;
        else
          next_state = s0;
      end
    endcase
  end
  
  always@(*) begin
    case(state)
      s0 : y = 1'b0;
      s1 : y = 1'b1;
      default : y = 1'b0;
    endcase
  end
endmodule
      
