`timescale 1ns/1ps

module fetch_stage(

    input  logic        clk,

    input  logic        reset,


    input  logic [15:0] pc_in,

    input  logic [15:0] instruction_in,


    output logic [15:0] pc_out,

    output logic [15:0] instruction_out,


    output logic [15:0] pc_next

);



// Instruction Fetch Stage

always_comb

begin


    // Current PC value

    pc_out = pc_in;



    // Current instruction

    instruction_out = instruction_in;



    // Next instruction address

    pc_next = pc_in + 16'd2;


end



endmodule
