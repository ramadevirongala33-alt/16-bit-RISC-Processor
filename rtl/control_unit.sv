
`timescale 1ns/1ps

module control_unit(

    input  logic [3:0] opcode,


    output logic [3:0] alu_control,

    output logic reg_write,

    output logic mem_read,

    output logic mem_write,
    output logic alu_src,
    output logic jump,

    output logic branch

);


// Opcode Decode

always_comb
begin


    // Default values

    alu_control = 4'b0000;

    reg_write   = 1'b0;

    mem_read    = 1'b0;

    mem_write   = 1'b0;
    alu_src     = 1'b0;
    jump        = 1'b0;

    branch      = 1'b0;



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



        // XOR
        4'b0100:

        begin

            alu_control = 4'b0100;

            reg_write = 1'b1;

        end



        // LOAD
        4'b0101:

        begin

            alu_control = 4'b0000;
            alu_src  = 1'b1;
            mem_read = 1'b1;

            reg_write = 1'b1;

        end



        // STORE
        4'b0110:

        begin

            alu_control = 4'b0000;
            alu_src   = 1'b1;
            mem_write = 1'b1;

        end



        // MOV
        4'b0111:

        begin

            alu_control = 4'b0000;

            reg_write = 1'b1;

        end



        // JUMP
        4'b1000:

        begin

            jump = 1'b1;

        end



        // BEQ
        4'b1001:

        begin

            branch = 1'b1;

            alu_control = 4'b0001;

        end



        // BNE
        4'b1010:

        begin

            branch = 1'b1;

            alu_control = 4'b0001;

        end



        // SHIFT LEFT
        4'b1011:

        begin

            alu_control = 4'b0101;

            reg_write = 1'b1;

        end



        // SHIFT RIGHT
        4'b1100:

        begin

            alu_control = 4'b0110;

            reg_write = 1'b1;

        end



        default:

        begin

            alu_control = 4'b0000;

            reg_write = 1'b0;

            mem_read = 1'b0;

            mem_write = 1'b0;

            jump = 1'b0;

            branch = 1'b0;

        end


    endcase


end


endmodule
