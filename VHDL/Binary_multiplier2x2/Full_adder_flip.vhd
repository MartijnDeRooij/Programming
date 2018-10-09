library ieee;
use ieee.std_logic_1164.all; -- use of std_logic

-- Next is the making of the entity.
entity full_adder_flip is
	port(
		-- Full adder inputs
		FA_a	: in std_logic;
		FA_x	: in std_logic;

		FA_b	: in std_logic;
		FA_cin	: in std_logic;
		-- Register necassary inputs
		clk		: in std_logic;
		rst_n	: in std_logic;
		-- space between inputs and outputs.
		-- Register outputs
		Reg_FA_a	: out std_logic; -- This output will be for a0, a1 etc flip flopping.
		Reg_SumF	: out std_logic;
		Reg_coutF	: out std_logic
	);
end entity full_adder_flip;

architecture behave of full_adder_flip is
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

component d_flip_flop is
	port( 
		serial_in1 	: in std_logic;
		serial_in2 	: in std_logic;
		serial_in3 	: in std_logic;
		clk			: in std_logic;
		rst_n		: in std_logic;
		Q_SumF		: out std_logic;
		Q_coutF		: out std_logic;
		Q_FA_a		: out std_logic
		);
end component d_flip_flop;

component and_gate is--here you declare your components
	port( 
		inAnd1 : in std_logic;     -- AND gate input
		inAnd2 : in std_logic;     -- AND gate input
		-- In between in and outputs
        outAnd : out std_logic    -- AND gate output
		);
end component and_gate;

signal a_and_x : std_logic; -- and gate between a and x

signal s1: std_logic; -- Intermediate signals for register and FA.
signal s2: std_logic; -- Intermediate signals

begin
ANDG: and_gate port map (
						inAnd1=>FA_a,
						inAnd2=>FA_x,
						outAnd=>a_and_x
						);
-- cin has to be the and gate of a and x to work properly
FA: full_adder port map (
						a=>FA_b,
						b=>a_and_x,
						cin=>FA_cin,
						sumF=>s1,
						coutF=>s2
						);
REG: d_flip_flop port map (
						serial_in1=>s1,
						serial_in2=>s2,
						serial_in3=>FA_a,
						clk=>clk,
						rst_n=>rst_n,
						Q_SumF=>Reg_SumF,
						Q_coutF=>Reg_coutF,
						Q_FA_a=>Reg_FA_a
						);
end architecture behave;