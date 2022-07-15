library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RegistroDespSerie is
 Port ( Clk, MC : in  STD_LOGIC;
           InSerie : out STD_LOGIC_VECTOR (3 downto 0);
           Q : inout  STD_LOGIC_VECTOR (3 downto 0));
end RegistroDespSerie;

architecture Behavioral of RegistroDespSerie is

begin
process (Clk, MC)
	begin
		Q <= "0000";
		if (Clk'event and Clk = '0') then
			if (MC = '0') then
				InSerie(3) <= ((Q(3) nor Q(2)) nor Q(1));
			end if; 
		end if;
	end process;
	
end Behavioral;

