library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FlipFlop_JK is
    Port ( Clk, J, K : in  STD_LOGIC;
           Q, Qn : inout  STD_LOGIC);
end FlipFlop_JK;

architecture Behavioral of FlipFlop_JK is

begin

	process (Clk, J, K)
		begin
			if (Clk ' event and Clk = '1') then
				if (J = '0' and K = '1') then
					Q <= '0';
					Qn <= '1';
				elsif (J = '1' and K = '0') then
					Q <= '1';
					Qn <= '0';
				elsif (J = '0' and K = '0') then
					Q <= Q;
					Qn <= Qn;
				else 
					Q <= not Qn;
				end if;
			end if;
end process;
end Behavioral;


