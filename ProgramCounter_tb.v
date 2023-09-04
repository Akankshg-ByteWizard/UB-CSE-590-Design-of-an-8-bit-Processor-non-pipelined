`timescale 1ns / 1ps

module ProgramCounter_tb;

  // Inputs
  reg clk;
  reg reset;

  // Outputs
  wire [7:0] pc_output;

  // Instantiate the Unit Under Test (UUT)
  ProgramCounter uut (
    .clk(clk),
    .reset(reset),
    .pc_output(pc_output)
  );

  initial begin
    // Initialize inputs
    clk = 0;
    reset = 1;

    // Wait for 10 clock cycles
    #10;

    // Deassert reset
    reset = 0;

    // Wait for 10 clock cycles
    #50;

    // Assert reset again
    reset = 1;

    // Wait for 5 clock cycles
    #10;

    // Deassert reset again
    reset = 0;

    // Stop the simulation
    $finish;
  end

  // Toggle the clock every 5 ns
  always #5 clk = ~clk;

endmodule
