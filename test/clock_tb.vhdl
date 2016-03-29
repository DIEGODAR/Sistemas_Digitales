 library ieee;
 use     ieee.std_logic_1164.all;
 library tp1;
 use     tp1.my_package.all;

entity clock_tb is
begin
end entity clock_tb;


architecture tb_arq of clock_tb is
    signal Q_int : std_logic;
begin

    clk : clock
        generic map (tau => 1 ns)
        port map ( Q => Q_int);

end architecture tb_arq;
