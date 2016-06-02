library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

package my_package is

- CLOCK
    component clock is
        generic( tau : time := 1 ns);
        port(
            RST : in  std_logic;
            Q   : out std_logic
        );
    end component clock;

-- FLIPFLOP
    component FlipFlop is
        port(
            D   : in std_logic;
            CLK : in std_logic;
            RST : in std_logic;
            Q   : out std_logic;
            notQ: out std_logic
        );
    end component FlipFlop;
    
-- CONTADOR BINARIO
    component contadorBinario is
        generic (maxNum : integer := 33000 ; numSalida : integer := 16 );
        port(
            D   : in std_logic;
            CLk : in std_logic;
            RST : in std_logic;
            Q   : out std_logic_vector(numSalida-1 downto 0)
         );
    end component contadorBinario;

-- CONTADOR BCD
    component contador_bcd is
        generic(maxNum : integer := 10);
        port(
            D   : in std_logic;
            CLK : in std_logic;
            RST : in std_logic;
            Q   : out std_logic_vector(3 downto 0);
            ENA : out std_logic
        );
    end component contador_bcd;

-- GENERADOR DE ENABLE
    component generator_enable is
        generic (N : integer := 1000);
        port(
            CLK : in std_logic;
            RST : in std_logic;
            Q   : out std_logic
        );
    end component generator_enable;

end package my_package;
