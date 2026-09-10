`timescale 1ns/1ps

module hazard_unit(

    input logic [3:0] id_rs1,

    input logic [3:0] id_rs2,


    input logic [3:0] ex_rd,


    input logic ex_mem_read,


    output logic stall

);



// Hazard Detection Logic
// Load followed by dependent instruction


always_comb
begin


    stall = 1'b0;



    if(ex_mem_read)

    begin


        if((ex_rd == id_rs1) || (ex_rd == id_rs2))

        begin

            if(ex_rd != 4'd0)

                stall = 1'b1;

        end


    end



end


endmodule