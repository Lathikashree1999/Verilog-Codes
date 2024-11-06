module multiple_of_4_ones(input clk, rst, input [1:0] in, output reg y);
  parameter s0 = 2'b00; // rem 0, z = 1
  parameter s1 = 2'b01; // rem 1, z = 0
  parameter s2 = 2'b10; // rem 2, z = 0
  parameter s3 = 2'b11; // rem 3, z = 0
  
  reg [1:0] state, next_state;

  always @(posedge clk or posedge rst) begin
    if (rst)
      state <= s0;
    else
      state <= next_state;
  end

  always @(*) begin
    next_state = state;
    y = 0;

    case (state)
      s0 : begin
        y = 1;
        case (in)
          2'b00: next_state = s0;
          2'b01, 2'b10: next_state = s1;
          2'b11: next_state = s2;
        endcase
      end
      s1 : begin
        case (in)
          2'b00: next_state = s1;
          2'b01, 2'b10: next_state = s2;
          2'b11: next_state = s3;
        endcase
      end
      s2 : begin
        case (in)
          2'b00: next_state = s2;
          2'b01, 2'b10: next_state = s3;
          2'b11: next_state = s0;
        endcase
      end
      s3 : begin
        case (in)
          2'b00: next_state = s3;
          2'b01, 2'b10: next_state = s0;
          2'b11: next_state = s1;
        endcase
      end
    endcase
  end
endmodule
