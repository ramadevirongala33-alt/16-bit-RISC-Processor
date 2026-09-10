`timescale 1ns/1ps

module forwarding_unit(

    input logic [3:0] ex_rs1,

    input logic [3:0] ex_rs2,


    input logic [3:0] mem_rd,

    input logic       mem_reg_write,


    input logic [3:0] wb_rd,

    input logic       wb_reg_write,


    output logic [1:0] forward_a,

    output logic [1:0] forward_b

);



// Forwarding Logic

always_comb
begin


    // Default: No forwarding

    forward_a = 2'b00;

    forward_b = 2'b00;



    // EX stage source 1 hazard

    if(mem_reg_write && (mem_rd != 4'd0) &&
       (mem_rd == ex_rs1))

    begin

        forward_a = 2'b10;

    end


    else if(wb_reg_write && (wb_rd != 4'd0) &&
            (wb_rd == ex_rs1))

    begin

        forward_a = 2'b01;

    end



    // EX stage source 2 hazard

    if(mem_reg_write && (mem_rd != 4'd0) &&
       (mem_rd == ex_rs2))

    begin

        forward_b = 2'b10;

    end


    else if(wb_reg_write && (wb_rd != 4'd0) &&
            (wb_rd == ex_rs2))

    begin

        forward_b = 2'b01;

    end



end


endmodule
