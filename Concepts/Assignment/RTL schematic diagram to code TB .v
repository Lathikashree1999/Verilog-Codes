module tb_sequential_circuit;

    // Inputs
    reg clk;
    reg x1,x2,x3;

    wire g, f;


    eg uut (
        .clk(clk),.x1(x1),.x2(x2), .x3(x3), .g(g),.f(f));
    always #10 clk = ~clk;

    initial begin
 
        clk = 0;
        x1 = 0;
        x2 = 0;
        x3 = 0;

        // Apply test cases
        #15 x1 = 1; x2 = 0; x3 = 1;  
        #20 x1 = 1; x2 = 1; x3 = 0; 
        #20 x1 = 0; x2 = 1; x3 = 1;
        #20 x1 = 1; x2 = 1; x3 = 1; 
        #20 x1 = 0; x2 = 0; x3 = 0; 
        #40 $stop;
    end

    initial begin
        $monitor("At time %t, x1 = %b, x2 = %b, x3 = %b, g = %b, f = %b", 
                  $time, x1, x2, x3, g, f);
    end

endmodule
