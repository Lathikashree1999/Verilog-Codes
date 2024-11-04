module ring_counter (input clk, rst, output reg [3:0] q);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 4'b0001;  
        else begin
            case (q)
                4'b0001: q <= 4'b0010; 
                4'b0010: q <= 4'b0011;  
                4'b0011: q <= 4'b0100;  
                4'b0100: q <= 4'b0001; 
                default: q <= 4'b0001; 
            endcase
        end
    end
endmodule
