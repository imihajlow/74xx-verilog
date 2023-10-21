`timescale 1ns/1ns
module shift_74165(
    output q7,
    output n_q7,
    input ds,
    input [7:0] d,
    input n_pl,
    input cp,
    input n_ce
);

    reg [7:0] q;

    initial begin
        q = 8'bx;
    end

    wire c = cp | n_ce;

    always @(n_pl or d) begin
        if (~n_pl) begin
            q <= #15 d;
        end
    end
    always @(posedge c) begin
        if (n_pl) begin
            q <= #15 {q[6:0], ds};
        end
    end

    assign q7 = q[7];
    assign n_q7 = ~q[7];
endmodule
