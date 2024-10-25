module priority_tb;
    reg [7:0]d;
    wire [2:0]y;
    
    priority_encoder pren(d,y);
    
    initial begin 
        $monitor("d=%0b --> y=%0b",d,y);
        repeat(5) begin
            d=$random;#1;
        end
    end
endmodule
