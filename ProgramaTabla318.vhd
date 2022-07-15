library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramaTabla318 is
 Port ( Clk, x : in  STD_LOGIC;
           Salida : out  STD_LOGIC_VECTOR (2 downto 0);
           z : out  STD_LOGIC);
end ProgramaTabla318;

architecture Behavioral of ProgramaTabla318 is
type estado is (A, B, C, D, E);
	signal edo_pres, edo_fut: estado;
begin

	proceso1: process (edo_pres, x)
		begin
			case edo_pres is
				when A => z <= '0';
					if x = '0' then
						edo_fut <= B;
						Salida <= "001";
					else
						edo_fut <= E;
						Salida <= "100";
					end if;
				
				when B => z <= '1';
					if x = '0' then
						edo_fut <= A;
						Salida <= "000";
					else
						edo_fut <= C;
						Salida <= "010";
					end if;
					
				when C => 
					if x = '0' then
						edo_fut <= B;
						z <= '0';
						Salida <= "001";
					else
						edo_fut <= C;
						z <= '1';
						Salida <= "010";
					end if;
					
				when D => z <= '0';
					if x = '0' then
						edo_fut <= C;
						Salida <= "010";
					else
						edo_fut <= E;
						Salida <= "100";
					end if;
					
				when E => 
					if x = '0' then
						edo_fut <= D;
						z <= '1';
						Salida <= "011";
					else
						edo_fut <= A;
						z <= '0';
						Salida <= "000";
					end if;
			end case;
	end process proceso1;

	proceso2: process (Clk)
		begin
			if (Clk'event and Clk = '1') then
				edo_pres <= edo_fut;
			end if;
	end process proceso2;
end Behavioral;

