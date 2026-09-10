
`timescale 1ns/1ps

module data_memory(

    input  logic        clk,

    input  logic        reset,


    input  logic        mem_read,

    input  logic        mem_write,


    input  logic [15:0] address,

    input  logic [15:0] write_data,


    output logic [15:0] read_data

);



logic [15:0] memory [0:255];


integer i;



// Memory Write and Reset

always_ff @(posedge clk or posedge reset)

begin


    if(reset)

    begin

        for(i=0;i<256;i=i+1)

        begin

            memory[i] <= 16'd0;

        end

    end


    else

    begin


        if(mem_write)

        begin

            memory[address] <= write_data;

        end


    end


end



// Memory Read

always_comb

begin


    if(mem_read)

    begin

        read_data = memory[address];

    end


    else

    begin

        read_data = 16'd0;

    end


end



endmodule
