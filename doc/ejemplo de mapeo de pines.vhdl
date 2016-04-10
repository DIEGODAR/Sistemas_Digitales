library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador is
    generic(N: natural := 4);
    port(
        clk, rst, ena: in std_logic;
        Q: out std_logic_vector(N-1 downto 0)
                            );
            
        attribute loc: string;
                    
        attribute loc of clk:signal is "T9";
        attribute loc of rst:signal is "L14";
        attribute loc of ena:signal is "K13";
        attribute loc of Q:signal is "N14 L12 P14 K12";

end contador;

architecture Behavioral of contador is

begin
    
    process(clk, rst)
        variable count: unsigned(N-1 downto 0);
    begin
        if rst = '1' then
            count := (others => '0'); -- (N-1 downto 0 => '0')
        elsif rising_edge(clk) then
            if ena = '1' then
                count := count + 1;
            end if;
        end if;
        Q <= std_logic_vector(count);
    end process;
end Behavioral;


