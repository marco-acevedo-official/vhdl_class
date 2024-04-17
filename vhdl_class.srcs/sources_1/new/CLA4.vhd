library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLA4 is
port(A, B: in bit_vector(3 downto 0);
Ci: in bit;
S: out bit_vector(3 downto 0); Co, PG, GG: out bit);
end CLA4;

entity CLALogic is
    port(G, P: in bit_vector(3 downto 0); Ci: in bit;-- âˆ'âˆ' Inputs
    C: out bit_vector(3 downto 1); Co, PG, GG: out bit);-- âˆ'âˆ' Outputs
end CLALogic;

architecture Structure of CLA4 is

    component GPFullAdder
    port
    (
        X, Y, Cin: in bit;
        G, P, Sum: out bit
    ); 
    end component;

    component CLALogic is
        port
        (
            G, P: in bit_vector(3 downto 0);
            Ci: in bit;
            C: out bit_vector(3 downto 1); Co, PG, GG: out bit
        );
    end component;

    signal G, P: bit_vector(3 downto 0);
    signal C: bit_vector(3 downto 1);

    begin
        CarryLogic:    CLALogic port map (G, P, Ci, C, Co, PG, GG);
        FA0:        GPFullAdder port map (A(0), B(0), Ci, G(0), P(0), S(0));
        FA1:        GPFullAdder port map (A(1), B(1), C(1), G(1), P(1), S(1));
        FA2:        GPFullAdder port map (A(2), B(2), C(2), G(2), P(2), S(2));
        FA3:        GPFullAdder port map (A(3), B(3), C(3), G(3), P(3), S(3));

end Structure;