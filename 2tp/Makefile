CC 		= ghdl
INC 	= -i
MAKE 	= -m
TEST 	= ./test/
SRC		= ./src/
DOC		= ./doc/
VCD     = $(DOC)vcd/
WORKDIR	= --workdir=obj
WORK	= --work=tp2
EXE		= ./exe/
INCDIR	= ./inc/
NULL	=# 1>/dev/null 2>/dev/null

INCLUDE = $(CC) $(INC) $(WORK) $(WORKDIR)
MAKERUN	= $(CC) $(MAKE) $(WORKDIR) $(WORK) -o

# Auxiliares
PACKAGE	= $(INCDIR)my_package.vhdl

# Reglas
test: $(VCD)tb_clock.vcd





# Zonas de tests
$(EXE)clock_tb:	$(SRC)clock.vhdl $(TEST)clock_tb.vhdl
	$(INCLUDE) $(SRC)clock.vhdl $(TEST)clock_tb.vhdl $(PACKAGE) $(NULL) \
		&& $(MAKERUN) $(EXE)clock_tb clock_tb $(NULL)


# Zona de archivos VCD
$(VCD)tb_clock.vcd: $(EXE)clock_tb
	$(EXE)clock_tb --stop-time=100ns --vcd=$(VCD)tb_clock.vcd $(NULL)


clean:
	rm -rfv exe/*_tb exe/*.o obj/* doc/vcd/*.vcd ?
