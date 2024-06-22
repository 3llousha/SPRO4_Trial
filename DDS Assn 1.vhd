-- Bomboclat 8 bit adder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity 8bitAdd is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR(7 downto 0);
           Sum : out  STD_LOGIC_VECTOR(7 downto 0);
           CarryOut : out  STD_LOGIC_VECTOR (7 downto 0);
end 8bitAdd;

-- Architecture typ shi 
architecture Behavioral of 8bitAdd is
begin
    process(A, B)-- sensitive to A AND B INPUT
        variable temp_sum: STD_LOGIC_VECTOR(8 downto 0);// variabe to handle overflow if there is a 9th bti
    begin
        temp_sum := ('0' & A) + ('0' & B); -- consitante 8 bits eith temp sum
        Sum <= temp_sum(7 downto 0);
        CarryOut <= temp_sum(8); -- detects overlfow from MSB of the temp vraibake 
    end process;
end Behavioral;
