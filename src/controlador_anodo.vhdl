library ieee;
use     ieee.std_logic_1164.all;

entity controlador_anodo is
    port(
        D_2BIT  : in std_logic_vector(1 downto 0);
        Q       : out std_logic_vector(3 downto 0)
        );
end entity controlador_anodo;


architecture controlador_arq of controlador_anodo is

begin
    with D_2BIT select
        Q       <= "1110" when "00",
                   "1101" when "01",
                   "1011" when "10",
                   "0111" when "11",
                   "1110" when others;
end architecture controlador_arq;
