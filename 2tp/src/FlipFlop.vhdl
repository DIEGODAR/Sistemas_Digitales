library ieee;
use     ieee.std_logic_1164.all;

entity FlipFlop is
    port(
        D   : in std_logic;
        CLK : in std_logic;
        RST : in std_logic;
        Q   : out std_logic;
        notQ: out std_logic
    );
end entity FlipFlop;

architecture arq of FlipFlop is
    signal Qi    : std_logic;
begin
    -- Asignación de señales
    Q   <= Qi;
    notQ <= not Qi;

    -- lógica
    process(clk,rst)
    begin
        if rst = '1' then
            Qi <= '0';
        elsif rising_edge(clk) then
            Qi <= D;
        end if;
    end process;

end architecture arq;
