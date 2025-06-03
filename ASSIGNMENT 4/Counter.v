Design Code:
module updown_counter (
    input clk,
    input reset,
    input m,
    output reg [3:0] count
);
  always @(posedge clk or posedge reset) begin
    if (reset)
        count <= 4'b0000;
    else begin
      if (m)
            count <= count + 1;
        else
            count <= count - 1;
    end
end
endmodule


Testbench:
`timescale 1ns/1ps
module test_updown_counter;
reg clk;
reg reset;
reg m;
wire [3:0] count;
updown_counter uut (
    .clk(clk),
    .reset(reset),
    .m(m),
    .count(count)
);
always #5 clk = ~clk;
initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    clk = 0;
    reset = 1; m = 1; #10;
    reset = 0;
    repeat(10) #10;
    m = 0;
    repeat(10) #10;
    $finish;
end
endmodule
