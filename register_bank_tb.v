`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2023 07:45:44 PM
// Design Name: 
// Module Name: register_bank_tb
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

module register_bank_tb;
    

    reg clk;
    reg read_reg1; 
    reg read_reg2;
    reg reg_write;
    reg reg_dst;
    reg [7:0] data_memory_out;
    wire [7:0] read_data1;
    wire [7:0] read_data2_muxop;
    
    register_bank dut (
        .clk(clk),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .reg_write(reg_write),
        .reg_dst(reg_dst),
        .data_memory_out(data_memory_out),
        .read_data1(read_data1),
        .read_data2_muxop(read_data2_muxop)
    );
        initial begin
        clk = 1;
        
        data_memory_out = 8'b00000000;
        read_reg1 = data_memory_out[3];  
        read_reg2 = data_memory_out[4];
        reg_write = 1'b0;
        reg_dst = 1'b0;
        #2;
        $display("read_data1 = %b, read_data2_muxop = %b", read_data1, read_data2_muxop);
 

    // Test Case 1
    
       data_memory_out = 8'b00000010; //aa
       read_reg1 = data_memory_out[3];  
       read_reg2 = data_memory_out[4];
       reg_write = 1'b1;
       reg_dst = 1'b0;
       #2;
       $display("read_data1 = %b, read_data2_muxop = %b", read_data1, read_data2_muxop);
        
     // Test Case 2
     
       data_memory_out = 8'b00000011; //
       read_reg1 = data_memory_out[3];
       read_reg2 = data_memory_out[4];
       reg_write = 1'b1;
       reg_dst = 1'b0;
       #2;
       $display("read_data1 = %b, read_data2_muxop = %b", read_data1, read_data2_muxop);
       
     // Test Case 3
     
       data_memory_out = 8'b00000001;
       read_reg1 = data_memory_out[3];
       read_reg2 = data_memory_out[4];
       reg_write = 1'b0;
       reg_dst = 1'b0;
       #2;
       $display("read_data1 = %b, read_data2_muxop = %b", read_data1, read_data2_muxop);
       
     // Test Case 4
     
       data_memory_out = 8'b00000111;
       read_reg1 = data_memory_out[3];
       read_reg2 = data_memory_out[4];
       reg_write = 1'b1;
       reg_dst = 1'b0;
       #2;
       $display("read_data1 = %b, read_data2_muxop = %b", read_data1, read_data2_muxop);
       
     // Test Case 5
     
       data_memory_out = 8'b11000111;
       read_reg1 = data_memory_out[3];
       read_reg2 = data_memory_out[4];
       reg_write = 1'b0;
       reg_dst = 1'b1;
       #2;
       $display("read_data1 = %b, read_data2_muxop = %b", read_data1, read_data2_muxop);
       
       // Test Case 6
       data_memory_out = 8'b00010111;
       read_reg1 = data_memory_out[3];
       read_reg2 = data_memory_out[4];
       reg_write = 1'b1;
       reg_dst = 1'b1;
       #2;
       $display("read_data1 = %b, read_data2_muxop = %b", read_data1, read_data2_muxop);
       
       // Test Case 7
       data_memory_out = 8'b00001111;
       read_reg1 = data_memory_out[3];
       read_reg2 = data_memory_out[4];
       reg_write = 1'b1;
       reg_dst = 1'b1;
       #2;
       $display("read_data1 = %b, read_data2_muxop = %b", read_data1, read_data2_muxop);
       
       // Test Case 8
       data_memory_out = 8'b00011111;
       read_reg1 = data_memory_out[3];
       read_reg2 = data_memory_out[4];
       reg_write = 1'b0;
       reg_dst = 1'b1;
       #2;
       $display("read_data1 = %b, read_data2_muxop = %b", read_data1, read_data2_muxop);
       $finish;
     end
 always #1 clk = ~clk;
endmodule
