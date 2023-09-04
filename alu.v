`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2023 06:24:10 AM
// Design Name: 
// Module Name: alu
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


module alu (
    input clk,
    input alusrc, // select line for mux2. one bit
     // one bit value it can be either regiesters[0] or registers[1]
    input [2:0] input_sign_extension_immediate,
    input [2:0] alu_op,
    input [7:0] read_data1,
    input [7:0] read_data2,
    output reg [7:0] alu_result
    
    
);

//These are internal variables and don't need to be given as input
reg [7:0] output_sign_extension_immediate;
reg [7:0] output_mux2;

initial begin
    alu_result = 8'b0;
end

always @(*) begin
//Mux2 Code Starts here
    output_sign_extension_immediate = {{5{1'b0}}, input_sign_extension_immediate};
    
    if (alusrc) begin
        output_mux2 = read_data2;
    end else begin
        output_mux2 = output_sign_extension_immediate;
       end
       
//Mux2 Code ends here

//ALU Code Starts here
    case (alu_op)
        3'b000: begin
            alu_result <= read_data1 + output_mux2; // ADD
            end
        3'b111: begin 
            alu_result <= read_data1 << output_mux2; // Shift :eft Left
            end
        3'b110: begin
         alu_result <= read_data1 + output_mux2; // Load Word
        end
        3'b101: begin 
        alu_result <= read_data1 + output_mux2; // Store Word
        end
        3'b100: begin 
        alu_result <= read_data1 + output_mux2; // ADD Immediate
        end
        default: begin
            alu_result <= 8'bXXXXXXXX;
         end
    endcase
end

endmodule