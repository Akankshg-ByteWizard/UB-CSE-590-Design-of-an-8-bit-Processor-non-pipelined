`timescale 1ns / 1ps

module Top_Module_tb();
    reg clk;
    reg reset;
    
wire [7:0] pc_output2;
wire [2:0] output_ctrl_unit_opcode2;
wire [2:0] input_sign_extension_immediate2;
wire output_rs_reg2;
wire output_rt_rd_reg2;
//wire register_destination2;
//wire register_write2;
wire memory_to_register2;
wire [2:0] aluop2;
wire [7:0] read_data1_2;
wire [7:0] read_data2_2;
wire [7:0] data_memory_out2;
wire [7:0] alu_result2;
wire memread2;
wire memwrite2;
wire alusrc2;
    
Top_Module dut(
    .clk1(clk),
    .reset1(reset),
    .pc_output2(pc_output2),
    .output_ctrl_unit_opcode2(output_ctrl_unit_opcode2),
    .input_sign_extension_immediate2(input_sign_extension_immediate2),
    .output_rs_reg2(output_rs_reg2),
    .output_rt_rd_reg2(output_rt_rd_reg2),
    //.register_destination2(register_destination2),
    //.register_write2(register_write2),
    .memory_to_register2(memory_to_register2),
    .aluop2(aluop2),
    .read_data1_2(read_data1_2),
    .read_data2_2(read_data2_2),
    .data_memory_out2(data_memory_out2),
    .alu_result2(alu_result2),
    .memread2(memread2),
    .memwrite2(memwrite2),
    .alusrc2(alusrc2)
);

 initial begin
    // Initialize inputs
    clk = 1;
    reset = 1;

    #1;

    reset = 0;

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
//initial begin
//    #100;
//end


endmodule
     
//Inputs

