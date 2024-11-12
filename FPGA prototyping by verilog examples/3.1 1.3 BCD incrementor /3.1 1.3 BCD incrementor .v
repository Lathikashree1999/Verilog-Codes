/*3.1 1.3 BCD incrementor 
The binary-coded-decimal (BCD) format uses 4 bits to represent 10 decimal digits. For 
example, 25910 is represented as "0010 0101 1001" in BCD format. A BCD incrementor 
adds 1 to a number in BCD format. For example, after incrementing, "00 10 0 10 1 100 1 " 
(i.e., 25910) becomes "0010 01 10 0000" (i.e., 26010). 
1. Design a three-digit 12-bit incrementor and derive the code. 
2. Derive a testbench and use simulation to verify operation of the code. 
3. Design a testing circuit that displays three digits on the seven-segment LED display 
and derive the code. 
4. Synthesize the circuit, program the FPGA, and verify its operation.*/

module bcd_incrementor(input [11:0]bcd_in, output reg[11:0]bcd_out);
    reg [3:0] hundreds, tens, ones;
    
    always@(*)begin
        hundreds = bcd_in[11:8];
        tens = bcd_in[7:4];
        ones = bcd_in[3:0];
        if(ones==4'd9) begin
            ones = 4'd0;
            if(tens==4'd9) begin
                tens = 4'd0;
                if(hundreds==4'd9) 
                    hundreds = 4'd0;
                else
                    hundreds = hundreds+1;
            end
            else
                tens = tens+1;
        end
        else
            ones = ones+1;
        bcd_out = {hundreds, tens, ones};
    end
endmodule
