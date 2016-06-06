library ieee;
use     ieee.std_logic_1164.all;
use     ieee.std_logic_arith.all;
use     ieee.std_logic_unsigned.all;


entity CharROM is
    generic(
            W:      integer := 8;
            nFC:    integer := 3
        );
    port(
        char_address:   in std_logic_vector(3 downto 0);
        font_row    :   in std_logic_vector(nFC-1 downto 0);
        font_col    :   in std_logic_vector(nFC-1 downto 0);
        rom_out     :   out std_logic
    );
end CharROM;

architecture arq of CharROM is 
    subtype tipoLinea is std_logic_vector(0 to W-1);

    type char is array(0 to W-1) of tipoLinea;

    constant char0: char:= (            
                                        "00111100",
                                        "01100110",
                                        "01100110",
                                        "01100110",
                                        "01100110",
                                        "01100110",
                                        "00111100",
                                        "00000000"
                                    );
    constant char1: char:=  (           
                                        "01111000",
                                        "00011000",
                                        "00011000",
                                        "00011000",
                                        "00011000",
                                        "00011000",
                                        "01111110",
                                        "00000000"
                                    );
    constant char2: char:=  (
                                        "01111110",
                                        "00000110",
                                        "00000110",
                                        "01111110",
                                        "01100000",
                                        "01100000",
                                        "01111110",
                                        "00000000"
                                    );
    constant char3: char:=  (
                                        "01111110",
                                        "00000110",
                                        "00000110",
                                        "11111110",
                                        "00000110",
                                        "00000110",
                                        "01111110",
                                        "00000000"
                                    );
    constant char4: char:=  ( 
                                        "01100110",
                                        "01100110",
                                        "01100110",
                                        "01111110",
                                        "00000110",
                                        "00000110",
                                        "00000110",
                                        "00000000"
                                    );
    constant char5: char:=  (
                                        "01111110",
                                        "01100000",
                                        "01100000",
                                        "01111110",
                                        "00000110",
                                        "00000110",
                                        "11111110",
                                        "00000000"
                                    );
    constant char6: char:=  (      
                                        "01111110",
                                        "01100000",
                                        "01100000",
                                        "01111110",
                                        "01100110",
                                        "01100110",
                                        "01111110",
                                        "00000000"
                                    );
    constant char7: char:=  (  
                                        "01111110",
                                        "00000110",
                                        "00000110",
                                        "00001100",
                                        "00001100",
                                        "00011000",
                                        "00011000",
                                        "00000000"
                                    );
    constant char8: char:=  (
                                        "01111110",
                                        "01100110",
                                        "01100110",
                                        "01111110",
                                        "01100110",
                                        "01100110",
                                        "01111110",
                                        "00000000"
                                    );
    constant char9: char:=  (
                                        "01111110",
                                        "01100110",
                                        "01100110",
                                        "01111110",
                                        "00000110",
                                        "00000110",
                                        "00000110",
                                        "00000000"
                                    );
    constant charV: char:=  (
                                        "01100110",
                                        "01100110",
                                        "01100110",
                                        "01100110",
                                        "01100110",
                                        "00111100",
                                        "00011000",
                                        "00000000"
                                    );
    constant charPunto: char:=(
                                        "00000000",
                                        "00000000",
                                        "00000000",
                                        "00000000",
                                        "00000000",
                                        "00000000",
                                        "00000110",
                                        "00000000"
                                    );
    constant charBlanco: char:=(
                                        "00000000",
                                        "00000000",
                                        "00000000",
                                        "00000000",
                                        "00000000",
                                        "00000000",
                                        "00000000",
                                        "00000000"
                                    );

    type memo is array(0 to 255) of tipoLinea;

    signal RAM: memo:= (
        
        0 =>char0(0), 1 =>char0(1), 2 =>char0(2), 3 =>char0(3), 4 =>char0(4), 5 =>char0(5), 6 =>char0(6), 7 =>char0(7),
        8 =>char1(0), 9 =>char1(1), 10=>char1(2), 11=>char1(3), 12=>char1(4), 13=>char1(5), 14=>char1(6), 15=>char1(7), 
        16=>char2(0), 17=>char2(1), 18=>char2(2), 19=>char2(3), 20=>char2(4), 21=>char2(5), 22=>char2(6), 23=>char2(7),
        24=>char3(0), 25=>char3(1), 26=>char3(2), 27=>char3(3), 28=>char3(4), 29=>char3(5), 30=>char3(6), 31=>char3(7),
        32=>char4(0), 33=>char4(1), 34=>char4(2), 35=>char4(3), 36=>char4(4), 37=>char4(5), 38=>char4(6), 39=>char4(7),
        40=>char5(0), 41=>char5(1), 42=>char5(2), 43=>char5(3), 44=>char5(4), 45=>char5(5), 46=>char5(6), 47=>char5(7), 
        48=>char6(0), 49=>char6(1), 50=>char6(2), 51=>char6(3), 52=>char6(4), 53=>char6(5), 54=>char6(6), 55=>char6(7),
        56=>char7(0), 57=>char7(1), 58=>char7(2), 59=>char7(3), 60=>char7(4), 61=>char7(5), 62=>char7(6), 63=>char7(7),
        64=>char8(0), 65=>char8(1), 66=>char8(2), 67=>char8(3), 68=>char8(4), 69=>char8(5), 70=>char8(6), 71=>char8(7),
        72=>char9(0), 73=>char9(1), 74=>char9(2), 75=>char9(3), 76=>char9(4), 77=>char9(5), 78=>char9(6), 79=>char9(7),
        80=>charV(0), 81=>charV(1), 82=>charV(2), 83=>charV(3), 84=>charV(4), 85=>charV(5), 86=>charV(6), 87=>charV(7),
        88=>charPunto(0),  89=>charPunto(1),  90=>charPunto(2),  91=>charPunto(3),  92=>charPunto(4),   93=>charPunto(5),   94=>charPunto(6),   95=>charPunto(7),
        96=>charBlanco(0), 97=>charBlanco(1), 98=>charBlanco(2), 99=>charBlanco(3), 100=>charBlanco(4), 101=>charBlanco(5), 102=>charBlanco(6), 103=>charBlanco(7),
        104 to 255 => "00000000"
    );

    signal char_addr_aux: std_logic_vector (8 downto 0);


begin

    char_addr_aux <= char_address & font_row;
    rom_out <= RAM(conv_integer(char_addr_aux))(conv_integer(font_col));

end architecture arq;
