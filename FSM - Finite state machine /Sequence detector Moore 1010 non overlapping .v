module moore_seq(
  input clk,rst,x,
  output reg z
);
  parameter s0=4'h1;
  parameter s1=4'h2;
  parameter s2=4'h3;
  parameter s3=4'h4;
  parameter s4=4'h5;
  
  reg [3:0] state,next_state;
  
  always@(posedge clk or negedge rst) begin
    if(!rst) state <= s0;
    else state <= next_state;
  end
  
  always@(state or x) begin
    case(state)
      s0 : begin
        z=1'b0;
        if(x==0) next_state <= s0;
        else next_state <= s1;
      end
      
      s1 : begin
        z=1'b0;
        if(x==0) next_state <= s2;
        else next_state <= s1;
      end
      
      s2 : begin
        z=1'b0;
        if(x==0) next_state <= s0;
        else next_state <= s3;
      end
      
      s3 : begin
        z=1'b0;
        if(x==0) next_state <= s4;
        else next_state <= s0;
      end
      
      s4 : begin
        z=1'b1;
        if(x==0) next_state <= s0;
        else next_state <= s1;
      end
    endcase
  end
endmodule