module cons_3_ones(input clk, rst, x, output reg z);
  parameter s0 = 2'b00;
  parameter s1 = 2'b01;
  parameter s2 = 2'b10;
  
  reg [1:0] state, next_state;
  
  always@(posedge clk or negedge rst) begin
    if(!rst)
      state <= 0;
    else
      state <= next_state;
  end
  
  always@(state or x) begin
    case(state)
      s0: begin
        if(x==0)
          next_state = s0;
        else
          next_state = s1;
      end
      
      s1: begin
        if(x==0)
          next_state = s0;
        else
          next_state = s2;
      end
      
      s2: begin
        if(x==0)
          next_state = s0;
        else
          next_state = s2;
      end
    endcase
  end
  
  assign z = (x==1) && (state==s2) ?1:0;
endmodule
        
