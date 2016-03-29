library ieee;
use     ieee.std_logic_1164.all;

entity clock is
    generic( tau : time := 1 ns);
    port(
        Q : out std_logic
    );
end entity clock;


architecture clock_arq of clock is
    signal Q_int : std_logic := '0';

begin
    Q_int <= not Q_int after tau;
    Q <= Q_int;
end architecture clock_arq;
