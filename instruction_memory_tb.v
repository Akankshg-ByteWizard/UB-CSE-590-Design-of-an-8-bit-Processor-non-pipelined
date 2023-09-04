`timescale 1ns / 1ps

module instruction_memory_tb;

  // Inputs
  reg [7:0] pc;

  // Outputs
  //wire [7:0] pc;
  wire [2:0] output_ctrl_unit_opcode;
  wire [2:0] input_sign_extension_immediate;
  wire output_rs_reg;
  wire output_rt_rd_reg;

  // Instantiate the instruction_memory module
  instruction_memory dut (
    .pc(pc),
    .output_ctrl_unit_opcode(output_ctrl_unit_opcode),
    .input_sign_extension_immediate(input_sign_extension_immediate),
    .output_rs_reg(output_rs_reg),
    .output_rt_rd_reg(output_rt_rd_reg)

  );
  
  initial begin
     pc = 8'b00000000;
  end
  
  always begin
     while (pc < 5) begin
        #5 pc = pc + 1;
     end
  end


endmodule

