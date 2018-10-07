library ieee;
use ieee.std_logic_1164.all; -- use of std_logic

entity and_gate is
    port ( 
		inAnd1 : in std_logic;     -- AND gate input
        inAnd2 : in std_logic;     -- AND gate input
		-- In between in and outputs
        outAnd : out std_logic    -- AND gate output
		);
end entity and_gate;

architecture Behavioral of and_gate is
begin
    outAnd <= inAnd1 and inAnd2;    -- output AND gate
end architecture Behavioral;