library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity ContadorPseudoaleatorios is
Port ( Clk, x, reset, load : in  STD_LOGIC;
           numero : inout  STD_LOGIC_VECTOR (3 downto 0));
end ContadorPseudoaleatorios;

architecture Behavioral of ContadorPseudoaleatorios is	
	signal aux_ran : std_logic_vector(3 downto 0);
	signal lfsr_reg : std_logic_vector(3 downto 0);
	signal aux : STD_LOGIC_VECTOR (3 downto 0) := "0000";
	type estado is (A, B, C, D, E, F, G);
	signal edo_pres, edo_fut: estado;
begin

	process(clk, reset)
	begin
    if(reset='1') then
      aux_ran <= (others=>'0');
    elsif(clk'event and clk='1') then
      if(load='1') then
        aux_ran <= numero;
      else
        aux_ran(0) <= lfsr_reg(3);
        aux_ran(1) <= lfsr_reg(2);
        aux_ran(2) <= lfsr_reg(1) xnor lfsr_reg(3);
        aux_ran(3) <= lfsr_reg(0) xnor lfsr_reg(3);
      end if;
    end if;
  end process;
  
  proceso1: process (edo_pres, x)
		begin
			case edo_pres is
				when A => 
					if x = '0' then
						edo_fut <= B;
						numero <= Aux + 1;
					else
						edo_fut <= G;
						numero <= aux_ran;
					end if;
				
				when B => 
					if x = '0' then
						edo_fut <= C;
						numero <= Aux + 1;
					else
						edo_fut <= A;
						numero <= aux_ran;
					end if;
					
				when C => 
					if x = '0' then
						edo_fut <= D;
						numero <= Aux + 1;
					else
						edo_fut <= B;
						numero <= aux_ran;
					end if;
					
				when D => 
					if x = '0' then
						edo_fut <= E;
						numero <= Aux + 1;
					else
						edo_fut <= C;
						numero <= aux_ran;
					end if;
					
				when E => 
					if x = '0' then
						edo_fut <= F;
						numero <= Aux + 1;
					else
						edo_fut <= D;
						numero <= aux_ran;
					end if;
					
				when F => 
					if x = '0' then
						edo_fut <= G;
						numero <= Aux + 1;
					else
						edo_fut <= A;
						numero <= aux_ran;
					end if;
				when others => 
					edo_fut <= A;
					numero <= aux_ran;
			end case;
	end process proceso1;
  
  proceso2: process (Clk)
		begin
			if (Clk'event and Clk = '1') then
				edo_pres <= edo_fut;
			end if;
	end process proceso2;
end Behavioral;

