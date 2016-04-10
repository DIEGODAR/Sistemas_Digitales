library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_bcd is
    port(
        D   : in std_logic;
        CLK : in std_logic;
        Q   : out std_logic_vector(3 downto 0);
        RST : in std_logic;
        ENA : out std_logic
    );
end entity contador_bcd;


architecture cont_arq of contador_bcd is
begin
    process(clk,rst,d)
        variable count : integer := 0;
    begin

        ena <= '0';
        if rst = '1' then
            count := 0;
        elsif D = '1' and rising_edge(clk) then
            count := count + 1 ;
            
            if count = 10 then
                count := 0;
                ena <= '1';
            else
                ena <= '0';
            end if;
        end if;
        Q <= std_logic_vector( to_signed(count,4) );
    end process;

end architecture;
