`timescale 1us/1ns
module test_74165();
    task assert;
        input v;
        if (v !== 1'b1)
            $fatal;
    endtask

    wire [7:0] q;
    wire q7, n_q7;
    reg ds;
    reg [7:0] d;
    reg n_pl;
    reg cp;
    reg n_ce;
    shift_74165 inst(
        .q7(q7),
        .n_q7(n_q7),
        .ds(ds),
        .d(d),
        .n_pl(n_pl),
        .cp(cp),
        .n_ce(n_ce));

    initial begin
        $dumpfile("test_74165.vcd");
        $dumpvars;

        // parallel load
        cp = 1'b0;
        n_ce = 1'b0;
        ds = 1'b0;
        d = 8'ha5;
        n_pl = 1'b0;
        #1
        assert(q7 === 1'b1);
        assert(n_q7 === 1'b0);
        d = 8'h5a;
        #1
        assert(q7 === 1'b0);
        assert(n_q7 === 1'b1);

        cp = 1'b1;
        #1
        assert(q7 === 1'b0);
        assert(n_q7 === 1'b1);
        d = 8'ha5;
        n_pl = 1'b0;
        #1
        assert(q7 === 1'b1);
        assert(n_q7 === 1'b0);
        d = 8'h5a;
        #1
        assert(q7 === 1'b0);
        assert(n_q7 === 1'b1);

        // shift with cp
        // 0
        cp = 1'b0;
        n_pl = 1'b1;
        #1
        assert(q7 === 1'b0);
        assert(n_q7 === 1'b1);

        // 1
        cp = 1'b1;
        #1
        assert(q7 === 1'b1);
        assert(n_q7 === 1'b0);
        cp = 1'b0;
        #1
        assert(q7 === 1'b1);
        assert(n_q7 === 1'b0);
        ds = 1'b1;

        // 0
        cp = 1'b1;
        #1
        assert(q7 === 1'b0);
        assert(n_q7 === 1'b1);
        cp = 1'b0;
        #1
        assert(q7 === 1'b0);
        assert(n_q7 === 1'b1);
        ds = 1'b1;

        // 1
        cp = 1'b1;
        #1
        assert(q7 === 1'b1);
        assert(n_q7 === 1'b0);
        cp = 1'b0;
        #1
        assert(q7 === 1'b1);
        assert(n_q7 === 1'b0);
        ds = 1'b1;

        // 1
        cp = 1'b1;
        #1
        assert(q7 === 1'b1);
        assert(n_q7 === 1'b0);
        cp = 1'b0;
        #1
        assert(q7 === 1'b1);
        assert(n_q7 === 1'b0);
        ds = 1'b1;

        // 0
        cp = 1'b1;
        #1
        assert(q7 === 1'b0);
        assert(n_q7 === 1'b1);
        cp = 1'b0;
        #1
        assert(q7 === 1'b0);
        assert(n_q7 === 1'b1);
        ds = 1'b1;

        // 1
        cp = 1'b1;
        #1
        assert(q7 === 1'b1);
        assert(n_q7 === 1'b0);
        cp = 1'b0;
        #1
        assert(q7 === 1'b1);
        assert(n_q7 === 1'b0);
        ds = 1'b1;

        // 0
        cp = 1'b1;
        #1
        assert(q7 === 1'b0);
        assert(n_q7 === 1'b1);
        cp = 1'b0;
        #1
        assert(q7 === 1'b0);
        assert(n_q7 === 1'b1);
        ds = 1'b1;

        // 0 - bit from ds
        cp = 1'b1;
        #1
        assert(q7 === 1'b0);
        assert(n_q7 === 1'b1);
        cp = 1'b0;
        #1
        assert(q7 === 1'b0);
        assert(n_q7 === 1'b1);
        ds = 1'b1;

        // 1 - bit from ds
        cp = 1'b1;
        #1
        assert(q7 === 1'b1);
        assert(n_q7 === 1'b0);
        cp = 1'b0;
        #1
        assert(q7 === 1'b1);
        assert(n_q7 === 1'b0);
        ds = 1'b1;
    end
endmodule
