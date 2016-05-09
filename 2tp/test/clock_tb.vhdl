 library ieee;
 use     ieee.std_logic_1164.all;
 library tp2;
 use     tp2.my_package.all;

entity clock_tb is
begin
end entity clock_tb;


architecture tb_arq of clock_tb is
    signal Q_int : std_logic;
    signal RST_int : std_logic := '0';
begin

    clk : clock
        generic map (tau => 1 ns)
        port map ( Q => Q_int, RST => RST_int);

        RST_int <= not RST_int after 5 ns;

end architecture tb_arq;
