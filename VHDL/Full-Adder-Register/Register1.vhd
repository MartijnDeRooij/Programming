library ieee;
use ieee.std_logic_1164.all; -- use of std_logic

entity register1 is 
	port(
		serial_in 	: in std_logic;
		clk			: in std_logic;
		rst_n		: in std_logic;
		Q1			: out std_logic_vector(7 downto 0);
		Q2			: out std_logic_vector(7 downto 0)
	);
end entity register1;


architecture behave of register1 is

signal QTemp1 : std_logic_vector(7 downto 0); -- Temporary Register
signal QTemp2 : std_logic_vector(7 downto 0); -- Temporary Register

begin
	REGOutput: process (rst_n, clk) is
	begin
		if(rst_n = '1') then
			Q1 <= (others => '0');
			QTemp1 <= (others => '0');
			Q2 <= (others => '0');
			QTemp2 <= (others => '0');
		elsif (rising_edge(clk)) then
			--QTemp is necassary because it doesnt allow the outpt to be assigned to the output.
			QTemp1 <= serial_in & QTemp1(7 downto 1); -- shift into to the right of qTEMP register
			Q1 <= QTemp1;

			QTemp2 <= serial_in & QTemp2(7 downto 1); -- shift into to the right of qTEMP register
			Q2 <= QTemp2;
  		end if;
	end process REGOutput;

end architecture behave;