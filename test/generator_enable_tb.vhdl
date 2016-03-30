library ieee;
use     ieee.std_logic_1164.all;
library tp1;
use     tp1.my_package.all;


entity generator_enable_tb is
begin
end entity generator_enable_tb;


architecture tb of generator_enable_tb is
    signal clk_int : std_logic;
    signal ena_int : std_logic;
    signal rst_int : std_logic;
begin
    clk_comp : clock
        generic map ( tau =>  10 ps)
        port map ( Q => clk_int);

    clk_rst : clock
        generic map ( tau => 2 ns )
        port map( Q => rst_int);

    enable_comp : generator_enable
        generic map ( N => 10)
        port map ( clk => clk_int, ena => ena_int, rst => rst_int);
end architecture tb;

