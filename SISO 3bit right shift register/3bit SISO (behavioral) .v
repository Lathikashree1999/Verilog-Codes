module siso(
  input clk,din,
  output reg dout
);
  reg [2:0] shift_reg;
  
  always@(posedge clk) begin
    shift_reg[2] <= shift_reg[1];
    shift_reg[1] <= shift_reg[0];
    shift_reg[0] <= din;
  end
  
  assign dout = shift_reg[2];
  
endmodule
