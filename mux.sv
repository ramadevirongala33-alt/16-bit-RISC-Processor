
`timescale 1ns/1ps

module mux(

    input  logic [15:0] input0,

    input  logic [15:0] input1,


    input  logic select,


    output logic [15:0] output_data

);


// 2x1 Multiplexer

always_comb

begin


    case(select)


        1'b0:

        begin

            output_data = input0;

        end



        1'b1:

        begin

            output_data = input1;

        end



        default:

        begin

            output_data = 16'd0;

        end


    endcase


end



endmodule
