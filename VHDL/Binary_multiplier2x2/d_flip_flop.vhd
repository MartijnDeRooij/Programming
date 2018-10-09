-- VHDL code for D Flip FLop with Asynchronous Reset 
-- With Rising edge D flip flop
-- Made by: Martijn de Rooij

-- libraries:
library IEEE;
use IEEE.std_logic_1164.all; -- standard std_logic library

entity d_flip_flop is
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
end entity d_flip_flop;

architecture behavior of d_flip_flop is
begin
	OutputFF1: process (rst_n, clk) is
	begin
		if(rst_n = '1') then
			Q_SumF <= '0';
		elsif (rising_edge(clk)) then
   			Q_SumF <= serial_in1;
  		end if;
	end process OutputFF1;

	OutputFF2: process (rst_n, clk) is
	begin
		if(rst_n = '1') then
			Q_coutF <= '0';
		elsif (rising_edge(clk)) then
   			Q_coutF <= serial_in2;
  		end if;
	end process OutputFF2;

	OutputFF3: process (rst_n, clk) is
	begin
		if(rst_n = '1') then
			Q_FA_a <= '0';
		elsif (rising_edge(clk)) then
   			Q_FA_a <= serial_in3;
  		end if;
	end process OutputFF3;

end architecture behavior;