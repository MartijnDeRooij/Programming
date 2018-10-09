 -- Tempkeep
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
signal FFXinputRow1: std_logic_vector(0 downto 0); -- internal signal for x1 flip flop
signal FF_SumFRow1 : std_logic_vector(0 downto 0); -- signal for row 1 output 
signal FF_SumFRow2 : std_logic_vector(1 downto 0); -- signal for row 2 output

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


Flip_Flop_Generate: for I in 0 to 1 generate 

	-- Create a flip flop for every x after x0.
	FlipFlips1: if I = 0 generate 
		FF1: d_flip_flop_signal port map (
			Data=>InputX(I + 1), -- x1
			clk=>clk,
			rst_n=>rst_n,
			Q => FFXinputRow1(I) -- x1 intermediate signal
		);
	end generate;

	-- Create flip flops for the sums that are eventually the outputs
	FlipFlips2: if I = 0 generate 
		FF2: d_flip_flop_signal port map (
			Data=> Full_adder_SumF_Row1(0), -- Output 1  
			clk=>clk,
			rst_n=>rst_n,
			Q => FF_SumFRow1(I) -- This will be output 1
		);
	end generate;

	FlipFlips3: if I = 0 generate -- row 2 outputs from previous determined values
		FF3: d_flip_flop_signal port map (
			Data=>FF_SumFRow1(I), -- from previous flip flop
			clk=>clk,
			rst_n=>rst_n,
			Q => OutputP(I) -- FF_SumFRow2(I) -- This is output 1
		);
	end generate;

	FlipFlips4: if I = 1 generate -- For right most FAF
		FF4: d_flip_flop_signal port map (
			Data=> Full_adder_SumF_Row2(0), -- output sum FAF right row 2 
			clk=>clk,
			rst_n=>rst_n,
			Q => OutputP(I) --FF_SumFRow2(I) -- This is output 2
		);
	end generate;
end generate Flip_Flop_Generate;


Full_Adder_Generate: for I in 0 to 0 generate -- Generate for 1 step
	-- Generate Statement For full Adder which is the final step
	FullAdders_1: if I = 0 generate
      STEP1: full_adder port map (
						a=> Full_adder_SumF_Row2(I+1), -- the Sum of the last FAF
						b=> '0', -- The carry of the second to last FAF 
						cin=>Full_adder_coutF_Row2(I), -- 
						sumF=> OutputP(2), -- Final outputs
						coutF=> OutputP(3) -- Final Outputs
						);
    end generate FullAdders_1;

end generate Full_Adder_Generate;
	-- First Lets do all the steps for ROW 1.

Full_Adder_Register_Generate: for I in 0 to 1 generate -- Generate for 2 Rows

	-- Generate Statement for First full adders with Register (First row) 2 adders
	FullAdderFLip1: if I = 0 or I = 1 generate
		FAF1: full_adder_flip port map (
			FA_a => InputA(I), -- input of a0 and a1 (First 2 bits)
			FA_x => InputX(0), -- input of x0 alone (Input x0)
			FA_b => '0', -- These values are both 0 at the first row.
			FA_cin => '0',
			clk => clk, -- clk is always clk
			rst_n => rst_n, -- rst is always rst
			-- Between Input and outputs
			Reg_FA_a => Full_adder_FA_a_Row1(I), -- 
			Reg_SumF => Full_adder_SumF_Row1(I), -- if I = 0 then Sum is p0
			Reg_coutF => Full_adder_coutF_Row1(I) -- cout FA row1 values 
		);
	end generate FullAdderFLip1;

	-- Generate Statement for full adders with Register (Second row) 2 adders
	FullAdderFLip2: if I = 0  generate -- This one is most left adder
		FAF2: full_adder_flip port map (
			FA_a => Full_adder_FA_a_Row1(I), -- input of a0
			FA_x => FFXinputRow1(0), -- input of x1 intermediate signal of x1
			FA_b => Full_adder_SumF_Row1(I + 1), 
			FA_cin => Full_adder_coutF_Row1(I), -- From the second FAF
			clk => clk,
			rst_n => rst_n,
			-- Between Input and outputs
			Reg_FA_a => Full_adder_FA_a_Row2(I),
			Reg_SumF => Full_adder_SumF_Row2(I),
			Reg_coutF => Full_adder_coutF_Row2(I) 
		);
	end generate FullAdderFLip2;

-- Generate Statement for full adders with Register (Second row) 2 adders
	FullAdderFLip3: if I = 1  generate
		FAF3: full_adder_flip port map ( -- Most right FULL Adder
			FA_a => Full_adder_FA_a_Row1(I), -- input a1
			FA_x => FFXinputRow1(0), -- input of x1 intermediate signal of x1
			FA_b => '0', -- 
			FA_cin => Full_adder_coutF_Row1(I), -- 
			clk => clk,
			rst_n => rst_n,
			-- Between Input and outputs
			Reg_FA_a => Full_adder_FA_a_Row2(I), -- 
			Reg_SumF => Full_adder_SumF_Row2(I), --
			Reg_coutF => Full_adder_coutF_Row2(I) -- 
		);
	end generate FullAdderFLip3;

end generate Full_Adder_Register_Generate;




end architecture behave;