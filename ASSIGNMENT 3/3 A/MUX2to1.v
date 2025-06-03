Design Code:
module mux2to1 (
    input  wire S,         
    input  wire [1:0] I,   
    output wire Y          
);
    assign Y = (S == 1'b0) ? I[0] : I[1];
endmodule


Testbench:
`timescale 1ns/1ps

module mux2to1_tb;
    reg  [1:0] I;
    reg        S;
    wire       Y;
    mux2to1 uut (
        .I(I),
        .S(S),
        .Y(Y)
    );
    initial begin
        I = 2'b00; S = 0; #10;
        I = 2'b00; S = 1; #10;
        I = 2'b01; S = 0; #10;
        I = 2'b01; S = 1; #10;
        I = 2'b10; S = 0; #10;
        I = 2'b10; S = 1; #10;
        I = 2'b11; S = 0; #10;
        I = 2'b11; S = 1; #10;
        $finish;
    end
endmodule
