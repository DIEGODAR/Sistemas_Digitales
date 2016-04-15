library ieee;
use ieee.std_logic_1164.all;

entity mux_control_2 is
    generic( N : integer := 4);
    port(
        C0  : in std_logic_vector(N-1 downto 0);
        C1  : in std_logic_vector(N-1 downto 0);
        C2  : in std_logic_vector(N-1 downto 0);
        C3  : in std_logic_vector(N-1 downto 0);
        S   : in std_logic_vector(1 downto 0);
        Q   : out std_logic_vector(N-1 downto 0);
        RST : in std_logic
        );
end entity mux_control_2;

architecture mux_arq of mux_control_2 is
begin


    Q <= (OTHERS => '0') when rst = '1' else
         C0 when S = "00" else
         C1 when S = "01" else
         C2 when S = "10" else
         C3 when S = "11";


end architecture mux_arq;
