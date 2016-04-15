library ieee;
use     ieee.std_logic_1164.all;


entity bcd_a_7_segmentos is
    port(
            BIN : in std_logic_vector(3 downto 0);
            DIG : out std_logic_vector(7 downto 0)
        );
end bcd_a_7_segmentos;


architecture bcd_7_seg_arq of bcd_a_7_segmentos is

begin
    with BIN select
        DIG     <=  "00000011" when "0000",
                    "10011111" when "0001",
                    "00100101" when "0010",
                    "00001101" when "0011",
                    "10011001" when "0100",
                    "01001001" when "0101",
                    "11000001" when "0110",
                    "00011111" when "0111",
                    "00000001" when "1000",
                    "00011001" when "1001",
                    "00000011" when others;
end architecture bcd_7_seg_arq;
