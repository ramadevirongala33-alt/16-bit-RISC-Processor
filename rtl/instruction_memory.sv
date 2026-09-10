`timescale 1ns/1ps

module instruction_memory(

    input  logic [15:0] address,
    output logic [15:0] instruction

);

logic [15:0] memory [0:255];

integer i;

initial begin

    memory[0] = 16'h0123;
    memory[1] = 16'h1456;
    memory[2] = 16'h2678;
    memory[3] = 16'h389A;
    memory[4] = 16'h4ABC;

    for(i=5; i<256; i=i+1)
        memory[i] = 16'h0000;

    $display("MEM0=%h", memory[0]);
    $display("MEM1=%h", memory[1]);
    $display("MEM2=%h", memory[2]);

end

always_comb begin

    instruction = memory[address >> 1];

end

endmodule