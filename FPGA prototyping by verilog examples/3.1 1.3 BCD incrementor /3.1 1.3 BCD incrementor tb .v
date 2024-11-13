module tb;
    reg [11:0]bcd_in;
    wire [11:0]bcd_out;
    
    bcd_incrementor incr(bcd_in, bcd_out);
    
    initial begin
        $monitor("At time %t : Input: %b, Output: %b", $time, bcd_in, bcd_out);
        bcd_in = 12'b0000_0010_0101;//37 incremented to 38
        #10;
        bcd_in = 12'b0000_0001_0000;//10 incremented to 11
        #10;
        bcd_in = 12'b0000_0000_0000;//0 incremented to 1 
        #10;
        bcd_in = 12'b0001_0010_0011;//123 incremented to 124
        #10;
        bcd_in = 12'b0001_0010_1001;//129 incremented to 130
        #10;
        bcd_in = 12'b1001_1001_1001;//999 incremented to 000(overflow)
        #10;
        $finish;
    end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule

