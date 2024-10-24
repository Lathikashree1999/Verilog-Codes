module alu_4bit (output [3:0] result, output carry_out, input [3:0] A, B, input [1:0] sel);

  wire [3:0] sum, diff, and_op, or_op;
  wire cout_add, cout_sub;

  // 4-bit adder for addition
  ripple_carry_adder adder (.sum(sum), .cout(cout_add), .A(A), .B(B), .cin(1'b0));
  
  // 4-bit subtractor for subtraction (A - B)
  ripple_carry_adder subtractor (.sum(diff), .cout(cout_sub), .A(A), .B(~B), .cin(1'b1));
  
  // AND operation
  assign and_op = A & B;
  
  // OR operation
  assign or_op = A | B;

  // Select the operation based on sel
  assign {carry_out, result} = (sel == 2'b00) ? {cout_add, sum} :
                               (sel == 2'b01) ? {cout_sub, diff} :
                               (sel == 2'b10) ? {1'b0, and_op} :
                               {1'b0, or_op};
endmodule

// Ripple carry adder for 4-bit addition
module ripple_carry_adder(output [3:0] sum, output cout, input [3:0] A, B, input cin);
  wire c1, c2, c3;
  
  full_adder FA0 (.sum(sum[0]), .cout(c1), .A(A[0]), .B(B[0]), .cin(cin));
  full_adder FA1 (.sum(sum[1]), .cout(c2), .A(A[1]), .B(B[1]), .cin(c1));
  full_adder FA2 (.sum(sum[2]), .cout(c3), .A(A[2]), .B(B[2]), .cin(c2));
  full_adder FA3 (.sum(sum[3]), .cout(cout), .A(A[3]), .B(B[3]), .cin(c3));
endmodule

// Full Adder Module
module full_adder(output sum, output cout, input A, B, cin);
  assign sum = A ^ B ^ cin;
  assign cout = (A & B) | (cin & (A ^ B));
endmodule
