`timescale 1ns/1ps

module cpu_tb;

    logic clk;
    logic reset;

    cpu_top DUT (
        .clk(clk),
        .reset(reset)
    );

    // Clock
    initial begin
        clk = 1'b0;
    end

    always #5 clk = ~clk;

    // Reset
    initial begin
        reset = 1'b1;
        #20;
        reset = 1'b0;
    end

    // Waveform
    initial begin
        $dumpfile("cpu_waveform.vcd");
        $dumpvars(0, cpu_tb);
    end

endmodule