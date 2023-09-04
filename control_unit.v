`timescale 1ns / 1ps

module control_unit(
    input clk,
    input [2:0] output_ctrl_unit_opcode,
    //output reg register_destination,   // we need to change if this doesnt work from [0] to just output reg register_destination
    output reg register_write,
    output reg memory_to_register,
    output reg [2:0] aluop,
    output reg memread,
    output reg memwrite,
    output reg alusrc
);

//initial begin
//    //register_destination = 1'b0;
//    register_write = 1'b0;
//    aluop = 3'b000; 
//    memread = 1'b0;
//    memwrite = 1'b0;
//    memory_to_register = 1'b0;
//    alusrc = 1'b0;
//end

always @(*) begin
    case(output_ctrl_unit_opcode[2:0]) 
    // ADD
        3'b000:
            begin
                //register_destination = 1'b0;
			    register_write = 1'b1;
                aluop = output_ctrl_unit_opcode; 
                memread = 1'b0;
                memwrite = 1'b0;
			    memory_to_register = 1'b0;
			    alusrc = 1'b1;
            end
        //ADDI
         3'b100:
            begin
                //register_destination = 1'b0;
			    register_write = 1'b1;
                aluop = output_ctrl_unit_opcode; 
                memread = 1'b0;
                memwrite = 1'b0;
			    memory_to_register = 1'b0;
			    alusrc = 1'b0;
            end
        //  SHIFT LEFT LOGICAL
         3'b111:
            begin
                //register_destination = 1'b1;
			    register_write = 1'b1;
                aluop = output_ctrl_unit_opcode; 
                memread = 1'b0;
                memwrite = 1'b0;
			    memory_to_register = 1'b0;
			    alusrc = 1'b0;
            end
         //ADDI

        // LOAD WORD
        3'b110:
            begin
                //register_destination = 1'b0;
			    register_write = 1'b1;
                aluop = output_ctrl_unit_opcode; 
                memread = 1'b1;
                memwrite = 1'b0;
			    memory_to_register = 1'b1;
			    alusrc = 1'b1;
            end
        // STORE WORD
        3'b101:
            begin
			 //register_destination = 1'b0;
			 register_write = 1'b0;
             aluop = output_ctrl_unit_opcode; 
             memread = 1'b0;
             memwrite = 1'b1;
			 memory_to_register = 1'b0;
			 alusrc = 1'b1;
            end
         default: begin
             register_write = 1'bX;
             aluop = 3'bXXX; 
             memread = 1'bX;
             memwrite = 1'bX;
			 memory_to_register = 1'bX;
			 alusrc = 1'bX;
            end
    endcase
end

endmodule
