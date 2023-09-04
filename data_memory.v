`timescale 1ns / 1ps

module data_memory (clk, alu_result_address, write_data, memread, memwrite, memory_to_register, output_mux3);
    input clk; 
    input [7:0] alu_result_address;
    input [7:0] write_data;
    input memread;
    input memwrite;
    input memory_to_register;
    output reg [7:0] output_mux3;


//Internal Variables for manipulating 
reg [7:0] mem [255:0];
reg [7:0] read_data = 8'b0;

integer i;
initial begin
  for (i = 0; i < 256; i = i + 1) begin
    mem[i] = 8'b00000000 + i;
  end
end

always @(*) begin
    
    if (memwrite) begin
        mem[alu_result_address] <= write_data;
    end
    if (memread) begin
        read_data <= mem[alu_result_address];
    end
//Mux3 Code begins here
    if (memory_to_register) begin
        output_mux3 <= read_data;
    end else begin
        output_mux3 <= alu_result_address;
    end
//Mux3 Code ends here
end
endmodule

