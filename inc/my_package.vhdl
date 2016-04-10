library ieee;
use     ieee.std_logic_1164.all;

package my_package is
    component clock is
        generic ( tau : time := 1 ns);
        port(
            Q : out std_logic;
            RST : in std_logic
        );
    end component clock;

    component generator_enable is
        generic ( N : integer := 1000);
        port (
            CLK : in std_logic;
            Q   : out std_logic;
            RST : in std_logic
        );
    end component generator_enable;

    component contador_bcd is
        port(
            D   : in std_logic;
            CLK : in  std_logic;
            Q   : out std_logic_vector(3 downto 0);
            RST : in std_logic;
            ENA : out std_logic
            );
    end component contador_bcd;
        

end package my_package;
