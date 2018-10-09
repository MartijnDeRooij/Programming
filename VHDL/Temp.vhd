-- This will be a pipelined 2x2 binary multiplier
-- In here I will use the generate statement to generate the correct code
-- Made by: Martijn de Rooij\

--FF = Flip flop
-- FAF = Full adder and flip flop with and gate
-- FA = Full Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binary_multiplier is
	-- In here are all the inputs and outputs of the multiplier
	port (
		clk		: in std_logic; -- General Clock
		rst_n	: in std_logic; -- Async Reset
		InputA 	: in std_logic_vector(1 downto 0); -- Input binary 1
		InputX 	: in std_logic_vector(1 downto 0); -- Input binary 2
		-- in between inputs and outputs
		OutputP	: out std_logic_vector(3 downto 0) -- Output P from multiplier
	);
end entity binary_multiplier;

architecture behave of binary_multiplier is

-- Full Adder For final Value 
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
-- Flip Flops for X values
component d_flip_flop_signal is
	port( 
		Data 	: in std_logic;
		clk		: in std_logic;
		rst_n	: in std_logic;
		Q 		: out std_logic
		);
end component d_flip_flop_signal;
-- Full Adder With Registers
component full_adder_flip
	port(
		-- Full adder inputs
		FA_a		: in std_logic;
		FA_x		: in std_logic;
 
		FA_b		: in std_logic;
		FA_cin		: in std_logic;
		-- Register necassary inputs
		clk			: in std_logic;
		rst_n		: in std_logic;
		-- space between inputs and outputs.
		-- Register outputs
		Reg_FA_a	: out std_logic; -- This output will be for a0, a1 etc flip flopping.
		Reg_SumF	: out std_logic;
		Reg_coutF	: out std_logic
	);
end component full_adder_flip;

-- Now we obtained the necassary components its time to create the necassary internal signals. 

-- internal signals to interconnect components
-- Internal signals for flip flops
signal FFXinputRow1: std_logic; -- internal signal for x1 flip flop
signal FF_SumFRow1 : std_logic; -- signal for row 1 output 

-- Intermediate signals for Full Adders
-- No signals needed in this case

-- Intermediate signals for Full adders with registers
signal Full_adder_coutF_Row1 : std_logic_vector(1 downto 0); -- Outputs coutF FAF Row 1
signal Full_adder_FA_a_Row1 : std_logic_vector(1 downto 0); -- All possible values of A row 1 
signal Full_adder_SumF_Row1 : std_logic_vector(1 downto 0); -- Outputs coutF FAF Row 1

signal Full_adder_coutF_Row2 : std_logic_vector(1 downto 0); -- Outputs coutF FAF Row 2
signal Full_adder_FA_a_Row2 : std_logic_vector(1 downto 0); -- All possible values of A row 2 
signal Full_adder_SumF_Row2 : std_logic_vector(1 downto 0); -- Outputs coutF FAF Row 2


begin
-- four flip flops needed
FF1: d_flip_flop_signal port map (
			Data=>InputX(1), -- x1
			clk=>clk,
			rst_n=>rst_n,
			Q => FFXinputRow1 -- x1 intermediate signal
		);
		
FF2: d_flip_flop_signal port map (
			Data=> Full_adder_SumF_Row1(0), -- Output 1  
			clk=>clk,
			rst_n=>rst_n,
			Q => FF_SumFRow1 -- This will be output 1
		);
		
FF3: d_flip_flop_signal port map (
			Data=>FF_SumFRow1, -- from previous flip flop
			clk=>clk,
			rst_n=>rst_n,
			Q => OutputP(0) -- FF_SumFRow2(I) -- This is output 1
		);
		
FF4: d_flip_flop_signal port map (
			Data=> Full_adder_SumF_Row2(0), -- output sum FAF right row 2 
			clk=>clk,
			rst_n=>rst_n,
			Q => OutputP(1) -- This is output 2
		);
-- 1 Full adder needed
FA1: full_adder port map (
			a=> Full_adder_SumF_Row2(1), -- the Sum of the last FAF
			b=>'0', -- The carry of the second to last FAF 
			cin=>Full_adder_coutF_Row2(0), 
			sumF=> OutputP(2), -- Final outputs
			coutF=> OutputP(3) -- Final Outputs
		);
-- 4 Full adder with register needed						
FAF1: full_adder_flip port map (
			FA_a => InputA(0), -- input a0
			FA_x => InputX(0), -- input x0
			FA_b => '0', 
			FA_cin => '0',
			clk => clk, 
			rst_n => rst_n, 
			-- Between Input and outputs
			Reg_FA_a => Full_adder_FA_a_Row1(0), -- intermediate a0
			Reg_SumF => Full_adder_SumF_Row1(0),
			Reg_coutF => Full_adder_coutF_Row1(0) 
		);
FAF2: full_adder_flip port map (
			FA_a => InputA(1), -- input a1
			FA_x => InputX(0), -- input of x0 alone (Input x0)
			FA_b => '0', 
			FA_cin => '0',
			clk => clk, 
			rst_n => rst_n, 
			-- Between Input and outputs
			Reg_FA_a => Full_adder_FA_a_Row1(1),  -- intermediate a1
			Reg_SumF => Full_adder_SumF_Row1(1),
			Reg_coutF => Full_adder_coutF_Row1(1) 
		);

FAF3: full_adder_flip port map (
			FA_a => Full_adder_FA_a_Row1(0), -- input of a0
			FA_x => FFXinputRow1, 			 -- input of x1 intermediate signal of x1
			FA_b => '0', 
			FA_cin => Full_adder_SumF_Row1(1),--Full_adder_coutF_Row1(0), -- From the second FAF
			clk => clk,
			rst_n => rst_n,
			-- Between Input and outputs
			Reg_FA_a => Full_adder_FA_a_Row2(0),
			Reg_SumF => Full_adder_SumF_Row2(0),
			Reg_coutF => Full_adder_coutF_Row2(0) 
		);
		
FAF4: full_adder_flip port map ( -- Most right FULL Adder
			FA_a => Full_adder_FA_a_Row1(1), -- input  intermediate a1
			FA_x => FFXinputRow1, -- input of x1 intermediate signal of x1
			FA_b => '0', 
			FA_cin => Full_adder_coutF_Row1(1),
			clk => clk,
			rst_n => rst_n,
			-- Between Input and outputs
			Reg_FA_a => Full_adder_FA_a_Row2(1), 
			Reg_SumF => Full_adder_SumF_Row2(1),
			Reg_coutF => Full_adder_coutF_Row2(1) 
		);
		
end architecture behave;