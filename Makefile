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


test: $(EXE)clock_tb $(EXE)generator_enable_tb $(EXE)contador_bcd_tb $(EXE)contador_tb $(EXE)mux_control_2_tb $(EXE)bcd_a_7_segmentos_tb $(EXE)controlador_anodo_tb $(EXE)contador_bcd_4_digitos_tb
	$(EXE)clock_tb --stop-time=100ns --vcd=$(VCD)tb_clock.vcd $(NULL) \
		&& $(EXE)generator_enable_tb --stop-time=100ns --vcd=$(VCD)tb_generator_enable.vcd $(NULL) \
		&& $(EXE)contador_bcd_tb	--stop-time=100ns --vcd=$(VCD)tb_contador_bcd.vcd $(NULL) \
		&& $(EXE)contador_tb		--stop-time=100ns --vcd=$(VCD)tb_contador.vcd $(NULL) \
		&& $(EXE)mux_control_2_tb	--stop-time=100ns --vcd=$(VCD)tb_mux_control_2.vcd $(NULL) \
		&& $(EXE)bcd_a_7_segmentos_tb --stop-time=100ns --vcd=$(VCD)tb_bcd_a_7_segmentos.vcd $(NULL) \
		&& $(EXE)controlador_anodo_tb --stop-time=100ns --vcd=$(VCD)tb_controlador_anodo.vcd $(NULL) \
		&& $(EXE)contador_bcd_4_digitos_tb --stop-time=100ns --vcd=$(VCD)tb_contador_bcd_4_digitos.vcd #$(NULL)

$(EXE)clock_tb: $(CLOCK) $(PACKAGE)
	$(CC) $(INC) $(WORK) $(WORKDIR) $(CLOCK) $(PACKAGE) $(NULL) \
		&& $(CC) $(MAKE) $(WORKDIR) $(WORK) -o $(EXE)clock_tb clock_tb $(NULL)

$(EXE)generator_enable_tb: $(SRC)clock.vhdl $(SRC)generator_enable.vhdl $(TEST)generator_enable_tb.vhdl
	$(CC) $(INC) $(WORK) $(WORKDIR) $(SRC)clock.vhdl $(SRC)generator_enable.vhdl $(TEST)generator_enable_tb.vhdl \
		&& $(CC) $(MAKE) $(WORKDIR) $(WORK) -o $(EXE)generator_enable_tb generator_enable_tb $(NULL)

$(EXE)contador_bcd_tb: $(SRC)clock.vhdl $(SRC)contador_bcd.vhdl $(TEST)contador_bcd_tb.vhdl
	$(CC) $(INC) $(WORK) $(WORKDIR) $(SRC)clock.vhdl $(SRC)contador_bcd.vhdl $(TEST)contador_bcd_tb.vhdl \
		&& $(CC) $(MAKE) $(WORKDIR) $(WORK) -o $(EXE)contador_bcd_tb contador_bcd_tb $(NULL)

$(EXE)contador_tb: $(SRC)clock.vhdl $(SRC)contador.vhdl $(TEST)contador_tb.vhdl
	$(CC) $(INC) $(WORK) $(WORKDIR) $(SRC)clock.vhdl $(SRC)contador.vhdl $(TEST)contador_tb.vhdl \
		&& $(CC) $(MAKE) $(WORKDIR) $(WORK) -o $(EXE)contador_tb contador_tb $(NULL)

$(EXE)mux_control_2_tb: $(SRC)clock.vhdl $(SRC)contador.vhdl $(SRC)mux_control_2.vhdl $(TEST)mux_control_2_tb.vhdl
	$(CC) $(INC) $(WORK) $(WORKDIR) $(SRC)clock.vhdl $(SRC)contador.vhdl $(SRC)mux_control_2.vhdl $(TEST)mux_control_2_tb.vhdl \
		&& $(CC) $(MAKE) $(WORKDIR) $(WORK) -o $(EXE)mux_control_2_tb mux_control_2_tb $(NULL)

$(EXE)bcd_a_7_segmentos_tb: $(SRC)clock.vhdl $(SRC)contador_bcd.vhdl $(SRC)bcd_a_7_segmentos.vhdl $(TEST)bcd_a_7_segmentos_tb.vhdl
	$(CC) $(INC) $(WORK) $(WORKDIR) $(SRC)clock.vhdl $(SRC)contador_bcd.vhdl $(SRC)bcd_a_7_segmentos.vhdl $(TEST)bcd_a_7_segmentos_tb.vhdl \
		&& $(CC) $(MAKE) $(WORKDIR) $(WORK) -o $(EXE)bcd_a_7_segmentos_tb bcd_a_7_segmentos_tb $(NULL)

$(EXE)controlador_anodo_tb: $(SRC)clock.vhdl $(SRC)contador.vhdl $(SRC)controlador_anodo.vhdl $(TEST)controlador_anodo_tb.vhdl
	$(CC) $(INC) $(WORK) $(WORKDIR) $(SRC)clock.vhdl $(SRC)contador.vhdl $(SRC)controlador_anodo.vhdl $(TEST)controlador_anodo_tb.vhdl \
		&& $(CC) $(MAKE) $(WORKDIR) $(WORK) -o $(EXE)controlador_anodo_tb controlador_anodo_tb $(NULL)

$(EXE)contador_bcd_4_digitos_tb: $(SRC)clock.vhdl $(SRC)generator_enable.vhdl $(SRC)controlador_anodo.vhdl $(SRC)bcd_a_7_segmentos.vhdl $(SRC)mux_control_2.vhdl $(SRC)contador.vhdl $(SRC)contador_bcd.vhdl contador_bcd_4_digitos.vhdl $(TEST)contador_bcd_4_digitos_tb.vhdl
	$(CC) $(INC) $(WORK) $(WORKDIR) $(SRC)clock.vhdl $(SRC)generator_enable.vhdl $(SRC)controlador_anodo.vhdl $(SRC)bcd_a_7_segmentos.vhdl $(SRC)mux_control_2.vhdl $(SRC)contador.vhdl $(SRC)contador_bcd.vhdl contador_bcd_4_digitos.vhdl $(TEST)contador_bcd_4_digitos_tb.vhdl \
		&& $(CC) $(MAKE) $(WORKDIR) $(WORK) -o $(EXE)contador_bcd_4_digitos_tb contador_bcd_4_digitos_tb

clean:
	ghdl --remove --work=tp1 --workdir=obj \
		&& rm -rfv doc/vcd/*.vcd exe/* ?
