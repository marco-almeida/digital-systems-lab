library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity freqDivider is
	generic(divFactor : natural);
	port(clkIn	: in  std_logic;
		  enable : in std_logic;
		  clkOut	: out std_logic);
end freqDivider;

architecture RTL of freqDivider is

	signal s_divCounter : natural;

begin
	process(clkIn)
	begin
		if (rising_edge(clkIn)) then
			if (enable = '0') then
				clkOut <= '0';
				s_divCounter <= 0;
			else
				if (s_divCounter = divFactor - 1) then
					clkOut		 <= '0';
					s_divCounter <= 0;
				else
					if (s_divCounter >= (divFactor / 2 - 1)) then
						clkOut <= '1';
					else
						clkOut <= '0';
					end if;
					s_divCounter <= s_divCounter + 1;
				end if;
			end if;
		end if;
	end process;
end RTL;