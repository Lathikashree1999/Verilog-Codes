module rotate_right(input [7:0]a, [2:0]amt, output reg [7:0]y);   //rotation direction : right
  always@(*) begin
    case(amt)
      3'b000 : y = a;
      3'b001 : y = {a[0], a[7:1]};
      3'b010 : y = {a[1:0], a[7:2]};
      3'b011 : y = {a[2:0], a[7:3]};
      3'b100 : y = {a[3:0], a[7:4]};
      3'b101 : y = {a[4:0], a[7:5]};
      3'b110 : y = {a[5:0], a[7:6]};
      3'b111 : y = {a[6:0], a[7]};
    endcase
  end
endmodule

module rotate_left(input [7:0]a, [2:0]amt, output reg [7:0]y);      //rotation direction : left
  always@(*) begin
    case(amt)
      3'b000 : y = a;
      3'b001 : y = {a[6:0], a[7]};
      3'b010 : y = {a[5:0], a[7:6]};
      3'b011 : y = {a[4:0], a[7:5]};
      3'b100 : y = {a[3:0], a[7:4]};
      3'b101 : y = {a[2:0], a[7:3]};
      3'b110 : y = {a[1:0], a[7:2]};
      3'b111 : y = {a[0], a[7:1]};
    endcase
  end
endmodule

module multifn_barrel_shifter(input [7:0]a, input [2:0]amt, input lr, output  [7:0]y);    // main module
  wire [7:0] right_shift, left_shift;
  
  rotate_right rr(.a(a),.amt(amt),.y(right_shift));
  rotate_left rl(.a(a),.amt(amt),.y(left_shift));
  
  assign y = lr?left_shift:right_shift;
endmodule
  
