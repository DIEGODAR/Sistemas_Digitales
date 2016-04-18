library ieee;
use     ieee.std_logic_1164.all;

entity clock is
    generic( tau : time := 1 ns);
    port(
        RST : in std_logic;
        Q : out std_logic
    );
end entity clock;


architecture clock_arq of clock is
    signal Q_int : std_logic := '1';
    signal RST_int : std_logic;

begin
    -- Asignación de señales
    Q <= Q_int;
    RST_int <= RST;

    -- Lógica
    Q_int <= '0' when RST_int = '1' else
             not Q_int after tau; 
end architecture clock_arq;
