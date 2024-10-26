module cir_oscl(input clk,rst,A, output reg y);
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
  
  always@(state or A) begin
    case(state)
      s0 : begin
        if(A==0) begin
          next_state = s1;
          y = 1'b0;
        end
        else begin
          next_state = s2;
          y = 1'b1;
        end
      end
      
      s1 : begin
        if(A==0) begin
          next_state = s0;
          y = 1'b0;
        end
        else begin
          next_state = s3;
          y = 1'b1;
        end
      end
      
      s2 : begin
        if(A==0) begin
          next_state = s3;
          y = 1'b0;
        end
        else begin
          next_state = s0;
          y = 1'b1;
        end
      end
      
      s3 : begin
        if(A==0) begin
          next_state = s2;
          y = 1'b0;
        end
        else begin
          next_state = s1;
          y = 1'b1;
        end
      end
    endcase
  end
endmodule
  
