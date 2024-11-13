/*3.1 1.5 
Floating-point and signed integer conversion circuit 
A number may need to be converted to different formats in a large system. Assume that 
we use the 13-bit format in Section 3.9.4 for the floating-point representation and the 
8-bit signed data type for the integer representation. An integer-to-floating-point conver- 
sion circuit converts an 8-bit integer input to a normalized, 13-bit floating-point output. 
A floating-point-to-integer conversion circuit reverses the operation. Since the range of 
a floating-point number is much larger, conversion may lead to the underflow condition 
(i.e., the magnitude of the converted number is smaller than "00000001 ") or the overflow 
condition (i.e., the magnitude of the converted number is larger than "01 1 11 11 1 "). 
1. Design an integer-to-floating-point conversion circuit and derive the code. 
2. Derive a testbench and use simulation to verify operation of the code. 
3. Design a testing circuit and derive the code. 
4. Synthesize the circuit, program the FPGA, and verify its operation. 
5. Design a floating-point-to-integer conversion circuit. In addition to the 8-bit integer 
output, the design should include two status signals, uf and of, for the underflow 
and overflow conditions. Derive the code and repeat steps 2 to 4.*/

module int_to_float(
    input signed [7:0] int_in,       
    output reg [12:0] float_out       
);

    reg [4:0] exponent;               
    reg [6:0] mantissa;               
    reg sign;                         
    reg [7:0] abs_int_in;             
    integer shift_count;

    always @(*) begin
        sign = (int_in < 0) ? 1'b1 : 1'b0;  
        abs_int_in = (int_in < 0) ? -int_in : int_in; 
        exponent = 5'd0;                     
        mantissa = 7'b0;                     
        shift_count = 0;                 

        if (abs_int_in == 0) begin
            float_out = 13'b0000000000000;    
        end else begin
            while (abs_int_in[7] == 0) begin
                abs_int_in = abs_int_in << 1;
                shift_count = shift_count + 1;
            end

            exponent = 5'd15 + (7 - shift_count); 
            mantissa = abs_int_in[6:0];   

            float_out = {sign, exponent, mantissa};
        end
    end

endmodule

/*Output
Integer:   25 -> Floating-point: 0100111001000
Integer:  -25 -> Floating-point: 1100111001000
Integer:  127 -> Floating-point: 0101011111110
Integer: -128 -> Floating-point: 1101100000000
Integer:    0 -> Floating-point: 0000000000000*/
