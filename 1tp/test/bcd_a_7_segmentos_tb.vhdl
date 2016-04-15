library ieee;
use     ieee.std_logic_1164.all;
library tp1;
use     tp1.my_package.all;


entity bcd_a_7_segmentos_tb is
begin
end entity bcd_a_7_segmentos_tb;

architecture tb of bcd_a_7_segmentos_tb is
    signal clk_int : std_logic;
    signal rst_int : std_logic := '1';
    signal ena_int : std_logic;
    signal D_int   : std_logic := '1';
    signal Qcon    : std_logic_vector(3 downto 0);
    signal Qbcd    : std_logic_vector(7 downto 0);

begin
    clo : clock
    port map (
                 Q => clk_int,
                 RST => rst_int
             );

    digito : contador_bcd
    port map (
                D => D_int,
                CLK => clk_int,
                Q => Qcon,
                RST => rst_int,
                ENA => ena_int
             );

    bcd : bcd_a_7_segmentos
    port map (
                BIN => Qcon,
                DIG => Qbcd
            );
    rst_int <= '0';



end architecture tb;
