module jkff (
  input clk, rst_n,
  input j,k,
  output reg q, 
  output q_bar
  );
  
  always@(posedge clk or negedge rst_n) begin 
    if(!rst_n) q <= 0;
    else begin
      case({j,k})
        2'b00: q <= q;    
        2'b01: q <= 1'b0; 
        2'b10: q <= 1'b1; 
        2'b11: q <= ~q;  
      endcase
    end
  end
  assign q_bar = ~q;
endmodule

module updown_selector(input q, q_bar, up, output nclk);  
  assign nclk = up?q_bar:q;
endmodule

module asyn_counter #(parameter SIZE=4)(
  input clk, rst_n,
  input j, k,
  input up,
  output [3:0] q, q_bar
);
  wire [3:0] nclk;
  genvar g;
    jkff jk0(clk, rst_n, j, k, q[0], q_bar[0]);
  	generate
    	for(g = 1; g<SIZE; g=g+1) begin
      		updown_selector ud1(q[g-1], q_bar[g-1], up, nclk[g-1]);
      		jkff jk1(nclk[g-1], rst_n, j, k, q[g], q_bar[g]);
    	end
  	endgenerate
endmodule
