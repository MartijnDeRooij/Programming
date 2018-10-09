library ieee;
use ieee.std_logic_1164.all; -- use of std_logic

-- Next is the making of the entity.
entity full_adder_register is
	port(
		-- Full adder inputs
		FA_a	: in std_logic; 
		FA_b	: in std_logic;
		FA_cin	: in std_logic;
		-- Register necassary inputs
		clk		: in std_logic;
		rst_n	: in std_logic;
		-- space between inputs and outputs.
		-- Register outputs
		RegOut1	: out std_logic;
		RegOut2	: out std_logic
	);
end entity full_adder_register;

architecture behave of full_adder_register is
component full_adder is
	port( 
		a		: in std_logic; -- Full adder stuff.
		b		: in std_logic;
		cin		: in std_logic;
		-- space between inputs and outputs.
		sumF	: out std_logic;
		coutF	: out std_logic
		);
end component full_adder;

component register1 is
	port( 
		serial_in1 	: in std_logic;
		serial_in2 	: in std_logic;
		clk			: in std_logic;
		rst_n		: in std_logic;
		Q1			: out std_logic;
		Q2			: out std_logic
		);
end component register1;

signal s1: std_logic; -- Intermediate signals
signal s2: std_logic; -- Intermediate signals

begin

FA: full_adder port map (
						a=>FA_a,
						b=>FA_b,
						cin=>FA_cin,
						sumF=>s1,
						coutF=>s2
						);
REG: register1 port map (
						serial_in1=>s1,
						serial_in2=>s2,
						clk=>clk,
						rst_n=>rst_n,
						Q1=>RegOut1,
						Q2=>RegOut2
						);
end architecture behave;