library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FlipFlop_T is
Port ( Clk, T : in  STD_LOGIC;
       Q, Qn : inout  STD_LOGIC);
			  
end FlipFlop_T;

architecture Behavioral of FlipFlop_T is

begin

	process (Clk, T)
			begin
				if (Clk'event and Clk = '1') then
					if (T = '1') then
						Q <= not Qn;
						Qn <= not Q;				
					else 
						Q <= Q;
						Qn <= Qn;
					end if;
				end if;
		end process;
end Behavioral;

