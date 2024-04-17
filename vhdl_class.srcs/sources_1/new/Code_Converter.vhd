library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------
entity Code_Converter is
    port
    (
        X: in bit;
        CLK: in bit;
        Z: out bit;
        stateOut : out integer range 0 to 6
    );
end Code_Converter;
----------------------------------------------------
architecture Behavioral of Code_Converter is
    signal State    : integer range 0 to 6;
    signal Nextstate: integer range 0 to 6;
    begin
    
    stateOut <= state;

    process(State, X) -- Combinational Circuit ---------|
    begin                                             --|
    case State is                                     --|
        when 0 =>                                     --|
            if X = '0' then Z <= '1'; Nextstate <= 1; --|
            else Z <= '0'; Nextstate <= 2; end if;    --|
        when 1 =>                                     --|
            if X = '0' then Z <= '1'; Nextstate <= 3; --|
            else Z <= '0'; Nextstate <= 4; end if;    --|
        when 2 =>                                     --|
            if X = '0' then Z <= '0'; Nextstate <= 4; --|
            else Z <= '1'; Nextstate <= 4; end if;    --|
        when 3 =>                                     --|
            if X = '0' then Z <= '0'; Nextstate <= 5; --|
            else Z <= '1'; Nextstate <= 5; end if;    --|
        when 4 =>                                     --|
            if X = '0' then Z <= '1'; Nextstate <= 5; --|
            else Z <= '0'; Nextstate <= 6; end if;    --|
        when 5 =>                                     --|
            if X = '0' then Z <= '0'; Nextstate <= 0; --|
            else Z <= '1'; Nextstate <= 0; end if;    --|
        when 6 =>                                     --|
            if X = '0' then Z <= '1'; Nextstate <= 0; --|
            else Z <= '0'; Nextstate <= 0; end if;    --|
        when others => null;                          --|
    end case;                                         --|
    end process;--END Combinational Circuit ------------|
    
    process(CLK) -- State Register ---------------------|
    begin                                             --|
        if CLK'EVENT and CLK = '1' then --rising edge --|
            State <= Nextstate;                       --|
        end if;                                       --|
    end process;-- State Register ----------------------|
    
end Behavioral;