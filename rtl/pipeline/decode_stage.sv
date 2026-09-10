`timescale 1ns/1ps

module decode_stage(

    input  logic [15:0] instruction,

    input  logic [15:0] read_data1,

    input  logic [15:0] read_data2,


    output logic [3:0] opcode,

    output logic [3:0] rs1,

    output logic [3:0] rs2,

    output logic [3:0] rd,


    output logic [15:0] reg_data1,

    output logic [15:0] reg_data2,


    output logic [15:0] immediate,


    output logic [3:0] alu_control,

    output logic reg_write,

    output logic mem_read,

    output logic mem_write,

    output logic branch,

    output logic jump

);


// Instruction Decode

always_comb

begin


    // Instruction format

    opcode = instruction[15:12];

    rd     = instruction[11:8];

    rs1    = instruction[7:4];

    rs2    = instruction[3:0];



    // Register values

    reg_data1 = read_data1;

    reg_data2 = read_data2;



    // Immediate generation

    immediate = {{12{instruction[3]}},instruction[3:0]};



    // Default control signals

    alu_control = 4'b0000;

    reg_write   = 1'b0;

    mem_read    = 1'b0;

    mem_write   = 1'b0;

    branch      = 1'b0;

    jump        = 1'b0;



    case(opcode)


        // ADD

        4'b0000:

        begin

            alu_control = 4'b0000;

            reg_write = 1'b1;

        end



        // SUB

        4'b0001:

        begin

            alu_control = 4'b0001;

            reg_write = 1'b1;

        end



        // AND

        4'b0010:

        begin

            alu_control = 4'b0010;

            reg_write = 1'b1;

        end



        // OR

        4'b0011:

        begin

            alu_control = 4'b0011;

            reg_write = 1'b1;

        end



        // LOAD

        4'b0101:

        begin

            mem_read = 1'b1;

            reg_write = 1'b1;

            alu_control = 4'b0000;

        end



        // STORE

        4'b0110:

        begin

            mem_write = 1'b1;

            alu_control = 4'b0000;

        end



        // JUMP

        4'b1000:

        begin

            jump = 1'b1;

        end



        // BRANCH

        4'b1001:

        begin

            branch = 1'b1;

            alu_control = 4'b0001;

        end



        default:

        begin

            alu_control = 4'b0000;

        end


    endcase


end


endmodule
