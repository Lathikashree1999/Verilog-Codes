module example();
  initial begin
      $display("Bitwise and (a&b) = %b",4'bx111 & 4'bx000);
      $display("Bitwise or (a|b) = %b",4'bx111 | 4'bx000);
      $display("Reduction and (&a) = %b",&4'b1xxx);
      $display("Reduction or (|a) = %b",|4'b1xxx);
      $display("Reduction nor (~|a) = %b",~|4'b1xxx);
      $display("Reduction nand (~&a) = %b",~&4'b1xxx);
      $display("Reduction and (&a) = %b",&4'bx000);
      $display("Reduction or (|a) = %b",|4'bx000);
      $display("Reduction nor (~|a) = %b",~|4'bx000);
      $display("Reduction nand (~&a) = %b",~&4'bx000);
      $display("Reduction and (&a) = %b",&4'bx111);
      $display("Reduction or (|a) = %b",|4'bx111);
      $display("Reduction nor (~|a) = %b",~|4'bx111);
      $display("Reduction nand (~&a) = %b",~&4'bx111);
  end
endmodule

/* Bitwise and (a&b) = x000
Bitwise or (a|b) = x111
Reduction and (&a) = x
Reduction or (|a) = 1
Reduction nor (~|a) = 0
Reduction nand (~&a) = x
Reduction and (&a) = 0
Reduction or (|a) = x
Reduction nor (~|a) = x
Reduction nand (~&a) = 1
Reduction and (&a) = x
Reduction or (|a) = 1
Reduction nor (~|a) = 0
Reduction nand (~&a) = x */
