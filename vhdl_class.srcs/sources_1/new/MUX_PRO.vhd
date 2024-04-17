library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_PRO is
    Port (I0,I1,I2,I3 : in std_logic;
    A,B :in std_logic;
    F : out std_logic);
end MUX_PRO;

architecture Behavioral of MUX_PRO is
signal SEL : std_logic_vector(1 downto 0):="00";
begin
SEL <= A&B;
process(I0,I1,I2,I3,A,B) begin
    case SEL is
    when "00" => F <= I0;
    when "01" => F <= I1;
    when "10" => F <= I2;
    when "11" => F <= I3;
    WHEN OTHERS => F <= 'X';
    end case;

end process;

end Behavioral;