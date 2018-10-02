-- First include the libraries.
library ieee;
use ieee.std_logic_1164.all; -- use of std_logic
use ieee.numeric_std.all; -- For numeric operatiosn

-- Next is the making of the entity.
entity full_adder is
	port( 
		a, b	: in std_logic;
		cin		: in std_logic;
		-- space between inputs and outputs.
		sum		: out std_logic;
		cout	: out std_logic
	);
end full_adder;

-- Up next is the architecture.
architecture behave of full_adder is
begin
	

end architecture behave;
