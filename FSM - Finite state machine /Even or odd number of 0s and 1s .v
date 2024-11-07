module even_odd (input clk, rst, in, output reg [1:0] out);
   parameter S0 = 2'b00;  // Even 0s, Even 1s
   parameter S1 = 2'b01;  // Even 0s, Odd 1s
   parameter S2 = 2'b10;  // Odd 0s, Even 1s
   parameter S3 = 2'b11;  // Odd 0s, Odd 1s
    
   state, next_state;
  
   always @(posedge clk or posedge reset) begin
        if (rst) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
   end

   always @(*) begin
        case (state)
            S0: begin
                if (in == 1'b0)
                    next_state = S2;
                else
                    next_state = S1;
                out = 2'b00;
            end
            
            S1: begin
                if (in == 1'b0)
                    next_state = S3;
                else
                    next_state = S0;
                out = 2'b01;
            end
            
            S2: begin
                if (in == 1'b0)
                    next_state = S0;
                else
                    next_state = S3;
                out = 2'b10;
            end
            
            S3: begin
                if (in == 1'b0)
                    next_state = S1;
                else
                    next_state = S2;
                out = 2'b11;
            end

            default: begin
                next_state = S0;
                out = 2'b00;
            end
        endcase
    end

endmodule
