`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2023 06:49:31 AM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;
    reg clk;
    reg alusrc;
    reg [7:0]read_data2;
    reg [2:0]alu_op;
    reg [7:0]read_data1;
    reg  [2:0]input_sign_extension_immediate;
    wire [7:0]output_sign_extension_immediate;
    wire [7:0]output_mux2;
    wire [7:0]alu_result;
    
    alu dut(
    .clk(clk),
    .alusrc(alusrc),
    .read_data2(read_data2),
    .alu_op(alu_op),
    .read_data1(read_data1),
    .input_sign_extension_immediate(input_sign_extension_immediate),
    .output_sign_extension_immediate(output_sign_extension_immediate),
    .output_mux2(output_mux2),
    .alu_result(alu_result)
    );
    
    //initally
    initial begin
        clk = 1;
        
        //alusrc = 1'b0;
        //alu_op = 3'b0;
        //read_data1 = 8'b0;
        //read_data2 = 8'b0;
       // input_sign_extension_immediate = 3'b000;
       // $display("alu_result = %b, output_sign_extension_immediate = %b", alu_result, output_sign_extension_immediate);
        //#1
         //Test case 1 ADD
        alusrc = 1'b0; // this is selct line to mux to see the 2 value is coming from read_data or output of sign extention immeditae.
        alu_op = 3'b000; // this will tell which operation to perform
        read_data1 = 8'b00000101;
        read_data2 = 8'b00001000;
        input_sign_extension_immediate = 3'b101;
        #2;
        $display("alu_result = %b, output_sign_extension_immediate = %b", alu_result, output_sign_extension_immediate);
        
        
        // Test case 2 sll
        alusrc = 1'b1; // this is selct line to mux to see the 2 value is coming from read_data or output of sign extention immeditae.
        alu_op = 3'b111; // this will tell which operation to perform
        read_data1 = 8'b00101001;
        read_data2 = 8'b00001100;
        input_sign_extension_immediate = 3'b001;
        #2;
        $display("alu_result = %b, output_sign_extension_immediate = %b", alu_result, output_sign_extension_immediate);
        
        //Test case 3 Load word
        alusrc = 1'b1; // this is selct line to mux to see the 2 value is coming from read_data or output of sign extention immeditae.
        alu_op = 3'b110; // this will tell which operation to perform
        read_data1 = 8'b10101010;
        read_data2 = 8'b00001000;
        input_sign_extension_immediate = 3'b101;
        #2;
        $display("alu_result = %b, output_sign_extension_immediate = %b", alu_result, output_sign_extension_immediate);
        
        // Test case 4 Store word
        alusrc = 1'b1; // this is selct line to mux to see the 2 value is coming from read_data or output of sign extention immeditae.
        alu_op = 3'b101; // this will tell which operation to perform
        read_data1 = 8'b00000110;
        read_data2 = 8'b00001000;
        input_sign_extension_immediate = 3'b011;
        #2;
        $display("alu_result = %b, output_sign_extension_immediate = %b", alu_result, output_sign_extension_immediate);
        
        //Test case 5 ADDI
        alusrc = 1'b1; // this is selct line to mux to see the 2 value is coming from read_data or output of sign extention immeditae.
        alu_op = 3'b100; // this will tell which operation to perform
        read_data1 = 8'b00000100;
        read_data2 = 8'b00001100;
        input_sign_extension_immediate = 3'b110;
        #2;
        $display("alu_result = %b, output_sign_extension_immediate = %b", alu_result, output_sign_extension_immediate);
        $finish;
    end
always #1 clk = ~clk;
endmodule