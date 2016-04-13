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
    signal count : integer range 0 to 3 := 0;
begin
    process(clk,rst,d)
    begin
        if rst = '1' then
            count <=0;
        elsif rising_edge(clk) then
            if D = '1' then
                if count = 3 then
                    count <=0;
                else
                    count <= count + 1;
                end if;
            end if;
        end if;
    end process;
    Q   <= std_logic_vector( to_signed(count,N));
end architecture;
