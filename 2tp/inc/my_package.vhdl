library ieee;
use ieee.std_logic_1164.all;

package my_package is

    component clock is
        generic( tau : time := 1 ns);
        port(
            Q   : out std_logic;
            RST : in  std_logic
        );
    end component clock;

end package my_package;
