library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity ContadorSenalAsDes is
Port ( Clk, X : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (2 downto 0));
end ContadorSenalAsDes;

architecture Behavioral of ContadorSenalAsDes is
signal aux : STD_LOGIC_VECTOR (2 downto 0) := "000";
begin
	process (Clk, X)
	begin
		if (Clk'event and Clk = '1') then
			if (X = '1') then
				if (Aux = "000") then
					Aux <= "011";
				else 
					Aux <= Aux - 1;
				end if;
			elsif (Aux = "011") then
				Aux <= "000";
			else
				Aux <= Aux + 1;
			end if;
		end if;
		Q <= Aux;
	end process;
end Behavioral;

