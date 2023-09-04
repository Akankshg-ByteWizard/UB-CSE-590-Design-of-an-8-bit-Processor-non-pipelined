`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2023 11:48:58 PM
// Design Name: 
// Module Name: connections
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module connections(
  wire output1,
  wire output2,
  wire output3,
  wire output4,
  wire output5,
  wire output6,
  wire output7
  );
ProgramCounter pc1(
    //.clk(clk),
    //.reset(reset),
    .pc_output(pc_output)
);
instruction_memory im(
    .pc(pc)
    //.output_ctrl_unit_opcode(output_ctrl_unit_opcode),
    //.input_sign_extension_immediate(input_sign_extension_immediate),
    //.output_rs_reg(output_rs_reg),
    //.output_rt_rd_reg(output_rt_rd_reg)
    //.output_shiftbits_reg(output_shiftbits_reg)
    //.immediate(immediate)
  );
  control_unit cu(
    .output_instruction_memory(output_instruction_memory),
    .register_destination(register_destination),
    .register_write(register_write),
    .memory_to_register(memory_to_register),
    .aluop(aluop),
    .memread(memread),
    .memwrite(memwrite),
    .alusrc(alusrc)
    );
//initial begin
//    pc1.clk = 0;
//end

    //assign pc1.clk = ~clk;
    //Assign output of program counter to Instruction Memory
    assign im.pc = pc1.pc_output;

    //Assign output of Instruction Memory to Control Unit
    assign cu.output_instruction_memory = im.output_ctrl_unit_opcode;
    assign output1 = register_destination;
    assign output2 = register_write;
    assign output3 = memory_to_register;
    assign output4 = aluop;
    assign output5 = memread;
    assign output6 = memwrite;
    assign output7 = alusrc;
endmodule

