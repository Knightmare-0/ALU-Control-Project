module multicore (
  input [7:0] A,
  input [7:0] B,
  input [3:0] opcode,
  input clk,
  input rst,
  output reg [15:0] result,
  output reg [1:0] coreFlag 
);

  wire [15:0] out1, out2, out3, out4;
  alu core1(.A(A), .B(B), .opcode(opcode), .out(out1));
  alu core2(.A(A), .B(B), .opcode(opcode), .out(out2));
  alu core3(.A(A), .B(B), .opcode(opcode), .out(out3));
  alu core4(.A(A), .B(B), .opcode(opcode), .out(out4));

  always @(posedge clk or posedge rst)
  begin
    if (!rst)
    begin
      case (opcode[3:2])
        2'b00: begin result <= out1; coreFlag <= 2'b00; end // Set coreFlag for core1
        2'b01: begin result <= out2; coreFlag <= 2'b01; end // Set coreFlag for core2
        2'b10: begin result <= out3; coreFlag <= 2'b10; end// Set coreFlag for core3
        default: begin result <= out4; coreFlag <= 2'b11; end // Set coreFlag for core4
      endcase;
    end
    else
    begin
      result = 0;
      //coreFlag = 2'b00; // Set coreFlag to 2'b00 during reset
    end
  end
endmodule


module alu (
  input wire [7:0] A,
  input wire [7:0] B,
  input wire [3:0] opcode,
  output reg [15:0] out 
);
  
  always @* begin
    case(opcode[1:0])
      2'b00: out = A + B; // Example addition operation
      2'b01: out = A - B; // Example subtraction operation
      2'b10: out = A * B; // Example multiplication operation
      default: out = 16'b0;
    endcase;
  end
endmodule
