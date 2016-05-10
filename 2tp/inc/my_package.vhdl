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
    
    component contadorBinario is
        generic (maxNum : integer := 33000 ; numSalida : integer := 16 );
        port(
            D   : in std_logic;
            CLk : in std_logic;
            RST : in std_logic;
            Q   : out std_logic_vector(numSalida-1 downto 0)
         );
    end component contadorBinario;

end package my_package;
