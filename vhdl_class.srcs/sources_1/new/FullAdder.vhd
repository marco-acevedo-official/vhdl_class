LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
----------------------------------------------------------------
entity FullAdder is
    Port(   
            Cin : in std_logic;
            A   : in std_logic;
            B   : in std_logic;
            SUM : out std_logic;
            Cout: out std_logic 
        );
end entity;
----------------------------------------------------------------
----------------------------------------------------------------
architecture Equation of FullAdder is
begin
    process(A,B,Cin) is
    begin
        SUM <= A xor B xor Cin;
        Cout <= (Cin and (A xor B)) or (A and B);
    end process;
end architecture;
----------------------------------------------------------------