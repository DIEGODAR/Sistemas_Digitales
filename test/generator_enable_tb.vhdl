library ieee;
use     ieee.std_logic_1164.all;
library tp1;
use     tp1.my_package.all;


entity generator_enable_tb is
begin
end entity generator_enable_tb;


architecture tb of generator_enable_tb is
    signal clk_int : std_logic;
    signal q_int : std_logic;
    signal rst_int : std_logic;
begin
    clk_comp : clock
        generic map ( tau =>  1 ns)
        port map ( Q => clk_int, RST => '0');

    clk_rst : clock
        generic map ( tau => 20 ns )
        port map( Q => rst_int, RST => '0');

    enable_comp : generator_enable
        generic map ( N => 8)
        port map ( clk => clk_int, q => q_int, rst => rst_int);
end architecture tb;

