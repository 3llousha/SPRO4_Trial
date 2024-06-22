--Adder Testbench
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity for the testbench
entity Adder8bit_tb is
  -------------
end Adder8bit_tb;

-- Architecture for the testbench
architecture testbench of Adder8bit_tb is
  
    component Adder8bit
        Port ( 
            A,B : in  STD_LOGIC_VECTOR (7 downto 0);
            Cin : in  STD_LOGIC;
            Cout : out  STD_LOGIC
            Sum : out  STD_LOGIC_VECTOR (7 downto 0);
        );
    end component;

    -- Signals 
    signal A, B : STD_LOGIC_VECTOR (7 downto 0);
    signal Cin : STD_LOGIC;
    signal Cout : STD_LOGIC;
    signal Sum : STD_LOGIC_VECTOR (7 downto 0);

begin
  
    -- Instantiate 8 Bit adder
uut: Adder8bit Port map ( -- unit under test port mapping
      A => A, 
      B => B, 
      Cin => Cin, 
      Sum => Sum, 
      Cout => Cout
    );
      
process
    begin
      
        -- Test  1
        A <= "00000001"; B <= "00000010"; Cin <= '0'; wait for 100 ns; 
          -- A = 1, B = 2, Sum should = 3
          
        -- Test  2
        A <= "00000011"; B <= "00000100"; Cin <= '1'; wait for 100 ns;
          -- A = 3, B = 4, Sum should = 7
          
        -- Test  3
        A <= "11111111"; B <= "00000001"; Cin <= '1'; wait for 100 ns;
          -- A = 255, B = 1, Sum should = 256 (Overflow should occur)
        
        wait;
    end process;

end testbench;
