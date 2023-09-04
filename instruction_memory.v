`timescale 1ns / 1ps

module instruction_memory(
    input clk,
    input [7:0] pc, // Program Counter input
    output reg [2:0] output_ctrl_unit_opcode, // Output to control unit
    output reg [2:0] input_sign_extension_immediate, // Output to sign extension
    output reg output_rs_reg, // Output to RS register as an input of register bank
    output reg output_rt_rd_reg // Output to RT register as an input of register bank
);
//wire pc;
//ProgramCounter top (
//   .pc(pc)
//    );
// Instruction memory
reg [7:0] mem[0:255];
initial begin
    // ADD instruction
    mem[0] = 8'bXXXXXXXX;
    
    mem[1] = 8'b00010000; //add s1 s1 s0
    
    // ADDI instruction
    mem[2] = 8'b10000111; // first 3 bits are op code then rd 1 bit=0 then ,rs 1 bit=0 ,rest 3 bits are immediate if I type. we have 111 as maximum we can shift 7 bits.// addi s0 s0 7
    
    // Store Word instruction
    mem[3] = 8'b10101100; // first 3 bits are op code of sw , rd 1 bit=0, rs 1 bit=1 ,rest 3 bits are immediate if I type . we have 100 as maximum is 7 bits we jsut use 4 as example . sw s0 4(s1)
    
    // Load Word instruction
    mem[4] = 8'b11010100; // first 3 bits are op code of lw , rd 1 bit=1, rs 1 bit=0 ,rest 3 bits are immediate if I type . we have 100 as maximum is 7 bits we jsut use 4 as example . 
//lw s0 4(s1)
    
    // Shift Left Logical instruction
    mem[5] = 8'b11101110; // first 3 bits are op code of sll , rd 1 bit=0, rs 1 bit=1 ,rest 3 bits are shamt of shit bit or unsed for R typr . we have 100 as maximum is 7 bits we jsut use 6 as example . 
//sll s0 6(s1)


    
end

// Output the instruction based on the program counter input
always @(*) begin
    case(mem[pc][7:5]) // this the 3 bit vlaues which tells which operation to perform seeing the value from the 32 bit end part from above . (this is the opcode but we just use 																									last 3 bits according to prof)
		3'b000: begin // ADD instruction (this is op code)
            output_ctrl_unit_opcode = mem[1][7:5]; // just for our understading this is op code but in the case above matches the user input as op code(pc[7:5]) with op code(3'b0000).
            output_rs_reg = mem[1][3];
            output_rt_rd_reg = mem[1][4];
		    //output_shiftbits_reg = mem[0][2:0];
		    input_sign_extension_immediate = mem[1][2:0];

        end
        
        3'b100: begin // ADDI instruction
            output_ctrl_unit_opcode = mem[2][7:5]; // just for our understading this is op code but in the case above matches the user input as op code(pc[7:5]) with op code(3'b0000).
            output_rs_reg = mem[2][3];
            output_rt_rd_reg = mem[2][4];
		    //output_shiftbits_reg = 0;
		    input_sign_extension_immediate = mem[2][2:0];
		
        end
        
        3'b101: begin // Store Word instruction
            output_ctrl_unit_opcode = mem[3][7:5]; // just for our understading this is op code but in the case above matches the user input as op code(pc[7:5]) with op code(3'b0000).
            output_rs_reg = mem[3][3];
            output_rt_rd_reg = mem[3][4];
		    //output_shiftbits_reg = 0;
		    input_sign_extension_immediate = mem[3][2:0];
		
        end
        
        3'b110: begin // Load Word instruction
            output_ctrl_unit_opcode = mem[4][7:5]; // just for our understading this is op code but in the case above matches the user input as op code(pc[7:5]) with op code(3'b0000).
            output_rs_reg = mem[4][3];
            output_rt_rd_reg = mem[4][4];
		    //output_shiftbits_reg = 0;
		    input_sign_extension_immediate = mem[4][2:0];
		
        end
        
        3'b111: begin // Shift Left Logical instruction
            output_ctrl_unit_opcode = mem[5][7:5]; // just for our understading this is op code but in the case above matches the user input as op code(pc[7:5]) with op code(3'b0000).
            output_rs_reg = mem[5][3];
            output_rt_rd_reg = mem[5][4];
		    //output_shiftbits_reg = mem[4][2:0];
		    input_sign_extension_immediate = mem[5][2:0];
		
        end
        
        // Add your own cases for more instructions here
        
        default: begin
            output_ctrl_unit_opcode = 3'bXXX; // just for our understading this is op code but in the case above matches the user input as op code(pc[7:5]) with op code(3'b0000).
            output_rs_reg = 1'bX;
            output_rt_rd_reg = 1'bX;
		    //output_shiftbits_reg = 0;
		    input_sign_extension_immediate = 1'bX;
	  end
 endcase
end

endmodule

