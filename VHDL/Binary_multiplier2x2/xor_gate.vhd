library ieee;
use ieee.std_logic_1164.all; -- use of std_logic

entity xor_gate is
    port ( 
		inXOR1 : in std_logic;     -- XOR gate input
		inXOR2 : in std_logic;     -- XOR gate input
		-- In between in and outputs
		outXOR : out std_logic    -- XOR gate output
		);
end entity xor_gate;

architecture Behavioral of xor_gate is
begin
    outXOR <= inXOR1 xor inXOR2;    -- output XOR gate
end architecture Behavioral;
