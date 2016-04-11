library ieee;
use     ieee.std_logic_1164.all;
library tp1;
use     tp1.my_package.all;


entity contador_bcd_4_digitos is
    port(
            CLK : in std_logic;
            RST : in std_logic;
            Q   : out std_logic_vector(7 downto 0)
        );
end entity;

architecture arq of contador_bcd_4_digitos is

    --constantes 
    constant cuenta_contador : integer := 5;
    constant cuenta_display  : integer := 1;

    --Propias del contador de 4 digitos
    signal clk_i    : std_logic;
    signal rst_i    : std_logic;
    signal Q7segmentos      : std_logic_vector(7 downto 0);

    --Señales auxiliares
    signal Qena1    : std_logic;
    signal Qena2    : std_logic;
    signal Qcont0   : std_logic_vector(3 downto 0);
    signal Qcont1   : std_logic_vector(3 downto 0);
    signal Qcont2   : std_logic_vector(3 downto 0);
    signal Qcont3   : std_logic_vector(3 downto 0);
    signal Cont_ena : std_logic_vector(3 downto 0);
    signal Cont2bit : std_logic_vector(1 downto 0);
    signal Qmux     : std_logic_vector(3 downto 0);
    signal Qdeco    : std_logic_vector(7 downto 0);
    signal anodo    : std_logic_vector(3 downto 0);

begin
    -- vinculando puertos con señales
    clk_i <= CLK;-- <= clk_i;
    rst_i <= RST; -- <= rst_i;
    Q   <= Q7segmentos;

    -- generador de enable
    ena1    :   generator_enable
    generic map ( N => cuenta_contador )
    port map (
             CLK => clk_i,
             Q  => Qena1,
             RST => rst_i
             );
    ena2    :   generator_enable
    generic map ( N => cuenta_display)
    port map(
            CLK => clk_i,
            Q  => Qena2,
            RST => rst_i
            );

    --decodificador de 2 a 4 para anodo
    deco_anodo : controlador_anodo
    port map (
             D_2BIT => Cont2bit,
             Q  => anodo
             );
    
    --decodificador bcd a 7 segmentos
    deco_bcd : bcd_a_7_segmentos
    port map (
             BIN => Qmux,
             DIG => Qdeco
             );

    --multiplexor de dos variables de control
    mux     :   mux_control_2
    port map (
             C0 => Qcont0,
             C1 => Qcont1,
             C2 => Qcont2,
             C3 => Qcont3,
             S  => Cont2bit,
             Q  => Qmux,
             RST => rst_i
             );

    --contador dos dígitos
    cont2   :   contador
    generic map ( N => 2)
    port map (
             D  =>  Qena2,
             CLK => clk_i,
             Q  =>  Cont2bit,
             RST => rst_i
             );

    --cuatro contadores bcd
    contador0 : contador_bcd
    port map (
             D      => Qena1,
             CLK    => clk_i,
             Q      => Qcont0,
             RST    => rst_i,
             ENA    => Cont_ena(0)
             );
    contador1 : contador_bcd
    port map (
             D      => Cont_ena(0),
             CLK    => clk_i,
             Q      => Qcont1,
             RST    => rst_i,
             ENA    => Cont_ena(1)
             );
    contador2 : contador_bcd
    port map (
             D      => Cont_ena(1),
             CLK    => clk_i,
             Q      => Qcont2,
             RST    => rst_i,
             ENA    => Cont_ena(2)
             );
    contador3 : contador_bcd
    port map (
             D      => Cont_ena(2),
             CLK    => clk_i,
             Q      => Qcont3,
             RST    => rst_i,
             ENA    => Cont_ena(3)
             );
end architecture arq;
