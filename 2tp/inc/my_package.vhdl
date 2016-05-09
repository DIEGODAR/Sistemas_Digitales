library ieee;
use ieee.std_logic_1164.all;

package my_package is

    component clock is
        generic( tau : time := 1 ns);
        port(
            RST : in  std_logic;
            Q   : out std_logic
        );
    end component clock;

    component FlipFlop is
        port(
            D   : in std_logic;
            CLK : in std_logic;
            RST : in std_logic;
            Q   : out std_logic;
            notQ: out std_logic
        );
    end component FlipFlop;

end package my_package;
