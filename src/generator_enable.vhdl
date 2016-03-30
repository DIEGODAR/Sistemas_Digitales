library ieee;
use     ieee.std_logic_1164.all;

entity generator_enable is
    generic ( N : integer := 1000);
    port (
        clk : in std_logic;
        ena : out std_logic;
        rst : in std_logic
    );
end entity generator_enable;


architecture enable_arq of generator_enable is
begin

    process(clk)
        variable count : integer := 0;
    begin
        if rst = '1' then
            ena <= '0';
        elsif rising_edge(clk) then
            count :=count +1;
            if count = N then
                ena <= '1';
                count := 0;
            else
                ena <= '0';
            end if;
        end if;
    end process;
end architecture;
