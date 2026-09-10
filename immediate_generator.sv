


`timescale 1ns/1ps

module immediate_generator(

    input  logic [15:0] instruction,

    output logic [15:0] immediate

);


// Immediate value generation

always_comb

begin


    // Extract lower 8 bits

    if(instruction[7] == 1'b1)

    begin

        // Sign extension for negative value

        immediate = {8'hFF, instruction[7:0]};

    end


    else

    begin

        // Zero extension for positive value

        immediate = {8'h00, instruction[7:0]};

    end


end



endmodule
