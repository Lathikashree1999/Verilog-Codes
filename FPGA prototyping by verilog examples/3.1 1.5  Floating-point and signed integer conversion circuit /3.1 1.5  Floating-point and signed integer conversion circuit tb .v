module int_to_float_tb;

    reg signed [7:0] int_in;
    wire [12:0] float_out;

  int_to_float converter(int_in, float_out);

    initial begin
        $monitor("Integer: %d -> Floating-point: %b", int_in, float_out);

        int_in = 25;
        #10;
        int_in = -25;
        #10;
        int_in = 127;
        #10;
        int_in = -128;
        #10;
        int_in = 0;
        #10;
    end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
