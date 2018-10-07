-- First include the libraries.
library ieee;
use ieee.std_logic_1164.all; -- use of std_logic
--use ieee.numeric_std.all; -- For numeric operatiosn

-- Next is the making of the entity.
entity full_adder is
	port( 
		a		: in std_logic; 
		b		: in std_logic;
		cin		: in std_logic;
		-- space between inputs and outputs.
		sumF		: out std_logic;
		coutF	: out std_logic
	);
end full_adder;

-- Up next is the architecture.
architecture behave of full_adder is

component half_adder is
	port( 
		a		: in std_logic; 
		b		: in std_logic;
		-- space between inputs and outputs.
		sum		: out std_logic;
		cout	: out std_logic 
		);
end component;

component or_gate is 
	port(
		inOr1 : in std_logic;     -- OR gate input 1
		inOr2 : in std_logic;     -- OR gate input 2
		-- In between in and outputs
		outOr : out std_logic    -- OR gate output
		);
end component or_gate;

signal s1: std_logic; --here more intermediate signals
signal s2: std_logic; --here more intermediate signals
signal s3: std_logic; --here more intermediate signals

begin
HA1: half_adder port map (
						a=>a, -- a from Full to a from half
						b=>b, -- b from Full to b from half
						sum=>s1, -- s1 is out xor gate
						cout=>s3 -- s3 is out and gate
						);
HA2: half_adder port map (
						a=>s1, -- s1 from full to half
						b=>cin, -- cin from full to half
						sum=>sumF, -- output xor half2 becomes output full
						cout=>s2 --out and half2 is s2
						);
OR2: or_gate port map ( 
						inOr1=>s2, -- input s2 to OR
						inOr2=>s3, -- input s1 to OR
						outOr=>coutF
						);
end architecture behave;
