module basic_gates_tb;
    reg a,b;
    wire and_out,or_out,not_out;
    wire nand_out,nor_out;
    wire xor_out,xnor_out;
    
    basic_gates dut(a,b,and_out,or_out,not_out,nand_out,nor_out,xor_out,xnor_out);
    
    initial begin
        a=0;b=0;#10;
        a=0;b=1;#10;
        a=1;b=0;#10;
        a=1;b=1;#10;
    end
    
    initial begin 
        $monitor("Time=%0t|a=%b|b=%b|and_out=%b|or_out=%b|not_out=%b|nand_out=%b|nor_out=%b|xor_out=%b|xnor_out=%b|",
                  $time,a,b,and_out,or_out,not_out,nand_out,nor_out,xor_out,xnor_out,);
        #60 $finish;
    end
        
endmodule
