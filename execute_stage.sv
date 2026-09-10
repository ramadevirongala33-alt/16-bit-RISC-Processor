`timescale 1ns/1ps

module execute_stage(

    input  logic [15:0] reg_data1,

    input  logic [15:0] reg_data2,

    input  logic [15:0] immediate,


    input  logic [3:0] alu_control,


    input  logic alu_src,


    output logic [15:0] alu_result,

    output logic zero_flag

);


// ALU second operand

logic [15:0] operand_b;



// Operand Selection

always_comb
begin

    if(alu_src)

        operand_b = immediate;

    else

        operand_b = reg_data2;


end



// ALU Operation

always_comb
begin


    case(alu_control)


        // ADD

        4'b0000:

            alu_result = reg_data1 + operand_b;



        // SUB

        4'b0001:

            alu_result = reg_data1 - operand_b;



        // AND

        4'b0010:

            alu_result = reg_data1 & operand_b;



        // OR

        4'b0011:

            alu_result = reg_data1 | operand_b;



        // XOR

        4'b0100:

            alu_result = reg_data1 ^ operand_b;



        // SHIFT LEFT

        4'b0101:

            alu_result = reg_data1 << operand_b[3:0];



        // SHIFT RIGHT

        4'b0110:

            alu_result = reg_data1 >> operand_b[3:0];



        default:

            alu_result = 16'd0;


    endcase


end



// Zero Flag

always_comb
begin

    if(alu_result == 16'd0)

        zero_flag = 1'b1;

    else

        zero_flag = 1'b0;


end


endmodule
