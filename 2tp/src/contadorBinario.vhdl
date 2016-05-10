library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;


entity contadorBinario is
    generic (maxNum : integer := 33000 ; numSalida : integer := 16);
    port(
        D   : in std_logic;
        CLK : in std_logic;
        RST : in std_logic;
        Q   : out std_logic_vector( numSalida-1 downto 0)
    );
end entity contadorBinario;


architecture arq of contadorBinario is
    signal count    : integer range 0 to maxNum := 0;
begin
    process(clk,rst)
    begin
        if rst = '1' then
            count <= 0;
        elsif rising_edge(clk) then
            if D = '1' then
                if count = maxNum then
                    count <= 0;
                else
                    count <= count + 1;
                end if;
            end if;
        end if;
    end process;
    Q <= std_logic_vector( to_signed( count,numSalida ));
end architecture arq; 
