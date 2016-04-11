library ieee;
use     ieee.std_logic_1164.all;
library tp1;
use     tp1.my_package.all;

entity controlador_anodo_tb is
begin
end entity controlador_anodo_tb;


architecture tb of controlador_anodo_tb is
    signal D_i  : std_logic_vector(1 downto 0);
    signal Q_i  : std_logic_vector(3 downto 0);
    signal cl   : std_logic;
    signal rst_i  : std_logic := '1';

begin

    anodo : controlador_anodo
    port map (
             D_2BIT => D_i,
             Q      => Q_i
             );

    clock1: clock
    generic map (tau => 1 ns)
    port map (
             Q => cl,
             RST => rst_i
             );

    cont2 : contador
    generic map (N => 2)
    port map (
             D => '1',
             CLK => cl,
             Q => D_i,
             RST => rst_i
             );
    rst_i <= '0';
end architecture tb;
