library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FlipFlop is
    Port ( 
            D   : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Rst : in STD_LOGIC;
            Q   : out STD_LOGIC
          );
end D_FlipFlop;

architecture Behavioral of D_FlipFlop is
begin
    process (Clk, Rst)
    begin
        if Rst = '1' then
            Q <= '0';
        elsif rising_edge(CLK) then
            Q <= D;
        end if;
    end process;
    
end Behavioral;
