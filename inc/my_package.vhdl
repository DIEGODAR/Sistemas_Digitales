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
        
    component contador is
        generic( N : integer := 1);
        port(
            D   : in std_logic;
            CLK : in std_logic;
            Q   : out std_logic_vector(N-1 downto 0);
            RST : in std_logic
            );
    end component;

    component mux_control_2 is
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
    end component;

end package my_package;
