module multicore_tb;

  reg [7:0] A, B;
  reg [3:0] opcode;
  reg clk, rst;
  wire [15:0] result;
  wire [1:0] coreFlag;

  // Instantiate multicore module
  multicore uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .clk(clk),
    .rst(rst),
    .result(result),
    .coreFlag(coreFlag)
  );

  alu core(.A(A), .B(B), .opcode(opcode), .out());

  // Clock Generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test Stimulus
  initial begin
    // Initialize inputs
    A = 8'b10101010;
    B = 8'b01010101;
    opcode = 4'b0000;
    rst = 1;

    // Apply reset
    #10 rst = 0;
   
   //Initialize inputs A and B 
  
    
    #10 A = 8'b11110000;
    #10 B = 8'b00001111;
  //Toggle all possible values of opcode  

   
    #10 opcode = 4'b0000;

    #10 opcode = 4'b0001;
    
    #10 opcode = 4'b0010;
    
    #10 opcode = 4'b0011;
    
    #10 opcode = 4'b0100;
    
    #10 opcode = 4'b0101;
    
    #10 opcode = 4'b0110;
    
    #10 opcode = 4'b0111;
    
    #10 opcode = 4'b1000;
    
    #10 opcode = 4'b1001;
    
    #10 opcode = 4'b1010;
    
    #10 opcode = 4'b1011;
    
    #10 opcode = 4'b1100;
    
    #10 opcode = 4'b1101;
    
    #10 opcode = 4'b1110;
    
    #10 opcode = 4'b1111;


    #100 $stop; 
  end

  // Display results
  always @(posedge clk) begin
    $display("Time: %t, Result: %h, CoreFlag: %b, opcode: %b", $time, result, coreFlag, opcode);
  end
  
initial begin
  
  $dumpfile("wave.vcd");
  $dumpvars(0,multicore_tb);
  end

endmodule

