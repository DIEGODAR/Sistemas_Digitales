library ieee;
use     ieee.std_logic_1164.all;

package my_package is
    component clock is
        generic ( tau : time := 1 ns);
        port(
            Q : out std_logic
        );
    end component clock;

    component generator_enable is
        generic ( N : integer := 1000);
        port (
            clk : in std_logic;
            ena : out std_logic;
            rst : in std_logic
        );
    end component generator_enable;
        

end package my_package;
