`timescale 1ns / 1ps

`include "ProgramCounter.v" 
`include "instruction_memory.v" 
`include "control_unit.v"
`include "register_bank.v"
`include "alu.v" 
`include "data_memory.v" 

module Top_Module(clk1, reset1,
pc_output2, output_ctrl_unit_opcode2, input_sign_extension_immediate2, output_rs_reg2, output_rt_rd_reg2, register_write2, memory_to_register2, 
aluop2,
read_data1_2, read_data2_2, alu_result2, 
data_memory_out2, memread2, memwrite2, alusrc2
);

input clk1,reset1;
output reg [7:0] pc_output2;
output reg [2:0] output_ctrl_unit_opcode2;
output reg [2:0] input_sign_extension_immediate2 ;
output reg output_rs_reg2;
output reg output_rt_rd_reg2;
//output reg register_destination2;
output reg register_write2;
output reg memory_to_register2;
output reg [2:0] aluop2;
output reg [7:0] read_data1_2;
output reg [7:0] read_data2_2;
output reg [7:0] data_memory_out2;
output reg [7:0] alu_result2;
output reg memread2;
output reg memwrite2;
output reg alusrc2;

//reg [7:0] temp;
wire [7:0] pc_output1;

ProgramCounter pc1(
    .clk(clk1),
    .reset(reset1),
    .pc_output(pc_output1)
);

//$display("output_ctrl_unit_opcode =%3b", output_ctrl_unit_opcode); 


wire [2:0] output_ctrl_unit_opcode1;
wire [2:0] input_sign_extension_immediate1;
wire output_rs_reg1;
wire output_rt_rd_reg1;

  instruction_memory im (
    .clk(clk1),
    .pc(pc_output1),
    .input_sign_extension_immediate(input_sign_extension_immediate1),
    .output_rs_reg(output_rs_reg1),
    .output_rt_rd_reg(output_rt_rd_reg1),
    .output_ctrl_unit_opcode(output_ctrl_unit_opcode1)
    //.output_shiftbits_reg(output_shiftbits_reg)
    //.immediate(immediate)
  );

//wire register_destination1;
wire register_write1;
wire memory_to_register1;
wire [2:0] aluop1;
wire memread1;
wire memwrite1;
wire alusrc1;

    control_unit cu (
    .clk(clk1),
    .output_ctrl_unit_opcode(output_ctrl_unit_opcode1),
    //.register_destination(register_destination1),
    .register_write(register_write1),
    .memory_to_register(memory_to_register1),
    .aluop(aluop1),
    .memread(memread1),
    .memwrite(memwrite1),
    .alusrc(alusrc1)
    );
    

wire [7:0] read_data1_1;
wire [7:0] read_data2_1;
wire [7:0] data_memory_out1;
//wire reset1;

    register_bank rb(
    .clk(clk1),
    .reset(reset1),
    .read_reg1(output_rs_reg1),
    .read_reg2(output_rt_rd_reg1),
    .reg_write(register_write1),
    //.reg_dst(register_destination1),
    .data_memory_out(data_memory_out1),
    .read_data1(read_data1_1),
    .read_data2(read_data2_1)
    );
   

wire [7:0] alu_result1;

   alu a( 
   .clk(clk1),
   .alusrc(alusrc1),
   .input_sign_extension_immediate(input_sign_extension_immediate1),
   .alu_op(aluop1),
   .read_data1(read_data1_1),
   .read_data2(read_data2_1),
   .alu_result(alu_result1)
   );
   

   data_memory dm(
   .clk(clk1),
   .alu_result_address(alu_result1),
   .write_data(read_data2_1),
   .memread(memread1),
   .memwrite(memwrite1),
   .memory_to_register(memory_to_register1),
   .output_mux3(data_memory_out1)
    );
 
always @(*) begin
    output_ctrl_unit_opcode2 = output_ctrl_unit_opcode1;
    input_sign_extension_immediate2 = input_sign_extension_immediate1;
    output_rs_reg2 = output_rs_reg1;
    output_rt_rd_reg2 = output_rt_rd_reg1;
    //register_destination2 = register_destination1;
    register_write2 = register_write1;
    memory_to_register2 = memory_to_register1;
    aluop2 = aluop1;
    memread2 = memread1;
    memwrite2 = memwrite1;
    alusrc2 = alusrc1;
    read_data1_2 = read_data1_1;
    read_data2_2 = read_data2_1;
    alu_result2 = alu_result1;
    pc_output2 = pc_output1;
    data_memory_out2 = data_memory_out1;
end

    //temp <= data_memory_out2;


//always @(*) begin
//$display("pc_output =%8b", pc_output1);
//$display("output_ctrl_unit_opcode1 =%3b",output_ctrl_unit_opcode1);
//$display("input_sign_extension_immediate1 =%3b",input_sign_extension_immediate1);
//$display("output_rs_reg1 =%1b",output_rs_reg1);
//$display("output_rt_rd_reg1 =%1b",output_rt_rd_reg1);
//$display("register_destination1 =%1b",register_destination1);
//$display("register_write1 =%1b",register_write1);
//$display("memory_to_register1 =%1b",memory_to_register1);
//$display("aluop1 =%3b",aluop1);
//$display("memread1 =%1b",memread1);
//$display("memwrite1 =%1b",memwrite1);
//$display("alusrc1 =%1b",alusrc1);
//$display("read_data1_1 =%1b",read_data1_1);
//$display("read_data2_muxop1 =%8b", read_data2_1);
//$display("alu_result1 =%8b",alu_result1);

//end
   
    
endmodule
