-- First include the libraries.
library ieee;
use ieee.std_logic_1164.all; -- use of std_logic

entity tb_full_adder_register is
-- no ports
end entity tb_full_adder_register;

architecture behave of tb_full_adder_register is

	component full_adder_register is -- Creating a component which is from the original vhdl fil
		port (
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
	end component full_adder_register;

	-- Full adder inputs
	signal FA_a	: std_logic := '0';
	signal FA_b	: std_logic := '0';
	signal FA_cin	: std_logic := '0';
	-- Register necassary inputs
	signal clk		: std_logic := '0';
	signal rst_n	: std_logic := '0';
	-- space between inputs and outputs.
	-- Register outputs
	signal RegOut1	: std_logic;
	signal	RegOut2	: std_logic;
	constant period1 : time := 5 ns; --constant deff for clock

begin
		-- Now to use a portmap to make sure the correct signals are synched across the files.
	Portmapping: full_adder_register port map (
		FA_a => FA_a,
		FA_b => FA_b,
		FA_cin => FA_cin, 
		--FA_sumF => FA_sumF,
		--FA_coutF => FA_coutF,
		clk => clk,
		rst_n => rst_n,
		RegOut1 => RegOut1,
		RegOut2 => RegOut2
	);

	clk <= not clk after period1;
	rst_n <= '1', '0' after 2 ns; -- waveform generation of reset.
	Data_Gen: process is -- to make the data more different.
  	begin
		FA_a <= '0';
		FA_b <= '0';
		FA_cin <= '0';
		wait for 10 ns;
		FA_a <= '1';
		FA_b <= '0';
		FA_cin <= '0';
		wait for 10 ns;
		FA_a <= '0';
		FA_b <= '1';
		FA_cin <= '0';
		wait for 10 ns;
		FA_a <= '1';
		FA_b <= '1';
		FA_cin <= '0';
		wait for 10 ns;
		FA_a <= '0';
		FA_b <= '0';
		FA_cin <= '1';
		wait for 10 ns;
		FA_a <= '1';
		FA_b <= '0';
		FA_cin <= '1';
		wait for 10 ns;
		FA_a <= '0';
		FA_b <= '1';
		FA_cin <= '1';
		wait for 10 ns;
		FA_a <= '1';
		FA_b <= '1';
		FA_cin <= '1';
		wait for 10 ns;
  end process Data_Gen;


end architecture behave;