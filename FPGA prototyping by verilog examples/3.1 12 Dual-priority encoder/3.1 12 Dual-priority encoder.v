/*3.1 1.2 Dual-priority encoder 
A dual-priority encoder returns the codes of the highest or second-highest priority requests. 
The input is a 12-bit req signal and the outputs are first and second, which are the 4-bit 
binary codes of the highest and second-highest priority requests, respectively. 
1. Design the circuit and derive the code. 
2. Derive a testbench and use simulation to verify operation of the code. 
3. Design a testing circuit that displays the two output codes on the seven-segment LED 
display of the prototyping board, and derive the code. 
4. Synthesize the circuit, program the FPGA, and verify its operation.*/

module priority_encoder_12x4(input [11:0]r,output reg [3:0] y);
  always@(*) begin
    casez(r)
      12'b1??????????? : y = 4'b1100;
      12'b01?????????? : y = 4'b1011;
      12'b001????????? : y = 4'b1010;
      12'b0001???????? : y = 4'b1001;
      12'b00001??????? : y = 4'b1000;
      12'b000001?????? : y = 4'b0111;
      12'b0000001????? : y = 4'b0110;
      12'b00000001???? : y = 4'b0101;
      12'b000000001??? : y = 4'b0100;
      12'b0000000001?? : y = 4'b0011;
      12'b00000000001? : y = 4'b0010;
      12'b000000000001 : y = 4'b0001;
      default : y = 4'b0000;
    endcase
  end
endmodule


module decoder_4x12(input [3:0]a, output reg [11:0]y);
  always@(*) begin
    case(a)
      4'b0000 : y = 12'b0000_0000_0000;
      4'b0001 : y = 12'b0000_0000_0001;
      4'b0010 : y = 12'b0000_0000_0010;
      4'b0011 : y = 12'b0000_0000_0100;
      4'b0100 : y = 12'b0000_0000_1000;
      4'b0101 : y = 12'b0000_0001_0000;
      4'b0110 : y = 12'b0000_0010_0000;
      4'b0111 : y = 12'b0000_0100_0000;
      4'b1000 : y = 12'b0000_1000_0000;
      4'b1001 : y = 12'b0001_0000_0000;
      4'b1010 : y = 12'b0010_0000_0000;
      4'b1011 : y = 12'b0100_0000_0000;
      4'b1100 : y = 12'b1000_0000_0000;
      default : y = 12'b0000_0000_0000;
    endcase
  end
endmodule

module dual_priority_encoder(input [11:0]ip, output [3:0]prio1, prio2);
  wire [3:0] first_priority_out;
  wire [11:0] first_priority_decoder_out;
  reg [11:0] second_encoder_input;
        
  priority_encoder_12x4 first_pri_encoder(.r(ip), .y(first_priority_out));
  decoder_4x12 decoder(.a(first_priority_out), .y(first_priority_decoder_out));

  always@(*) begin
    second_encoder_input = ip & ~first_priority_decoder_out;
  end

  priority_encoder_12x4 second_pri_encoder(.r(second_encoder_input), .y(prio2));

  assign prio1 = first_priority_out;
endmodule



