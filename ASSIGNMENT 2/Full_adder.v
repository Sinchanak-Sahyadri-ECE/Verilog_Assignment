Design Code:
module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);
    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

Testbench:
`timescale 1ns/1ps

module full_adder_tb;
    reg A_tb, B_tb, Cin_tb;
    wire Sum_tb, Cout_tb;

    full_adder uut (
      .A(A_tb),
        .B(B_tb),
        .Cin(Cin_tb),
        .Sum(Sum_tb),
        .Cout(Cout_tb)
    );

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
        A_tb = 0; B_tb = 0; Cin_tb = 0; #10;
        A_tb = 0; B_tb = 0; Cin_tb = 1; #10;
        A_tb = 0; B_tb = 1; Cin_tb = 0; #10;
        A_tb = 0; B_tb = 1; Cin_tb = 1; #10;
        A_tb = 1; B_tb = 0; Cin_tb = 0; #10;
        A_tb = 1; B_tb = 0; Cin_tb = 1; #10;
        A_tb = 1; B_tb = 1; Cin_tb = 0; #10;
        A_tb = 1; B_tb = 1; Cin_tb = 1; #10;

        $finish;
    end
endmodule

