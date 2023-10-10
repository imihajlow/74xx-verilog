`timescale 1us/1ns
module test_744040();
    task assert;
        input v;
        if (v !== 1'b1)
            $fatal;
    endtask

    reg clk;
    reg clr;
    wire [11:0] q;
    counter_744040 inst(
        .q(q),
        .clk(clk),
        .clr(clr));

    integer i;
    initial begin
        $dumpfile("test_744040.vcd");
        $dumpvars;

        clr = 1'b1;
        clk = 1'b1;
        #1
        assert(q === 12'd0);
        clr = 1'b0;
        #1
        assert(q === 12'd0);

        clk = 1'b0;
        #1
        assert(q === 12'd1);
        clk = 1'b1;
        #1
        assert(q === 12'd1);

        for (i = 2; i != 1000; i = i + 1) begin
            clk = 1'b0;
            #1
            assert(q === i[11:0]);
            clk = 1'b1;
            #1
            assert(q === i[11:0]);
        end

        clr = 1'b1;
        #1
        assert(q === 12'd0);
        clr = 1'b0;
        #1
        assert(q === 12'd0);

        for (i = 1; i != 4096; i = i + 1) begin
            clk = 1'b0;
            #1
            assert(q === i[11:0]);
            clk = 1'b1;
            #1
            assert(q === i[11:0]);
        end
    end
endmodule
