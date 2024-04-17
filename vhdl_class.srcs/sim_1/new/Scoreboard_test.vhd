library IEEE;
--use IEEE.numeric_bit.all;
USE ieee.std_logic_1164.ALL;
use IEEE.numeric_std.all; -- any package with overloaded add and subtract
 
ENTITY Scoreboard_test IS
END Scoreboard_test;
 
ARCHITECTURE behavior OF Scoreboard_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Scoreboard
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         inc : IN  std_logic;
         dec : IN  std_logic;
         bcd1_out : out unsigned(3 downto 0);
         bcd0_out : out unsigned(3 downto 0);
         seg7disp1 : OUT  unsigned(6 downto 0);
         seg7disp0 : OUT  unsigned(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal inc : std_logic := '0';
   signal dec : std_logic := '0';

 	--Outputs
   signal seg7disp1 : unsigned(6 downto 0);
   signal seg7disp0 : unsigned(6 downto 0);
   signal bcd1_out : unsigned(3 downto 0);
   signal bcd0_out : unsigned(3 downto 0);
   
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Scoreboard PORT MAP (
          clk => clk,
          rst => rst,
          inc => inc,
          dec => dec,
          --bcd0_out => bcd0_out,
          --bcd1_out => bcd1_out,
          seg7disp1 => seg7disp1,
          seg7disp0 => seg7disp0
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for clk_period;	
        inc<='1';
      wait for clk_period*15;	
        inc<='0';
      wait for clk_period;	
        dec<='1'; 
      wait for clk_period*10;	
        dec<='0'; 
       wait for clk_period;	
        rst<='1';       
       wait for clk_period*3;
        rst<='0';   
       wait for clk_period;	
        rst<='1';       
       wait for clk_period*5;
        rst<='0';        
         wait;
   end process;

END;
