LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
----------------------------------------------------------------
entity FullAdderTb is
end entity;
----------------------------------------------------------------
----------------------------------------------------------------
architecture bench of FullAdderTb is
        signal sA, sB, sSUM: std_logic_vector(3 downto 0);
        signal sCin, sCout: std_logic;
        
        component FullAdder_nbits
            Port
            (
                nCin     :   in std_logic;
                nA       :   in std_logic_vector(3 downto 0);
                nB       :   in std_logic_vector(3 downto 0);
                nSUM     :   out std_logic_vector(3 downto 0);
                nCout    :   out std_logic
            );
        end component;

    begin
        FullAdder_N : FullAdder_nbits port map (
            nCin  => sCin,
            nA    => sA,
            nB    => sB,
            nSUM  => sSUM,
            nCout => sCout
        );
    
        stimulus: process
        begin
            -- Operation 1
            sA <= "0000";
            sB <= "0000";
            sCin <= '0';
            wait for 10 ns;
    
            -- Operation 2 
            sA <= "0001";
            sB <= "0001";
            sCin <= '0';
            wait for 10 ns;
            -- 
            sA <= "0010";
            sB <= "0001";
            sCin <= '0';
            wait for 10 ns;
            wait;
        end process;
    
end architecture;
