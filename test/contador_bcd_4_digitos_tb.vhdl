library ieee;
use     ieee.std_logic_1164.all;
library tp1;
use     tp1.my_package.all;

entity contador_bcd_4_digitos_tb is
begin
end entity;

architecture tb of contador_bcd_4_digitos_tb is
    signal rst_i : std_logic := '1';
    signal clk_i : std_logic;
    signal Q_i   : std_logic_vector(7 downto 0);

begin

    contador_4 : contador_bcd_4_digitos
    port map(
                CLK => clk_i,
                RST => rst_i,
                Q   => Q_i
            );

    clk1    :   clock
    generic map ( tau => 1 ps)
    port map (
                Q => clk_i,
                RST => rst_i
             );
    rst_i <= '0';

end architecture tb;
