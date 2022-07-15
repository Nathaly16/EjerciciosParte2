library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Cronometro is
    Port ( clk : in  STD_LOGIC;
           reset : out  STD_LOGIC);
end Cronometro;

architecture Behavioral of Cronometro is
signal temporal: std_logic := '0';
signal contador: integer range 0 to 245 := 0;
begin
	process(clk)
	begin
		if rising_edge (clk) then
			if (contador = 245) then
				temporal <= not(temporal);
				contador<=0;
		else
			contador <=contador+1;
		end if;
		end if;
	end process;
reset <= temporal;
end Behavioral;

