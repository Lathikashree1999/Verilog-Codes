module bi_shift_reg(input clk, rst, load, shift_dir, input [3:0] parallel_in, output reg [3:0] data_out);
  always@(posedge clk or posedge rst) begin
    if(rst)
      data_out <= 4'b0000;
    else if(load)
      data_out <= parallel_in;
    else if(shift_dir)
      data_out <= {data_out[2:0],1'b0}; //left shift
    else
      data_out <= {1'b0,data_out[3:1]}; //right shift
  end
endmodule
