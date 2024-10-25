module mux_8x1(
  input [7:0]in,
  input [2:0]sel,
  output reg y
);
  always@(*) begin
    integer i;
    for(i=0;i<8;i=i+1) begin
      if (sel==i)
        y=in[i];
    end
  end
endmodule
