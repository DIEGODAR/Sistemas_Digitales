library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_bcd is
    port(
        D   : in std_logic;                     --entrada de enable
        CLK : in std_logic;                     --entrada de clock
        Q   : out std_logic_vector(3 downto 0); --salida bcd
        RST : in std_logic;                     --entrada de rst
        ENA : out std_logic                     --salida de enable de 9 -> 0
    );
end entity contador_bcd;


architecture cont_arq of contador_bcd is
begin
    process(clk,rst,d)
        variable count : integer := 0;
    begin
        if rst = '1' then
            count := 0;
        elsif rising_edge(clk) then
            ena <= '0';
        end if;

        if D = '1' and rising_edge(clk) then
            count := count + 1 ;
        end if;
            
        if count = 10 then
            count := 0;
            ena <= '1';
        end if;

        Q <= std_logic_vector( to_signed(count,4) );

    end process;

end architecture;
