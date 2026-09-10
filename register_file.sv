
`timescale 1ns/1ps

module register_file(

    input  logic        clk,

    input  logic        reset,


    input  logic        reg_write,


    input  logic [3:0]  read_addr1,

    input  logic [3:0]  read_addr2,


    input  logic [3:0]  write_addr,


    input  logic [15:0] write_data,


    output logic [15:0] read_data1,

    output logic [15:0] read_data2

);



logic [15:0] registers [0:15];


integer i;



// Register Reset and Write Operation

always_ff @(posedge clk or posedge reset)

begin


    if(reset)

    begin

        for(i=0;i<16;i=i+1)

        begin

            registers[i] <= 16'd0;

        end

    end


    else

    begin


        if(reg_write)

        begin


            // R0 always remains zero

            if(write_addr != 4'd0)

            begin

                registers[write_addr] <= write_data;

            end


        end


    end


end



// Register Read Operation

always_comb
begin
    if(read_addr1 < 16)
        read_data1 = registers[read_addr1];
    else
        read_data1 = 16'd0;

    if(read_addr2 < 16)
        read_data2 = registers[read_addr2];
    else
        read_data2 = 16'd0;
end



endmodule
