module seq_det_1010(                                //Mealy overlapping 
  input clk,rst,x,
  output z
);
  parameter s0=4'h1;
  parameter s1=4'h2;
  parameter s2=4'h3;
  parameter s3=4'h4;
  
  reg [3:0] state,next_state;
  
  always@(posedge clk or negedge rst) begin
    if(!rst) begin
      state <= s0;
    end
    else state <= next_state;
  end
  
  always@(state or x) begin
    
    case(state)
      
      s0 : begin
        if(x==0) next_state = s0;
        else next_state = s1;
      end
      
      s1 : begin
        if(x==0) next_state = s2;
        else next_state = s1;
      end
      
      s2 : begin
        if(x==0) next_state = s0;
        else next_state = s3;
      end
      
      s3 : begin
        if(x==0) next_state = s2;
        else next_state = s1;
      end
      default : next_state = s0;
    endcase
  end
  assign z = (state==s3) && (x==0) ?1:0;
endmodule
