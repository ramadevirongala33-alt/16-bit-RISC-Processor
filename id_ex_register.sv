`timescale 1ns/1ps

module id_ex_register(

    input  logic        clk,

    input  logic        reset,

    input  logic        enable,


    input  logic [15:0] pc_in,

    input  logic [15:0] reg_data1_in,

    input  logic [15:0] reg_data2_in,

    input  logic [15:0] immediate_in,


    input  logic [3:0]  rs1_in,

    input  logic [3:0]  rs2_in,

    input  logic [3:0]  rd_in,


    input  logic [3:0]  alu_control_in,


    input  logic        reg_write_in,

    input  logic        mem_read_in,

    input  logic        mem_write_in,

    input  logic        branch_in,

    input  logic        jump_in,



    output logic [15:0] pc_out,

    output logic [15:0] reg_data1_out,

    output logic [15:0] reg_data2_out,

    output logic [15:0] immediate_out,


    output logic [3:0]  rs1_out,

    output logic [3:0]  rs2_out,

    output logic [3:0]  rd_out,


    output logic [3:0]  alu_control_out,


    output logic        reg_write_out,

    output logic        mem_read_out,

    output logic        mem_write_out,

    output logic        branch_out,

    output logic        jump_out

);



// ID/EX Pipeline Register

always_ff @(posedge clk or posedge reset)

begin


    if(reset)

    begin

        pc_out <= 16'd0;

        reg_data1_out <= 16'd0;

        reg_data2_out <= 16'd0;

        immediate_out <= 16'd0;


        rs1_out <= 4'd0;

        rs2_out <= 4'd0;

        rd_out <= 4'd0;


        alu_control_out <= 4'd0;


        reg_write_out <= 1'b0;

        mem_read_out <= 1'b0;

        mem_write_out <= 1'b0;

        branch_out <= 1'b0;

        jump_out <= 1'b0;

    end


    else if(enable)

    begin

        pc_out <= pc_in;

        reg_data1_out <= reg_data1_in;

        reg_data2_out <= reg_data2_in;

        immediate_out <= immediate_in;


        rs1_out <= rs1_in;

        rs2_out <= rs2_in;

        rd_out <= rd_in;


        alu_control_out <= alu_control_in;


        reg_write_out <= reg_write_in;

        mem_read_out <= mem_read_in;

        mem_write_out <= mem_write_in;

        branch_out <= branch_in;

        jump_out <= jump_in;

    end


end


endmodule