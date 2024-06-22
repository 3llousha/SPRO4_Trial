-- Library declarations
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity declaration for the 8-bit Adder
entity Adder8bit is
    Port ( 
        A,B : in  STD_LOGIC_VECTOR (7 downto 0); -- input A & B (8-bit)
        Cin : in  STD_LOGIC; -- Carry input
        Cout : out  STD_LOGIC; -- Carry out
        Sum : out STD_LOGIC_VECTOR (7 downto 0);-- Sum 
    );
end Adder8bit;

-- Architecture for Adder
architecture Behavioral of Adder8bit is
    signal add_var : STD_LOGIC_VECTOR (8 downto 0); --  signal to hold the result including any carry overflow
begin 
    
process(A, B, Cin)    -- Process for the adder, sensitive to carry in and input A/B
    begin

        add_var <= ('0' & A) + ('0' & B) + Cin;  -- Adding A, B, & Cin and store in add_var
        Sum <= add_var(7 downto 0); 
        Cout <= add_var(8); -- Assign the MSB to Cout to detect Overflow

    end process;

end Behavioral;

