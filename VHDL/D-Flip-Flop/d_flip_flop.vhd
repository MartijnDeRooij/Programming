-- VHDL code for D Flip FLop with Asynchronous Reset 
-- With Rising edge D flip flop
-- Made by: Martijn de Rooij

-- libraries:
library IEEE;
use IEEE.std_logic_1164.all; -- standard std_logic library


entity dff_async is
	port(	Data 		: in std_logic;
			clk			: in std_logic;
			async_rst_n	: in std_logic;
			Q 			: out std_logic;
			Qbar		: out std_logic
		);
end entity dff_async;

architecture behavior of dff_async is
begin
	asyncOutput: process (async_rst_n, clk) is
	begin
		if(async_rst_n = '1') then
			Q <= '0';
			Qbar <= '0';
		elsif (rising_edge(clk)) then
   			Q <= Data;
			Qbar <= not(Data);
  		end if;
	end process asyncOutput;
end architecture behavior;