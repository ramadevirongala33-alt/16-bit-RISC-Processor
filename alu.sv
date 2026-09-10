
`timescale 1ns/1ps

module alu(

    input  logic [15:0] operand_a,

    input  logic [15:0] operand_b,

    input  logic [3:0]  alu_control,


    output logic [15:0] alu_result,

    output logic zero_flag

);


// ALU Operations

always_comb
begin

    case(alu_control)


        // ADD

        4'b0000:

        begin
            alu_result = operand_a + operand_b;
        end



        // SUB

        4'b0001:

        begin
            alu_result = operand_a - operand_b;
        end



        // AND

        4'b0010:

        begin
            alu_result = operand_a & operand_b;
        end



        // OR

        4'b0011:

        begin
            alu_result = operand_a | operand_b;
        end



        // XOR

        4'b0100:

        begin
            alu_result = operand_a ^ operand_b;
        end



        // SHIFT LEFT

        4'b0101:

        begin
            alu_result = operand_a << operand_b[3:0];
        end



        // SHIFT RIGHT

        4'b0110:

        begin
            alu_result = operand_a >> operand_b[3:0];
        end



        // COMPARE

        4'b0111:

        begin
            if(operand_a == operand_b)

                alu_result = 16'd0;

            else

                alu_result = 16'd1;

        end



        // DEFAULT

        default:

        begin
            alu_result = 16'd0;
        end


    endcase


end



// Zero Flag Generation

always_comb
begin

    if(alu_result == 16'd0)

        zero_flag = 1'b1;

    else

        zero_flag = 1'b0;


end


endmodule
