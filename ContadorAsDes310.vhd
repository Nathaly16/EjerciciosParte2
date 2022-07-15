library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity ContadorAsDes310 is
   Port ( Clk, C : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
           Sal1, Sal2 : out  STD_LOGIC);
end ContadorAsDes310; 

architecture Behavioral of ContadorAsDes310 is
signal X : STD_LOGIC;	
signal aux : STD_LOGIC_VECTOR (3 downto 0) := "0000";	
begin
	process (Clk, X) 
	begin
		if (Clk'event and Clk = '1') then
			if (C = '1') then
				if (Aux = "0000") then
					Aux <= "1001";				
				else 
					Aux <= Aux - 1;
				end if;
			elsif (Aux = "1001") then
				Aux <= "0000";
			else
				Aux <= Aux + 1;
			end if;
		end if;
		Q <= Aux;
	end process;
	process (aux, X)
		begin
			case Aux is
				when "0000" => 
					if (X = '0') then
						Sal1 <= '1';
						Sal2 <= '0';
					else
						Sal1 <= '0';
						Sal2 <= '0';
					end if;
				when "0001" => 
					if (X = '1') then
						Sal1 <= '0';
						Sal2 <= '1';
					else
						Sal1 <= '0';
						Sal2 <= '0';
					end if;
				when "0010" => 
					if (X = '0') then
						Sal1 <= '1';
						Sal2 <= '0';
					else
						Sal1 <= '0';
						Sal2 <= '0';
					end if;
				when "0011" => 
					if (X = '1') then
						Sal1 <= '0';
						Sal2 <= '1';
					else
						Sal1 <= '0';
						Sal2 <= '0';
					end if;
				when "0100" => 
					if (X = '0') then
						Sal1 <= '1';
						Sal2 <= '0';
					else
						Sal1 <= '0';
						Sal2 <= '0';
					end if;
				when "0101" => 
					if (X = '1') then
						Sal1 <= '0';
						Sal2 <= '1';
					else
						Sal1 <= '0';
						Sal2 <= '0';
					end if;
				when "0110" => 
					if (X = '0') then
						Sal1 <= '1';
						Sal2 <= '0';
					else
						Sal1 <= '0';
						Sal2 <= '0';
					end if;
				when "0111" => 
					if (X = '1') then
						Sal1 <= '0';
						Sal2 <= '1';
					else
						Sal1 <= '0';
						Sal2 <= '0';
					end if;
				when "1000" => 
					Sal1 <= '0';
					Sal2 <= '0';
				when "1001" => 
					if (X = '1') then
						Sal1 <= '0';
						Sal2 <= '1';
					else
						Sal1 <= '0';
						Sal2 <= '0';
					end if;				
				when others => 
					Sal1 <= '0';
					Sal2 <= '0';
			end case;
	end process;
end Behavioral;

