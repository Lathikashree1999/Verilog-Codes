module piso_4bit(input clk, rst, load, input [3:0] parallel_in, output reg serial_out);
  reg [3:0] shift_reg;
  
  always@(posedge clk or posedge rst) begin
    if(rst)
      shift_reg <= 4'b0000;
    else if(load)
      shift_reg <= parallel_in;
    else
      shift_reg <= {shift_reg[2:0],1'b0};
  end
  
  assign serial_out = shift_reg[3];
  
endmodule