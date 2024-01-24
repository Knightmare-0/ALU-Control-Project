module multicore_tb;

  reg [7:0] A;
  reg [7:0] B;
  reg [3:0] opcode;
  reg clk;
  reg rst;
  wire [15:0] result;

  // Instantiate the top module
  multicore uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .clk(clk),
    .rst(rst),
    .result(result)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Initial values
  initial begin
    clk = 0;
    rst = 0;
    A = 8'b10101010;
    B = 8'b01010101;
    opcode = 4'b00;

    // Test case 1: Addition (opcode = 2'b00)
    rst = 1;
    
    #10;
    
    rst = 0;
    
    opcode = 4'b00;
    #10; // Wait for a few clock cycles
    $display("Test Case 1: Addition");
    check_output(A + B);

    // Test case 2: Subtraction (opcode = 2'b01)
    opcode = 4'b01;
    #10; // Wait for a few clock cycles
    $display("Test Case 2: Subtraction");
    check_output(A - B);

    // Test case 3: Multiplication (opcode = 2'b10)
    opcode = 4'b10;
    #10; // Wait for a few clock cycles
    $display("Test Case 3: Multiplication");
    check_output(A * B);

    // Test case 4: Default (opcode not 2'b00, 2'b01, or 2'b10)
    opcode = 4'b11;
    #10; // Wait for a few clock cycles
    $display("Test Case 4: Default");
    check_output(16'b0);

    // End simulation
    $stop;
  end

  // Helper task to check the output
  task check_output(input [15:0] expected_output);
    if (result === expected_output) begin
      $display("Output is correct: %h", result);
    end else begin
      $display("Output mismatch! Expected: %h, Actual: %h", expected_output, result);
    end
  endtask
  
  
  
  initial begin
  
  $dumpfile("wave.vcd");
  $dumpvars(0,top_tb);
  end

endmodule







