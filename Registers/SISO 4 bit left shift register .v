module siso_4bit(input clk, rst, serial_in, output reg serial_out);
  reg [3:0] shift_reg;
  
  always@(posedge clk or posedge rst) begin
    if(rst) 
      shift_reg <= 4'b0000;
    else
      shift_reg <= {shift_reg[2:0],serial_in};
  end
  
  assign serial_out = shift_reg[3];
endmodule
