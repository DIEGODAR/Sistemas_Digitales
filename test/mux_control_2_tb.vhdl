library ieee;
use     ieee.std_logic_1164.all;
library tp1;
use     tp1.my_package.all;

entity mux_control_2_tb is
begin
end entity mux_control_2_tb;


architecture tb_arq of mux_control_2_tb is
    signal C0_int : std_logic_vector(3 downto 0) := "0001";
    signal C1_int : std_logic_vector(3 downto 0) := "0010";
    signal C2_int : std_logic_vector(3 downto 0) := "0100";
    signal C3_int : std_logic_vector(3 downto 0) := "1000";

    signal S_int   : std_logic_vector(1 downto 0);
    signal rst_int : std_logic := '1';
    signal clo     : std_logic;
    signal Q_int   : std_logic_vector(3 downto 0);

begin

    clk : clock
    generic map ( tau => 1 ns)
    port map (
                 Q  => clo, 
                 RST => rst_int
             );

    con : contador
    generic map ( N => 2)
    port map (
                 D      => '1',
                 CLK    => clo,
                 Q      => S_int,
                 RST    => rst_int
             );

    mux : mux_control_2
    generic map (N => 4)
    port map (
                 C0 => C0_int,
                 C1 => C1_int,
                 C2 => C2_int,
                 C3 => C3_int,
                 S  => S_int,
                 Q  => Q_int,
                 RST => rst_int
             );
    rst_int <= '0';
end architecture tb_arq;
