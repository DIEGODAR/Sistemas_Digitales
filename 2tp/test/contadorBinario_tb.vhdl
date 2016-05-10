library ieee;
use     ieee.std_logic_1164.all;
library tp2;
use     tp2.my_package.all;

entity contadorBinario_tb is
begin
end entity contadorBinario_tb;


architecture tb of contadorBinario_tb is
    signal clk_in   : std_logic;
    signal rst_in   : std_logic := '1';
begin
    rst_in <= '0';

    clk : clock
    port map(
            RST => rst_in,
            Q   => clk_in
        );
    cont : contadorBinario
    generic map(maxNum => 15, numSalida => 4)
    port map(D => '1', CLK => clk_in, RST => rst_in);

end architecture tb;
