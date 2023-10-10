`timescale 1us/1ns
module test_74164();
    task assert;
        input v;
        if (v !== 1'b1)
            $fatal;
    endtask

    reg dsa;
    reg dsb;
    reg n_mr;
    reg cp;
    wire [7:0] q;
    shift_74164 inst(
        .q(q),
        .cp(cp),
        .n_mr(n_mr),
        .dsa(dsa),
        .dsb(dsb));

    initial begin
        $dumpfile("test_74164.vcd");
        $dumpvars;

        n_mr = 1'b0;
        dsb = 1'b1;
        dsa = 1'b0;
        cp = 1'b0;
        #1
        assert(q === 8'b0);
        n_mr = 1'b1;
        #1
        assert(q === 8'b0);

        dsa = 1'b1;
        cp = 1'b1;
        #1
        assert(q === 8'b00000001);
        cp = 1'b0;
        #1
        assert(q === 8'b00000001);

        dsa = 1'b1;
        cp = 1'b1;
        #1
        assert(q === 8'b00000011);
        cp = 1'b0;
        #1
        assert(q === 8'b00000011);

        dsa = 1'b0;
        cp = 1'b1;
        #1
        assert(q === 8'b00000110);
        cp = 1'b0;
        #1
        assert(q === 8'b00000110);

        dsa = 1'b0;
        cp = 1'b1;
        #1
        assert(q === 8'b00001100);
        cp = 1'b0;
        #1
        assert(q === 8'b00001100);

        dsa = 1'b1;
        dsb = 1'b1;
        cp = 1'b1;
        #1
        assert(q === 8'b00011001);
        cp = 1'b0;
        #1
        assert(q === 8'b00011001);

        dsa = 1'b1;
        dsb = 1'b0;
        cp = 1'b1;
        #1
        assert(q === 8'b00110010);
        cp = 1'b0;
        #1
        assert(q === 8'b00110010);

        n_mr = 1'b0;
        dsb = 1'b1;
        #1
        assert(q === 8'b0);
        cp = 1'b1;
        #1
        assert(q === 8'b0);
    end
endmodule
