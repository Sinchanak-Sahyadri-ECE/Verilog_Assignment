Design code:
module mux4to1 (
  input  wire [1:0] S,
  input  wire [3:0] I,
    output reg      Y
);
    always @(*) begin
        case (sel)
            2'b00: out = I[0];
            2'b01: out = I[1];
            2'b10: out = I[2];
            2'b11: out = I[3];
        endcase
    end
endmodule


Testbench:
`timescale 1ns/1ps
module mux4to1_tb;
    reg  [3:0] I;
    reg  [1:0] S;
    wire Y;
    mux4to1 uut (
        .I(I),
        .S(S),
        .Y(Y)
    );
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        I = 4'b1010; S = 2'b00; #10;
        I = 4'b1010; S = 2'b01; #10;
        I = 4'b1010; S = 2'b10; #10;
        I = 4'b1010; S = 2'b11; #10;
        I = 4'b1100; S = 2'b00; #10;
        I = 4'b1100; S = 2'b01; #10;
        I = 4'b1100; S = 2'b10; #10;
        I = 4'b1100; S = 2'b11; #10;
        $finish;
    end
endmodule
