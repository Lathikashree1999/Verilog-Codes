module bg_tb #(parameter width=4);
    reg [width-1:0]binary;
    wire [width-1:0] gray;
    binary_to_graycode bg(binary,gray);
    
    initial begin
        binary = 4'b0000; #1;
        binary = 4'b0001; #1;
        binary = 4'b0010; #1;
        binary = 4'b0011; #1;
        binary = 4'b0100; #1;
        binary = 4'b0101; #1;
        binary = 4'b0110; #1;
        binary = 4'b0111; #1;
        binary = 4'b1000; #1;
        binary = 4'b1001; #1;
        binary = 4'b1010; #1;
        binary = 4'b1011; #1;
        binary = 4'b1100; #1;
        binary = 4'b1101; #1;
        binary = 4'b1110; #1;
        binary = 4'b1111; #1;
    end
    initial begin 
        $monitor("Binary=%b ---> Gray=%b", binary,gray);
    end
endmodule
