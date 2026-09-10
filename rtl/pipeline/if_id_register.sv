`timescale 1ns/1ps

module if_id_register(

    input  logic        clk,

    input  logic        reset,

    input  logic        enable,


    input  logic [15:0] pc_in,

    input  logic [15:0] instruction_in,


    output logic [15:0] pc_out,

    output logic [15:0] instruction_out

);



// IF/ID Pipeline Register

always_ff @(posedge clk or posedge reset)

begin


    if(reset)

    begin

        pc_out <= 16'd0;

        instruction_out <= 16'd0;

    end



    else if(enable)

    begin

        pc_out <= pc_in;

        instruction_out <= instruction_in;

    end



end



endmodule
