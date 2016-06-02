library ieee;
use     ieee.std_logic_1164.all;
library tp2;
use     tp2.my_package.all;


entity FlipFlop_tb is
begin
end entity FlipFlop_tb;

architecture tb of FlipFlop_tb is
    signal Q_clk    : std_logic;
    signal RST_int  : std_logic := '1';
    signal D_int    : std_logic := '0';
begin
    RST_int <= '0';
    D_int <= not D_int after 7 ns;

    clk : clock
    generic map (tau => 10 ns)
    port map (
                 Q => Q_clk, 
                 RST => RST_int
             );
    
    flip_flop : FlipFlop
    port map (
                 D => D_int, 
                 CLK => Q_clk, 
                 RST => RST_int
             );
end architecture tb;
