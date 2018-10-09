-- First include the libraries.
library ieee;
use ieee.std_logic_1164.all; -- use of std_logic

entity tb_binary_multiplier is
-- no ports
end entity tb_binary_multiplier;

architecture behave of tb_binary_multiplier is

	component binary_multiplier is
		-- In here are all the inputs and outputs of the multiplier
		port (
			clk		: in std_logic; -- General Clock
			rst_n	: in std_logic; -- Async Reset
			InputA 	: in std_logic_vector(1 downto 0); -- Input binary 1
			InputX 	: in std_logic_vector(1 downto 0); -- Input binary 2
			-- in between inputs and outputs
			OutputP	: out std_logic_vector(3 downto 0) -- Output P from multiplier
		);
	end component binary_multiplier;

-- clk and reset input
	signal clk		: std_logic := '0';
	signal rst_n	: std_logic := '0';
-- Input for multiplier
	signal InputA	: std_logic_vector(1 downto 0);
	signal InputX	: std_logic_vector(1 downto 0);
-- Output P 
	signal OutputP	: std_logic_vector(3 downto 0);

	constant period1 : time := 4 ns; --constant deff for clock

begin
	-- Now to use a portmap to make sure the correct signals are synched across the files.
	Portmapping: binary_multiplier port map (
		clk => clk,
		rst_n => rst_n,
		InputA => InputA, 
		InputX => InputX,
		OutputP => OutputP
	);

	clk <= not clk after period1;
	rst_n <= '1', '0' after 2 ns; -- waveform generation of reset.
		Data_Gen: process is -- to make the data more different.
  	begin

		InputA <= "00";
		InputX <= "00";
		wait for 10 ns;
		InputA <= "01";
		InputX <= "00";
		wait for 10 ns;
		InputA <= "10";
		InputX <= "00";
		wait for 10 ns;
		InputA <= "11";
		InputX <= "00";
		wait for 10 ns;

		InputA <= "00";
		InputX <= "01";
		wait for 10 ns;
		InputA <= "01";
		InputX <= "01";
		wait for 10 ns;
		InputA <= "10";
		InputX <= "01";
		wait for 10 ns;
		InputA <= "11";
		InputX <= "01";
		wait for 10 ns;

		InputA <= "00";
		InputX <= "10";
		wait for 10 ns;
		InputA <= "01";
		InputX <= "10";
		wait for 10 ns;
		InputA <= "10";
		InputX <= "10";
		wait for 10 ns;
		InputA <= "11";
		InputX <= "10";
		wait for 10 ns;

		InputA <= "00";
		InputX <= "11";
		wait for 10 ns;
		InputA <= "01";
		InputX <= "11";
		wait for 10 ns;
		InputA <= "10";
		InputX <= "11";
		wait for 10 ns;
		InputA <= "11";
		InputX <= "11";
		wait for 10 ns;


  end process Data_Gen;


end architecture behave;