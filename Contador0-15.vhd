library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity Contador015 is
ort ( Clk , X : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
           Z1, Z2 : out  STD_LOGIC);
end Contador015;

architecture Behavioral of Contador015 is
signal aux : STD_LOGIC_VECTOR (3 downto 0) := "0000";	
begin
	process (Clk, X)
	begin
		if (Clk'event and Clk = '1') then
			if (X = '1') then
				Aux <= Aux - 1;
			else
				Aux <= Aux + 1;
			end if;
		end if;
		Q <= Aux;
	end process;
	process (Aux)
		begin
			case Aux is
				when "0000" => 
					Z1 <= '1';
					Z2 <= '0';
				when "0001" => 
					Z1 <= '0';
					Z2 <= '1';
				when "0010" => 
					Z1 <= '1';
					Z2 <= '0';
				when "0011" => 
					Z1 <= '0';
					Z2 <= '1';
				when "0100" => 
					Z1 <= '1';
					Z2 <= '0';
				when "0101" => 
					Z1 <= '0';
					Z2 <= '1';
				when "0110" => 
					Z1 <= '1';
					Z2 <= '0';
				when "0111" => 
					Z1 <= '0';
					Z2 <= '1';
				when "1000" => 
					Z1 <= '1';
					Z2 <= '0';
				when "1001" => 
					Z1 <= '0';
					Z2 <= '1';
				when "1010" => 
					Z1 <= '1';
					Z2 <= '0';
				when "1011" => 
					Z1 <= '0';
					Z2 <= '1';
				when "1100" => 
					Z1 <= '1';
					Z2 <= '0';
				when "1101" => 
					Z1 <= '0';
					Z2 <= '1';
				when "1110" => 
					Z1 <= '1';
					Z2 <= '0';
				when others => 
					Z1 <= '0';
					Z2 <= '1';
			end case;
		end process;

end Behavioral;

