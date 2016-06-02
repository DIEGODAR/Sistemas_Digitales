library ieee;
use     ieee.std_logic_1164.all;
library tp2;
use     tp2.my_package.all;

entity contador_bcd_tb is
begin
end entity contador_bcd_tb;


architecture tb_arq of contador_bcd_tb is

    signal D_int : std_logic := '1';
    signal RST_int : std_logic := '1';
    signal CLK_int : std_logic;
    signal Q_test : std_logic_vector(3 downto 0);
    signal ENA_out : std_logic :='1';

begin
    clk : clock
        generic map (tau => 1 ns)
        port map ( Q => CLK_int, RST => RST_int);

    D   : clock
        generic map ( tau => 15 ns)
        port map ( Q => D_int, RST => RST_int);

    bcd : contador_bcd
        generic map (maxNum => 3)
        port map ( D => D_int, 
                   CLK => CLK_int, 
                   Q => Q_test, 
                   RST => RST_int, 
                   ENA => ENA_out
               );
        RST_int <= '0';


end architecture tb_arq;
