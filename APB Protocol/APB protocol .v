module apb( input Pclk, Prst, Pselx, Penable, Pwrite, input [31:0] Paddr, Pwdata, output reg Pready, Pslverr, output reg [31:0] Prdata);
  
  parameter [1:0] idle = 2'b00;
  parameter [1:0] setup = 2'b01;
  parameter [1:0] access = 2'b10;
  
  reg [31:0] mem[31:0];
  reg [1:0] present_state, next_state;
  
  always@(posedge Pclk) begin
    if(Prst)
      present_state <= idle;
    else
      present_state <= next_state;
  end
  
  always@(*) begin
//     Pready = 0;
//     Pslverr = 0;
//     Prdata = 32'b0;
//     next_state = present_state;
    
    case(present_state)
      idle : begin
        if(Pselx && !Penable) 
          next_state = setup;
        
        else
          Pready = 1;
      end
      
      setup : begin
        if(Pselx && Penable) begin
          next_state = access;
          if(Pwrite) begin
            mem[Paddr] = Pwdata;
            Pready = 1;
            //Pslverr = 0;
           end
          
           else begin
            Prdata = mem[Paddr];
            Pready = 1;
            // Pslverr = 0;
           end
        end
        
        else 
          next_state = idle;
      end
      
      access : begin
        if(!Pselx || !Penable) begin
          next_state = idle;
          Pready = 0;
        end
        else 
          Pready = 1;
      end
        
      default : next_state = idle;
    endcase
  end
  
  always@(*) begin
    if(Pselx && Penable && (present_state == access) && Pready) 
      Pslverr = 0;
    else
      Pslverr = 0;
  end
endmodule
