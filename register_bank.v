`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2023 10:54:57 AM
// Design Name: 
// Module Name: register_bank
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
module register_bank (
    input reset,
    input clk, // clock input
    input read_reg1, // register read 1 />>>>> output_rs_reg from IR code
    input read_reg2, // register read 2
    input reg_write, // register write = ALU O/P to check if we should write back in a register
    //input reg_dst,
    input [7:0] data_memory_out, // output from data memory or can also be called Mux3
    //input [7:0] display_reg_write,
    output [7:0] read_data1, // read data 1 output
    output [7:0] read_data2// read data 2 output
    );

    
reg [7:0] registers[1:0]; // 2 registers

initial begin
registers[0] = 8'b00000010;
registers[1] = 8'b00000011;
//read_data1 = 8'b00000000;
//read_data2 = 8'b00000000;

end
assign read_data1 = registers[read_reg1];
assign read_data2 = registers[read_reg2];

always @(read_reg1 or read_reg2) begin
//    if (reset) begin
//        registers[0] <= 8'b00000010;
//        registers[1] <= 8'b00000011;
//    end
//    read_data1 <= registers[read_reg1];
//    read_data2 <= registers[read_reg2];
        if (reg_write) begin
            registers[read_reg2] = data_memory_out;
        end
//always @(negedge clk) begin
//    if (reg_write) begin
//        registers[read_reg2] = data_memory_out;
//end

end

endmodule
