.PHONY: all clean


all: test_74153 test_7474 test_74151 test_74193 test_74151 test_74164 test_744040 test_74165

clean:
	rm -f ./test_7474 ./test_74153 ./test_74193 ./test_74151 ./test_74165 ./test_74161 ./test_744040
	rm -f *.vcd

test_74153: test_74153.v ../selector_74153.v
	iverilog -o $@ $^
	./verilog-verify.sh ./test_74153

test_74151: test_74151.v ../mux_74151.v
	iverilog -o $@ $^
	./verilog-verify.sh ./test_74151

test_7474: test_7474.v ../d_ff_7474.v
	iverilog -o $@ $^
	./verilog-verify.sh ./test_7474

test_74193: test_74193.v ../counter_74193.v
	iverilog -o $@ $^
	./verilog-verify.sh ./test_74193

test_74164: test_74164.v ../shift_74164.v
	iverilog -o $@ $^
	./verilog-verify.sh ./test_74164

test_744040: test_744040.v ../counter_744040.v
	iverilog -o $@ $^
	./verilog-verify.sh ./test_744040

test_74165: test_74165.v ../shift_74165.v
	iverilog -o $@ $^
	./verilog-verify.sh ./test_74165
