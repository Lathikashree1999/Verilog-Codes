module alternate_0s_1s(input clk, rst, x, output reg z);
  parameter s0 = 4'h0;
  parameter s1 = 4'h1;
  parameter s2 = 4'h2;
  parameter s3 = 4'h3;
  
  reg [3:0] state, next_state;
  
  always@(posedge clk or negedge rst) begin
    if(!rst)
      state <= s0;
    else
      state <= next_state;
  end
  
  always@(state or x) begin
    case(state)
      s0 : begin
        if(x==0) begin
          next_state = s1;
          z = 0;
        end
        else begin
          next_state = s2;
          z = 0;
        end
      end
      
      s1 : begin
        if(x==0) begin
          next_state = s2;
          z = 0;
        end
        else begin
          next_state = s1;
          z = 0;
        end
      end
        
      s2 : begin
        if(x==0) begin
          next_state = s3;
          z = 1;
        end
        else begin
          next_state = s2;
          z = 0;
        end
      end
      
      s3 : begin
        if(x==0) begin
          next_state = s1;
          z = 0;
        end
        else begin
          next_state = s0;
          z = 1;
        end
      end
    endcase
  end
endmodule
