`timescale 1ns/1ns
module shift_74164(
//output
          q,
//input
          cp,
          n_mr,
          dsa, dsb);
    input wire cp;
    input wire n_mr;
    input wire dsa, dsb;
    output reg [7:0] q;

    initial begin
        q = 8'bx;
    end

    wire ds = dsa & dsb;

    always @(posedge cp or negedge n_mr) begin
        if (~n_mr) begin
            q <= #15 8'b0;
        end else begin
            q <= #15 {q[6:0], ds};
        end
    end
endmodule
