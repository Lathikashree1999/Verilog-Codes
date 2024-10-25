module tb_alu_4bit();
  reg [3:0] A, B;
  reg [1:0] sel;
  wire [3:0] result;
  wire carry_out;
  
  alu_4bit alu (.result(result), .carry_out(carry_out), .A(A), .B(B), .sel(sel));

  initial begin
    A = 4'b0011; B = 4'b0001; sel = 2'b00; 
    #10 sel = 2'b01; 
    #10 sel = 2'b10; 
    #10 sel = 2'b11; 
    #10 $stop;
  end
  
  initial begin
    $monitor("Time=%0d A=%b B=%b sel=%b result=%b carry_out=%b", $time, A, B, sel, result, carry_out);
  end
endmodule
