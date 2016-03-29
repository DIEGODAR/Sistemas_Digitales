CC 		= ghdl
INC 	= -i
MAKE 	= -m
TEST 	= ./test/
SRC		= ./src/
DOC		= ./doc/
WORKDIR	= --workdir=obj
WORK	= --work=tp1

CLOCK	= $(SRC)clock.vhdl $(TEST)clock_tb.vhdl
PACKAGE = $(SRC)my_package.vhdl


ALL:  test #contador_bcd_4_digitos_tb


test: $(TEST)clock_tb
	$(TEST)clock_tb --stop-time=10ns --vcd=$(DOC)tb_clock.vcd 

$(TEST)clock_tb: $(CLOCK) $(PACKAGE)
	$(CC) $(INC) $(WORK) $(WORKDIR) $(CLOCK) $(PACKAGE) \
		&& $(CC) $(MAKE) $(WORKDIR) $(WORK) -o $(TEST)clock_tb clock_tb

clean:
	ghdl --remove --work=tp1 --workdir=obj \
		&& rm -rfv doc/*vcd test/clock_tb test/*.o ?
