CC= make
GHDL=ghdl
GHDLFLAGS= --work=tp2 --workdir=obj
INC=inc/my_package.vhdl
SRC=src/clock.vhdl src/FlipFlop.vhdl
TEST=test/clock_tb.vhdl test/FlipFlop_tb.vhdl
VCD=vcd/


ALL: clean include m 
	$(CC) -f file/clock \
		&& $(CC) -f file/FlipFlop

run: clock_tb
	./clock_tb --stop-time=100ns --vcd=$(VCD)tb_clock.vcd \
		&& ./flipflop_tb --stop-time=100ns --vcd=$(VCD)tb_flipflop.vcd

include:
	$(GHDL) -i $(GHDLFLAGS) $(INC) $(SRC) $(TEST)

m:
	$(GHDL) --gen-makefile $(GHDLFLAGS) -o exe/clock_tb clock_tb > file/clock \
		&& $(GHDL) --gen-makefile $(GHDLFLAGS) -o exe/FlipFlop_tb FlipFlop_tb > file/FlipFlop

clean:
	$(GHDL) --remove $(GHDLFLAGS) \
		&& rm -rfv e~* $(VCD)*.vcd file/clo* file/Flip*
