entity Code_Converter_structural is
    port(   X,CLK: in bit;
            Z: out bit);
end Code_Converter_structural;
architecture Structure of Code_Converter_structural is

    signal A1, A2, A3, A5, A6, D3: bit;
    signal Q1, Q2, Q3: bit;
    signal Q1N, Q2N, Q3N, XN: bit;

    component DFF
        port(D, CLK: in bit; Q: out bit; QN: out bit := '1');
    end component;
    component Nand2
        port(A1, A2: in bit; Z: out bit);
    end component;
    component Nand3
        port(A1, A2, A3: in bit; Z: out bit);
    end component;
    component Inverter
        port(A: in bit; Z: out bit);
    end component;
    
    begin
        I1: Inverter port map (X, XN);
        G1: Nand3 port map (Q1, Q2, Q3, A1);
        G2: Nand3 port map (Q1, Q3N, XN, A2);
        G3: Nand3 port map (X, Q1N, Q2N, A3);
        G4: Nand3 port map (A1, A2, A3, D3);
        FF1: DFF port map (Q2N, CLK, Q1, Q1N);
        FF2: DFF port map (Q1, CLK, Q2, Q2N);
        FF3: DFF port map (D3, CLK, Q3, Q3N);
        G5: Nand2 port map (X, Q3, A5);
        G6: Nand2 port map (XN, Q3N, A6);
        G7: Nand2 port map (A5, A6, Z);
end Structure;