`timescale 1ns/1ns
module counter_744040
(
  clk,
  clr,
  q,
);

input wire clk;
input wire clr;
output reg [11:0] q;

wire [11:0] ripple_clock = ~{q[10:0], clk};

genvar i;
generate
  for (i = 0; i < 12; i = i + 1) begin
    always @(posedge clr or posedge ripple_clock[i]) begin
      if (clr) begin
        q[i] <= #17 1'b0;
      end else if (ripple_clock[i]) begin
        q[i] <= #10 ~q[i];
      end
    end
  end
endgenerate

endmodule
