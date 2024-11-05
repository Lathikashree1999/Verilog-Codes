module rotate_right(input [7:0]a, [2:0]amt, output reg [7:0]y);    //rotating direction : right
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


module bit_reversal(input [7:0]a, output [7:0] y);         //reversing circuit
  assign y = {a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7]};
endmodule


module multifn_barrel_shifter_rev(input [7:0]a, input [2:0]amt, input lr, output [7:0]y);
  wire [7:0] reversed_input, rotated_result, reversed_output;
  
  bit_reversal rever(.a(a), .y(reversed_input));   //reversed_input has reversed 'a'
  
  rotate_right rr(.a(lr?reversed_input:a),.amt(amt),.y(rotated_result));  //to rotate left we choose .a(reversed_input) , for right rotation .a(a)
  
  bit_reversal br(.a(rotated_result),.y(reversed_output));    //reversed_output has rotated_result
  
  assign y = lr ? reversed_output : rotated_result;
endmodule
  
