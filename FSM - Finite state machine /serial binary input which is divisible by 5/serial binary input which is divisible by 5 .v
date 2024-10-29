module serial_bin_ip(input clk, rst, serial_ip, output reg z);
  parameter s0 = 4'h0;
  parameter s1 = 4'h1;
  parameter s2 = 4'h2;
  parameter s3 = 4'h3;
  parameter s4 = 4'h4;
  
  reg [3:0] state, next_state;
  
  always@(posedge clk or negedge rst) begin
    if(rst)
      state <= s0;
    else
      state <= next_state;
  end
  
  always@(state or serial_ip) begin
    case(state)
      s0 : begin
        if(serial_ip==0)
          next_state = s0;
        else
          next_state = s1;
      end
      
      s1 : begin
        if(serial_ip==0)
          next_state = s2;
        else
          next_state = s3;
      end
      
      s2 : begin
        if(serial_ip==0)
          next_state = s4;
        else
          next_state = s0;
      end
      
      s3 : begin
        if(serial_ip==0)
          next_state = s1;
        else
          next_state = s2;
      end
      
      s4 : begin
        if(serial_ip==0)
          next_state = s3;
        else
          next_state = s4;
      end
      
      default : next_state = s0;
    endcase
  end
  
  always@(state) begin
    case(state)
      s0 : z=1;
      s1 : z=0;
      s2 : z=0;
      s3 : z=0;
      s4 : z=0;
      default : z=0;
    endcase
  end
  
endmodule
      
