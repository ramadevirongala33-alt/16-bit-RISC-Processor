`timescale 1ns/1ps

module program_counter(

    input  logic clk,
    input  logic reset,
    input  logic pc_enable,
    input  logic [15:0] pc_next,
    output logic [15:0] pc

);

always_ff @(posedge clk or posedge reset)
begin
    if(reset)
        pc <= 16'h0000;

    else if(pc_enable)
        pc <= pc_next;

end

endmodule