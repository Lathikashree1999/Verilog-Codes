module bg_tb #(parameter width=4);
    reg [width-1:0] gray;
    wire [width-1:0] binary;
    
    gray_to_binarycode bg(gray,binary);
    
    initial begin
        $monitor("Gray=%b ---> Binary=%b",gray,binary);
        gray=4'b0000;#1;
        gray=4'b0001;#1;
        gray=4'b0010;#1;
        gray=4'b0011;#1;
        gray=4'b0100;#1;
        gray=4'b0101;#1;
        gray=4'b0110;#1;
        gray=4'b0111;#1;
        gray=4'b1000;#1;
        gray=4'b1001;#1;
        gray=4'b1010;#1;
        gray=4'b1011;#1;
        gray=4'b1100;#1;
        gray=4'b1101;#1;
        gray=4'b1110;#1;
        gray=4'b1111;#1;
    end
endmodule
