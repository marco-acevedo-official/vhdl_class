LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mult_test IS

END mult_test;

ARCHITECTURE behavior OF mult_test IS 
   -- Component Declaration for the Unit Under Test (UUT)
   COMPONENT Mult

   PORT(

        CLK : IN STD_LOGIC;
        St : IN STD_LOGIC;
        K : IN STD_LOGIC;
        M : IN STD_LOGIC;
        Load : OUT STD_LOGIC;
        Sh : OUT STD_LOGIC;
        Ad : OUT STD_LOGIC;
        Done : OUT STD_LOGIC
       );

   END COMPONENT;
  --Inputs
  signal CLK : STD_LOGIC := '0';
  signal St : STD_LOGIC := '0';
  signal K : STD_LOGIC := '0';
  signal M : STD_LOGIC := '0';
    --Outputs
  signal Load : STD_LOGIC;
  signal Sh : STD_LOGIC;
  signal Ad : STD_LOGIC;
  signal Done : STD_LOGIC;
  -- Clock period definitions
  constant CLK_period : time := 10 ns;
BEGIN
   -- Instantiate the Unit Under Test (UUT)
  uut: Mult PORT MAP (
         CLK => CLK,
         St => St,
         K => K,
         M => M,
         Load => Load,
         Sh => Sh,
         Ad => Ad,
         Done => Done
       );
  -- Clock process definitions
  CLK_process :process
  begin
      CLK <= '0';
      wait for CLK_period/2;
      CLK <= '1';
      wait for CLK_period/2;
  end process;
  -- Stimulus process
  stim_proc: process
  begin      
     -- hold reset state for 100 ns.
     wait for CLK_period;
         St<='1';
     wait for CLK_period;
         St<='0';
         M<='1';
     wait for CLK_period*2;
         M<='0';
     wait for CLK_period;
         M<='1';
     wait for CLK_period;
         M<='0';
     wait for CLK_period;
         K<='1';
         M<='1';
     wait for CLK_period;
         K<='0';
         M<='0';
     wait;
  end process;
END;