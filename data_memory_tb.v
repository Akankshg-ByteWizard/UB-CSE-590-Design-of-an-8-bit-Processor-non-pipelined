`timescale 1ns/1ps

module data_memory_tb;
    // Inputs
    reg clk;
    reg [7:0] alu_result_address;
    reg [7:0] write_data;
    reg memread;
    reg memwrite;
    reg memory_to_register;
    //Output
    wire [7:0] read_data;
    wire [7:0] output_mux3;
    
    // Instantiate the data_memory module
    data_memory dut (
        .clk(clk),
        .alu_result_address(alu_result_address),
        .write_data(write_data),
        .memread(memread),
        .memwrite(memwrite),
        .memory_to_register(memory_to_register),
        .read_data(read_data),
        .output_mux3(output_mux3)
    );

    initial begin
        clk = 1;

        // Write data to and read data from memory
        //testcase 1
        alu_result_address = 8'b00001100;
        write_data = 8'b00000110;
        memread = 1'b0;
        memwrite = 1'b0;
        memory_to_register = 1'b1;
        #2 ;    
        //Write data in memory
        //testcase 2
        alu_result_address = 8'b00001100;
        write_data = 8'b00001110;
        memread = 1'b0;
        memwrite = 1'b1;
        memory_to_register = 1'b1;
        #2;
        //Read data from memory
        //testcase 3
        alu_result_address = 8'b00001100;
        write_data = 8'b00010110;
        memread = 1'b1;
        memwrite = 1'b0;
        memory_to_register = 1'b1;
        #2;
        //testcase 4
        alu_result_address = 8'b00001100;
        write_data = 8'b00011110;
        memread = 1'b1;
        memwrite = 1'b1;
        memory_to_register = 1'b0 ;
        #2;
        //testcase 5
        alu_result_address = 8'b00001100;
        write_data = 8'b00011110;
        memread = 1'b1;
        memwrite = 1'b1;
        memory_to_register = 1'b1 ;
        
        $finish;
    end
always #1 clk = ~clk;
   
endmodule

