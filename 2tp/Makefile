CC= make
GHDL=ghdl
GHDLFLAGS= --work=tp2 --workdir=obj
GENMAKE= --gen-makefile
INC=inc/my_package.vhdl
SRC=src/clock.vhdl src/FlipFlop.vhdl src/contadorBinario.vhdl src/contador_bcd.vhdl \
	src/generator_enable.vhdl
TEST=test/clock_tb.vhdl test/FlipFlop_tb.vhdl test/contadorBinario_tb.vhdl test/contador_bcd_tb.vhdl \
	test/generator_enable_tb.vhdl
VCD=vcd/


ALL: clean include m 
	$(CC) -f file/m_clock \
		&& $(CC) -f file/m_FlipFlop \
		&& $(CC) -f file/m_contadorBinario \
		&& $(CC) -f file/m_contadorBCD \
		&& $(CC) -f file/m_generatorEnable

run: clock_tb
	./clock_tb --stop-time=100ns --vcd=$(VCD)tb_clock.vcd \
		&& ./flipflop_tb --stop-time=100ns --vcd=$(VCD)tb_flipflop.vcd \
		&& ./contadorbinario_tb --stop-time=100ns --vcd=$(VCD)tb_contadorbinario.vcd \
		&& ./contador_bcd_tb --stop-time=100ns --vcd=$(VCD)tb_contador_bcd.vcd \
		&& ./generator_enable_tb --stop-time=100ns --vcd=$(VCD)tb_generator_enable.vcd

include:
	$(GHDL) -i $(GHDLFLAGS) $(INC) $(SRC) $(TEST)

m:
	$(GHDL) $(GENMAKE) $(GHDLFLAGS) -o exe/clock_tb clock_tb > file/m_clock \
		&& $(GHDL) $(GENMAKE) $(GHDLFLAGS) -o exe/FlipFlop_tb FlipFlop_tb > file/m_FlipFlop \
		&& $(GHDL) $(GENMAKE) $(GHDLFLAGS) -o exe/contadorBinario_tb contadorBinario_tb > file/m_contadorBinario \
		&& $(GHDL) $(GENMAKE) $(GHDLFLAGS) -o exe/contador_bcd_tb contador_bcd_tb > file/m_contadorBCD \
		&& $(GHDL) $(GENMAKE) $(GHDLFLAGS) -o exe/generator_enable_tb generator_enable_tb > file/m_generatorEnable

clean:
	$(GHDL) --remove $(GHDLFLAGS) \
		&& rm -rfv e~* $(VCD)*.vcd file/m_*?
