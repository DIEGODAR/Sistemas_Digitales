library ieee;
use ieee.std_logic_1164.all;
library tp1;
use tp1.my_package.all;

entity contador_tb is
begin
end contador_tb;

architecture tb_arq of contador_tb is
    signal D_int    : std_logic := '1';
    signal RST_int  : std_logic := '1';
    signal CLK_int  : std_logic;
    signal Q_test   : std_logic_vector(1 downto 0);

begin

    RST_int <= '0';

    clk : clock
        generic map (tau => 1 ns)
        port map (
                 Q => CLK_int, 
                 RST => RST_int
                 );
    D   : clock
        generic map ( tau => 20 ns)
        port map (
                 Q => D_int,
                 RST => RST_int
                 );

    contar2 : contador
            generic map (N => 2)
            port map(
                    D   => D_int,
                    CLK => CLK_int,
                    Q   => Q_test,
                    RST => RST_int
                    );
            
end architecture tb_arq;
