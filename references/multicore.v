module multicore (
  input [7:0] A,
  input [7:0] B,
  input [3:0] opcode,
  input clk,
  input rst,
  output reg [15:0] result,
  output reg [15:0]flag
);

  wire [15:0] out1, out2, out3, out4;
  
  alu core1(.A(A), .B(B), .opcode(opcode), .out(out1), .flag(out1));
  alu core2(.A(A), .B(B), .opcode(opcode), .out(out2), .flag(out2));
  alu core3(.A(A), .B(B), .opcode(opcode), .out(out3), .flag(out3));
  alu core4(.A(A), .B(B), .opcode(opcode), .out(out4), .flag(out4));
  
  always @(posedge clk or posedge rst)
  begin
    if (!rst)
    begin
      case (opcode[3:2])
        2'b00: result <= out1; 
        2'b01: result <= out2; 
        2'b10: result <= out3; 
        default: result <= out4; 
      endcase;
    end
    else 
      result <= 0;
    
    // Assign flag based on the result (moved inside always block)
    if (result == out1)
      flag <= 2'b00;
    else if (result == out2)
      flag <= 2'b01;
    else
      flag <= 2'b10;
  end

endmodule

module alu (
  input wire [7:0] A,
  input wire [7:0] B,
  input wire [3:0] opcode,
  output reg [15:0] out,
  output reg [15:0]flag
);
  
  always @* begin
    case(opcode[1:0])
      2'b00: out = A + B; // Example addition operation
      2'b01: out = A - B; // Example subtraction operation
      2'b10: out = A * B; // Example multiplication operation
      default: out = 16'b0;
    endcase;
    
    // Assign flag based on the operation (just an example)
    if (out == 0)
      flag = 2'b00;
    else if (out > 0)
      flag = 2'b01;
    else
      flag = 2'b10;
  end
endmodule

