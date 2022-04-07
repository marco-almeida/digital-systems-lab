--0000 xx
--0001 00
--0010 01
--0100 10
--1000 11

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity PEnc4_2 is
	port(inputs : in std_logic_vector(3 downto 0);
		  outputs : out std_logic_vector(1 downto 0);
		  valid : out std_logic);
end PEnc4_2;

architecture v1 of PEnc4_2 is
begin
	valid <= '0' when inputs = "0000" else '1';
	process(inputs)
	begin
		if (inputs(3) = '1') then
			outputs <= "11";
		elsif (inputs(2) = '1') then
			outputs <= "10";
		elsif (inputs(1) = '1') then
			outputs <= "01";
		elsif (inputs(0) = '1') then
			outputs <= "00";
		else
			outputs <= "00";
		end if;
	end process;
end v1;