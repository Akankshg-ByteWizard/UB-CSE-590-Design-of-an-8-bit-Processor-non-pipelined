`timescale 1ns / 1ps

module control_unit_tb;

    reg [2:0] output_ctrl_unit_opcode;
    wire register_destination;   // we need to change if this doesnt work from [0] to just output reg register_destination
    wire register_write;
    wire memory_to_register;
    wire [2:0] aluop;
    wire memread;
    wire memwrite;
    wire alusrc;
    
    control_unit dut (
    .output_ctrl_unit_opcode(output_ctrl_unit_opcode),
    .register_destination(register_destination),
    .register_write(register_write),
    .memory_to_register(memory_to_register),
    .aluop(aluop),
    .memread(memread),
    .memwrite(memwrite),
    .alusrc(alusrc)
    );
    
    initial
        begin
            assign output_ctrl_unit_opcode = 3'b000;
            #10 assign output_ctrl_unit_opcode = 3'b100;
            #10 assign output_ctrl_unit_opcode = 3'b101;
            #10 assign output_ctrl_unit_opcode = 3'b110;
            #10 assign output_ctrl_unit_opcode = 3'b111;
            $finish;
        end
    
    
    
endmodule
