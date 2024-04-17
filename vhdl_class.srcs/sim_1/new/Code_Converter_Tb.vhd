library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Code_Converter_Tb is                     
end Code_Converter_Tb;       

architecture Behavioral of Code_Converter_Tb is
    signal sX : bit := '0';               
    signal sCLK : bit := '0';               
    signal sZ : bit := '0';                     
    signal sStateOut : integer := 0;            
    signal counter : integer := 0;              
    constant clk_period : time := 10 ns;        
 
    component Code_Converter is
        port (                                  
            X: in bit;                          
            CLK: in bit;                        
            Z: out bit;                         
            stateOut: out integer range 0 to 6  
        );                                      
    end component;

begin
    uut: Code_Converter port map (
        X => sX,                            
        CLK => sCLK,                        
        Z => sZ,                            
        stateOut => sStateOut               
    );
   
    clk_process: process
    begin                                       
        sCLK <= '0';                            
        wait for clk_period / 2;                
        sCLK <= '1';                            
        wait for clk_period / 2;                
    end process clk_process;                    

   
    stimulus: process
    begin                                       
        if counter < 9 then                     
            sX <= '0';                          
            counter <= counter + 1;             
            wait for clk_period;                
        else                                    
            sX <= '1';                          
            wait for clk_period;                
        end if;                                 
                                                
    end process stimulus;
end architecture Behavioral;