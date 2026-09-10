
`timescale 1ns/1ps

module cpu_top(
    input  logic clk,
    input  logic reset,
    output logic [15:0] pc_out,
    output logic [15:0] instruction_out,
    output logic [15:0] alu_result_out
);


//==============================
// Program Counter
//==============================

logic [15:0] pc;
logic [15:0] pc_next;
logic [15:0] instruction_address;

assign pc_next = pc + 16'd2;

assign instruction_address = pc >> 1;



program_counter PC_UNIT(

    .clk(clk),
    .reset(reset),
    .pc_enable(1'b1),
    .pc_next(pc_next),
    .pc(pc)

);



//==============================
// Instruction Memory
//==============================

 logic [15:0] instruction;



instruction_memory IM_UNIT(

    .address(instruction_address),
    .instruction(instruction)

);



//==============================
// Instruction Fields
//==============================

logic [3:0] opcode;
logic [3:0] rd;
logic [3:0] rs1;
logic [3:0] rs2;


assign opcode = instruction[15:12];

assign rd  = instruction[11:8];

assign rs1 = instruction[7:4];

assign rs2 = instruction[3:0];



//==============================
// Control Unit
//==============================

logic [3:0] alu_control;

logic reg_write;
logic mem_read;
logic mem_write;
logic alu_src;
logic jump;
logic branch;



control_unit CU_UNIT(

    .opcode(opcode),

    .alu_control(alu_control),

    .reg_write(reg_write),

    .mem_read(mem_read),

    .mem_write(mem_write),
    .alu_src(alu_src),
    .jump(jump),

    .branch(branch)

);



//==============================
// Register File
//==============================


logic [15:0] read_data1;
logic [15:0] read_data2;

logic [15:0] write_back_data;



register_file RF_UNIT(

    .clk(clk),

    .reset(reset),

    .reg_write(reg_write),

    .read_addr1(rs1),

    .read_addr2(rs2),

    .write_addr(rd),

    .write_data(write_back_data),

    .read_data1(read_data1),

    .read_data2(read_data2)

);



//==============================
// Immediate Generator
//==============================

logic [15:0] immediate;



immediate_generator IMM_UNIT(

    .instruction(instruction),

    .immediate(immediate)

);



//==============================
// ALU Input MUX
//==============================

logic [15:0] alu_input2;



mux MUX_UNIT(

    .input0(read_data2),

    .input1(immediate),

    .select(alu_src),

    .output_data(alu_input2)

);



//==============================
// ALU
//==============================

logic [15:0] alu_result;

logic zero_flag;



alu ALU_UNIT(

    .operand_a(read_data1),

    .operand_b(alu_input2),

    .alu_control(alu_control),

    .alu_result(alu_result),

    .zero_flag(zero_flag)

);



//==============================
// Data Memory
//==============================
logic [15:0] address;
logic [15:0] write_data;
logic [15:0] memory_read_data;

assign address    = alu_result;
assign write_data = read_data2;



data_memory DM_UNIT(
    .clk(clk),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .address(address),
    .write_data(write_data),
    .read_data(memory_read_data)
);


//==============================
// Write Back MUX
//==============================


always_comb
begin

    if(mem_read)

        write_back_data = memory_read_data;

    else

        write_back_data = alu_result;


end
assign pc_out = pc;
assign instruction_out = instruction;
assign alu_result_out = alu_result;


endmodule
