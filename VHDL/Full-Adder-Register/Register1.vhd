library ieee;
use ieee.std_logic_1164.all; -- use of std_logic

entity register1 is 
	port(
		serial_in1 	: in std_logic;
		serial_in2 	: in std_logic;
		clk			: in std_logic;
		rst_n		: in std_logic;
		Q1			: out std_logic;
		Q2			: out std_logic
	);
end entity register1;


architecture behave of register1 is

begin
	REGOutput1: process (rst_n, clk) is
	begin
		if(rst_n = '1') then
			Q1 <= '0';
		elsif (rising_edge(clk) and rst_n = '0') then
			Q1 <= serial_in1;
  		end if;
	end process REGOutput1;

	REGOutput2: process (rst_n, clk) is
	begin
		if(rst_n = '1') then
			Q2 <= '0';
		elsif (rising_edge(clk) and rst_n = '0') then
			Q2 <= serial_in2;
  		end if;
	end process REGOutput2;

end architecture behave;