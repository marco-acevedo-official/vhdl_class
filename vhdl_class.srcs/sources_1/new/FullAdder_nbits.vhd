LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
----------------------------------------------------------------
entity FullAdder_nbits is
    generic ( n: integer := 4);
    Port
    (
        nCin    : in std_logic;
        nA      : in std_logic_vector(n-1 downto 0);
        nB      : in std_logic_vector(n-1 downto 0);
        nSUM    : out std_logic_vector(n-1 downto 0);
        nCout   : out std_logic
    );
end FullAdder_nbits;
----------------------------------------------------------------
----------------------------------------------------------------
architecture Behavioral of FullAdder_nbits is
        signal c : std_logic_vector(n-2 downto 0);
        component FullAdder is
            Port
            (
                Cin     :   in std_logic;
                A       :   in std_logic;
                B       :   in std_logic;
                SUM     :   out std_logic;
                Cout    :   out std_logic 
            );
        end component;

    begin --architecture Behavioral of FullAdder_nbits

        FA0: FullAdder port map
        (
                nCin,       --Cin 
                nA(0),      --A   
                nB(0),      --B   
                nSUM(0),    --SUM 
                c(0)        --Cout
         );
        FA1: FullAdder port map
        (
                c(0),       --Cin 
                nA(1),      --A      
                nB(1),      --B   
                nSUM(1),    --SUM
                c(1)        --Cout
         );
        FA2: FullAdder port map
        (
                c(1), 
                nA(2),   
                nB(2),
                nSUM(2) ,
                c(2)
         );
        FA3: FullAdder port map
        (
                c(2), 
                nA(3),   
                nB(3),
                nSUM(3) ,
                nCout
         );
end architecture Behavioral;
----------------------------------------------------------------