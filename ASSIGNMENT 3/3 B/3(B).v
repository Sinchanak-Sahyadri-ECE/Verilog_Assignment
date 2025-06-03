Design Code:
module mux_dff (
    input  wire clk,
    input  wire I1,
    input  wire S,
    output reg  Q
);
    wire D;
    assign D = (S == 1'b0) ? Q : I1;

    always @(posedge clk) begin
        Q <= D;
    end
endmodule

Testbench:
`timescale 1ns/1ps
module mux_dff_feedback_tb;
    reg clk;
    reg I1;
    reg S;
    wire Q;
    mux_dff uut (
        .clk(clk),
        .I1(I1),
        .S(S),
        .Q(Q)
    );
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
        clk = 0;
        forever #10 clk = ~clk;
    end
    initial begin
        I1 = 0;
        S  = 0;
        #25;
        I1 = 1; S = 1; #40;
        S = 0; #40;
        I1 = 0; #40;
        S = 1; I1 = 0; #40;
        $finish;
    end
endmodule

