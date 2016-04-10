library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador is
    generic( N : integer := 1);
    port(
        D   : in std_logic;
        CLK : in std_logic;
        Q   : out std_logic_vector(N-1 downto 0);
        RST : in std_logic
        );
end entity contador;

architecture cont_arq of contador is
begin
    process(clk,rst,d)
        variable count : integer := 0;
    begin
        if rst = '1' then
            count :=0;
        elsif D = '1' and rising_edge(clk) then
            count := count + 1;
        end if;
        Q   <= std_logic_vector( to_signed(count,N));
    end process;
end architecture;
