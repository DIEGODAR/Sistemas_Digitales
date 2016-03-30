CC 		= ghdl
INC 	= -i
MAKE 	= -m
TEST 	= ./test/
SRC		= ./src/
DOC		= ./doc/
WORKDIR	= --workdir=obj
WORK	= --work=tp1
EXE		= ./exe/
INCDIR	= ./inc/

CLOCK	= $(SRC)clock.vhdl $(TEST)clock_tb.vhdl
PACKAGE = $(INCDIR)my_package.vhdl


ALL:  test #contador_bcd_4_digitos_tb


test: $(EXE)clock_tb $(EXE)generator_enable_tb 
	$(EXE)clock_tb --stop-time=10ns --vcd=$(DOC)tb_clock.vcd 1>/dev/null 2>/dev/null \
		&& $(EXE)generator_enable_tb --stop-time=10ns --vcd=$(DOC)tb_generator_enable.vcd 1>/dev/null 2>/dev/null

$(EXE)clock_tb: $(CLOCK) $(PACKAGE)
	$(CC) $(INC) $(WORK) $(WORKDIR) $(CLOCK) $(PACKAGE) 1>/dev/null 2>/dev/null \
		&& $(CC) $(MAKE) $(WORKDIR) $(WORK) -o $(EXE)clock_tb clock_tb 1>/dev/null 2>/dev/null

$(EXE)generator_enable_tb: $(SRC)clock.vhdl $(SRC)generator_enable.vhdl $(TEST)generator_enable_tb.vhdl
	$(CC) $(INC) $(WORK) $(WORKDIR) $(SRC)clock.vhdl $(SRC)generator_enable.vhdl $(TEST)generator_enable_tb.vhdl \
		&& $(CC) $(MAKE) $(WORKDIR) $(WORK) -o $(EXE)generator_enable_tb generator_enable_tb 1>/dev/null 2>/dev/null

clean:
	ghdl --remove --work=tp1 --workdir=obj \
		&& rm -rfv doc/*vcd exe/* ?
