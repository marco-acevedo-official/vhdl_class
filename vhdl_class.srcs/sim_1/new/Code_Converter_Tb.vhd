library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--------------------------------------------------
entity Code_Converter_Tb is                     --
end Code_Converter_Tb;                          --
--------------------------------------------------
                                                
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
architecture Behavioral of Code_Converter_Tb is -- Signal and Variable Declaration
    signal sX, sCLK : bit := '0';               --
    signal sZ : bit;                            --
    signal sStateOut : integer;                 --
    signal counter : integer := 0;              --
    constant clk_period : time := 10 ns;        --
    ----------------------------------------------
   
    component Code_Converter is-------------------Component Declaratio
        port (                                  --
            X: in bit;                          --
            CLK: in bit;                        --
            Z: out bit;                         --
            stateOut: out integer range 0 to 6  --
        );                                      --
    end component;--------------------------------

    begin
        uut: Code_Converter port map (------------ Instantiate Component
            X => sX,                            --
            CLK => sCLK,                        --
            Z => sZ,                            --
            stateOut => sStateOut               --
        );----------------------------------------
   
    clk_process: process-------------------------- Generate Clock Signal
    begin                                       --
        sCLK <= '0';                            --
        wait for clk_period / 2;                --
        sCLK <= '1';                            --
        wait for clk_period / 2;                --
    end process clk_process;                    --
    ----------------------------------------------
   
    stimulus: process-----------------------------sX sends input signals to the Code_Converter
    begin                                       --Output changes with different sequences of sX
        if counter < 9 then                     --
            sX <= '0';                          --
            counter <= counter + 1;             --
            wait for clk_period;                --
        else                                    --
            sX <= '1';                          --
            wait for clk_period;                --
        end if;                                 --
                                                --
    end process stimulus;-------------------------
   
end Behavioral;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------