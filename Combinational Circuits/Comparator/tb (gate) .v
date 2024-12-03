module tb_comparator_2bit;
    reg [1:0] A, B;
    wire A_eq_B, A_gt_B, A_lt_B;
    
    // Instantiate the 2-bit comparator
    comparator_2bit uut (
        .A(A), 
        .B(B), 
        .A_eq_B(A_eq_B), 
        .A_gt_B(A_gt_B), 
        .A_lt_B(A_lt_B)
    );
    
    initial begin
        // Monitor the signals
        $monitor("A = %b, B = %b, A_eq_B = %b, A_gt_B = %b, A_lt_B = %b", A, B, A_eq_B, A_gt_B, A_lt_B);

        // Test cases
        A = 2'b00; B = 2'b00; #10;
        A = 2'b00; B = 2'b01; #10;
        A = 2'b01; B = 2'b00; #10;
        A = 2'b10; B = 2'b10; #10;
        A = 2'b10; B = 2'b11; #10;
        A = 2'b11; B = 2'b10; #10;
        A = 2'b11; B = 2'b11; #10;
        
        $finish;
    end
endmodule
