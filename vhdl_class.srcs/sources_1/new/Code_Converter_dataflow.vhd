library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------
entity Code_Converter_dataflow is
    port
    (
        X: in bit;
        CLK: in bit;
        Z: out bit
    );
end Code_Converter_dataflow;
----------------------------------------------------
architecture Equations of Code_Converter_dataflow is
    signal Q1, Q2, Q3: bit;

    begin
    
    process(CLK)
    begin
        if CLK = '1' and CLK'event then
            Q1 <= not Q2 after 10 ns;
            Q2 <= Q1 after 10 ns;
            Q3 <= ( Q1 and Q2 and Q3) or (not X and Q1 and not Q3) or (X and not Q1 and not Q2) after 10 ns;
        end if;
    end process;
    
    Z <= (not X and not Q3) or (X and Q3) after 20 ns;

    
end Equations;