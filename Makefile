CC 		= ghdl
INC 	= -i
MAKE 	= -m
TEST 	= ./test/
SRC		= ./src/
DOC		= ./doc/
VCD     = $(DOC)vcd/
WORKDIR	= --workdir=obj
WORK	= --work=tp1
EXE		= ./exe/
INCDIR	= ./inc/
NULL	= 1>/dev/null 2>/dev/null

CLOCK	= $(SRC)clock.vhdl $(TEST)clock_tb.vhdl
PACKAGE = $(INCDIR)my_package.vhdl


ALL:  test #contador_bcd_4_digitos_tb


test: $(EXE)clock_tb $(EXE)generator_enable_tb $(EXE)contador_bcd_tb
	$(EXE)clock_tb --stop-time=100ns --vcd=$(VCD)tb_clock.vcd $(NULL) \
		&& $(EXE)generator_enable_tb --stop-time=100ns --vcd=$(VCD)tb_generator_enable.vcd $(NULL) \
		&& $(EXE)contador_bcd_tb	--stop-time=100ns --vcd=$(VCD)tb_contador_bcd.vcd $(NULL)

$(EXE)clock_tb: $(CLOCK) $(PACKAGE)
	$(CC) $(INC) $(WORK) $(WORKDIR) $(CLOCK) $(PACKAGE) $(NULL) \
		&& $(CC) $(MAKE) $(WORKDIR) $(WORK) -o $(EXE)clock_tb clock_tb $(NULL)

$(EXE)generator_enable_tb: $(SRC)clock.vhdl $(SRC)generator_enable.vhdl $(TEST)generator_enable_tb.vhdl
	$(CC) $(INC) $(WORK) $(WORKDIR) $(SRC)clock.vhdl $(SRC)generator_enable.vhdl $(TEST)generator_enable_tb.vhdl \
		&& $(CC) $(MAKE) $(WORKDIR) $(WORK) -o $(EXE)generator_enable_tb generator_enable_tb $(NULL)

$(EXE)contador_bcd_tb: $(SRC)clock.vhdl $(SRC)generator_enable.vhdl $(SRC)contador_bcd.vhdl $(TEST)contador_bcd_tb.vhdl
	$(CC) $(INC) $(WORK) $(WORKDIR) $(SRC)clock.vhdl $(SRC)generator_enable.vhdl $(SRC)contador_bcd.vhdl $(TEST)contador_bcd_tb.vhdl \
		&& $(CC) $(MAKE) $(WORKDIR) $(WORK) -o $(EXE)contador_bcd_tb contador_bcd_tb $(NULL)

clean:
	ghdl --remove --work=tp1 --workdir=obj \
		&& rm -rfv doc/vcd/*.vcd exe/* ?
