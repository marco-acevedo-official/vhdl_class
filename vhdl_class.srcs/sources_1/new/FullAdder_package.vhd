library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package FullAdder_package is
    component FullAdder
        port (            
                Cin : in std_logic;
                A   : in std_logic;
                B   : in std_logic;
                SUM : out std_logic;
                Cout: out std_logic
            );
        end component;
end FullAdder_package;

