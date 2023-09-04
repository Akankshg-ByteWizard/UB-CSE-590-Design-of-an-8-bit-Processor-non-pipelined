`timescale 1ns / 1ps

module ProgramCounter(
input clk,
input reset,
//input [7:0] instr_input,
output reg [7:0] pc_output
);

//reg [7:0] pc;
initial begin
    pc_output = 8'b00000000;
 end
 
always @(posedge clk) begin
    if(reset) begin
        pc_output = 8'b00000000;
    end else begin
        pc_output = pc_output + 1;
    end
end

//always @*begin
//    pc_output = pc;
//end

endmodule

