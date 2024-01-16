// Testbench for TopModule
module TopModule_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in time units
  parameter SIM_TIME = 200; // Simulation time in time units

  // Signals
  reg clk;
  reg reset;
  reg [7:0] operandA;
  reg [7:0] operandB;
  reg [2:0] opcode;
  wire [15:0] result;

  // Instantiate the module
  TopModule uut (
    .clk(clk),
    .reset(reset),
    .operandA(operandA),
    .operandB(operandB),
    .opcode(opcode),
    .result(result)
  );

  // Clock generation
  always #((CLK_PERIOD / 2)) clk = ~clk;

  // Initial block
  initial begin
    // Initialize signals
    clk = 0;
    reset = 1;
    operandA = 8'b0000_0000;
    operandB = 8'b0000_0000;
    opcode = 3'b000;

    // Apply reset
    #10 reset = 0;

    // Test scenario
    #10 operandA = 8'b0010_1010; // Example input A
    #10 operandB = 8'b0001_1100; // Example input B
    #10 opcode = 3'b000; // Addition
    #10 opcode = 3'b001; // Subtraction
    #10 opcode = 3'b010; // multiplication

    // Add more test scenarios as needed

    // Finish simulation
    #SIM_TIME $finish;
  end

endmodule


